#!/usr/bin/env python3
"""Readability pass over the lifted instructions.

Each rendered VM instruction is a little straight-line program over the
interpreter's own scratch locals (`z`, `x`, `J`, `F`, `U`, `i`, `t`), because
that is how the Luraph handler builds one operation out of several statements:

    z=R; x=(5); J=R; F=1; J=J[F]; F=2; J%=F; z[x]=J;

The payload's real state is the register file `R`, so this module folds each
instruction back into the operation it actually performs:

    R[5] = R[1] % 2

What it does, all of it semantics-preserving and local to one instruction:

* substitutes scratch-local values into the statements that read them, dropping
  the scratch assignment (only for pure right-hand sides — a call keeps its
  statement, because the call may have effects);
* folds `x=(5)`-style parentheses, `J%=F` into `J = J % F`, `z+=k` into `z = z + k`;
* folds consecutive integer constants (`z+186-1` -> `z+185`);
* collapses the obfuscator's double negations (`not(not(x))` -> `x`);
* puts one spaces around binary operators and after commas, and never touches
  the inside of a string literal.

Scratch locals are per-instruction scratch: the handler reuses them, so folding
never crosses an instruction boundary, a `function` boundary, or a control-flow
statement (where an assignment would be conditional).
"""

from __future__ import annotations

import re

# the interpreter's scratch locals; the payload's state lives in R[]/Protos[]/globals
SCRATCH = frozenset("z x J F U i t".split())

_STRING = re.compile(r'"(?:\\.|[^"\\])*"')
_IDENT = re.compile(r"[A-Za-z_]\w*")
_NUMBER = re.compile(r"\d+(?:\.\d+)?")

# keywords that open or close a block inside one instruction
_OPENERS = ("if", "for", "while", "do", "function", "repeat")
_CLOSERS = ("end", "until")

_TOKEN = re.compile(
    r'"(?:\\.|[^"\\])*"'          # string
    r"|\.\.\.|\.\."               # vararg, concat
    r"|==|~=|<=|>=|\.\.=|//"      # comparisons, floor division
    r"|\+=|-=|\*=|/=|%=|\^=|\.\.="  # compound assignment
    r"|[A-Za-z_]\w*"              # name
    r"|\d+(?:\.\d+)?(?:[eE][-+]?\d+)?"  # number
    r"|\s+"
    r"|."                         # anything else, one char
)


def _protect(text: str) -> tuple[str, list[str]]:
    strings: list[str] = []
    return _protect_into(text, strings), strings


def _protect_into(text: str, strings: list[str]) -> str:
    """Mask string literals, appending them to a list shared by the whole block."""

    def stash(match: re.Match) -> str:
        strings.append(match.group(0))
        return f"\x01{len(strings) - 1}\x02"

    return _STRING.sub(stash, text)


def _restore(text: str, strings: list[str]) -> str:
    return re.sub(r"\x01(\d+)\x02", lambda m: strings[int(m.group(1))], text)


# -- statement splitting ----------------------------------------------------
def split_statements(text: str) -> list[tuple[str, str]]:
    """Split one instruction into statements, keeping compound ones whole.

    Returns `(kind, text)` with `kind` in {"simple", "control", "closure"}.
    Simple statements are the only ones it is safe to fold across.
    """
    pieces: list[tuple[str, str]] = []
    depth = 0
    pending_do = False       # `for`/`while` already opened the block; `do` is theirs
    buffer: list[str] = []
    words: list[str] = []
    for token in _TOKEN.findall(text):
        stripped = token.strip()
        if token == ";":
            if depth == 0:
                statement = "".join(buffer).strip()
                if statement:
                    pieces.append((_kind(statement), statement))
                buffer = []
                words = []
                continue
            buffer.append(token)
            continue
        buffer.append(token)
        if stripped and not token.isspace():
            words.append(stripped)
            if stripped in ("for", "while"):
                depth += 1
                pending_do = True
            elif stripped == "do":
                if pending_do:
                    pending_do = False
                else:
                    depth += 1
            elif stripped in ("if", "function", "repeat"):
                depth += 1
            elif stripped in _CLOSERS:
                depth = max(0, depth - 1)
                pending_do = False
    statement = "".join(buffer).strip()
    if statement:
        pieces.append((_kind(statement), statement))
    return pieces


