#!/usr/bin/env python3
"""Disassemble the program the VM actually runs.

The interpreter receives one instruction per iteration as

    op = X[pc]                       -- opcode array
    K[pc] j[pc] m[pc] l[pc] D[pc] Y[pc]   -- operand arrays, same index

`tools/harness/build_runner.py` instruments exactly that dispatch site and the
harness records every executed `(proto, pc) -> op/operands` tuple.  This module
turns the recording back into a readable listing:

  * opcodes are named from the interpreter's own dispatch ladder (the branch of
    the `if N == <const>` tree *is* the semantics: EQ, ADD, CALL, ...),
  * each branch body is used as a template, with `K[pc]`/`j[pc]`/... substituted
    by the recorded operand values, so an instruction reads like
    `R[545] = R[66] ~= R[2]` instead of `k[K[H]]=(k[j[H]]~=k[m[H]])`,
  * jumps (`H = <target>`) are rendered as `goto <pc>`.
"""

from __future__ import annotations

import re
from collections import Counter, defaultdict

from luau_lex import NAME, NUMBER, OP, match_blocks, parse_number, tokenize
from name_map import classify_opcode
from opcodes import _body_span, _cond_span, _else_span

OPERAND_ARRAYS = ["K", "j", "m", "l", "D", "Y"]
MAX_TEMPLATE = 900
CMP = {"<": lambda a, b: a < b, ">": lambda a, b: a > b,
       ">=": lambda a, b: a >= b, "<=": lambda a, b: a <= b,
       "==": lambda a, b: a == b, "~=": lambda a, b: a != b}
FLIP = {"<": ">", ">": "<", "<=": ">=", ">=": "<=", "==": "==", "~=": "~="}


def dispatch_tree(src: str, start: int) -> tuple[dict[int, str], str | None]:
    """Decode the opcode ladder by *evaluating* it, not by guessing at shapes.

    The interpreter dispatches with a nested `if <op> < const` tree whose leaves
    are the actual instruction implementations.  For every candidate opcode value
    we walk the tree numerically and return the leaf that a real run would take,
    which is exact even where the generator mixed `~=`, reversed comparisons and
    `not(...)` wrappers.
    """
    sub = src[start:start + 60000]
    tokens = tokenize(sub)
    blocks = match_blocks(tokens)
    if not tokens:
        return {}, None

    # opcode variable = the name tested against literals at the root
    var = None
    root = next((i for i, t in enumerate(tokens) if t.kind == NAME and t.text == "if"), None)
    if root is None:
        return {}, None
    cond = _cond_span(tokens, root)
    for k in range(cond[0], cond[1] - 2) if cond else []:
        if tokens[k].kind == NAME and tokens[k + 1].kind == OP and tokens[k + 2].kind == NUMBER:
            var = tokens[k].text
            break
        if tokens[k].kind == NUMBER and tokens[k + 1].kind == OP and tokens[k + 2].kind == NAME:
            var = tokens[k + 2].text
            break
    if var is None:
        return {}, None

    def text(lo: int, hi: int) -> str:
        if hi <= lo:
            return ""
        return re.sub(r"\s+", " ", sub[tokens[lo].start:tokens[hi - 1].end]).strip()

    def first_if(lo: int, hi: int) -> int | None:
        i = lo
        while i < hi:
            t = tokens[i]
            if t.kind == NAME and t.text in ("if", "for", "while", "function", "do", "repeat"):
                if t.text == "if":
                    return i
                end = blocks.get(i)
                if end is not None:
                    i = end + 1
                    continue
            i += 1
        return None

    def test(lo: int, hi: int, value: int) -> bool | None:
        span = tokens[lo:hi]
        negate = False
        if len(span) > 4 and span[0].kind == NAME and span[0].text == "not" \
                and span[1].kind == OP and span[1].text == "(":
            negate, span = True, span[2:-1]
        for k in range(len(span) - 2):
            a, b, c = span[k], span[k + 1], span[k + 2]
            if a.kind == NAME and a.text == var and b.kind == OP and b.text in CMP and c.kind == NUMBER:
                result = CMP[b.text](value, parse_number(c.text))
                return not result if negate else result
            if a.kind == NUMBER and b.kind == OP and b.text in CMP and c.kind == NAME and c.text == var:
                result = CMP[FLIP[b.text]](value, parse_number(a.text))
                return not result if negate else result
        return None

    def leaf(value: int) -> str | None:
        lo, hi = 0, len(tokens)
        while True:
            idx = first_if(lo, hi)
            if idx is None:
                return text(lo, hi)
            span = _cond_span(tokens, idx)
            verdict = test(span[0], span[1], value) if span else None
            if verdict is None:
                return text(lo, hi)  # runtime condition: this whole span is the opcode body
            branch = _body_span(tokens, blocks, idx) if verdict else \
                (_else_span(tokens, blocks, idx) or (idx, idx))
            if branch[1] <= branch[0]:
                return ""
            lo, hi = branch

    out: dict[int, str] = {}
    for value in range(0, 300):
        impl = leaf(value)
        if impl and len(impl) <= MAX_TEMPLATE:
            out[value] = impl
    return out, var


