#!/usr/bin/env python3
"""Run the payload under the emulation harness and turn its output into JSON.

The harness prints tab-separated `@@` records; this module parses them into a
structured result:

  * decrypted string table entries (with the pool offset they came from)
  * map of obfuscated handler name -> live function identity, per stage
  * every Roblox/executor API call together with the *handler chain* that made
    it (this is what lets behaviour be attributed to obfuscated names)
  * per-handler call counts (a profile of the interpreter)
  * the obfuscator's numeric "library table" resolved to real stdlib functions
  * snapshots of `buffer` objects (the decoded constant pools)
"""

from __future__ import annotations

import json
import os
import pathlib
import re
import shutil
import subprocess
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent / "harness"))
import build_runner  # noqa: E402

DEFAULT_BUDGET = 45  # seconds of payload execution before the harness snapshots


def find_luau() -> str | None:
    for candidate in (
        os.environ.get("LUAU_BIN"),
        str(pathlib.Path(__file__).resolve().parents[1] / ".tools" / "luau"),
        shutil.which("luau"),
    ):
        if candidate and pathlib.Path(candidate).exists():
            return candidate
    return None


def _unescape(s: str) -> str:
    return (s.replace("\\\\", "\x00").replace("\\n", "\n").replace("\\r", "\r")
             .replace("\\t", "\t").replace("\\0", "\x00").replace("\x00", "\\"))


def _luau_quote(text: str) -> str:
    """Quote a constant the way Luau source wants it (json.dumps is not enough)."""
    out = ['"']
    for ch in text:
        code = ord(ch)
        if ch == '"':
            out.append('\\"')
        elif ch == "\\":
            out.append("\\\\")
        elif ch == "\n":
            out.append("\\n")
        elif ch == "\r":
            out.append("\\r")
        elif ch == "\t":
            out.append("\\t")
        elif code < 32 or code == 127:
            out.append(f"\\{code:03d}")
        else:
            out.append(ch)
    out.append('"')
    return "".join(out)


def _vm_field(raw: str):
    """Decode one recorded VM operand: `n:<num>`, `s:<string>` or `-` (nil)."""
    if raw in ("", "-"):
        return None
    if raw.startswith("n:"):
        return raw[2:]
    if raw.startswith("s:"):
        return _luau_quote(raw[2:])
    return raw


def parse_output(stdout: str) -> dict:
    result = {
        "strings": {},          # origin -> list of unique strings (insertion ordered)
        "readstrings": [],      # (count, offset, length, text)
        "funcs": {},            # stage -> {name: identity}
        "api": [],              # {api, detail, stack:[identity@src:line]}
        "hprof": {},            # "A.xx" -> call count
        "hcall_samples": [],    # {handler, n, argc, shapes}
        "probe": {},            # stage -> {slot: resolved}
        "buffers": [],          # {index, len, hex}
        "snapshot": None,
        "trace": None,
        "errors": [],
        "output": [],
        "stats": None,
        "vm": [],              # {site, pc, fields:[op, K, j, m, l, D, Y]}
        "vmstats": None,
        "protos": {},           # site -> {length, code:[[op, operands...]]}  (whole proto)
        "missing_globals": {},
        "values": [],           # {site, pc, op, ra, va, rb, vb, rc, vc}  (value trace)
        "valuestats": None,
    }

    for line in stdout.splitlines():
        if not line.startswith("@@"):
            continue
        parts = line.split("\t")
        kind = parts[0]
        if kind == "@@STR":
            origin, text = _unescape(parts[1]), _unescape(parts[2])
            result["strings"].setdefault(origin, [])
            if text not in result["strings"][origin]:
                result["strings"][origin].append(text)
        elif kind == "@@RDS" and len(parts) >= 5:
            result["readstrings"].append({
                "n": int(parts[1]), "offset": int(parts[2]), "len": int(parts[3]),
                "text": _unescape(parts[4]),
            })
        elif kind == "@@FUNC" and len(parts) >= 4:
            result["funcs"].setdefault(parts[1], {})[parts[2]] = parts[3]
        elif kind == "@@API" and len(parts) >= 3:
            result["api"].append({
                "api": _unescape(parts[1]),
                "detail": _unescape(parts[2]),
                "stack": [s for s in _unescape(parts[3]).split(">") if s],
            })
        elif kind == "@@HPROF" and len(parts) >= 3:
            result["hprof"][parts[1]] = int(parts[2])
        elif kind == "@@HCALL" and len(parts) >= 5:
            result["hcall_samples"].append({
                "handler": parts[1], "n": int(parts[2]), "argc": int(parts[3]),
                "shapes": _unescape(parts[4]),
            })
        elif kind == "@@PROBE" and len(parts) >= 4:
            stage, slot = parts[1], parts[2]
            value_type = parts[3]
            resolved = _unescape(parts[4]) if len(parts) > 4 else value_type
            result["probe"].setdefault(stage, {})[slot] = {
                "type": value_type, "resolved": resolved}
        elif kind == "@@BUF" and len(parts) >= 4:
            result["buffers"].append({"index": int(parts[1]), "len": int(parts[2]), "hex": parts[3]})
        elif kind == "@@SNAP":
            result["snapshot"] = {"reason": parts[1], "buffers": parts[2],
                                  "buffer_calls": parts[3], "seconds": parts[4]}
        elif kind == "@@TRACE":
            result["trace"] = _unescape(parts[1]) if len(parts) > 1 else ""
        elif kind == "@@VMSTATS" and len(parts) >= 4:
            result["vmstats"] = {"dispatches": int(parts[1]), "bad_pc": int(parts[2]),
                                 "instructions": int(parts[3])}
        elif kind == "@@PRLEN" and len(parts) >= 3:
            result["protos"].setdefault(parts[1], {"length": int(parts[2]), "code": []})
            result["protos"][parts[1]]["length"] = int(parts[2])
        elif kind == "@@PR" and len(parts) >= 4:
            entry = result["protos"].setdefault(parts[1], {"length": 0, "code": []})
            entry["code"].append([_vm_field(f) for f in _unescape(parts[3]).split("\t")])
        elif kind == "@@VM" and len(parts) >= 4:
            # @@VM \t site \t pc \t <op \t operands...>  (inner separators escaped)
            result["vm"].append({
                "site": parts[1],
                "pc": int(parts[2]),
                "fields": [_vm_field(f) for f in _unescape(parts[3]).split("\t")],
            })
        elif kind == "@@TV" and len(parts) >= 10:
            result["values"].append({
                "site": parts[1], "pc": int(parts[2]), "op": parts[3],
                "ra": _vm_field(parts[4]), "va": _unescape(parts[5]),
                "rb": _vm_field(parts[6]), "vb": _unescape(parts[7]),
                "rc": _vm_field(parts[8]), "vc": _unescape(parts[9]),
            })
        elif kind == "@@TVSTATS" and len(parts) >= 3:
            result["valuestats"] = {"steps": int(parts[1]), "emitted": int(parts[2])}
        elif kind == "@@ERROR" and len(parts) >= 3:
            result["errors"].append({"phase": parts[1], "message": _unescape(parts[2])})
        elif kind in ("@@OUTPUT", "@@WARN"):
            result["output"].append(_unescape(parts[1]) if len(parts) > 1 else "")
        elif kind == "@@STATS":
            result["stats"] = {"api": int(parts[1]), "strings": int(parts[2]), "funcs": int(parts[3])}
        elif kind == "@@MISSING" and len(parts) >= 2:
            result["missing_globals"].setdefault(parts[1], 0)
            result["missing_globals"][parts[1]] += 1
    return result


