#!/usr/bin/env python3
"""Prove that the annotated copies are faithful and still valid Luau.

Two independent checks:

* **token equality** — the annotated file must produce exactly the same token
  stream as the original stage, modulo number canonicalisation and the inserted
  comments/newlines.  That proves the rewrite changed presentation only.
* **parse check** — `luau-ast` (built from luau-lang/luau) must accept the file;
  it prints the AST as JSON, which is also handy evidence for the report.
"""

from __future__ import annotations

import json
import pathlib
import subprocess
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from luau_lex import NAME, NUMBER, OP, canonical_number, tokenize  # noqa: E402


def token_stream(path: pathlib.Path) -> list[tuple[str, str]]:
    src = path.read_text(encoding="utf-8", errors="surrogateescape")
    out = []
    for tok in tokenize(src):
        if tok.kind in (NAME, NUMBER, OP):
            out.append((tok.kind, canonical_number(tok.text) if tok.kind == NUMBER else tok.text))
    return out


def check_tokens(original: pathlib.Path, annotated: pathlib.Path) -> dict:
    a = token_stream(original)
    b = token_stream(annotated)
    ok = a == b
    detail = {"ok": ok, "tokens": len(a)}
    if not ok:
        for i, (x, y) in enumerate(zip(a, b)):
            if x != y:
                detail["first_difference"] = {"index": i, "original": x, "annotated": y}
                break
        else:
            detail["first_difference"] = {"index": min(len(a), len(b)),
                                          "original": a[min(len(a), len(b)) - 1] if a else None,
                                          "annotated": b[min(len(a), len(b)) - 1] if b else None}
    return detail


def find_luau_ast(explicit: str | None = None) -> str | None:
    import os
    import shutil
    for candidate in (explicit, os.environ.get("LUAU_AST_BIN"),
                      str(pathlib.Path(__file__).resolve().parents[1] / ".tools" / "luau-ast"),
                      shutil.which("luau-ast")):
        if candidate and pathlib.Path(candidate).exists():
            return candidate
    return None


def check_parse(path: pathlib.Path, luau_ast: str | None) -> dict:
    exe = find_luau_ast(luau_ast)
    if not exe:
        return {"ok": None, "reason": "luau-ast not available"}
    proc = subprocess.run([exe, str(path)], capture_output=True, text=True, errors="surrogateescape")
    ok = proc.returncode == 0 and proc.stdout.strip().startswith("{")
    return {"ok": ok, "exit_code": proc.returncode,
            "errors": (proc.stderr or "").strip()[:2000]}


def main(argv: list[str]) -> int:
    if len(argv) < 3:
        print("usage: verify.py <original_stage> <annotated_stage> [luau-ast]", file=sys.stderr)
        return 2
    original, annotated = pathlib.Path(argv[1]), pathlib.Path(argv[2])
    tokens = check_tokens(original, annotated)
    parse = check_parse(annotated, argv[3] if len(argv) > 3 else None)
    print(json.dumps({"tokens": tokens, "parse": parse}, indent=1))
    return 0 if tokens["ok"] and parse.get("ok") is not False else 1


if __name__ == "__main__":
    raise SystemExit(main(__import__("sys").argv))