KEYWORDS = ("then", "do", "end", "else", "elseif")

VALID_SIMPLE_ESCAPES = set('abfnrtvz\\"\'0`')


def _sanitize_strings(text: str) -> str:
    """Repair escape sequences that Luau would reject (the payload has some)."""
    def fix(match: re.Match) -> str:
        body = match.group(1)
        out = []
        i = 0
        while i < len(body):
            ch = body[i]
            if ch != "\\" or i + 1 >= len(body):
                out.append(ch)
                i += 1
                continue
            nxt = body[i + 1]
            if nxt == "u" and re.match(r"[0-9a-fA-F]{4}", body[i + 2:i + 6]):
                try:
                    out.append(chr(int(body[i + 2:i + 6], 16)))
                except ValueError:
                    out.append("")
                i += 6
                continue
            if nxt == "u" and body[i + 2:i + 3] == "{":
                close = body.find("}", i + 3)
                out.append(body[i:close + 1] if close > 0 else "")
                i = close + 1 if close > 0 else i + 2
                continue
            if nxt.isdigit() or nxt in VALID_SIMPLE_ESCAPES:
                out.append(body[i:i + 2])
                i += 2
                continue
            out.append("\\\\" + nxt)
            i += 2
        return '"' + "".join(out) + '"'

    return re.sub(r'"((?:[^"\\]|\\.)*)"', fix, text)


def _space_keywords(text: str) -> str:
    """Make sure `do`/`then`/`end` are separate tokens (but not inside strings)."""
    parts = re.split(r'("(?:[^"\\]|\\.)*")', text)
    for index in range(0, len(parts), 2):
        chunk = parts[index]
        for keyword in KEYWORDS:
            chunk = re.sub(rf"(?<=\d){keyword}", f" {keyword} ", chunk)
            chunk = re.sub(rf"(?<=[\)\]}}]){keyword}", f" {keyword} ", chunk)
        parts[index] = chunk
    return "".join(parts)


def render_instruction(template: str, op: int, fields: list[str | None]) -> str:
    """Substitute the recorded operands into a branch body."""
    values = dict(zip(OPERAND_ARRAYS, fields[1:]))
    text = template

    def repl_for(name: str):
        def repl(match: re.Match) -> str:
            value = values.get(name)
            if value is None or value == "":
                return match.group(0)
            return value
        return repl

    for name in OPERAND_ARRAYS:
        text = re.sub(rf"\b{name}\[H\]", repl_for(name), text)
    text = re.sub(r"\bX\[H\]", str(op), text)

    # jumps: the interpreter sets `H = <operand>` and then advances by one at the
    # bottom of the dispatch loop, so the real next pc is operand + 1.  Verified
    # against 1,200 observed transitions (jump target == operand + 1 every time).
    text = re.sub(r"\bH=(\d+)\b", lambda m: f"goto {int(m.group(1)) + 1}", text)
    text = re.sub(r"\bH=\((\d+)\)", lambda m: f"goto {int(m.group(1)) + 1}", text)
    text = re.sub(r"\(k\)", "R", text)
    text = re.sub(r"\bk\b(?=\[)", "R", text)
    text = re.sub(r"\bs\b(?=\[)", "Protos", text)
    text = _space_keywords(text)
    text = _sanitize_strings(text)
    text = text.replace(";", "; ")

    def num(match: re.Match) -> str:
        try:
            return str(int(parse_number(match.group(0))))
        except (ValueError, OverflowError):
            return match.group(0)

    text = re.sub(r"\b0[xX][0-9a-fA-F_]+\b|\b0[bB][01_]+\b", num, text)
    text = re.sub(r"\((R\[\d+\])\)", r"\1", text)
    return re.sub(r"\s+", " ", text).strip()


