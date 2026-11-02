#!/usr/bin/env python3
"""Reconstruct structured control flow from the flattened VM CFG.

The payload's basic blocks are laid out in permuted order and joined by explicit
jumps, so the lifted program looks like a state machine.  This module puts the
structure back:

* **Dominators** find loops — an edge `u -> v` where `v` dominates `u` is a back
  edge, and the nodes that reach `u` without passing through `v` form the natural
  loop.
* **Post-dominators** find merges — the immediate post-dominator of a two-way
  branch is where its arms come back together, which is exactly what a
  structured `if`/`else` needs as its follow set.
* **A follow-set walk** then emits `while` / `if` / `else` / `break` /
  `continue` instead of `PC = n`, using Cifuentes-style structuring: a region is
  emitted until it reaches its follow node.

Anything the walk cannot place (multiple loop exits, irreducible regions, a block
reachable twice) is reported instead of guessed at, and the caller falls back to
the state-machine form for that proto, so the output never claims structure the
CFG does not have.
"""

from __future__ import annotations

import re
from collections import defaultdict

EXIT = -1  # virtual exit node


class StructError(Exception):
    pass


class _LoopLeft(Exception):
    """Raised when a branch breaks out of the loop being emitted."""

    def __init__(self, exit_node):
        super().__init__(str(exit_node))
        self.exit_node = exit_node


def build_cfg(blocks: dict[int, list], following: dict[int, int | None]):
    """node -> successors, plus the conditional info of each terminator."""
    succ: dict[int, list[int]] = {}
    terms: dict[int, object] = {}
    for start, block in blocks.items():
        last = block[-1]
        fall = following.get(start)
        terms[start] = last
        if last.kind == "return":
            succ[start] = []
        elif last.kind == "jump":
            succ[start] = [last.target] if last.target in blocks else []
        elif last.kind == "condboth":
            succ[start] = [t for t in (last.target, last.target2) if t in blocks]
        elif last.kind in ("condtrue", "condfalse", "condbody", "guardbody"):
            succ[start] = [t for t in (last.target, fall) if t in blocks]
        else:
            succ[start] = [fall] if fall is not None else []
    return succ, terms


def dominators(nodes: list[int], succ: dict[int, list[int]], entry: int) -> dict[int, set[int]]:
    preds: dict[int, set[int]] = {n: set() for n in nodes}
    for node in nodes:
        for target in succ.get(node, []):
            if target in preds:
                preds[target].add(node)
    dom: dict[int, set[int]] = {n: set(nodes) for n in nodes}
    dom[entry] = {entry}
    changed = True
    while changed:
        changed = False
        for node in nodes:
            if node == entry:
                continue
            incoming = [dom[p] for p in preds[node] if p in dom]
            new = set.intersection(*incoming) | {node} if incoming else {node}
            if new != dom[node]:
                dom[node] = new
                changed = True
    return dom


def postdominators(nodes: list[int], succ: dict[int, list[int]]) -> dict[int, set[int]]:
    all_nodes = list(nodes) + [EXIT]
    preds: dict[int, set[int]] = {n: set() for n in all_nodes}
    for node in nodes:
        targets = succ.get(node) or [EXIT]
        for target in targets:
            preds.setdefault(target, set()).add(node)
    pd: dict[int, set[int]] = {n: set(all_nodes) for n in all_nodes}
    pd[EXIT] = {EXIT}
    changed = True
    while changed:
        changed = False
        for node in nodes:
            targets = succ.get(node) or [EXIT]
            incoming = [pd.get(t, {EXIT}) for t in targets]
            new = set.intersection(*incoming) | {node} if incoming else {node, EXIT}
            if new != pd[node]:
                pd[node] = new
                changed = True
    return pd


def immediate_postdom(node: int, nodes: list[int], pd: dict[int, set[int]]) -> int:
    """Closest strict post-dominator of `node` (EXIT at the end of the proto).

    The immediate post-dominator is the strict post-dominator that every other
    strict post-dominator also post-dominates.
    """
    candidates = [c for c in pd.get(node, {EXIT}) if c != node]
    for candidate in candidates:
        if candidate == EXIT:
            continue
        others = [c for c in candidates if c != candidate]
        if all(other in pd.get(candidate, set()) for other in others):
            return candidate
    return EXIT


