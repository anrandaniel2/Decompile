#!/usr/bin/env python3
"""Produce a readable, still-executable copy of an obfuscated stage.

Three transformations, all semantics preserving:

1. **Numeric literals are canonicalised.**  Luraph emits literals such as
   `0Xf__`, `0b1110__0__1` and `0B110101` purely to break pattern matchers and
   human reading; they are just 15, 57 and 53.
2. **Statement separation is restored.**  The stage is one enormous line; a
   newline is inserted after every `;` token (never inside a string, because
   positions come from the lexer).
3. **Every handler table entry gets an annotation comment** naming the handler
   and the role recovered by `tools/name_map.py`.

Nothing else is rewritten, so the output stays valid Luau and behaves exactly
like the input (the CI job re-parses it to prove that).
"""

from __future__ import annotations

import re

from luau_lex import COMMENT, NAME, NUMBER, OP, STRING, canonical_number, tokenize

LONG_STRING_MAX = 600


def _short_string(text: str) -> str:
    if len(text) <= LONG_STRING_MAX:
        return text
    return text[:LONG_STRING_MAX] + "...]]"


def normalize_stage(src: str, annotations: dict[str, tuple[str, str]] | None = None) -> str:
    """annotations: handler name -> (semantic name, role)."""
    annotations = annotations or {}
    tokens = tokenize(src, keep_comments=False)
    out: list[str] = []
    pos = 0
    pending_newline = False

    for idx, tok in enumerate(tokens):
        if tok.kind == "eof":
            break
        if tok.start > pos:
            gap = src[pos:tok.start]
            out.append(gap)
        text = tok.text
        if tok.kind == NUMBER:
            text = canonical_number(text)
        # annotate `name = function(` entries of the handler table
        if tok.kind == NAME and tok.text in annotations:
            nxt = tokens[idx + 1] if idx + 1 < len(tokens) else None
            nxt2 = tokens[idx + 2] if idx + 2 < len(tokens) else None
            if nxt is not None and nxt.kind == OP and nxt.text == "=" and nxt2 is not None \
                    and nxt2.kind == NAME and nxt2.text == "function":
                semantic, role = annotations[tok.text]
                out.append(f"\n-- {tok.text} = {semantic}  [{role}]\n")
                pending_newline = False
        out.append(text)
        pos = tok.end
        if tok.kind == OP and text == ";":
            out.append("\n")
            pending_newline = True
    out.append(src[pos:])
    result = "".join(out)
    # collapse the runs of blank lines the rewrite can produce
    result = re.sub(r"\n{3,}", "\n\n", result)
    return result


def compress_strings_for_report(src: str, limit: int = 80) -> str:
    """Shorten long brackets for log/annotation purposes only."""
    return re.sub(r"\[(=*)\[[^\]]{80,}\]\1\]", lambda m: f"[{m.group(1)}[<{len(m.group(0))} bytes>]{m.group(1)}]",
                  src)