DISPATCH_MARK = "local N=X[H];if N<"


def find_dispatch(stage_text: str) -> tuple[dict[int, str], str | None, int]:
    """Locate the interpreter's opcode ladder in a deobfuscated stage."""
    pos = stage_text.find(DISPATCH_MARK)
    if pos < 0:
        return {}, None, -1
    templates, var = dispatch_tree(stage_text, pos + len("local N=X[H];"))
    return templates, var, pos


LABEL_RULES: list[tuple[str, str]] = [
    (r"^goto \d+;$", "JUMP"),
    (r"^if .* then goto \d+;? ?end;$", "conditional jump"),
    (r"^if .* then goto \d+; else goto \d+;? ?end;$", "conditional jump"),
    (r"^(z=)?(\d+);? ?R\[z\]=R\[z\]\(", "CALL"),
    (r"^R\[\d+\]=R\[\d+\]\(", "CALL"),
    (r"Protos\[", "NEWCLOSURE"),
    (r"^return\b", "RETURN"),
    (r"\bfor \w+=", "FORNLOOP"),
    (r"=#R\[|#R\[", "LENGTH"),
    (r"^R\[\d+\]=.?\d+\)?;$", "LOADK / LOADN"),
    (r"^R\[\d+\]=R\[\d+\];?$", "MOVE"),
    (r"^\(?R\[z\]\)?\(R\[z", "CALL"),
    (r"^z=?\(?\d+\)?;? ?R\[z\]=R\[z\]\(", "CALL"),
    (r"^R\[\d+\]\[[^\]]+\]=", "SETTABLE"),
    (r"^R\[\d+\]=R\[\d+\]\[R\[\d+\]\];?$", "GETTABLE"),
    (r"^R\[\d+\]\[R\[\d+\]\]=", "SETTABLE"),
    (r"^R\[\d+\]=R\[\d+\]\[\d+\];?$", "GETIMPORT / GETFIELD"),
    (r"~=", "compare (not equal)"),
    (r"==", "compare (equal)"),
    (r"<=", "compare (le)"),
    (r">=", "compare (ge)"),
    (r"\+", "ADD"),
    (r"\*", "MUL"),
    (r"\bnot\b", "NOT"),
    (r"\.\.", "CONCAT"),
    (r"nil", "LOADNIL"),
    (r"^R\[\d+\]=.?R\[", "register move / read"),
    (r"\[\]", "NEWTABLE"),
    (r"\+", "ADD"),
    (r"-", "SUB"),
    (r"\*", "MUL"),
    (r"/", "DIV"),
]


def label_instruction(template: str, fields: list[str]) -> str:
    """Name an instruction from its implementation (cheap, shape-based)."""
    text = render_instruction(template, int(fields[0]), fields) if fields else template
    for pattern, name in LABEL_RULES:
        if re.search(pattern, text):
            return name
    return classify_opcode(template)