def _kind(statement: str) -> str:
    words = _IDENT.findall(statement)
    if "function" in words and statement.lstrip().startswith("function"):
        return "closure"
    for word in words:
        if word in _OPENERS or word in _CLOSERS:
            return "control"
    return "simple"


# -- expression clean-up ----------------------------------------------------
def simplify_expr(text: str) -> str:
    """Tidy a bare expression (used for `if`/`while` conditions)."""
    protected, strings = _protect(text)
    result = _strip_parens(protected)
    result = _collapse_not(result)
    result = _fold_constants(result)
    result = _space(result)
    return _restore(result, strings)


def _balanced(text: str) -> bool:
    depth = 0
    for char in text:
        if char == "(":
            depth += 1
        elif char == ")":
            depth -= 1
            if depth < 0:
                return False
    return depth == 0


def _strip_parens(text: str) -> str:
    text = text.strip()
    while len(text) > 2 and text[0] == "(" and text[-1] == ")":
        inner = text[1:-1]
        if not _balanced(inner):
            break
        text = inner.strip()
    return text


def _collapse_not(text: str) -> str:
    """not(not(x)) -> x, not (not (x)) -> x, not (not x) -> x."""
    atom = r"[\w\[\].:]+"
    patterns = [
        re.compile(r"\bnot\s*\(\s*not\s*\(([^()]*(?:\([^()]*\)[^()]*)*)\)\s*\)"),
        re.compile(r"\bnot\s*\(\s*not\s+(" + atom + r")\s*\)"),
    ]
    previous = None
    while previous != text:
        previous = text
        for pattern in patterns:
            text = pattern.sub(lambda m: m.group(1), text)
    # not (x) -> not x  for a plain atom
    text = re.sub(r"\bnot\s*\(\s*(" + atom + r")\s*\)", r"not \1", text)
    return text


def _strip_outer_not(text: str) -> str:
    return text


_IDENTITY = [
    (re.compile(r"\s*\+\s*0(?![\d.])"), ""),
    (re.compile(r"\s*-\s*0(?![\d.])"), ""),
    (re.compile(r"\s*\*\s*1(?![\d.])"), ""),
    (re.compile(r"\s*/\s*1(?![\d.])"), ""),
]


def _fold_identity(text: str) -> str:
    for pattern, replacement in _IDENTITY:
        text = pattern.sub(replacement, text)
    return text


def _fold_constants(text: str) -> str:
    # z+186-1 -> z+185   /   12+5 -> 17   (only for digits, never inside names)
    pattern = re.compile(r"(?<![\w.\]])(\d+)\s*([+-])\s*(\d+)(?![\w.])")
    previous = None
    while previous != text:
        previous = text

        def fold(match: re.Match) -> str:
            left, op, right = int(match.group(1)), match.group(2), int(match.group(3))
            return str(left + right if op == "+" else left - right)

        text = pattern.sub(fold, text)
    # z+x-1 style: keep as is; z+1-2 already folded above
    return text


_BINARY = (r"\s*(\+=|-=|\*=|//=|/=|%=|\^=|\.\.=|==|~=|<=|>=|//|\.\.|<|>|=|\+|-|\*|/|%|\^)\s*")


_ATOM = r"(\x01\d+\x02|\d+(?:\.\d+)?|[A-Za-z_]\w*(?:\[[^\[\]]*\])*)"


_KEYWORDS = frozenset("if then else elseif for while do end repeat until return and "
                      "or not in function local".split())


def _strip_atom_parens(text: str) -> str:
    """`(5)`, `(x)`, `(R[3])` -> the value; parentheses add nothing there.

    Not when the `(` is a call: `f(x)` keeps its parentheses, `else (w)` does not.
    """
    pattern = re.compile(r"\(" + _ATOM + r"\)")
    previous = None
    while previous != text:
        previous = text
        out = []
        last = 0
        for match in pattern.finditer(text):
            start = match.start()
            before = text[:start].rstrip()
            word = re.search(r"([A-Za-z_]\w*)$", before)
            if word and word.group(1) not in _KEYWORDS:
                continue                      # a call: keep the parentheses
            if before.endswith(("]", ")")):
                continue
            prefix = text[last:start]
            out.append(prefix)
            if word and not prefix.endswith((" ", "(")):
                out.append(" ")          # `do(x)` -> `do x`, never `dox`
            out.append(match.group(1))
            last = match.end()
        if out:
            out.append(text[last:])
            text = "".join(out)
    return text


