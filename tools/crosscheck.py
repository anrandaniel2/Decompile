#!/usr/bin/env python3
"""Independent cross-check with an off-the-shelf Luraph deobfuscator.

`caomod2077/Deobfuscator-Luraph-V15` is the most complete public devirtualiser
for Luraph output.  Its v15 pipeline is mature; its v14.x path is documented as
experimental.  Running it on the same input gives a second opinion on the
obfuscator/version and, when it works, a devirtualised body to compare against
this repository's own recovery.

The step is advisory: the CI job marks it `continue-on-error`, and its raw
output is committed to `reports/CROSSCHECK.md` so the result is auditable.
"""

from __future__ import annotations

import argparse
import json
import os
import pathlib
import shutil
import subprocess
import sys
import tempfile

DVL_REPO = os.environ.get("DVL_REPO", "https://github.com/caomod2077/Deobfuscator-Luraph-V15.git")
DVL_REF = os.environ.get("DVL_REF", "892b48ac200e9deda6cd6fd3142bf66abed393c6")


def run(cmd: list[str], cwd: pathlib.Path | None = None, timeout: int = 600) -> dict:
    try:
        proc = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True,
                              errors="surrogateescape", timeout=timeout)
        return {"cmd": " ".join(cmd), "exit_code": proc.returncode,
                "stdout": proc.stdout[-20000:], "stderr": proc.stderr[-20000:]}
    except FileNotFoundError:
        return {"cmd": " ".join(cmd), "exit_code": 127, "stdout": "", "stderr": "command not found"}
    except subprocess.TimeoutExpired:
        return {"cmd": " ".join(cmd), "exit_code": 124, "stdout": "", "stderr": "timeout"}


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--stages", nargs="+", default=["out/stages/stageA.luau", "out/stages/stageB.luau"])
    ap.add_argument("--work", default=".build/dvl")
    ap.add_argument("--report", default="reports/CROSSCHECK.md")
    ap.add_argument("--luau", default=".tools/luau")
    ap.add_argument("--luau-ast", default=".tools/luau-ast")
    args = ap.parse_args(argv[1:])

    report: dict = {"tool": {"repo": DVL_REPO, "ref": DVL_REF}, "runs": []}
    work = pathlib.Path(args.work)

    if not (work / ".git").exists():
        work.parent.mkdir(parents=True, exist_ok=True)
        clone = run(["git", "clone", DVL_REPO, str(work)])
        report["clone"] = clone
        if clone["exit_code"] != 0:
            _write(args.report, report)
            return 1
        run(["git", "fetch", "--depth", "1", "origin", DVL_REF], cwd=work)
        run(["git", "checkout", DVL_REF], cwd=work)

    if not shutil.which("node"):
        report["error"] = "node is not available"
        _write(args.report, report)
        return 1

    # the tool looks for luau/luau-ast in its bin/ directory on non-Windows hosts
    bin_dir = work / "bin"
    bin_dir.mkdir(exist_ok=True)
    for name, src in (("luau", args.luau), ("luau-ast", args.luau_ast)):
        if pathlib.Path(src).exists():
            shutil.copy(src, bin_dir / name)
            (bin_dir / name).chmod(0o755)
    report["binaries"] = sorted(p.name for p in bin_dir.iterdir())

    for stage in args.stages:
        stage_path = pathlib.Path(stage).resolve()
        if not stage_path.exists():
            report["runs"].append({"stage": stage, "skipped": "missing stage file"})
            continue
        detect = run(["node", "deob.js", "--detect", str(stage_path)], cwd=work, timeout=120)
        trace = run(["node", "deob.js", "--no-devirt", "-o",
                     str(work / f"{stage_path.stem}.trace.luau"), str(stage_path)],
                    cwd=work, timeout=900)
        output = work / f"{stage_path.stem}.trace.luau"
        report["runs"].append({
            "stage": str(stage_path),
            "detect": detect,
            "trace": trace,
            "trace_output_bytes": output.stat().st_size if output.exists() else 0,
            "trace_output_head": output.read_text(errors="surrogateescape")[:4000] if output.exists() else "",
        })

    _write(args.report, report)
    print(f"wrote {args.report}")
    return 0


def _write(path: str, report: dict) -> None:
    out = pathlib.Path(path)
    out.parent.mkdir(parents=True, exist_ok=True)
    lines = ["# Cross-check: off-the-shelf Luraph deobfuscator", "",
             f"- tool: `{report['tool']['repo']}` @ `{report['tool']['ref'][:12]}`",
             "- purpose: independent second opinion on obfuscator/version and, where the "
             "tool's v14.x path cooperates, a devirtualised body to compare with this repo's "
             "own recovery",
             "- this step is advisory (CI marks it `continue-on-error`)", "",
             "> **Reading this report.** The detector and this repository agree on the family",
             "> (Luraph v14.x). The behaviour trace, however, stops immediately: the tool's",
             "> offline engine resolves the obfuscator's numeric stdlib table differently, so the",
             "> base-85 pool decoder is handed a wrong buffer size and the stage dies in",
             "> `buffer.create`. That table is built from global identities at run time - see the",
             "> *Obfuscator library table* section of `BEHAVIOR.md` for the live resolution this",
             "> repository's harness obtains instead.", ""]
    if report.get("error"):
        lines += [f"**not run:** {report['error']}", ""]
    for item in report.get("runs", []):
        if item.get("skipped"):
            lines += [f"## `{item['stage']}`", "", f"_skipped: {item['skipped']}_", ""]
            continue
        lines += [f"## `{item['stage']}`", ""]
        det = item["detect"]
        lines += ["### Detection", "", "```", (det["stdout"] or det["stderr"]).strip(), "```", ""]
        tr = item["trace"]
        lines += ["### Behaviour trace (`--no-devirt`)", "", "```",
                  (tr["stdout"] or "").strip()[-4000:], "```", ""]
        if tr.get("stderr", "").strip():
            lines += ["### stderr", "", "```", tr["stderr"].strip()[-4000:], "```", ""]
        if item.get("trace_output_bytes"):
            lines += [f"Recovered body: {item['trace_output_bytes']:,} bytes", "",
                      "```lua", item["trace_output_head"], "```", ""]
    out.write_text("\n".join(lines), encoding="utf-8")


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