def build_listing(runtime: dict, inventories: dict, stage_texts: dict | None = None,
                  blob: str = "B") -> dict:
    """Return per-proto listings, an opcode table and a histogram."""
    stage_text = (stage_texts or {}).get(blob, "")
    templates, opcode_var, site_offset = find_dispatch(stage_text)
    if not templates:  # fall back to the dispatched handler body
        for handler in (inventories.get(blob) or {}).get("handlers", []):
            body = handler.get("body") or ""
            if DISPATCH_MARK in body:
                templates, opcode_var = dispatch_tree(body, body.find(DISPATCH_MARK) + 22)
                break

    protos: dict[str, list[dict]] = defaultdict(list)
    executed = {(r["site"], r["pc"]) for r in runtime.get("vm", [])}
    full = runtime.get("protos") or {}

    def add(site: str, pc: int, fields: list[str | None]) -> None:
        op_int = None
        if fields and fields[0] is not None and str(fields[0]).lstrip("-").isdigit():
            op_int = int(fields[0])
        template = templates.get(op_int, "") if op_int is not None else ""
        protos[site].append({
            "pc": pc,
            "op": op_int,
            "operands": fields[1:],
            "executed": (site, pc) in executed,
            "semantics": label_instruction(template, fields) if template else "unclassified",
            "template": template,
            "text": render_instruction(template, op_int, fields) if template else "",
        })

    if full:  # complete protos, straight from the interpreter's code arrays
        for site, entry in full.items():
            for index, fields in enumerate(entry.get("code") or [], 1):
                add(site, index, list(fields))
    else:  # fall back to the executed trace only
        for record in runtime.get("vm", []):
            add(record["site"], record["pc"], record.get("fields") or [])

    ordered = sorted(protos.items(), key=lambda kv: (-len(kv[1]), kv[0]))
    proto_list = []
    for i, (site, instructions) in enumerate(ordered, 1):
        instructions.sort(key=lambda r: r["pc"])
        proto_list.append({"id": f"P{i}", "site": site, "instructions": instructions})

    # constant slots that can be read straight out of the listing:
    #   R[<proto table>][<slot>] = ("literal")   -- the VM pre-resolves constants
    const_re = re.compile(r'^R\[\d+\]\[(\d+)\]=\((".*")\);$')
    constants: dict[str, dict[str, str]] = {}
    for proto in proto_list:
        table: dict[str, str] = {}
        for ins in proto["instructions"]:
            match = const_re.match(ins["text"] or "")
            if match:
                table.setdefault(match.group(1), match.group(2))
        if table:
            constants[proto["id"]] = dict(sorted(table.items(), key=lambda kv: int(kv[0])))

    histogram = Counter(i["semantics"] for p in proto_list for i in p["instructions"])
    opcodes = Counter(i["op"] for p in proto_list for i in p["instructions"] if i["op"] is not None)
    covered = sum(1 for p in proto_list for i in p["instructions"] if i["text"])
    return {
        "opcode_var": opcode_var,
        "dispatch_offset": site_offset,
        "templates": {str(k): v for k, v in sorted(templates.items())},
        "protos": proto_list,
        "instruction_count": sum(len(p["instructions"]) for p in proto_list),
        "decoded_count": covered,
        "executed_count": sum(1 for p in proto_list for i in p["instructions"] if i["executed"]),
        "complete": bool(full),
        "constants": constants,
        "constant_count": sum(len(v) for v in constants.values()),
        "histogram": dict(histogram.most_common()),
        "opcode_histogram": {str(k): v for k, v in sorted(opcodes.items())},
    }


def render_text(listing: dict) -> str:
    lines = []
    lines.append("-- Disassembly of the Luraph VM program (decoded from the interpreter's")
    lines.append("-- own dispatch: opcode array X, operand arrays K/j/m/l/D/Y).")
    lines.append(f"-- {listing['instruction_count']} instructions across "
                 f"{len(listing['protos'])} protos "
                 f"({listing.get('executed_count', 0)} executed in the captured run).")
    lines.append("")
    for proto in listing["protos"]:
        lines.append(f"proto {proto['id']}  ({len(proto['instructions'])} instructions)")
        lines.append("")
        for ins in proto["instructions"]:
            ops = " ".join(v for v in ins["operands"] if v not in (None, ""))
            head = f"  {ins['pc']:>6}  op{ins['op']:<5} {ops:<24}"
            body = ins["text"] or "(no template)"
            lines.append(f"{head}  {body}   -- {ins['semantics']}")
        lines.append("")
    return "\n".join(lines)


