#!/usr/bin/env python3
"""A small, dependency-free Luau lexer.

Only needs to be good enough to walk obfuscated Luau reliably: it must not be
fooled by long-bracket strings, `\\z` escapes, `\\u{...}` escapes, comments that
look like strings, or the deliberately mangled numeric literals Luraph emits
(`0Xf__`, `0b1110__0__1`, `0B110101`).
"""

from __future__ import annotations

import re
from dataclasses import dataclass

NAME = "name"
NUMBER = "number"
STRING = "string"
OP = "op"
COMMENT = "comment"
EOF = "eof"

# longest first
OPERATORS = [
    "...", "..=", "//=", "<<=", ">>=",
    "==", "~=", "<=", ">=", "..", "::", "->", "+=", "-=", "*=", "/=", "%=",
    "^=", "//", "<<", ">>",
    "+", "-", "*", "/", "%", "^", "#", "&", "~", "|", "<", ">", "=", "(",
    ")", "{", "}", "[", "]", ";", ":", ",", ".", "@",
]

NAME_RE = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")
# decimal / hex / binary, optional fraction, exponent, underscores anywhere
NUMBER_RE = re.compile(
    r"""
    0[xX][0-9a-fA-F_]*(?:\.[0-9a-fA-F_]*)?(?:[pP][+-]?[0-9_]+)?
  | 0[bB][01_]*
  | (?:\d[\d_]*(?:\.[\d_]*)?|\.\d[\d_]*)(?:[eE][+-]?[\d_]+)?
    """,
    re.VERBOSE,
)


@dataclass
class Token:
    kind: str
    text: str
    start: int
    end: int

    def __repr__(self) -> str:  # pragma: no cover - debugging aid
        return f"Token({self.kind},{self.text!r})"


def _long_bracket_level(src: str, i: int) -> int | None:
    """If src[i:] starts a long bracket `[==[`, return the level, else None."""
    if i >= len(src) or src[i] != "[":
        return None
    j = i + 1
    level = 0
    while j < len(src) and src[j] == "=":
        level += 1
        j += 1
    if j < len(src) and src[j] == "[":
        return level
    return None


def tokenize(src: str, keep_comments: bool = False) -> list[Token]:
    tokens: list[Token] = []
    i, n = 0, len(src)
    while i < n:
        c = src[i]
        if c in " \t\r\n\f\v":
            i += 1
            continue

        # comments
        if src.startswith("--", i):
            level = _long_bracket_level(src, i + 2)
            if level is not None:
                close = "]" + "=" * level + "]"
                end = src.find(close, i + 2)
                end = n if end < 0 else end + len(close)
            else:
                end = src.find("\n", i)
                end = n if end < 0 else end
            if keep_comments:
                tokens.append(Token(COMMENT, src[i:end], i, end))
            i = end
            continue

        # long strings
        level = _long_bracket_level(src, i)
        if level is not None:
            close = "]" + "=" * level + "]"
            end = src.find(close, i)
            end = n if end < 0 else end + len(close)
            tokens.append(Token(STRING, src[i:end], i, end))
            i = end
            continue

        # quoted strings
        if c in "\"'":
            quote = c
            j = i + 1
            while j < n:
                ch = src[j]
                if ch == "\\":
                    if j + 1 < n and src[j + 1] == "z":
                        # \z skips following whitespace
                        j += 2
                        while j < n and src[j] in " \t\r\n":
                            j += 1
                        continue
                    j += 2
                    continue
                if ch == quote:
                    j += 1
                    break
                if ch == "\n":
                    break
                j += 1
            tokens.append(Token(STRING, src[i:j], i, j))
            i = j
            continue

        # numbers (must be checked before bare '.' operator)
        if c.isdigit() or (c == "." and i + 1 < n and src[i + 1].isdigit()):
            m = NUMBER_RE.match(src, i)
            if m and m.end() > i:
                tokens.append(Token(NUMBER, m.group(), i, m.end()))
                i = m.end()
                continue

        if c.isalpha() or c == "_":
            m = NAME_RE.match(src, i)
            tokens.append(Token(NAME, m.group(), i, m.end()))
            i = m.end()
            continue

        for op in OPERATORS:
            if src.startswith(op, i):
                tokens.append(Token(OP, op, i, i + len(op)))
                i += len(op)
                break
        else:
            # unknown byte: emit as op so we never loop forever
            tokens.append(Token(OP, c, i, i + 1))
            i += 1
    tokens.append(Token(EOF, "", n, n))
    return tokens


def parse_number(text: str) -> float | int:
    """Convert a (possibly mangled) Luau numeric literal to a Python number."""
    t = text.replace("_", "")
    low = t.lower()
    if low.startswith("0x"):
        body = low[2:]
        if "." in body or "p" in body:
            return float.fromhex("0x" + body) if body else 0
        return int(body, 16) if body else 0
    if low.startswith("0b"):
        body = low[2:]
        return int(body, 2) if body else 0
    if "." in t or "e" in low:
        try:
            return float(t)
        except ValueError:
            return 0
    try:
        return int(t)
    except ValueError:
        return float(t)


def canonical_number(text: str) -> str:
    """Render a numeric literal in a canonical, tool-friendly form."""
    try:
        value = parse_number(text)
    except (ValueError, OverflowError):
        return text
    if isinstance(value, int):
        if value < 0:
            return f"({value})"
        if value > 2**53:
            return str(value)
        return str(value)
    if value == int(value) and abs(value) < 2**53:
        return str(int(value))
    return repr(value)


BLOCK_OPENERS = {"function", "if", "for", "while", "do"}
BLOCK_CLOSERS = {"end"}


def block_depths(tokens: list[Token]) -> list[int]:
    """Block nesting depth for every token (0 = top level of the chunk).

    `for`/`while` open a block and consume the `do` that belongs to them, so the
    depth of the token inside a `for ... do ... end` header is still 1.
    """
    depths = [0] * len(tokens)
    depth = 0
    skip_do = False
    for idx, tok in enumerate(tokens):
        if tok.kind == NAME:
            word = tok.text
            if word in ("for", "while"):
                depths[idx] = depth
                depth += 1
                skip_do = True
                continue
            if word == "do":
                if skip_do:
                    skip_do = False
                    depths[idx] = depth
                    continue
                depths[idx] = depth
                depth += 1
                continue
            if word in ("if", "function", "repeat"):
                depths[idx] = depth
                depth += 1
                continue
            if word in ("end", "until"):
                depth = max(0, depth - 1)
                depths[idx] = depth
                continue
        depths[idx] = depth
    return depths


def match_blocks(tokens: list[Token]) -> dict[int, int]:
    """Map token index of a block opener to the index of its `end`/`until`."""
    stack: list[int] = []
    pending_do: list[int] = []
    pairs: dict[int, int] = {}
    skip_do = False
    for idx, tok in enumerate(tokens):
        if tok.kind != NAME:
            continue
        word = tok.text
        if word in ("for", "while"):
            stack.append(idx)
            skip_do = True
            continue
        if word == "do":
            if skip_do:
                skip_do = False
                continue
            stack.append(idx)
            continue
        if word == "if":
            stack.append(idx)
            continue
        if word == "function":
            stack.append(idx)
            continue
        if word == "repeat":
            stack.append(idx)
            continue
        if word == "until":
            if stack:
                pairs[stack.pop()] = idx
            continue
        if word == "end":
            if stack:
                pairs[stack.pop()] = idx
            continue
    return pairs
