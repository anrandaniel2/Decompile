#!/usr/bin/env python3
"""End-to-end deobfuscation pipeline.

    python3 tools/pipeline.py --input input/Key.luau.txt --out out --reports reports

Stages (each one is also runnable on its own, see the other modules):

  1. identify       which obfuscator/version, with evidence
  2. split          separate obfuscated stages from plaintext glue
  3. pools          extract + statically decode the `LPH` constant pools
  4. inventory      recover every handler in every handler table
  5. runtime        run each stage under the Roblox emulation harness:
                    decrypted strings, API trace, per-handler profile
  6. rename         assign a semantic name to every handler
  7. opcodes        decode the VM's opcode ladder into readable operations
  8. annotate       emit readable, still-executable copies of each stage

Everything it writes is deterministic given the same input, so CI can diff it.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import pathlib
import re
import shutil
import subprocess
import sys
import time
from collections import Counter

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(HERE / "harness"))

import identify as identify_mod  # noqa: E402
import verify as verify_mod  # noqa: E402
import lph  # noqa: E402
import name_map as name_map_mod  # noqa: E402
import opcodes as opcodes_mod  # noqa: E402
from inventory import inventory_stage  # noqa: E402
from normalize import normalize_stage  # noqa: E402
from stages import plaintext_settings, plaintext_urls, split_stages  # noqa: E402

STAGE_TAGS = "ABCDEFGH"


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8", "surrogateescape")).hexdigest()


# ---------------------------------------------------------------------------
# report helpers
# ---------------------------------------------------------------------------
def render_strings_report(runtimes: dict[str, dict]) -> str:
    lines = ["# Decrypted strings", "",
             "Every string the payload asked its constant pool for while running under the",
             "emulation harness. Luraph decrypts pool entries lazily, so this is the set of",
             "strings the executed code path actually needs.", ""]
    all_strings: dict[str, set[str]] = {}
    for tag, rt in runtimes.items():
        bucket: set[str] = set()
        for values in rt.get("strings", {}).values():
            bucket.update(values)
        all_strings[tag] = bucket

    for tag, bucket in all_strings.items():
        lines.append(f"## Stage `{tag}` — {len(bucket)} unique strings")
        lines.append("")
        notable = sorted(s for s in bucket if len(s) > 24)
        if notable:
            lines.append("### Notable (long) strings")
            lines.append("")
            lines.append("```")
            for s in notable:
                lines.append(s.replace("\n", "\\n")[:400])
            lines.append("```")
            lines.append("")
        lines.append("<details><summary>All strings</summary>")
        lines.append("")
        lines.append("```")
        for s in sorted(bucket, key=lambda v: (len(v), v)):
            lines.append(s.replace("\n", "\\n")[:200])
        lines.append("```")
        lines.append("")
        lines.append("</details>")
        lines.append("")
    return "\n".join(lines)


def render_behavior_report(runtimes: dict[str, dict]) -> str:
    lines = ["# Runtime behaviour", "",
             "Observations from the emulation harness (`tools/harness`). The payload is a",
             "VM interpreted in Lua, so a budgeted run is used: the harness snapshots and",
             "stops once the time budget is reached.", ""]
    for tag, rt in runtimes.items():
        lines.append(f"## Stage `{tag}`")
        lines.append("")
        if rt.get("completed"):
            lines.append("- run completed within the budget")
        else:
            lines.append("- run stopped by the budget (the payload does not terminate on its "
                         "own: it is an eternal Roblox script)")
        snap = rt.get("snapshot") or {}
        if snap:
            lines.append(f"- snapshot: reason=`{snap.get('reason')}`, buffers={snap.get('buffers')}, "
                         f"buffer calls={snap.get('buffer_calls')}, seconds={snap.get('seconds')}")
        stats = rt.get("stats") or {}
        if stats:
            lines.append(f"- harness counters: {stats}")
        buffers = rt.get("buffers", [])
        if buffers:
            lines.append("- captured `buffer` objects: " +
                         ", ".join(f"#{b['index']} ({b['len']:,} bytes)" for b in buffers))
        missing = rt.get("missing_globals") or {}
        if missing:
            lines.append("- globals the emulator had to stub: " +
                         ", ".join(f"`{k}`" for k in sorted(missing)[:20]))
        errors = rt.get("errors") or []
        if errors:
            lines.append("- harness-reported errors:")
            for err in errors[:5]:
                lines.append(f"  - `{err['phase']}`: {err['message'][:200]}")
        api = rt.get("api") or []
        lines.append("")
        lines.append(f"### API calls ({len(api)})")
        lines.append("")
        if api:
            lines.append("| API | detail | handler chain |")
            lines.append("|---|---|---|")
            for call in api[:80]:
                chain = " → ".join(f"`{c}`" for c in call.get("handlers", [])[:8]) or "—"
                lines.append(f"| `{call['api']}` | {call.get('detail','')[:80]} | {chain} |")
        else:
            lines.append("_No Roblox/executor API calls were reached on this code path._")
        lines.append("")
        prof = sorted((rt.get("hprof") or {}).items(), key=lambda kv: -kv[1])[:25]
        if prof:
            lines.append("### Hottest handlers")
            lines.append("")
            lines.append("| handler | calls |")
            lines.append("|---|---|")
            for handler, count in prof:
                lines.append(f"| `{handler}` | {count:,} |")
            lines.append("")
        probe = rt.get("probe") or {}
        for stage_key, slots in probe.items():
            numeric = {k: v for k, v in slots.items() if k.isdigit()}
            if not numeric:
                continue
            lines.append(f"### Obfuscator library table (`{stage_key}`)")
            lines.append("")
            lines.append("The VM indexes its stdlib table numerically, so the slots are all "
                         "that is visible in the source. Resolved live:")
            lines.append("")
            lines.append("| slot | resolved |")
            lines.append("|---|---|")
            for slot in sorted(numeric, key=int):
                entry = numeric[slot]
                resolved = entry.get("resolved") if isinstance(entry, dict) else entry
                lines.append(f"| `{slot}` | `{resolved}` |")
            lines.append("")
    return "\n".join(lines)


def render_pipeline_report(manifest: dict) -> str:
    lines = ["# Pipeline run", "",
             f"- input: `{manifest['input']['path']}` ({manifest['input']['bytes']:,} bytes, "
             f"sha256 `{manifest['input']['sha256'][:32]}`)",
             f"- luau: `{manifest.get('luau') or 'not found'}`",
             f"- budget per stage: {manifest.get('budget')}s", ""]
    lines.append("## Stages")
    lines.append("")
    lines.append("| stage | kind | lines | bytes | pools | notes |")
    lines.append("|---|---|---|---|---|---|")
    for st in manifest["stages"]:
        lines.append(f"| `{st['tag']}` | {st['kind']} | {st['start_line']}–{st['end_line']} | "
                     f"{st['bytes']:,} | {st['lph_pools']} | {', '.join(st.get('notes', []))} |")
    lines.append("")
    if manifest.get("plaintext"):
        lines.append("## Plaintext glue")
        lines.append("")
        cfg = manifest["plaintext"].get("settings") or {}
        for name, block in cfg.items():
            if isinstance(block, dict):
                lines.append(f"### `_G.{name}`")
                lines.append("")
                lines.append("| key | value |")
                lines.append("|---|---|")
                for k, v in block.items():
                    if isinstance(v, bool):
                        v = "true" if v else "false"
                    lines.append(f"| `{k}` | `{v}` |")
                lines.append("")
            else:
                lines.append(f"- `_G.{name} = {block}`")
        urls = manifest["plaintext"].get("urls") or []
        if urls:
            lines.append("")
            lines.append("Referenced endpoints:")
            lines.append("")
            for url in urls:
                lines.append(f"- `{url}`")
        lines.append("")
    if manifest.get("verification"):
        lines.append("## Verification of the annotated output")
        lines.append("")
        lines.append("| stage | token stream identical | tokens | parses (luau-ast) |")
        lines.append("|---|---|---|---|")
        for tag, ver in manifest["verification"].items():
            tok = ver["tokens"]
            parse = ver["parse"]
            parse_txt = "yes" if parse.get("ok") else ("n/a" if parse.get("ok") is None else "**no**")
            lines.append(f"| `{tag}` | {'yes' if tok['ok'] else '**no**'} | {tok['tokens']:,} | {parse_txt} |")
        lines.append("")
        lines.append("The token stream check re-lexes both files and compares every token "
                     "(numbers compared by value), so the annotations provably change "
                     "presentation only.")
        lines.append("")
    if manifest.get("disassembly"):
        dis = manifest["disassembly"]
        lines.append("## Recovered program (VM disassembly)")
        lines.append("")
        lines.append(f"- capture budget: {dis['budget']} (dispatch hook, stage `{dis['stage']}`)")
        stats = dis.get("vmstats") or {}
        if stats:
            lines.append(f"- dispatches observed: {stats.get('dispatches', 0):,}")
        lines.append(f"- instructions: **{dis['instructions']:,}** "
                     f"({dis['decoded']:,} decoded) across **{dis['protos']}** protos, "
                     f"{dis['opcodes']} distinct opcodes")
        lines.append(f"- constant slots recovered: {dis.get('constant_slots', 0)}")
        lines.append(f"- listing: `{dis['artifacts']['disassembly']}`")
        lines.append("")
        lines.append("| semantics | count |")
        lines.append("|---|---|")
        for name, count in list(dis["histogram"].items())[:12]:
            lines.append(f"| {name} | {count} |")
        lines.append("")
    lines.append("## Artefacts")
    lines.append("")
    lines.append("| file | bytes | sha256 |")
    lines.append("|---|---|---|")
    for art in manifest["artifacts"]:
        lines.append(f"| `{art['path']}` | {art['bytes']:,} | `{art['sha256'][:32]}` |")
    lines.append("")
    return "\n".join(lines)


# ---------------------------------------------------------------------------
# main flow
# ---------------------------------------------------------------------------
DISASM_BUDGET = 10


def run_pipeline(input_path: pathlib.Path, out_dir: pathlib.Path, reports_dir: pathlib.Path,
                 budget: int = 40, skip_runtime: bool = False, luau: str | None = None,
                 luau_ast: str | None = None) -> dict:
    started = time.time()
    source = input_path.read_text(encoding="utf-8", errors="surrogateescape")
    out_dir.mkdir(parents=True, exist_ok=True)
    reports_dir.mkdir(parents=True, exist_ok=True)
    artifacts: list[dict] = []

    def record(path: pathlib.Path) -> None:
        data = path.read_bytes()
        artifacts.append({"path": str(path), "bytes": len(data),
                          "sha256": hashlib.sha256(data).hexdigest()})

    # ---- 1/2. identify + split -------------------------------------------
    stages = split_stages(source)
    stage_info = []
    obfuscated: list[tuple[str, object]] = []
    plain_index = 0
    obf_index = 0
    for st in stages:
        info = st.summary()
        if st.kind == "obfuscated":
            tag = STAGE_TAGS[obf_index]
            obf_index += 1
            obfuscated.append((tag, st))
        else:
            plain_index += 1
            tag = f"plaintext{plain_index}"
        info["tag"] = tag
        stage_info.append(info)

    stage_dir = out_dir / "stages"
    stage_dir.mkdir(exist_ok=True)
    stage_paths: dict[str, pathlib.Path] = {}
    for tag, st in obfuscated:
        path = stage_dir / f"stage{tag}.luau"
        path.write_text(st.text + "\n", encoding="utf-8", errors="surrogateescape")
        stage_paths[tag] = path
        record(path)

    # ---- 3. pools ---------------------------------------------------------
    pool_dir = out_dir / "pools"
    pool_dir.mkdir(exist_ok=True)
    pools, blobs = lph.describe(source)
    for pool, blob in zip(pools, blobs):
        path = pool_dir / f"pool{pool.index}.bin"
        path.write_bytes(blob)
        record(path)
    lph.write_reports(pools, pool_dir)
    record(pool_dir / "pools.json")

    # ---- 4. inventory -----------------------------------------------------
    inventories: dict[str, dict] = {}
    for tag, st in obfuscated:
        handlers, meta = inventory_stage(st.text, tag)
        inventories[tag] = {"handlers": [h.to_json() for h in handlers], "meta": meta}
    inventory_path = out_dir / "inventory.json"
    inventory_path.write_text(json.dumps(inventories, indent=1), encoding="utf-8")
    record(inventory_path)

    # ---- 5. runtime -------------------------------------------------------
    runtimes: dict[str, dict] = {}
    resolved_luau = luau
    if not skip_runtime:
        import run_runtime
        resolved_luau = luau or run_runtime.find_luau()
        luau = resolved_luau
        if resolved_luau:
            for tag, path in stage_paths.items():
                rt = run_runtime.run(path, out_dir / "runtime" / tag, budget=budget, luau=resolved_luau)
                runtimes[tag] = rt
                rt_path = out_dir / "runtime" / tag / "runtime.json"
                rt_path.write_text(json.dumps(rt, indent=1), encoding="utf-8")
                record(rt_path)
        else:
            print("[warn] no luau binary: skipping the runtime stage (strings/behaviour "
                  "will be missing)", file=sys.stderr)

    runtime_strings = [s for rt in runtimes.values() for bucket in rt.get("strings", {}).values()
                       for s in bucket]

    # ---- 5b. capture + disassemble the VM program -------------------------
    # The interpreter's dispatch site is instrumented, so every executed
    # instruction lands in runtime.json.  The hook is expensive (~1.6e8 calls
    # per run), so it gets its own short-budget pass over the main payload.
    disassembly: dict | None = None
    vm_tag = "B" if "B" in stage_paths else (next(iter(stage_paths), None))
    if resolved_luau and vm_tag:
        import disasm
        import run_runtime
        trace_dir = out_dir / "runtime" / f"{vm_tag}trace"
        trace_budget = min(budget, DISASM_BUDGET)
        trace_rt = run_runtime.run(stage_paths[vm_tag], trace_dir, budget=trace_budget,
                                   luau=resolved_luau, timeout=trace_budget * 10 + 120,
                                   vm_trace=True)
        trace_path = trace_dir / "runtime.json"
        trace_path.write_text(json.dumps(trace_rt, indent=1), encoding="utf-8")
        record(trace_path)
        stage_texts = {t: s.text for t, s in obfuscated}
        listing = disasm.build_listing(trace_rt, inventories, stage_texts, vm_tag)
        paths = disasm.write_outputs(listing, out_dir, reports_dir)
        for path in paths.values():
            record(pathlib.Path(path))
        disassembly = {
            "stage": vm_tag,
            "budget": trace_budget,
            "vmstats": trace_rt.get("vmstats"),
            "instructions": listing["instruction_count"],
            "decoded": listing["decoded_count"],
            "protos": len(listing["protos"]),
            "ladder_values": len(listing["templates"]),
            "opcodes": len(listing["opcode_histogram"]),
            "histogram": listing["histogram"],
            "artifacts": paths,
        }
        print(f"[disasm] {listing['instruction_count']} executed instructions, "
              f"{listing['decoded_count']} decoded, {len(listing['protos'])} protos")

    # ---- 1b. identification (uses runtime evidence) -----------------------
    detector_notes = ""
    verdict = identify_mod.identify(source, runtime_strings)
    ident_json = out_dir / "identification.json"
    ident_json.write_text(json.dumps(verdict.to_json(), indent=1), encoding="utf-8")
    record(ident_json)

    # ---- 6/7. names + opcodes --------------------------------------------
    runtime_combined = {"hprof": {}, "api": []}
    for tag, rt in runtimes.items():
        runtime_combined["hprof"].update(rt.get("hprof") or {})
        runtime_combined["api"].extend(rt.get("api") or [])
    runtime_combined["api"].sort(key=lambda c: c.get("api", ""))

    name_map = name_map_mod.build_map(inventories, runtime_combined, {t: s.text for t, s in obfuscated})
    name_map_path = out_dir / "function_map.json"
    name_map_path.write_text(json.dumps(name_map, indent=1), encoding="utf-8")
    record(name_map_path)

    opcode_table = opcodes_mod.for_map(inventories)
    opcodes_path = out_dir / "opcodes.json"
    opcodes_path.write_text(json.dumps(opcode_table, indent=1), encoding="utf-8")
    record(opcodes_path)

    # ---- 8. annotated stages (token-verified + parsed) --------------------
    deob_dir = out_dir / "deobfuscated"
    deob_dir.mkdir(exist_ok=True)
    verification: dict[str, dict] = {}
    for tag, st in obfuscated:
        annotations = {h["name"]: (h["semantic_name"], h["role"])
                       for h in name_map["blobs"][tag]["handlers"]}
        text = normalize_stage(st.text, annotations)
        path = deob_dir / f"stage{tag}.annotated.luau"
        path.write_text(text + "\n", encoding="utf-8", errors="surrogateescape")
        record(path)
        original = stage_paths[tag]
        verification[tag] = {
            "tokens": verify_mod.check_tokens(original, path),
            "parse": verify_mod.check_parse(path, luau_ast),
        }

    # ---- reports ----------------------------------------------------------
    ident_md = reports_dir / "IDENTIFICATION.md"
    ident_md.write_text(identify_mod.render_markdown(
        verdict.to_json(), {"pools": [p.to_json() for p in pools],
                            "detector_crosscheck": detector_notes}),
        encoding="utf-8")
    record(ident_md)

    fmap_md = reports_dir / "FUNCTION_MAP.md"
    fmap_md.write_text(name_map_mod.render_report(name_map, runtime_combined, inventories,
                                                  {"opcodes": opcode_table}), encoding="utf-8")
    record(fmap_md)

    if runtimes:
        strings_md = reports_dir / "STRINGS.md"
        strings_md.write_text(render_strings_report(runtimes), encoding="utf-8")
        record(strings_md)
        behavior_md = reports_dir / "BEHAVIOR.md"
        behavior_md.write_text(render_behavior_report(runtimes), encoding="utf-8")
        record(behavior_md)

    manifest = {
        "input": {"path": str(input_path), "bytes": len(source), "sha256": sha256_text(source)},
        "luau": str(luau) if luau else None,
        "budget": budget,
        "stages": stage_info,
        "plaintext": {
            "settings": plaintext_settings(source),
            "urls": plaintext_urls(source),
        },
        "artifacts": artifacts,
        "verification": verification,
        "disassembly": disassembly,
        "elapsed_seconds": round(time.time() - started, 1),
        "totals": name_map["totals"],
    }
    pipeline_md = reports_dir / "PIPELINE.md"
    pipeline_md.write_text(render_pipeline_report(manifest), encoding="utf-8")
    (out_dir / "manifest.json").write_text(json.dumps(manifest, indent=1), encoding="utf-8")
    return manifest


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--input", default="input/Key.luau.txt")
    ap.add_argument("--out", default="out")
    ap.add_argument("--reports", default="reports")
    ap.add_argument("--budget", type=int, default=40, help="seconds of payload execution per stage")
    ap.add_argument("--skip-runtime", action="store_true")
    ap.add_argument("--luau", default=None)
    ap.add_argument("--luau-ast", default=None)
    args = ap.parse_args(argv[1:])

    manifest = run_pipeline(pathlib.Path(args.input), pathlib.Path(args.out),
                            pathlib.Path(args.reports), args.budget, args.skip_runtime,
                            args.luau, args.luau_ast)
    print(f"done in {manifest['elapsed_seconds']}s — "
          f"{manifest['totals'].get('handlers', 0)} handlers mapped, "
          f"{len(manifest['artifacts'])} artifacts")
    for art in manifest["artifacts"]:
        print(f"  {art['path']}  {art['bytes']:,} bytes")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