def _space(text: str) -> str:
    text = text.replace("...", "\x03")
    text = re.sub(r"\s*,\s*", ", ", text)
    text = re.sub(_BINARY, r" \1 ", text)
    text = re.sub(r"\s+", " ", text).strip()
    # undo spacing that would be wrong
    text = re.sub(r"\(\s+", "(", text)
    text = re.sub(r"\s+\)", ")", text)
    text = re.sub(r"\[\s+", "[", text)
    text = re.sub(r"\s+\]", "]", text)
    text = re.sub(r"\bnot\s+", "not ", text)
    text = re.sub(r"\s+\.\s+", ".", text)
    text = re.sub(r"\.\s*\.", "..", text)
    # unary minus stays glued
    text = re.sub(r"([=(\[,]\s*)-\s+(\d)", r"\1-\2", text)
    text = re.sub(r"\b(and|or)\s*(?=[{(\-\#])", r"\1 ", text)
    text = re.sub(r"(?<=[\w)\]])\x03", " \x03", text)
    text = re.sub(r"\x03(?=[\w(\x01])", "\x03 ", text)
    text = text.replace("\x03", "...")
    text = _strip_atom_parens(text)
    return text


# -- the folding pass -------------------------------------------------------
_ASSIGN = re.compile(r"^([A-Za-z_]\w*)\s*=\s*(.+)$", re.S)
_COMPOUND = re.compile(r"^([A-Za-z_]\w*)\s*(\+|-|\*|/|%|\^|\.\.)=\s*(.+)$", re.S)
_CALLISH = re.compile(r"[\w\]\)]\s*\(")


def _is_pure(expr: str) -> bool:
    if "function" in expr or "{" in expr:
        return False
    if _CALLISH.search(expr):
        return False
    return True


def _atomic(expr: str) -> bool:
    return bool(re.fullmatch(r"[A-Za-z_]\w*(?:\[[^\[\]]*\])*(?:\.[A-Za-z_]\w*)*"
                             r"|\d+(?:\.\d+)?|\x01\d+\x02"
                             r"|-?\d+(?:\.\d+)?", expr))


_STORE = frozenset(["=", "+=", "-=", "*=", "/=", "%=", "^=", "..=", "//="])
_STORE_OR_CALL = re.compile(r"[\w\]\)]\s*\(|^\s*[A-Za-z_]\w*\s*\[[^\]]*\]\s*=(?!=)"
                            r"|^\s*(?:R|Protos|d|D|B|k)\s*\[[^\]]*\]\s*=(?!=)")


def _substitute(statement: str, bindings: dict[str, str]) -> str:
    """Replace scratch locals by their current value, but never a store target."""
    if not bindings:
        return statement
    tokens = _TOKEN.findall(statement)
    out: list[str] = []
    for index, token in enumerate(tokens):
        if token not in bindings:
            out.append(token)
            continue
        following = index + 1
        while following < len(tokens) and tokens[following].isspace():
            following += 1
        if following < len(tokens) and tokens[following] in _STORE:
            out.append(token)          # `x = ...` stores into x, it does not read it
            continue
        value = bindings[token]
        if following < len(tokens) and tokens[following] == "[" and re.fullmatch(r"-?\d+(?:\.\d+)?", value):
            out.append(token)          # a number is not a table: the binding is stale
            continue
        out.append(value if _atomic(value) else f"({value})")
    return "".join(out)


_VOLATILE = re.compile(r"[\[\]<>~=+*/%^#.]|\band\b|\bor\b|\bnot\b")


