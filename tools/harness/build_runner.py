#!/usr/bin/env python3
"""Build a self-contained Luau runner that executes the payload under the
Roblox/executor emulation harness.

The payload is embedded as a long-bracket string constant (the payload itself
never uses a bracket level above 2, so level 16 is unambiguous), which means the
runner needs no file-system access -- the `luau` CLI sandbox has no `io`.

Source-level instrumentation rewrites (applied only when their anchor is
present, so the tool degrades gracefully on other Luraph builds):

    return({l=bit32,...  }):p()(...)   ->  return __wrap1(({l=bit32,...  })):p()(...)
    return({qW=function..}):o()(...)   ->  return __wrap2(({qW=function..})):o()(...)
    bq=function(w,w)                   ->  bq=function(__a,w)__probe(w,"bq"); ...
    uq=function(w,w)                   ->  uq=function(__a,w)__probe(w,"uq"); ...

`__wrap*` records `field-name -> function identity` and wraps every handler so
its calls can be counted; `__probe` dumps the obfuscator's numeric "library
table" so its slots can be resolved back to real stdlib functions.
"""

from __future__ import annotations

import hashlib
import json
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
HARNESS = ROOT / "tools" / "harness" / "roblox_shim.luau"

# needle -> replacement
VM_REWRITES: list[tuple[str, str]] = [
    # VM dispatch site of stage B: capture (pc, opcode, operands) per instruction.
    # Note the `local`: the dispatch site is `while true do local N=X[H]; if N<...`.
    # Opt-in only -- the hook fires ~1.6e8 times per run, which slows the VM down
    # enough that it needs its own short run.
    ("local N=X[H];if N<",
     '__vmop("B",H,X,X,K,j,m,l,D,Y,k);local N=X[H];if N<'),
]

REWRITES: list[tuple[str, str]] = [
    ("return({l=bit32,", "return __wrap1(({l=bit32,"),
    ("}):p()(...)", "})):p()(...)"),
    ("return({qW=function", "return __wrap2(({qW=function"),
    ("}):o()(...)", "})):o()(...)"),
    ("bq=function(w,w)", 'bq=function(__a,w)__probe(w,"bq");'),
    ("uq=function(w,w)", 'uq=function(__a,w)__probe(w,"uq");'),
]


class BuildError(RuntimeError):
    pass


def instrument(payload: str, vm_trace: bool = False) -> tuple[str, dict]:
    out = payload
    applied, skipped = [], []
    rewrites = REWRITES + (VM_REWRITES if vm_trace else [])
    for needle, repl in rewrites:
        if needle in out:
            out = out.replace(needle, repl, 1)
            applied.append(needle)
        else:
            skipped.append(needle)
    return out, {"applied": applied, "skipped": skipped}


def config_lua(cfg: dict) -> str:
    parts = []
    for k, v in cfg.items():
        if isinstance(v, str):
            parts.append(f"{k}={json.dumps(v)}")
        elif isinstance(v, bool):
            parts.append(f"{k}={'true' if v else 'false'}")
        else:
            parts.append(f"{k}={v}")
    return "__CFG = {" + ", ".join(parts) + "}\n"


def embed(source: str) -> str:
    level = 16
    close = "]" + "=" * level + "]"
    if close in source:
        raise BuildError("payload contains the chosen long-bracket terminator")
    return "__PAYLOAD = [" + "=" * level + "[\n" + source + "\n" + close + "\n"


def build(payload_path: pathlib.Path, out_path: pathlib.Path, cfg: dict | None = None) -> dict:
    payload = payload_path.read_text(encoding="utf-8", errors="surrogateescape")
    cfg = cfg or {}
    instrumented, rewrites = instrument(payload, vm_trace=bool(cfg.get("vmTrace")))
    runner = config_lua(cfg) + embed(instrumented) + "\n" + HARNESS.read_text(encoding="utf-8")
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(runner, encoding="utf-8", errors="surrogateescape")
    return {
        "payload": str(payload_path),
        "payload_sha256": hashlib.sha256(payload.encode("utf-8", "surrogateescape")).hexdigest(),
        "payload_bytes": len(payload),
        "runner": str(out_path),
        "runner_bytes": len(runner),
        "rewrites_applied": len(rewrites["applied"]),
        "rewrites_skipped": rewrites["skipped"],
    }


def main(argv: list[str]) -> int:
    if len(argv) < 3:
        print("usage: build_runner.py <payload.luau> <out_runner.luau> [cfg-json]", file=sys.stderr)
        return 2
    cfg = json.loads(argv[3]) if len(argv) > 3 else {}
    info = build(pathlib.Path(argv[1]), pathlib.Path(argv[2]), cfg)
    for k, v in info.items():
        print(f"{k}: {v}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