def natural_loops(nodes: list[int], succ: dict[int, list[int]],
                  dom: dict[int, set[int]]) -> dict[int, set[int]]:
    """header -> set of loop nodes (only properly nested, single-header loops)."""
    loops: dict[int, set[int]] = {}
    for node in nodes:
        for target in succ.get(node, []):
            if target in dom.get(node, set()):  # back edge
                body = {target, node}
                stack = [node]
                while stack:
                    current = stack.pop()
                    for pred in _predecessors(nodes, succ, current):
                        if pred not in body:
                            body.add(pred)
                            if pred != target:
                                stack.append(pred)
                loops.setdefault(target, set()).update(body)
    # a header that is itself inside another loop is fine (nesting), but a node
    # claimed by two different headers is not
    owner: dict[int, int] = {}
    for header, body in loops.items():
        for node in body:
            if node in owner and owner[node] != header:
                other = owner[node]
                nested = header in loops.get(other, set()) or other in loops.get(header, set())
                if not nested:
                    raise StructError(f"overlapping loops: {header} and {other} share block {node}")
                continue
            owner[node] = header
    return loops


def strongly_connected(nodes: list[int], succ: dict[int, list[int]]) -> list[set[int]]:
    """Kosaraju's algorithm, iterative, so deep CFGs cannot blow the stack."""
    seen: set[int] = set()
    order: list[int] = []
    for root in nodes:
        if root in seen:
            continue
        stack = [(root, 0)]
        seen.add(root)
        while stack:
            node, index = stack[-1]
            kids = [t for t in succ.get(node, []) if t in succ]
            if index < len(kids):
                stack[-1] = (node, index + 1)
                child = kids[index]
                if child not in seen:
                    seen.add(child)
                    stack.append((child, 0))
            else:
                order.append(node)
                stack.pop()
    reverse: dict[int, list[int]] = {n: [] for n in nodes}
    for node in nodes:
        for target in succ.get(node, []):
            if target in reverse:
                reverse[target].append(node)
    assigned: set[int] = set()
    components: list[set[int]] = []
    for node in reversed(order):
        if node in assigned:
            continue
        component = {node}
        assigned.add(node)
        stack = [node]
        while stack:
            current = stack.pop()
            for pred in reverse.get(current, []):
                if pred not in assigned:
                    assigned.add(pred)
                    component.add(pred)
                    stack.append(pred)
        components.append(component)
    return components


def _predecessors(nodes: list[int], succ: dict[int, list[int]], node: int) -> list[int]:
    return [n for n in nodes if node in succ.get(n, [])]