def _drop_volatile(bindings: dict[str, str], statement: str = "") -> list[str]:
    """Forget folded values a store or a call could change.

    Registers are distinct slots, so `R[1] = v` cannot change what `R[7]` reads;
    only an aliasing store (a dynamic index into the same table) or a call can,
    and a call can reach anything.
    """
    store = re.match(r"^\s*([A-Za-z_]\w*)\s*\[([^\[\]]*)\]\s*=(?!=)", statement)
    call = re.search(r"[\w\]\)]\s*\(", statement)
    lines = []
    for name, value in list(bindings.items()):
        if re.fullmatch(r"[A-Za-z_]\w*", value):
            continue                        # an alias of a table: still the same table
        if call:
            lines.append(_space(f"{name} = {value}"))
            del bindings[name]
            continue
        if not store:
            continue
        base, index = store.group(1), store.group(2).strip()
        hit = (re.fullmatch(r"-?\d+", index) and f"{base}[{index}]" in value) or \
              (not re.fullmatch(r"-?\d+", index) and f"{base}[" in value)
        if hit:
            lines.append(_space(f"{name} = {value}"))
            del bindings[name]
    return lines


def _safe(statement: str, bindings: dict[str, str], strings: list[str],
          fallback: str | None = None) -> list[str]:
    """Format a statement; if substitution produced nonsense, keep the original."""
    line = _format(_substitute(statement, bindings), strings)
    if line and re.match(r"^\(?-?\d", line[0].strip()) and fallback is not None:
        return _format(fallback, strings)
    return line


def _materialise(bindings: dict[str, str], names: set[str] | None,
                 strings: list[str] | None = None) -> list[str]:
    out: list[str] = []
    for name, value in list(bindings.items()):
        if names is not None and name not in names:
            continue
        text = _fold_constants(_strip_atom_parens(f"{name} = {value}"))
        text = _strip_rhs_parens(_space(text))
        text = _fold_identity(text)
        out.append(_restore(text, strings) if strings is not None else text)
    return out


def simplify_block(texts: "list[str]", carried: "set[str] | None" = None) -> "list[str]":
    """Fold one basic block: a run of rendered instructions sharing the scratch locals.

    `carried` is the set of scratch names a later block may read; those get their
    final value written back at the end of the block.
    """
    bindings: dict[str, str] = {}
    out: list[str] = []

    strings: list[str] = []
    for text in texts:
        protected = _protect_into(text, strings)
        for kind, statement in split_statements(protected):
            if kind != "simple":
                # substitute what the values are now, then stop folding across it:
                # anything assigned inside a branch or a loop may not happen
                out.extend(_materialise(bindings, None, strings))
                out.extend(_safe(statement, bindings, strings, statement))
                bindings.clear()
                continue

            match = _ASSIGN.match(statement)
            if match and match.group(1) in SCRATCH:
                name, value = match.group(1), _strip_parens(match.group(2))
                value = _substitute(value, bindings)
                if not _is_pure(value):
                    out.extend(_format(f"{name} = {value}", strings))
                    bindings.pop(name, None)
                else:
                    bindings[name] = value
                continue

            match = _COMPOUND.match(statement)
            if match and match.group(1) in SCRATCH:
                name, op, value = match.group(1), match.group(2), match.group(3)
                current = bindings.get(name, name)
                folded = f"{current} {op} {_substitute(value, bindings)}"
                if _is_pure(folded):
                    bindings[name] = folded
                else:
                    bindings.pop(name, None)
                    out.extend(_format(f"{name} = {folded}", strings))
                continue

            if _STORE_OR_CALL.search(statement):
                out.extend(_drop_volatile(bindings, statement))   # before the store, not after
            out.extend(_safe(statement, bindings, strings, statement))

    out.extend(_materialise(bindings, carried, strings))
    return out


def simplify_instruction(text: str) -> "list[str]":
    """One rendered instruction on its own (used by the tests)."""
    return simplify_block([text], None)


def _format(statement: str, strings: list[str]) -> list[str]:
    text = _strip_atom_parens(statement)
    text = _collapse_not(text)
    text = _fold_constants(text)
    text = _space(text)
    text = _strip_rhs_parens(text)
    text = _fold_identity(text)
    return [_restore(text, strings)]


def _strip_rhs_parens(text: str) -> str:
    match = re.match(r"^(.*?=\s*)\((.*)\)(;?)$", text, re.S)
    if match and _balanced(match.group(2)):
        return match.group(1) + match.group(2) + match.group(3)
    return text
