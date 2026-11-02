#!/usr/bin/env python3
"""Recover the VM's opcode table from the dispatch ladder.

The dispatcher is a hand-flattened binary search over one variable (the opcode
byte).  Each `if <op> == <const>` / `if <op> ~= <const>` leaf guards a short
statement that performs the operation.  Reading those statements back gives a
naming for the VM's opcodes even though the opcode numbers are a private
permutation of Luau's.
"""

from __future__ import annotations

import re

from luau_lex import NAME, NUMBER, OP, Token, canonical_number, match_blocks, tokenize
from name_map import classify_opcode

CMP_OPS = {"==", "~=", "<", "<=", ">", ">="}


def _cond_span(tokens: list[Token], if_idx: int) -> tuple[int, int] | None:
    """Token span of the condition of the `if` at if_idx (up to `then`)."""
    depth = 0
    for k in range(if_idx + 1, len(tokens)):
        t = tokens[k]
        if t.kind == OP and t.text in "([{":
            depth += 1
        elif t.kind == OP and t.text in ")]}":
            depth -= 1
        elif t.kind == NAME and t.text == "then" and depth == 0:
            return if_idx + 1, k
    return None


def _body_span(tokens: list[Token], blocks: dict[int, int], if_idx: int) -> tuple[int, int] | None:
    then_idx = None
    for k in range(if_idx + 1, len(tokens)):
        if tokens[k].kind == NAME and tokens[k].text == "then":
            then_idx = k
            break
    if then_idx is None:
        return None
    end_idx = blocks.get(if_idx)
    if end_idx is None:
        return None
    depth = 0
    for k in range(then_idx + 1, end_idx):
        t = tokens[k]
        if t.kind == NAME and t.text in ("if", "for", "while", "function", "repeat"):
            depth += 1
        elif t.kind == NAME and t.text in ("end", "until"):
            depth -= 1
        elif t.kind == NAME and t.text in ("else", "elseif") and depth == 0:
            return then_idx + 1, k
    return then_idx + 1, end_idx


def _else_span(tokens: list[Token], blocks: dict[int, int], if_idx: int) -> tuple[int, int] | None:
    """Span of the `else` branch of the `if` at if_idx, if it has one."""
    then_idx = None
    for k in range(if_idx + 1, len(tokens)):
        if tokens[k].kind == NAME and tokens[k].text == "then":
            then_idx = k
            break
    if then_idx is None:
        return None
    end_idx = blocks.get(if_idx)
    if end_idx is None:
        return None
    depth = 0
    for k in range(then_idx + 1, end_idx):
        t = tokens[k]
        if t.kind == NAME and t.text in ("if", "for", "while", "function", "repeat"):
            depth += 1
        elif t.kind == NAME and t.text in ("end", "until"):
            depth -= 1
        elif t.kind == NAME and t.text == "else" and depth == 0:
            return k + 1, end_idx
    return None


def extract_opcodes(src: str, handler_body: str, opcode_var: str, limit: int = 400) -> list[dict]:
    tokens = tokenize(handler_body)
    blocks = match_blocks(tokens)
    rows: list[dict] = []
    seen: set[str] = set()

    for idx, tok in enumerate(tokens):
        if not (tok.kind == NAME and tok.text == "if"):
            continue
        cond = _cond_span(tokens, idx)
        if not cond:
            continue
        lo, hi = cond
        cond_tokens = tokens[lo:hi]
        test_text = handler_body[cond_tokens[0].start:cond_tokens[-1].end] if cond_tokens else ""
        # condition must be a comparison involving the opcode variable
        op = None
        const = None
        for k in range(len(cond_tokens) - 1):
            a, b, c = cond_tokens[k], cond_tokens[k + 1], cond_tokens[k + 2] if k + 2 < len(cond_tokens) else None
            if a.kind == NAME and a.text == opcode_var and b.kind == OP and b.text in CMP_OPS and c and c.kind == NUMBER:
                op, const = b.text, c.text
                break
        if op not in ("==", "~=") or const is None:
            continue
        value = canonical_number(const)
        if value in seen:
            continue
        body = _body_span(tokens, blocks, idx)
        if not body:
            continue
        if op == "~=":
            # `if op ~= K then <other> else <opcode K body> end`
            else_body = _else_span(tokens, blocks, idx)
            if else_body:
                body = else_body
        blo, bhi = body
        body_text = handler_body[tokens[blo].start:tokens[bhi - 1].end] if bhi > blo else ""
        body_text = re.sub(r"\s+", " ", body_text).strip()
        if not body_text:
            continue
        # Only leaf operations are useful: a branch that still tests the opcode
        # variable is an interval of the binary search, and a branch that opens
        # another flattened loop is a nested state machine, not one opcode.
        if re.search(rf"\bif\s+{re.escape(opcode_var)}\b", body_text):
            continue
        if re.search(r"\b(while|repeat)\b", body_text) or len(body_text) > 220:
            continue
        seen.add(value)
        rows.append({
            "opcode": value,
            "var": opcode_var,
            "op": op,
            "test": test_text,
            "semantics": classify_opcode(body_text),
            "evidence": body_text[:160],
        })
        if len(rows) >= limit:
            break
    rows.sort(key=lambda r: int(r["opcode"]))
    return rows


def for_map(inventories: dict) -> dict:
    """Pick the dispatcher of every stage and decode its branch table."""
    out = {}
    for blob, inv in inventories.items():
        for h in inv["handlers"]:
            distinct = h.get("distinct_eq") or {}
            if not distinct:
                continue
            var, consts = max(distinct.items(), key=lambda kv: len(kv[1]))
            if len(consts) < 12:
                continue
            rows = extract_opcodes("", h.get("body") or "", var)
            if rows:
                out[blob] = rows
                break
    return out