class Structurer:
    def __init__(self, proto, blocks, following):
        self.proto = proto
        self.blocks = blocks
        self.following = following
        self.nodes = sorted(blocks)
        self.succ, self.terms = build_cfg(blocks, following)
        self.dom = dominators(self.nodes, self.succ, self.nodes[0])
        self.pd = postdominators(self.nodes, self.succ)
        self.loops = natural_loops(self.nodes, self.succ, self.dom)
        self.emitted: set[int] = set()
        self.dupes: dict[int, int] = defaultdict(int)
        self.lines: list[str] = []
        self.depth = 0
        self.loop_exits: dict[int, list[int]] = {}
        self.stats = {"ifs": 0, "whiles": 0, "breaks": 0, "continues": 0, "islands": 0}
        self._collect_loop_exits()
        self.order = {node: i for i, node in enumerate(self.nodes)}
        self.island_of: dict[int, frozenset[int]] = {}
        self.contained = False
        self.parse_check = None
        self.line_budget = 20 * max(len(self.nodes), 1) + 2000
        self._find_islands()

    def _find_islands(self) -> None:
        """Irreducible regions: cycles the loop analysis cannot express.

        A natural loop is an SCC that is entered through exactly one header and
        whose body the header dominates.  Anything else that cycles — several
        entry points, or a cycle that skips the loop header — cannot be written
        as a `while`, so it is emitted as a small numeric dispatch loop instead
        of being flattened wholesale.
        """
        preds: dict[int, set[int]] = {n: set() for n in self.nodes}
        for node in self.nodes:
            for target in self.succ.get(node, []):
                if target in preds:
                    preds[target].add(node)
        for component in strongly_connected(self.nodes, self.succ):
            if len(component) < 2:
                continue
            headers = [n for n in component if any(p not in component for p in preds[n])]
            if len(headers) == 1:
                header = headers[0]
                if self.loops.get(header) == component:
                    continue        # an ordinary, properly nested loop
            if not headers:
                continue            # a cycle with no entry at all: dead code
            frozen = frozenset(component)
            for node in component:
                self.island_of.setdefault(node, frozen)
        for header, body in self.loops.items():
            inner = set(body) - {header}
            if len(inner) < 2:
                continue
            sub = {n: [t for t in self.succ.get(n, []) if t in inner] for n in inner}
            for component in strongly_connected(sorted(inner), sub):
                if len(component) < 2:
                    continue
                frozen = frozenset(component)
                for node in component:
                    self.island_of.setdefault(node, frozen)

    # -- helpers -----------------------------------------------------------
    def _collect_loop_exits(self) -> None:
        for header, body in self.loops.items():
            exits = set()
            for node in body:
                for target in self.succ.get(node, []):
                    if target not in body:
                        exits.add(target)
            self.loop_exits[header] = sorted(exits) if exits else [EXIT]

    def exit_index(self, loop: int | None, target: int) -> int | None:
        """1-based exit number when `target` leaves the loop, else None."""
        if loop is None:
            return None
        exits = self.loop_exits.get(loop, [])
        if len(exits) <= 1:
            return None
        if target in exits:
            return exits.index(target) + 1
        return None

    def _leave(self, loop: int, target: int) -> str | None:
        """Source for leaving `loop` towards `target`, or None if it is not an exit."""
        exits = self.loop_exits.get(loop, [])
        if target not in exits:
            return None
        if len(exits) == 1:
            return "break"
        return f"_e{loop} = {exits.index(target) + 1}; break"

    def indent(self, text: str) -> str:
        return "    " * self.depth + text

    def block_statements(self, block) -> list[str]:
        out = []
        for ins in block:
            if ins.pre:
                out.append(self.indent(ins.pre.rstrip(";") + ";"))
        return out

    def _meet(self, take: int, other: int, stop: int) -> int | None:
        """The earliest block both arms can reach without passing the merge."""
        def reach(source: int) -> set[int]:
            seen = {source}
            stack = [source]
            while stack and len(seen) < 512:
                node = stack.pop()
                for succ in self.succ.get(node, []):
                    if succ == stop or succ in seen or succ not in self.blocks:
                        continue
                    seen.add(succ)
                    stack.append(succ)
            return seen
        common = (reach(take) & reach(other)) - {stop}
        if not common:
            return None
        return min(common, key=lambda n: self.order.get(n, 1 << 30))

    def _reaches(self, source: int, target: int, stop: int) -> bool:
        """Is `target` reachable from `source` without passing through `stop`?"""
        if source == target:
            return True
        seen = {source, stop}
        stack = [source]
        while stack:
            node = stack.pop()
            for succ in self.succ.get(node, []):
                if succ == target:
                    return True
                if succ in seen or succ not in self.blocks:
                    continue
                seen.add(succ)
                stack.append(succ)
        return False

    def cond_text(self, last, swapped: bool) -> str:
        if last.kind in ("condtrue", "condfalse"):
            text = last.cond
            return text
        if last.kind == "condboth":
            return last.cond
        if last.kind == "guardbody":
            return f"not ({last.cond})"
        if last.kind == "condbody":
            return last.cond
        return last.cond

    # -- emission ----------------------------------------------------------
    def emit(self, start: int, follow: int | None, loop: int | None = None) -> int | None:
        """Emit structured code from `start` until `follow`; return the next node."""
        node = start
        guard = 0
        while node is not None and node != follow and node != EXIT:
            guard += 1
            if guard > 100000:
                raise StructError("walk did not terminate")
            if len(self.lines) > self.line_budget:
                raise StructError(f"structured output exceeded {self.line_budget} lines")
            if node not in self.blocks:
                raise StructError(f"jump to unknown block {node}")
            if loop is not None:
                if node == loop and node in self.emitted:
                    self.lines.append(self.indent("continue"))
                    self.stats["continues"] += 1
                    return None
                leave = self._leave(loop, node)
                if leave is not None:
                    self.lines.append(self.indent(leave))
                    self.stats["breaks"] += 1
                    return None
            if node in self.loops and node != loop:
                node = self.emit_loop(node, follow)
                continue
            if node in self.island_of:
                node = self.emit_island(node, follow, loop)
                continue
            if loop is not None and node == loop and node in self.emitted:
                # a jump straight back to the header restarts the loop
                self.lines.append(self.indent("continue"))
                self.stats["continues"] += 1
                return None

            if node in self.emitted:
                # the CFG re-enters this block along a different path: duplicate
                # the tail rather than give up on the whole function
                if self.dupes[node] >= 4:
                    raise StructError(f"block {node} emitted twice")
                self.dupes[node] += 1
                self.emitted.discard(node)
            self.emitted.add(node)

            block = self.blocks[node]
            last = block[-1]
            # jump to the loop header = continue
            if loop is not None and last.kind == "jump" and last.target == loop:
                self.lines.extend(self.block_statements(block[:-1]))
                self.lines.append(self.indent("continue"))
                self.stats["continues"] += 1
                return None

            self.lines.extend(self.block_statements(block))

            if last.kind == "return":
                self.lines.append(self.indent("return"))
                return None

            succs = [s for s in self.succ.get(node, []) if s != node]

            if not succs:
                return None

            if len(succs) == 1:
                target = succs[0]
                if target == follow:
                    return target
                if loop is not None and target == loop:
                    self.lines.append(self.indent("continue"))
                    self.stats["continues"] += 1
                    return None
                if loop is not None:
                    leave = self._leave(loop, target)
                    if leave is not None:
                        self.lines.append(self.indent(leave))
                        self.stats["breaks"] += 1
                        return None
                    if target not in self.loops.get(loop, set()):
                        # left the loop by a path the loop analysis did not call an
                        # exit: break out and let the enclosing region resume there
                        self.lines.append(self.indent("break"))
                        self.stats["breaks"] += 1
                        raise _LoopLeft(target)
                node = target
                continue

            # two successors: an if/else whose merge is the post-dominator
            node = self.emit_if(node, last, succs, follow, loop)
            if loop is not None and node == loop:
                self.lines.append(self.indent("continue"))
                self.stats["continues"] += 1
                return None
            if loop is not None and node is not None:
                leave = self._leave(loop, node)
                if leave is not None:
                    self.lines.append(self.indent(leave))
                    self.stats["breaks"] += 1
                    return None

        return node

    def emit_if(self, node: int, last, succs: list[int], follow: int | None,
                loop: int | None) -> int | None:
        take = succs[0]           # successor when the condition holds
        other = succs[1]          # fall-through successor
        if last.kind == "condfalse":
            take, other = other, take
        elif last.kind == "condboth":
            take, other = last.target, last.target2

        merge = immediate_postdom(node, self.nodes, self.pd)
        if merge not in self.blocks:
            merge = follow if follow is not None else EXIT
        # the post-dominator can sit past a reconvergence point the two arms
        # share; emitting up to that nearer node keeps the arms from both
        # walking through it
        if take != merge and other != merge and take != other:
            meet = self._meet(take, other, merge)
            if meet is not None and self.order.get(node, -1) < self.order.get(meet, 1 << 30) \
                    and self.order.get(meet, 1 << 30) < self.order.get(merge, 1 << 30):
                merge = meet

        cond = self.cond_text(last, False)
        if last.kind in ("condtrue", "condfalse", "condboth", "condbody", "guardbody"):
            if last.kind == "condbody" and last.body:
                cond = f"{last.cond}"
            if last.kind == "guardbody":
                take, other = other, take
                cond = last.cond

        leave_take = self._leave(loop, take) if loop is not None else None
        leave_other = self._leave(loop, other) if loop is not None else None
        if (take == merge or other == merge) and leave_take is None and leave_other is None:
            only = other if take == merge else take
            if only == merge:
                return merge
            keyword = "if" if take == merge else "if"
            inner = f"not ({cond})" if take == merge else cond
            self.lines.append(self.indent(f"{keyword} {inner} then"))
            self.stats["ifs"] += 1
            self.depth += 1
            self.emit(only, merge, loop)
            self.depth -= 1
            self.lines.append(self.indent("end"))
            if merge == EXIT:
                return EXIT
            return merge
        if leave_take is not None and leave_other is not None:
            self.lines.append(self.indent(f"if {cond} then {leave_take} else {leave_other} end"))
            self.stats["ifs"] += 1
            return None
        self.lines.append(self.indent(f"if {cond} then"))
        self.stats["ifs"] += 1
        self.depth += 1
        pending = None
        try:
            if leave_take is not None:
                self.lines.append(self.indent(leave_take))
                self.stats["breaks"] += 1
            else:
                self.emit(take, merge, loop)
        except _LoopLeft as left:
            pending = left
        self.depth -= 1
        if pending is None:
            if leave_other is not None:
                self.lines.append(self.indent("else"))
                self.depth += 1
                self.lines.append(self.indent(leave_other))
                self.stats["breaks"] += 1
                self.depth -= 1
            elif other != merge:
                self.lines.append(self.indent("else"))
                self.depth += 1
                try:
                    self.emit(other, merge, loop)
                except _LoopLeft as left:
                    pending = left
                self.depth -= 1
        self.lines.append(self.indent("end"))
        if pending is not None:
            raise pending
        if (leave_take is not None or leave_other is not None) and loop is not None \
                and merge not in self.loops.get(loop, set()):
            # the merge lies after the loop: unwind to emit_loop, which continues there
            raise _LoopLeft(merge if merge != EXIT else None)
        if leave_take is not None:
            return None
        if merge == EXIT:
            return EXIT
        return merge

    def emit_loop(self, header: int, follow: int | None) -> int | None:
        body = self.loops[header]
        exits = self.loop_exits[header]
        exit_node = exits[0] if len(exits) == 1 else EXIT
        if len(exits) > 1:
            return self.emit_multi_exit_loop(header, body, exits, follow)
        back_edges = [n for n in body if header in self.succ.get(n, [])]
        # `while cond do ... end` when the header tests and exits in one branch
        head = self.blocks[header][-1]
        while_form = False
        if head.kind in ("condtrue", "condfalse") and back_edges:
            head_succ = self.succ.get(header, [])
            inside = [s for s in head_succ if s in body]
            outside = [s for s in head_succ if s not in body]
            if len(inside) == 1 and len(outside) == 1 and outside[0] == exit_node \
                    and len(back_edges) == 1:
                while_form = True

        if while_form:
            branch_into_body = [s for s in self.succ.get(header, []) if s in body][0]
            cond = head.cond
            if head.kind == "condfalse":
                cond = f"not ({cond})"
            self.lines.append(self.indent(f"while {cond} do"))
            self.stats["whiles"] += 1
            self.emitted.add(header)
            self.lines.extend(self.block_statements(self.blocks[header][:-1]))
            self.depth += 1
            try:
                self.emit(branch_into_body, header, loop=header)
            except _LoopLeft as left:
                self.depth -= 1
                self.lines.append(self.indent("end"))
                return left.exit_node
            self.depth -= 1
            self.lines.append(self.indent("end"))
            return exit_node if exit_node != EXIT else None

        self.lines.append(self.indent("while true do"))
        self.stats["whiles"] += 1
        self.depth += 1
        try:
            self.emit(header, None, loop=header)
        except _LoopLeft as left:
            self.depth -= 1
            self.lines.append(self.indent("end"))
            return left.exit_node
        self.depth -= 1
        self.lines.append(self.indent("end"))
        return exit_node if exit_node != EXIT else None

    def emit_multi_exit_loop(self, header: int, body: set[int], exits: list[int],
                             follow: int | None) -> int | None:
        """Loop with several exits: leave a number behind and dispatch after it."""
        merge = immediate_postdom(header, self.nodes, self.pd)
        if merge not in self.blocks:
            merge = follow if follow is not None else EXIT
        self.lines.append(self.indent(f"local _e{header} = 0"))
        self.lines.append(self.indent("while true do"))
        self.stats["whiles"] += 1
        self.depth += 1
        left_to = None
        try:
            self.emit(header, None, loop=header)
        except _LoopLeft as left:
            left_to = left.exit_node
        self.depth -= 1
        self.lines.append(self.indent("end"))
        if left_to is not None:
            return left_to
        pending = None
        for index, target in enumerate(exits, 1):
            if target == EXIT or target not in self.blocks:
                continue
            keyword = "if" if index == 1 else "elseif"
            self.lines.append(self.indent(f"{keyword} _e{header} == {index} then"))
            self.depth += 1
            try:
                self.emit(target, merge, None)
            except _LoopLeft as left:
                pending = left
            finally:
                self.depth -= 1
        self.lines.append(self.indent("end"))
        if pending is not None:
            raise pending
        return merge if merge != EXIT else None

    def _island_goto(self, entry: int, component: frozenset[int], target: int | None,
                     exits: list[int]) -> str:
        name = f"_s{entry}"
        if target is None or target not in self.blocks:
            return f"{name} = nil"
        if target in component:
            return f"{name} = {target}"
        if target not in exits:
            exits.append(target)
        return f"_x{entry} = {exits.index(target) + 1}; {name} = nil"

    def emit_island(self, start: int, follow: int | None, loop: int | None = None) -> int | None:
        """Emit an irreducible region as a numeric dispatch loop."""
        return self.emit_dispatch(start, self.island_of[start], follow, loop)

    def emit_dispatch(self, start: int, component: frozenset[int], follow: int | None,
                      loop: int | None = None, self_contained: bool = False) -> int | None:
        """Emit `component` as `while _s do if _s == n then ... end end`."""
        entry = start
        self.contained = self_contained
        merge = immediate_postdom(entry, self.nodes, self.pd)
        if merge not in self.blocks:
            merge = follow if follow is not None else EXIT
        members = sorted(component, key=lambda n: self.order.get(n, 0))
        exits: list[int] = []
        self.lines.append(self.indent(f"local _s{entry}, _x{entry} = {entry}, 0"))
        self.lines.append(self.indent(f"while _s{entry} do"))
        self.stats["whiles"] += 1
        self.stats["islands"] += 1
        self.depth += 1
        first = True
        for node in members:
            self.emitted.add(node)
            block = self.blocks[node]
            last = block[-1]
            keyword = "if" if first else "elseif"
            first = False
            self.lines.append(self.indent(f"{keyword} _s{entry} == {node} then"))
            self.depth += 1
            self.lines.extend(self.block_statements(block))
            if last.kind == "return":
                self.lines.append(self.indent("return"))
            elif last.kind in ("condtrue", "condfalse", "guardbody", "condbody", "condboth"):
                succs = self.succ.get(node, [])
                take = succs[0] if succs else None
                other = succs[1] if len(succs) > 1 else None
                if last.kind == "condfalse":
                    take, other = other, take
                elif last.kind == "condboth":
                    take, other = last.target, last.target2
                if last.kind == "guardbody":
                    take, other = other, take
                cond = self.cond_text(last, False)
                goto_take = self._island_goto(entry, component, take, exits)
                goto_other = self._island_goto(entry, component, other, exits)
                self.lines.append(self.indent(f"if {cond} then {goto_take} else {goto_other} end"))
                self.stats["ifs"] += 1
            elif last.kind == "jump":
                self.lines.append(self.indent(self._island_goto(entry, component,
                                                               last.target, exits)
                                             + ";"))
            else:
                target = self.succ.get(node, [None])[0]
                self.lines.append(self.indent(self._island_goto(entry, component,
                                                               target, exits)
                                             + ";"))
            self.depth -= 1
        if first is False:
            self.lines.append(self.indent("else"))
            self.depth += 1
            self.lines.append(self.indent(f"_s{entry} = nil"))
            self.depth -= 1
            self.lines.append(self.indent("end"))
        self.depth -= 1
        self.lines.append(self.indent("end"))
        pending = None
        if exits:
            try:
                for index, target in enumerate(exits, 1):
                    keyword = "if" if index == 1 else "elseif"
                    self.lines.append(self.indent(f"{keyword} _x{entry} == {index} then"))
                    self.depth += 1
                    try:
                        if self.contained:
                            self.lines.append(self.indent(f"-- leaves the recovered region to block {target}"))
                        else:
                            leave = self._leave(loop, target) if loop is not None else None
                            if leave is not None:
                                self.lines.append(self.indent(leave))
                            elif loop is not None and target == loop:
                                self.lines.append(self.indent("continue"))
                            else:
                                self.emit(target, merge, loop)
                    finally:
                        self.depth -= 1
            except _LoopLeft as left:
                pending = left
            self.lines.append(self.indent("end"))
        if pending is not None:
            raise pending
        return merge if merge != EXIT else None

    def emit_unreachable(self, missing: list[int]) -> None:
        """Blocks with no path from the entry: name them, do not emit them.

        Their instructions are still in the disassembly listing; inline bodies
        from dead blocks only add text the parser has to choke down.
        """
        self.lines.append(self.indent(f"-- unreachable in the recovered CFG "
                                      f"({len(missing)} block(s): "
                                      f"{', '.join(map(str, missing[:12]))}"
                                      f"{', ...' if len(missing) > 12 else ''})"))
        for node in missing:
            self.emitted.add(node)

    def run(self) -> list[str]:
        try:
            self.emit(self.nodes[0], None)
        except StructError as error:
            # the walk could not place part of the CFG (an irreducible region it
            # kept re-entering): keep the structure found so far and finish the
            # remaining blocks as one local dispatch loop
            self.stats["bailed"] = str(error)
            reachable = self._reachable()
            missing = sorted(set(self.nodes) - self.emitted)
            live = [n for n in missing if n in reachable]
            if not live:
                self._balance()
                return self.lines
            first = live[0]
            self.lines.append(self.indent(f"-- structurer stopped at block {first} "
                                          f"({error}); the rest runs as a dispatch loop"))
            self.emit_dispatch(first, frozenset(live), None, None, self_contained=True)
            self.stats["flat_tail_blocks"] = len(live)
        missing = sorted(set(self.nodes) - self.emitted)
        if missing:
            # only blocks that are genuinely unreachable may be parked
            reachable = self._reachable()
            live = [n for n in missing if n in reachable]
            dead = [n for n in missing if n not in reachable]
            if live:
                # the walk pruned a path the CFG still has: keep the code, but as
                # comments -- Luau requires `return` to be the last statement of its
                # block, so the tail cannot sit after one as live code
                self.stats["tails"] = self.stats.get("tails", 0) + 1
                self.lines.append(self.indent(f"-- control-flow tail not placed by the "
                                              f"structurer: {len(live)} block(s) "
                                              f"{live[:8]}{' ...' if len(live) > 8 else ''}"))
                for node in live:
                    text = "; ".join(ins.text for ins in self.blocks[node] if ins.text)
                    self.lines.append(self.indent(f"--   @{node}: {text.replace('--', '- -')}"))
                    self.emitted.add(node)
            if dead:
                self.emit_unreachable(dead)
        self._balance()
        return self.lines

    def _balance(self) -> None:
        """Close blocks a bail-out left open (verified with the real parser)."""
        if self.parse_check is None:
            return
        saved = list(self.lines)
        for closers in range(0, 10):
            self.lines = saved + [self.indent("end")] * closers
            if self.parse_check(self.lines):
                if closers:
                    self.stats["closed_open_blocks"] = closers
                    self.lines = (saved + [self.indent("-- closed after a bail-out")]
                                  + [self.indent("end")] * closers)
                return
        self.lines = saved

    _KEYWORDS = re.compile(r"\b(function|then|elseif|do|repeat|until|end)\b")

    def _close_open_blocks(self) -> None:
        """Close blocks a bail-out left open, so the output always parses."""
        depth = 0
        for line in self.lines:
            stripped = line.strip()
            if stripped.startswith("--"):
                continue
            tokens = self._KEYWORDS.findall(stripped)
            for token in tokens:
                if token in ("function", "then", "do", "repeat"):
                    depth += 1
                elif token in ("until", "end"):
                    depth -= 1
            depth -= tokens.count("elseif")
        if depth > 0:
            self.stats["closed_open_blocks"] = depth
            self.lines.append(self.indent("-- closed by the structurer after a bail-out"))
            self.lines.extend(self.indent("end") for _ in range(depth))

    def _reachable(self) -> set[int]:
        seen = {self.nodes[0]}
        stack = [self.nodes[0]]
        while stack:
            node = stack.pop()
            for target in self.succ.get(node, []):
                if target in self.blocks and target not in seen:
                    seen.add(target)
                    stack.append(target)
        return seen


def structurize(proto, blocks, following, parse_check=None) -> tuple[list[str], dict]:
    structurer = Structurer(proto, blocks, following)
    structurer.parse_check = parse_check
    lines = structurer.run()
    return lines, structurer.stats
