#!/usr/bin/env python3
"""Lift the captured VM program back to Luau source.

`tools/disasm.py` produces the *listing* (one line per VM instruction).  This
module turns the same data into source: every proto becomes a Luau function with
a register array `R`, the payload's own constants inlined, and the control flow
expressed as Luau.

A word on the shape of the output.  The program in the constant pool is not
ordinary compiler output: its basic blocks are laid out in permuted order and
connected with explicit jumps (a block-flattening pass ran before Luraph did).
A faithful translation therefore has to name the next block explicitly, so each
proto is emitted as a small state machine over block numbers:

    local PC = 1
    while true do
        if PC == 1 then
            R[7] = "IsA"
            PC = 12
            continue
        end
        ...
        break
    end

`linearize()` still earns its keep: it re-lays the blocks out in reverse
postorder so the emitted order follows control flow and the block numbers read
top to bottom, which is what makes the output reviewable by eye.

The result is validated with `luau-ast`, so what ships is a file the Luau parser
accepts.
"""

from __future__ import annotations

import json
import pathlib
import re

# A rendered instruction is "<prefix statements> <control>" where the control
# part is a jump, a conditional jump (either polarity) or a return.
TAIL_PATTERNS: list[tuple[str, re.Pattern]] = [
    ("condboth",
     re.compile(r"^(?P<pre>.*?)\s*if (?P<cond>.+?) then goto (?P<t>\d+); else goto (?P<t2>\d+); end;$")),
    ("condbody",
     re.compile(r"^(?P<pre>.*?)\s*if (?P<cond>.+?) then (?P<body>[^;]+?) else goto (?P<t>\d+); end;$")),
    ("guardbody",
     re.compile(r"^(?P<pre>.*?)\s*if (?P<cond>.+?) then else (?P<body>.+?); goto (?P<t>\d+); end;$")),
    ("condfalse",
     re.compile(r"^(?P<pre>.*?)\s*if (?P<cond>.+?) then else goto (?P<t>\d+); end;$")),
    ("condtrue",
     re.compile(r"^(?P<pre>.*?)\s*if (?P<cond>.+?) then goto (?P<t>\d+); end;$")),
    ("return", re.compile(r"^(?P<pre>.*?)\s*return\b(?P<rest>.*)$")),
    ("jump", re.compile(r"^(?P<pre>.*?)\s*goto (?P<t>\d+);$")),
]


def _mask_strings(text: str) -> str:
    """Replace string literals with same-length filler so regexes ignore them."""
    out: list[str] = []
    i, n = 0, len(text)
    while i < n:
        if text[i] != '"':
            out.append(text[i])
            i += 1
            continue
        j = i + 1
        while j < n:
            if text[j] == "\\":
                j += 2
                continue
            if text[j] == '"':
                j += 1
                break
            j += 1
        out.append('"' + "#" * max(0, j - i - 2) + '"')
        i = j
    return "".join(out)


class Ins:
    """One VM instruction: prefix statements plus its control effect."""

    __slots__ = ("pc", "op", "text", "kind", "target", "target2", "cond", "body", "pre")

    def __init__(self, pc: int, op, text: str):
        self.pc = pc
        self.op = op
        self.text = text or ""
        self.kind = "stmt"
        self.target = None
        self.target2 = None
        self.cond = ""
        self.body = ""
        self.pre = self.text.rstrip(";")
        self._classify()

    def _slice(self, span: tuple[int, int]) -> str:
        return self.text[span[0]:span[1]].strip()

    def _classify(self) -> None:
        if not self.text:
            return
        masked = _mask_strings(self.text)
        for kind, pattern in TAIL_PATTERNS:
            match = pattern.match(masked)
            if not match:
                continue
            self.kind = kind
            self.pre = self._slice(match.span("pre")).rstrip(";").strip()
            if kind in ("condtrue", "condfalse", "condboth", "condbody", "guardbody"):
                self.cond = self._slice(match.span("cond"))
                self.target = int(self._slice(match.span("t")))
            elif kind == "jump":
                self.target = int(self._slice(match.span("t")))
            if kind == "condboth":
                self.target2 = int(self._slice(match.span("t2")))
            if kind in ("condbody", "guardbody"):
                self.body = self._slice(match.span("body"))
            return

    @property
    def is_control(self) -> bool:
        return self.kind != "stmt"

    def __repr__(self) -> str:  # pragma: no cover - debugging aid
        return f"<@{self.pc} {self.kind} {self.text[:40]}>"


