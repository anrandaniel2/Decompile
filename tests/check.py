#!/usr/bin/env python3
"""Prove the decompiled loader matches the protected build, and is not a replica.

The oracle is the MoonVeil build. Both programs run in the same Luau sandbox.
A readable file that still contains the obfuscator, or a cleaned file whose
calls differ, fails.
"""

from __future__ import annotations

import argparse
import difflib
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ORIGINAL = ROOT / "input" / "DevoidHubLoader.txt"
DECOMPILED = ROOT / "decompiled" / "DevoidHubLoader.luau"
HARNESS = ROOT / "tests" / "harness.luau"

# Strings recovered from the protected build. A replica of the obfuscated
# source does not contain them in the clear, and a wrong reconstruction drops one.
REQUIRED_STRINGS = [
    "Devoid Hub Supports Loader",
    "by Totallynothimplayz",
    "devoided",
    "rbxassetid://732731242066",
    "rbxassetid://1234",
    "https://github.com/Footagesus/WindUI/releases/download/1.6.65/main.lua",
    "https://vss.pandauth.com/kv/62dcfcad9c9438a6",
    "https://vss.pandauth.com/kv/5c9cce70aa883f6f",
    "https://vss.pandauth.com/kv/ab3e7202a3ac7ae0",
    "clicked to the 'user icon'",
    "Load Piggy",
    "Load MM2",
    "Load STK",
    "Murder Mystery 2",
    "Survive The Killer",
    "MarketplaceService",
    "CreateWindow",
]

REPLICA_MARKERS = [
    "MoonVeil",
    "moonveil.cc",
    "|FVDM0RzVwF8",
    "while true do",
    "0b10010110",
]


def lua_long_string(source: str) -> str:
    eq = 0
    while True:
        close = "]" + ("=" * eq) + "]"
        if close not in source:
            return "[" + ("=" * eq) + "[\n" + source + "\n" + close
        eq += 1


def build_runner(script: str) -> str:
    harness = HARNESS.read_text()
    marker = "---SCRIPT---"
    if marker not in harness:
        raise SystemExit("harness is missing the script marker")
    return harness.replace(marker, script, 1)


def run_luau(luau: str, script: str) -> list[str]:
    with tempfile.TemporaryDirectory(prefix="devoid-") as tmp:
        path = Path(tmp) / "run.luau"
        path.write_text(build_runner(script))
        proc = subprocess.run(
            [luau, str(path)],
            text=True,
            capture_output=True,
            timeout=30,
        )
    if proc.returncode != 0 and "EVENT|run.done" not in proc.stdout:
        sys.stderr.write(proc.stderr)
        sys.stderr.write(proc.stdout)
        raise SystemExit(f"luau failed with status {proc.returncode}")
    events = []
    for line in proc.stdout.splitlines():
        if line.startswith("EVENT|"):
            events.append(line[len("EVENT|") :])
    if not events:
        sys.stderr.write(proc.stderr)
        sys.stderr.write(proc.stdout)
        raise SystemExit("sandbox produced no events")
    return events


def assert_readable(source: str, label: str) -> None:
    for marker in REPLICA_MARKERS:
        if marker in source:
            raise SystemExit(f"{label} still looks like the obfuscated build ({marker!r})")
    for text in REQUIRED_STRINGS:
        if text not in source:
            raise SystemExit(f"{label} is missing recovered string {text!r}")
    if len(source) > 8000:
        raise SystemExit(f"{label} is too large to be a decompilation ({len(source)} bytes)")
    if source.count("function") > 12:
        raise SystemExit(f"{label} still has the obfuscator's function soup")


def assert_replica_rejected(source: str) -> None:
    try:
        assert_readable(source, "obfuscated fixture")
    except SystemExit:
        return
    raise SystemExit("replica guard accepted the obfuscated fixture")


def diff_events(left: list[str], right: list[str]) -> str:
    return "".join(
        difflib.unified_diff(
            [line + "\n" for line in left],
            [line + "\n" for line in right],
            fromfile="protected",
            tofile="decompiled",
        )
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--luau", required=True, help="path to the luau CLI")
    args = parser.parse_args()
    luau = args.luau

    original = ORIGINAL.read_text()
    decompiled = DECOMPILED.read_text()
    if "return({" not in original or "MoonVeil" not in original:
        raise SystemExit("protected fixture is not the expected MoonVeil build")

    assert_readable(decompiled, "decompiled/DevoidHubLoader.luau")
    assert_replica_rejected(original)

    protected_events = run_luau(luau, original)
    decompiled_events = run_luau(luau, decompiled)
    if protected_events != decompiled_events:
        sys.stderr.write(diff_events(protected_events, decompiled_events))
        raise SystemExit("decompiled behavior does not match the protected build")

    mutated = decompiled.replace(
        "https://vss.pandauth.com/kv/62dcfcad9c9438a6",
        "https://vss.pandauth.com/kv/0000000000000000",
        1,
    )
    if mutated == decompiled:
        raise SystemExit("negative test could not mutate the decompiled source")
    mutated_events = run_luau(luau, mutated)
    if mutated_events == protected_events:
        raise SystemExit("comparator did not notice a changed load URL")

    joined = "\n".join(protected_events)
    for text in (
        "Devoid Hub Supports Loader",
        "https://github.com/Footagesus/WindUI/releases/download/1.6.65/main.lua",
        "https://vss.pandauth.com/kv/62dcfcad9c9438a6",
        "https://vss.pandauth.com/kv/5c9cce70aa883f6f",
        "https://vss.pandauth.com/kv/ab3e7202a3ac7ae0",
        "clicked to the 'user icon'",
        "service:MarketplaceService",
        "service:Players",
        "Load Piggy",
        "Load MM2",
        "Load STK",
    ):
        if text not in joined:
            raise SystemExit(f"protected trace is missing {text!r}; sandbox is not observing the program")

    if "run.done true" not in joined:
        raise SystemExit("protected build did not finish successfully:\n" + joined)
    print(f"ok: {len(protected_events)} events match; replica and mutation checks passed")


if __name__ == "__main__":
    main()