def attribute_api_to_handlers(result: dict) -> None:
    """Annotate each API call with the obfuscated handler names on its stack."""
    identities: dict[str, str] = {}
    for stage, entries in result["funcs"].items():
        for name, ident in entries.items():
            identities[ident] = f"{stage}.{name}"
    for call in result["api"]:
        chain = []
        for frame in call["stack"]:
            ident = frame.split("@")[0]
            handler = identities.get(ident)
            if handler and handler not in chain:
                chain.append(handler)
        call["handlers"] = chain


def run(payload: pathlib.Path, workdir: pathlib.Path, budget: int = DEFAULT_BUDGET,
        luau: str | None = None, timeout: int | None = None,
        vm_trace: bool = False) -> dict:
    luau = luau or find_luau()
    if not luau:
        raise FileNotFoundError(
            "no luau binary found: build luau-lang/luau and set LUAU_BIN, or put it in .tools/luau")
    workdir.mkdir(parents=True, exist_ok=True)
    runner = workdir / "runner.luau"
    cfg = {"budget": budget, "dumpAtReadstring": 0, "vmTrace": bool(vm_trace)}
    info = build_runner.build(payload, runner, cfg)
    # The payload normally never terminates (it is a VM interpreting an
    # infinite Roblox script), so the driver streams the harness output, stops
    # as soon as the harness reports @@END, and then reaps the process.
    limit = timeout or (budget * 6 + 240)
    proc = subprocess.Popen(
        [luau, str(runner)],
        stdout=subprocess.PIPE, stderr=subprocess.PIPE,
        text=True, errors="surrogateescape", bufsize=1,
    )

    def _watchdog() -> None:
        import time
        deadline = time.time() + limit
        while time.time() < deadline:
            if proc.poll() is not None:
                return
            time.sleep(0.25)
        if proc.poll() is None:
            proc.kill()

    import threading
    watchdog = threading.Thread(target=_watchdog, daemon=True)
    watchdog.start()

    lines: list[str] = []
    ended = False
    assert proc.stdout is not None
    for line in proc.stdout:
        if line.startswith("@@PAD"):
            continue
        line = line.rstrip("\n")
        if line.startswith("@@END"):
            ended = True
            break
        lines.append(line)
    try:
        proc.kill()
        proc.wait(timeout=15)
    except subprocess.TimeoutExpired:
        pass
    err = ""
    if proc.stderr is not None:
        try:
            err = proc.stderr.read() or ""
        except (ValueError, OSError):
            err = ""
    result = parse_output("\n".join(lines))
    result["build"] = info
    result["completed"] = ended
    result["exit_code"] = proc.returncode
    if err and err.strip():
        result["stderr"] = err[-4000:]
    attribute_api_to_handlers(result)
    return result


def main(argv: list[str]) -> int:
    if len(argv) < 3:
        print("usage: run_runtime.py <payload.luau> <workdir> [budget]", file=sys.stderr)
        return 2
    budget = int(argv[3]) if len(argv) > 3 else DEFAULT_BUDGET
    result = run(pathlib.Path(argv[1]), pathlib.Path(argv[2]), budget)
    out = pathlib.Path(argv[2]) / "runtime.json"
    out.write_text(json.dumps(result, indent=1), encoding="utf-8")
    print(f"wrote {out}: {len(result['api'])} api calls, "
          f"{sum(len(v) for v in result['strings'].values())} strings, "
          f"{len(result['hprof'])} handler counters")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