class Proto:
    def __init__(self, pid: str, instructions: list[dict]):
        self.id = pid
        self.code: dict[int, Ins] = {}
        for record in instructions:
            self.code[record["pc"]] = Ins(record["pc"], record.get("op"), record.get("text") or "")
        self.pcs = sorted(self.code)
        self.targets = {i.target for i in self.code.values() if i.target}
        self.targets |= {i.target2 for i in self.code.values() if i.target2}

    def next_pc(self, pc: int) -> int:
        later = [p for p in self.pcs if p > pc]
        return later[0] if later else max(self.pcs) + 1


# ---------------------------------------------------------------------------
# layout
# ---------------------------------------------------------------------------
def build_blocks(proto: Proto) -> dict[int, list[Ins]]:
    """Split the proto into basic blocks keyed by their first pc."""
    leaders = {proto.pcs[0]} | set(proto.targets)
    for pc in proto.pcs:
        ins = proto.code[pc]
        nxt = proto.next_pc(pc)
        if ins.is_control and nxt in proto.code:
            leaders.add(nxt)
    leaders &= set(proto.code)
    blocks: dict[int, list[Ins]] = {}
    current: list[Ins] = []
    for pc in proto.pcs:
        if pc in leaders and current:
            blocks[current[0].pc] = current
            current = []
        current.append(proto.code[pc])
    if current:
        blocks[current[0].pc] = current
    return blocks


def block_successors(blocks: dict[int, list[Ins]]) -> dict[int, list[int]]:
    starts = sorted(blocks)
    following = {start: (starts[i + 1] if i + 1 < len(starts) else None)
                 for i, start in enumerate(starts)}
    succ: dict[int, list[int]] = {}
    for start, block in blocks.items():
        last = block[-1]
        fallthrough = following[start]
        if last.kind == "return":
            out: list[int] = []
        elif last.kind == "jump":
            out = [last.target] if last.target in blocks else []
        elif last.kind == "condboth":
            out = [t for t in (last.target, last.target2) if t in blocks]
        elif last.kind in ("condtrue", "condfalse", "condbody", "guardbody"):
            out = [t for t in (last.target, fallthrough) if t in blocks]
        else:
            out = [fallthrough] if fallthrough else []
        succ[start] = list(dict.fromkeys(out))
    return succ


def reverse_postorder(succ: dict[int, list[int]], entry: int) -> list[int]:
    seen: set[int] = {entry}
    order: list[int] = []
    stack = [(entry, iter(succ.get(entry, [])))]
    while stack:
        node, children = stack[-1]
        advanced = False
        for child in children:
            if child not in seen:
                seen.add(child)
                stack.append((child, iter(succ.get(child, []))))
                advanced = True
                break
        if not advanced:
            order.append(stack.pop()[0])
    order.reverse()
    for node in sorted(succ):
        if node not in seen:
            order.append(node)
    return order