def render_markdown(listing: dict, sample: int = 60) -> str:
    lines = ["# Recovered program (VM disassembly)", "",
             "The protected payload is not Luau source: it is a program for the Luraph bytecode",
             "VM. The harness instruments the interpreter's dispatch site, so every executed",
             "instruction is captured as `(proto, pc) -> opcode + operands`, and this listing",
             "reconstructs the program from it. Opcodes are named from the interpreter's own",
             "comparison tree, and operands are substituted into the branch body, so a line",
             "reads like `R[545] = R[66] ~= R[2]` rather than `k[K[H]]=(k[j[H]]~=k[m[H]])`.",
             "",
             f"- instructions recovered: **{listing['instruction_count']:,}**"
             + (" (whole protos, including paths this run never executed)"
                if listing.get("complete") else " (executed path only)"),
             f"- executed in the captured run: {listing.get('executed_count', 0):,}",
             f"- protos (functions): **{len(listing['protos'])}**",
             f"- opcode variable: `{listing['opcode_var']}`",
             ""]
    lines.append("## Protos")
    lines.append("")
    lines.append("| proto | instructions |")
    lines.append("|---|---|")
    for proto in listing["protos"][:40]:
        lines.append(f"| `{proto['id']}` | {len(proto['instructions'])} |")
    lines.append("")
    lines.append("## Instruction mix")
    lines.append("")
    lines.append("| semantics | count |")
    lines.append("|---|---|")
    for name, count in list(listing["histogram"].items())[:25]:
        lines.append(f"| {name} | {count} |")
    lines.append("")
    if listing.get("constants"):
        lines.append("## Constant slots recovered from the listing")
        lines.append("")
        lines.append("The VM pre-resolves constants into the operand slots, so "
                     f"**{listing['constant_count']}** string constants appear directly in the "
                     "disassembly, keyed by their slot in the proto's constant table.")
        lines.append("")
        lines.append("| proto | slot | value |")
        lines.append("|---|---|---|")
        shown = 0
        for proto_id, table in listing["constants"].items():
            for slot, value in table.items():
                if shown >= 40:
                    break
                lines.append(f"| `{proto_id}` | {slot} | `{value}` |")
                shown += 1
            if shown >= 40:
                break
        lines.append("")
    biggest = listing["protos"][0] if listing["protos"] else None
    if biggest:
        lines.append(f"## `{biggest['id']}` — first {sample} instructions")
        lines.append("")
        lines.append("```lua")
        for ins in biggest["instructions"][:sample]:
            ops = " ".join(v for v in ins["operands"] if v not in (None, ""))
            lines.append(f"{ins['pc']:>6}  op{ins['op']:<4} {ops:<22} {ins['text']}  -- {ins['semantics']}")
        lines.append("```")
        lines.append("")
    return "\n".join(lines)


def write_outputs(listing: dict, out_dir, reports_dir) -> dict:
    """Persist the listing (text + json) and the markdown report; return paths."""
    import json
    import pathlib

    out_dir = pathlib.Path(out_dir)
    reports_dir = pathlib.Path(reports_dir)
    prog_dir = out_dir / "payload"
    prog_dir.mkdir(parents=True, exist_ok=True)

    listing_text = render_text(listing)
    text_path = prog_dir / "program.disasm.txt"
    text_path.write_text(listing_text, encoding="utf-8", errors="surrogateescape")
    # keep a copy next to the reports: this is the reviewable deliverable
    committed = reports_dir / "program.disasm.txt"
    committed.write_text(listing_text, encoding="utf-8", errors="surrogateescape")
    json_path = prog_dir / "program.json"
    payload = dict(listing)
    payload["protos"] = [
        {"id": p["id"], "site": p["site"], "instructions": p["instructions"]}
        for p in listing["protos"]]
    json_path.write_text(json.dumps(payload, indent=1), encoding="utf-8", errors="surrogateescape")
    report_path = reports_dir / "PROGRAM.md"
    report_path.write_text(render_markdown(listing), encoding="utf-8", errors="surrogateescape")
    return {"disassembly": str(text_path), "committed_listing": str(committed),
            "program_json": str(json_path), "report": str(report_path)}


def main(argv: list[str]) -> int:
    import argparse
    import json
    import pathlib

    ap = argparse.ArgumentParser(description="Disassemble the captured VM program")
    ap.add_argument("--runtime", required=True, help="runtime.json from the harness")
    ap.add_argument("--inventory", default="out/inventory.json")
    ap.add_argument("--stage", default="B", help="which stage's interpreter to use")
    ap.add_argument("--stage-file", default="out/stages/stageB.luau")
    ap.add_argument("--out", default="out")
    ap.add_argument("--reports", default="reports")
    args = ap.parse_args(argv[1:])

    runtime = json.loads(pathlib.Path(args.runtime).read_text(encoding="utf-8", errors="surrogateescape"))
    inventories = {}
    inventory_path = pathlib.Path(args.inventory)
    if inventory_path.exists():
        inventories = json.loads(inventory_path.read_text(encoding="utf-8", errors="surrogateescape"))
    stage_text = pathlib.Path(args.stage_file).read_text(encoding="utf-8", errors="surrogateescape")
    listing = build_listing(runtime, inventories, {args.stage: stage_text}, args.stage)
    paths = write_outputs(listing, args.out, args.reports)
    print(f"{listing['instruction_count']} instructions, {listing['decoded_count']} decoded, "
          f"{len(listing['protos'])} protos -> {paths['disassembly']}")
    return 0


if __name__ == "__main__":
    import sys

    raise SystemExit(main(sys.argv))
