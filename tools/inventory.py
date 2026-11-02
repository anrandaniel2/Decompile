#!/usr/bin/env python3
"""Static inventory of the obfuscator's handler tables.

Every Luraph stage is (essentially)

    return({ <handler-name> = function(...) ... end, ... }):<run-method>()(...)

The table holds a few hundred tiny "handlers".  This module recovers, for each
one: its name, arity, source span, size, the slots it reads/writes, the numeric
constants it compares against, which sibling handlers it calls, and a handful of
shape flags.  Later stages turn that into readable names.
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field, asdict

from luau_lex import NAME, NUMBER, OP, STRING, Token, block_depths, canonical_number, tokenize

FIELD_RE = re.compile(r"\(\s*([A-Za-z_]\w*)\s*\)\s*\[\s*([0-9A-Za-z_]+)\s*\]\s*=")
READ_FIELD_RE = re.compile(r"([A-Za-z_]\w*)\s*\[\s*(0[xXbB][0-9A-Za-z_]+|\d[\d_]*)\s*\]")
BIT32_RE = re.compile(r"bit32\.(\w+)")
LIB_CALL_RE = re.compile(r"\b(buffer|string|table|math|coroutine|utf8|os|debug|bit32)\.(\w+)\s*\(")
RETURN_CONST_RE = re.compile(r"return\s+(0[xX][0-9a-fA-F_]+|0[bB][01_]+|\d[\d_]*)\s*;?\s*(?:end|$)")
STATE_MACHINE_RE = re.compile(r"while true do|repeat\b")


@dataclass
class Handler:
    name: str
    blob: str
    kind: str                     # "function" | "value"
    params: list[str] = field(default_factory=list)
    size: int = 0
    offset: int = 0
    value: str = ""               # for kind == "value" (e.g. `bit32.bnot`)
    calls: list[str] = field(default_factory=list)
    reads: list[str] = field(default_factory=list)
    writes: list[str] = field(default_factory=list)
    comparisons: dict[str, int] = field(default_factory=dict)
    flags: dict[str, object] = field(default_factory=dict)
    body: str = ""
    distinct_eq: dict[str, list[str]] = field(default_factory=dict)
    role: str = ""
    semantic_name: str = ""
    runtime: dict | None = None

    def to_json(self) -> dict:
        return asdict(self)


def _slice_text(src: str, tokens: list[Token], lo: int, hi: int) -> str:
    return src[tokens[lo].start:tokens[hi - 1].end]


def find_handler_table(src: str, tokens: list[Token]) -> tuple[int, int] | None:
    """Locate the top level `return({ ... })` table; return (open, close) indices."""
    for i in range(len(tokens) - 3):
        if tokens[i].kind == NAME and tokens[i].text == "return":
            j = i + 1
            if tokens[j].kind == OP and tokens[j].text == "(":
                j += 1
            if tokens[j].kind == OP and tokens[j].text == "{":
                depth = 0
                for k in range(j, len(tokens)):
                    if tokens[k].kind == OP and tokens[k].text == "{":
                        depth += 1
                    elif tokens[k].kind == OP and tokens[k].text == "}":
                        depth -= 1
                        if depth == 0:
                            return j, k
                return None
    return None


def _split_entries(tokens: list[Token], open_idx: int, close_idx: int,
                   depths: list[int]) -> list[tuple[int, int]]:
    """Split the table body into (start, end) token spans, one per entry.

    A separator is only a comma at bracket depth 0 *and* block depth 0 -- a
    comma inside `function ... end` or `if ... then ... end` belongs to a
    statement (`local a, b = ...`), not to the table constructor.
    """
    spans: list[tuple[int, int]] = []
    bracket = 0
    start = open_idx + 1
    base_block = depths[open_idx]
    for k in range(open_idx + 1, close_idx):
        tok = tokens[k]
        if tok.kind == OP:
            if tok.text in "{([":
                bracket += 1
            elif tok.text in "})]":
                bracket -= 1
            elif tok.text == "," and bracket == 0 and depths[k] <= base_block:
                spans.append((start, k))
                start = k + 1
    if start < close_idx:
        spans.append((start, close_idx))
    return [s for s in spans if s[1] > s[0]]


def _param_names(tokens: list[Token], lo: int, hi: int) -> list[str]:
    """Parameters of a `function(...)` that starts at token lo."""
    k = lo
    while k < hi and not (tokens[k].kind == OP and tokens[k].text == "("):
        k += 1
    params: list[str] = []
    depth = 0
    for m in range(k, hi):
        t = tokens[m]
        if t.kind == OP and t.text == "(":
            depth += 1
            if depth == 1:
                continue
        elif t.kind == OP and t.text == ")":
            depth -= 1
            if depth == 0:
                break
        if depth == 1 and t.kind in (NAME,) and t.text != "...":
            prev = tokens[m - 1]
            if m == k + 1 or (prev.kind == OP and prev.text == ","):
                params.append(t.text)
        if depth == 1 and t.kind == OP and t.text == "...":
            params.append("...")
    return params


def analyse_handler(src: str, blob: str, name: str, tokens: list[Token], lo: int, hi: int) -> Handler:
    value_text = _slice_text(src, tokens, lo, hi)
    is_function = any(tokens[m].kind == NAME and tokens[m].text == "function" for m in range(lo, min(hi, lo + 4)))
    handler = Handler(name=name, blob=blob, kind="function" if is_function else "value",
                      size=len(value_text), offset=tokens[lo].start, value="" if is_function else value_text)
    if not is_function:
        return handler

    handler.params = _param_names(tokens, lo, hi)

    # field reads / writes, e.g. `(c)[U[G]]=(c[d[G]][R[G]])` is a read, `(R)[7]=(nil)` a write
    writes = set()
    for m in FIELD_RE.finditer(value_text):
        try:
            writes.add(str(int(canonical_number(m.group(2)))))
        except ValueError:
            pass
    reads = set()
    for m in READ_FIELD_RE.finditer(value_text):
        try:
            slot = str(int(canonical_number(m.group(2))))
        except ValueError:
            continue
        if slot not in writes:
            reads.add(slot)
    handler.writes = sorted(writes, key=lambda s: int(s) if s.lstrip("-").isdigit() else 0)
    handler.reads = sorted(reads, key=lambda s: int(s) if s.lstrip("-").isdigit() else 0)

    # numeric comparisons: the flattened dispatch ladders
    comparisons: dict[str, int] = {}
    selfvars = {"l", "o", "v", "n", "b", "r", "G", "w", "N", "q"}
    for k in range(lo, hi - 2):
        t = tokens[k]
        if t.kind == NAME and t.text in selfvars and tokens[k + 1].kind == OP \
                and tokens[k + 1].text in ("==", "~=", "<", ">", "<=", ">=") \
                and tokens[k + 2].kind == NUMBER:
            key = t.text
            comparisons[key] = comparisons.get(key, 0) + 1
    handler.comparisons = comparisons

    # distinct numeric equality tests per variable: a large count means the
    # function is an opcode dispatch ladder (binary search over the opcode byte)
    distinct: dict[str, list[str]] = {}
    for k in range(lo, hi - 2):
        a, b, c = tokens[k], tokens[k + 1], tokens[k + 2]
        if a.kind == NAME and b.kind == OP and b.text in ("==", "~=") and c.kind == NUMBER:
            bucket = distinct.setdefault(a.text, [])
            if c.text not in bucket:
                bucket.append(c.text)
    handler.distinct_eq = distinct
    handler.body = value_text[:20000]

    handler.flags = {
        "loops": len(STATE_MACHINE_RE.findall(value_text)),
        "continues": value_text.count("continue"),
        "bit32_ops": sorted(set(BIT32_RE.findall(value_text))),
        "lib_calls": sorted({f"{a}.{b}" for a, b in LIB_CALL_RE.findall(value_text)}),
        "strings": len([t for t in tokens[lo:hi] if t.kind == STRING]),
        "numbers": len([t for t in tokens[lo:hi] if t.kind == NUMBER]),
        "returns_const": bool(RETURN_CONST_RE.search(value_text)),
        "branches": value_text.count("if "),
    }
    return handler


def call_graph(handlers: list[Handler], tokens_by_name: dict[str, list[Token]]) -> None:
    names = {h.name for h in handlers if len(h.name) >= 1}
    for h in handlers:
        if h.kind != "function":
            continue
        toks = tokens_by_name[h.name]
        found: list[str] = []
        for k in range(len(toks) - 2):
            a, b, c = toks[k], toks[k + 1], toks[k + 2]
            if a.kind == NAME and a.text in names and b.kind == OP and b.text in (":", ".") \
                    and c.kind == NAME and c.text in names and c.text != a.text:
                found.append(c.text)
        seen: list[str] = []
        for n in found:
            if n not in seen:
                seen.append(n)
        h.calls = seen


def inventory_stage(src: str, blob: str) -> tuple[list[Handler], dict]:
    tokens = tokenize(src)
    located = find_handler_table(src, tokens)
    if not located:
        return [], {"error": "no handler table found"}
    open_idx, close_idx = located
    depths = block_depths(tokens)
    spans = _split_entries(tokens, open_idx, close_idx, depths)
    handlers: list[Handler] = []
    tokens_by_name: dict[str, list[Token]] = {}

    for lo, hi in spans:
        # entry shape: NAME '=' value
        if tokens[lo].kind != NAME:
            continue
        name = tokens[lo].text
        k = lo + 1
        if not (k < hi and tokens[k].kind == OP and tokens[k].text == "="):
            continue
        h = analyse_handler(src, blob, name, tokens, k + 1, hi)
        handlers.append(h)
        tokens_by_name[name] = tokens[k + 1:hi]

    call_graph(handlers, tokens_by_name)

    # which entry is the "run" method invoked as `:name(...)` after the table?
    run_method = None
    for k in range(close_idx, min(close_idx + 8, len(tokens) - 1)):
        if tokens[k].kind == OP and tokens[k].text == ")":
            if tokens[k + 1].kind == OP and tokens[k + 1].text == ":" and tokens[k + 2].kind == NAME:
                run_method = tokens[k + 2].text
                break
        if tokens[k].kind == OP and tokens[k].text == ":" and tokens[k + 1].kind == NAME:
            run_method = tokens[k + 1].text
            break

    meta = {
        "blob": blob,
        "handlers": len(handlers),
        "run_method": run_method,
        "table_bytes": tokens[close_idx].end - tokens[open_idx].start,
    }
    return handlers, meta