def linearize(proto: Proto) -> tuple[Proto, dict[int, int]]:
    """Re-lay blocks in reverse postorder; returns the new proto and the mapping."""
    blocks = build_blocks(proto)
    if not blocks:
        return proto, {}
    succ = block_successors(blocks)
    order = reverse_postorder(succ, proto.pcs[0])

    new_index: dict[int, int] = {}
    cursor = 1
    for start in order:
        new_index[start] = cursor
        cursor += len(blocks[start])

    def remap(target: int | None) -> int | None:
        if target is None:
            return None
        if target in new_index:
            return new_index[target]
        for start, block in blocks.items():
            if block[0].pc <= target <= block[-1].pc:
                return new_index[start] + (target - block[0].pc)
        return target

    items: list[dict] = []
    for start in order:
        for ins in blocks[start]:
            items.append({"pc": new_index[start] + (ins.pc - blocks[start][0].pc),
                          "op": ins.op, "text": ins.text})
    lifted = Proto(proto.id, items)
    for ins in lifted.code.values():
        ins.target = remap(ins.target)
        ins.target2 = remap(ins.target2)
    lifted.targets = {i.target for i in lifted.code.values() if i.target}
    lifted.targets |= {i.target2 for i in lifted.code.values() if i.target2}
    return lifted, new_index


# ---------------------------------------------------------------------------
# emission
# ---------------------------------------------------------------------------
class Emitter:
    def __init__(self, proto: Proto, original: Proto):
        self.proto = proto
        self.original = original
        self.blocks = build_blocks(proto)

    def block_comment(self, start: int) -> str:
        block = self.blocks[start]
        origin = None
        for old_pc, new_pc in self._block_map().items():
            if new_pc == start:
                origin = old_pc
                break
        span = f"@ {start}" + (f" (was @ {origin})" if origin and origin != start else "")
        return f"-- {span}: {len(block)} instruction" + ("s" if len(block) != 1 else "")

    def _block_map(self) -> dict[int, int]:
        return getattr(self, "_map", {})

    def instruction_lines(self, ins: Ins) -> list[str]:
        nxt = self.proto.next_pc(ins.pc)
        out: list[str] = []
        if ins.pre:
            out.append(ins.pre + ";")
        if ins.kind == "stmt":
            return out
        if ins.kind == "return":
            out.append("return")
            return out
        if ins.kind == "jump":
            out.append(f"PC = {ins.target}")
        elif ins.kind == "condtrue":
            out.append(f"if {ins.cond} then PC = {ins.target} else PC = {nxt} end;")
        elif ins.kind == "condfalse":
            out.append(f"if {ins.cond} then PC = {nxt} else PC = {ins.target} end;")
        elif ins.kind == "condboth":
            out.append(f"if {ins.cond} then PC = {ins.target} else PC = {ins.target2} end;")
        elif ins.kind == "condbody":
            out.append(f"if {ins.cond} then {ins.body}; PC = {ins.target} else PC = {nxt} end;")
        elif ins.kind == "guardbody":
            out.append(f"if {ins.cond} then PC = {nxt} else {ins.body}; PC = {ins.target} end;")
        return out

    def _terminator_target(self, block: list[Ins]) -> int | None:
        """Target the block continues to when nothing branches away."""
        last = block[-1]
        if last.kind == "jump":
            return last.target
        return None

    def emit(self) -> list[str]:
        proto = self.proto
        if not proto.pcs:
            return []
        starts = sorted(self.blocks)
        following = {start: (starts[i + 1] if i + 1 < len(starts) else None)
                     for i, start in enumerate(starts)}

        def falls_through(block: list[Ins], next_start: int | None) -> bool:
            if next_start is None:
                return False
            last = block[-1]
            if last.kind == "jump":
                return last.target == next_start
            if last.kind in ("condtrue", "condfalse", "condbody", "guardbody"):
                return last.target == next_start
            if last.kind == "condboth":
                return last.target == next_start and last.target2 == next_start
            return last.kind != "return"

        regions: list[tuple[int, list[Ins]]] = []
        for start in starts:
            block = self.blocks[start]
            if regions and falls_through(regions[-1][1], start):
                # the previous block's jump only reaches this one: drop it
                previous = regions[-1][1][:-1]
                regions[-1] = (regions[-1][0], previous + block)
            else:
                regions.append((start, list(block)))

        lines = [f"local PC = {proto.pcs[0]}", "while true do"]
        for region_start, region in regions:
            # drop the no-op jump that only exists to reach the next block
            tail = region[-1]
            if tail.kind == "jump" and tail.target == self._next_region_start(regions, region_start):
                region = region[:-1]
            lines.append(f"    -- block @ {region_start}: {len(region)} instruction"
                         + ("s" if len(region) != 1 else ""))
            lines.append(f"    if PC == {region_start} then")
            for ins in region:
                for line in self.instruction_lines(ins):
                    lines.append("        " + line)
            last = region[-1] if region else None
            if last is None:
                lines.append("        PC = " + str(region_start))
            elif last.kind == "stmt":
                lines.append(f"        PC = {proto.next_pc(last.pc)}")
            if last is None or last.kind != "return":
                lines.append("        continue")
            lines.append("    end")
        lines += ["    break", "end"]
        return lines

    @staticmethod
    def _next_region_start(regions: list[tuple[int, list[Ins]]], start: int) -> int | None:
        for index, (region_start, _) in enumerate(regions):
            if region_start == start and index + 1 < len(regions):
                return regions[index + 1][0]
        return None

HEADER = """-- Recovered Luau source for the protected payload of Key.luau.
--
-- Produced by tools/lift.py from the VM program captured at the interpreter's
-- dispatch site (tools/harness). Every proto of the VM program became one Luau
-- function here. Conventions:
--
--   R[n]        register n of the proto (the VM's register file)
--   ...         parameters
--   Protos[n]   the proto table (closure creation reads it)
--   PC          the next block to run
--
-- The payload's basic blocks are laid out in permuted order and joined by
-- explicit jumps (a block-flattening pass ran before Luraph did), so control
-- flow is expressed as a block dispatch loop. Blocks were re-laid out in
-- reverse postorder first, so reading top to bottom follows the flow.
--
-- Constants were pre-resolved by the obfuscator and appear inline as literals.
"""


def lift_listing(listing: dict) -> tuple[str, dict]:
    out: list[str] = [HEADER]
    stats = {"protos": 0, "instructions": 0, "blocks": 0, "lines": 0}
    for entry in listing["protos"]:
        proto = Proto(entry["id"], entry["instructions"])
        laid_out, mapping = linearize(proto)
        emitter = Emitter(laid_out, proto)
        emitter._map = {old: new for old, new in mapping.items()}
        body = emitter.emit()
        executed = sum(1 for i in entry["instructions"] if i.get("executed"))
        stats["protos"] += 1
        stats["instructions"] += len(proto.pcs)
        stats["blocks"] += len(emitter.blocks)
        stats["lines"] += len(body)
        out.append(f"-- proto {entry['id']}: {len(proto.pcs)} instructions, "
                   f"{len(emitter.blocks)} blocks, {executed} executed in the captured run")
        out.append(f"local function {entry['id'].lower()}(...)")
        out.append("    local R = {}")
        out.extend("    " + line if line else line for line in body)
        out.append("end\n")
    return "\n".join(out), stats


def main(argv: list[str]) -> int:
    import argparse

    ap = argparse.ArgumentParser(description="Lift the VM program to Luau source")
    ap.add_argument("--program", default="out/payload/program.json")
    ap.add_argument("--out", default="out/deobfuscated/payload.luau")
    args = ap.parse_args(argv[1:])

    listing = json.loads(pathlib.Path(args.program).read_text(encoding="utf-8",
                                                             errors="surrogateescape"))
    source, stats = lift_listing(listing)
    path = pathlib.Path(args.out)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(source + "\n", encoding="utf-8", errors="surrogateescape")
    print(f"{stats['protos']} protos, {stats['blocks']} blocks, "
          f"{stats['instructions']} instructions -> {path}")
    return 0


if __name__ == "__main__":
    import sys

    raise SystemExit(main(sys.argv))
