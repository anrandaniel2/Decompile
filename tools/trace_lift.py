"""Reconstruct Luau source from a dynamic trace of the protected payload.

The static lift (`tools/lift.py`) recovers every instruction the interpreter
*can* execute.  This module adds the other half: the payload is actually run
inside the emulated Roblox environment (`tools/harness/`), the interpreter's
dispatch site is instrumented, and for the first N dispatches we record

    proto (code array identity), pc, opcode, operand registers, values in them

That log answers questions the listing cannot: which of the 7,591 instructions
were reached, what the registers actually held when each one ran, which API
calls came out the other side and in what order.

Outputs
-------
out/trace/<stage>/trace.json      the raw log: steps, per-proto hits, API calls
out/trace/<stage>/ir.txt          the log rendered as an execution listing
reports/TRACE.md                  what the run did, with values
reports/payload.traced.luau       the lift annotated with the observed values

The annotation is what makes the published source trace-derived: every basic
block that the run reached carries the register values recorded at that pc, so
a reader can check the reconstructed statement against what the VM really did.
"""

from __future__ import annotations

import json
import pathlib
from collections import Counter, defaultdict

TRACE_LIMIT = 20000     # must match VALUE_LIMIT in tools/harness/roblox_shim.luau
SNIPPET = 72


def _short(value: str) -> str:
    """Render one recorded value compactly, for comments and tables."""
    if not isinstance(value, str):
        return str(value)
    if value.startswith("s:"):
        text = value[2:]
        if len(text) > SNIPPET:
            text = text[:SNIPPET] + "..."
        return json.dumps(text, ensure_ascii=False)
    if value.startswith("n:"):
        return value[2:]
    if value.startswith("b:"):
        return value[2:]
    if value == "nil" or value == "":
        return "nil"
    return value


# ---------------------------------------------------------------------------
# the log
# ---------------------------------------------------------------------------
def steps(runtime: dict) -> list[dict]:
    """Every recorded dispatch, in execution order."""
    out = []
    for index, record in enumerate(runtime.get("values") or [], 1):
        reads = []
        for reg, value in ((record.get("ra"), record.get("va")),
                           (record.get("rb"), record.get("vb")),
                           (record.get("rc"), record.get("vc"))):
            try:
                reg = int(reg)
            except (TypeError, ValueError):
                continue
            if value not in (None, "", "nil"):
                reads.append((reg, value))
        out.append({
            "n": index,
            "site": record.get("site") or "",
            "pc": record.get("pc"),
            "op": record.get("op") or "",
            "reads": reads,
        })
    return out


def proto_hits(runtime: dict) -> dict[str, list[int]]:
    """Which pcs each proto ran, in first-execution order."""
    hits: dict[str, list[int]] = {}
    for record in steps(runtime):
        hits.setdefault(record["site"], [])
        if record["pc"] not in hits[record["site"]]:
            hits[record["site"]].append(record["pc"])
    return {site: sorted(pcs) for site, pcs in hits.items()}


def values_by_pc(runtime: dict) -> dict[str, dict[int, list[str]]]:
    """site -> pc -> the distinct values seen in that instruction's operands."""
    table: dict[str, dict[int, list[str]]] = defaultdict(lambda: defaultdict(list))
    for record in steps(runtime):
        notes = table[record["site"]][record["pc"]]
        for reg, value in record["reads"]:
            note = f"R[{reg}] = {_short(value)}"
            if note not in notes and len(notes) < 3:
                notes.append(note)
    # a pc whose operands were all nil carries no observation
    return {site: {pc: values for pc, values in pcs.items() if values}
            for site, pcs in table.items()}


def interesting_values(runtime: dict) -> list[str]:
    """Strings that came out of the log and look like data, not noise."""
    seen: list[str] = []
    for record in steps(runtime):
        for _reg, value in record["reads"]:
            if not isinstance(value, str) or not value.startswith("s:"):
                continue
            text = value[2:]
            if len(text) < 4 or text in seen:
                continue
            seen.append(text)
    return seen


def _call_detail(detail: str) -> str:
    return detail if len(detail) <= 120 else detail[:117] + "..."


def summarize(runtime: dict, listing: dict) -> dict:
    """Turn the raw log into the facts the reports quote."""
    log = steps(runtime)
    hits = proto_hits(runtime)
    sites = [p["site"] for p in listing.get("protos", [])]
    by_site = {p["site"]: p["id"] for p in listing.get("protos", [])}
    listing_executed = sum(1 for p in listing.get("protos", [])
                           for ins in p["instructions"] if ins.get("executed"))
    api = runtime.get("api") or []
    per_proto = []
    for site, pcs in sorted(hits.items(), key=lambda kv: -len(kv[1])):
        proto = by_site.get(site, "?")
        total = next((len(p["instructions"]) for p in listing.get("protos", [])
                      if p["site"] == site), 0)
        per_proto.append({
            "proto": proto,
            "site": site,
            "executed": len(pcs),
            "instructions": total,
            "coverage": round(100.0 * len(pcs) / total, 1) if total else 0.0,
            "hot": [pc for pc, _ in Counter(r["pc"] for r in log
                                            if r["site"] == site).most_common(5)],
        })
    strings = interesting_values(runtime)
    urls = [s for s in strings if s.startswith(("http://", "https://"))]
    return {
        "steps": len(log),
        "capped": len(log) >= TRACE_LIMIT,
        "protos_touched": len(hits),
        "protos": len(listing.get("protos", [])),
        "executed_instructions": listing_executed,
        "instructions": listing.get("instruction_count", 0),
        "per_proto": per_proto,
        "api": [{"api": c.get("api"), "detail": _call_detail(c.get("detail") or ""),
                 "stack": c.get("stack") or []} for c in api],
        "strings": strings[:60],
        "urls": urls[:20],
        "sites": sites,
        "opcodes": dict(Counter(r["op"] for r in log).most_common()),
    }


# ---------------------------------------------------------------------------
# artifacts
# ---------------------------------------------------------------------------
def render_ir(runtime: dict, listing: dict, limit: int = 4000) -> str:
    """The execution log as a listing: one line per executed dispatch."""
    by_site = {p["site"]: p["id"] for p in listing.get("protos", [])}
    text_of = {(p["site"], i["pc"]): (i.get("text") or i.get("semantics") or "")
               for p in listing.get("protos", []) for i in p["instructions"]}
    lines = [
        "-- Execution log of the protected payload, rendered as a listing.",
        "-- Columns: step | proto | pc | opcode | values observed in the operands | statement",
        "-- Recorded at the interpreter's dispatch site (tools/harness/roblox_shim.luau).",
        "",
    ]
    previous = None
    for record in steps(runtime):
        if record["n"] > limit:
            lines.append(f"-- ... {len(steps(runtime)) - limit} further steps in trace.json")
            break
        proto = by_site.get(record["site"], record["site"])
        if previous is not None and (record["site"] != previous["site"]):
            lines.append("")
        transition = ""
        if previous is not None and previous["site"] == record["site"]:
            if record["pc"] != previous["pc"] + 1:
                transition = f"   <- branch from {previous['pc']}"
        observed = "  ".join(f"R[{r}]={_short(v)}" for r, v in record["reads"])
        stmt = text_of.get((record["site"], record["pc"]), "") or "-"
        lines.append(f"{record['n']:>7}  {proto:<4} {record['pc']:>5}  "
                     f"op {record['op']:<4} {observed:<44} {stmt}{transition}")
        previous = record
    return "\n".join(lines) + "\n"


def annotations(runtime: dict) -> dict[str, dict[int, str]]:
    """site -> pc -> the comment the lifted source carries for that instruction."""
    return {site: {pc: f"@pc {pc}: " + ", ".join(values) for pc, values in pcs.items()}
            for site, pcs in values_by_pc(runtime).items()}


def render_markdown(summary: dict, trace_rel: str, ir_rel: str) -> str:
    lines = ["# Dynamic trace: what the payload actually did", ""]
    lines.append(
        "The payload was executed inside the emulated Roblox environment "
        "(`tools/harness/`) rather than read statically. The interpreter's "
        "dispatch site is instrumented, so every instruction the VM ran - with "
        "the values sitting in its operand registers - lands in the log.")
    lines.append("")
    lines.append(f"- dispatches recorded: **{summary['steps']:,}**")
    lines.append(f"- protos reached: **{summary['protos_touched']}/{summary['protos']}**")
    lines.append(f"- instructions executed: **{summary['executed_instructions']:,} "
                 f"of {summary['instructions']:,}**")
    lines.append(f"- API calls observed: **{len(summary['api'])}**")
    lines.append(f"- distinct string values seen in registers: **{len(summary['strings'])}**")
    lines.append(f"- raw log: `{trace_rel}`; rendered listing: `{ir_rel}`")
    lines.append("")

    lines.append("## Coverage per proto")
    lines.append("")
    lines.append("| proto | instructions | executed | coverage | hot pcs (most re-executed) |")
    lines.append("| --- | ---: | ---: | ---: | --- |")
    for row in summary["per_proto"]:
        hot = ", ".join(str(pc) for pc in row["hot"])
        lines.append(f"| `{row['proto']}` | {row['instructions']:,} | "
                     f"{row['executed']:,} | {row['coverage']}% | {hot} |")
    lines.append("")

    lines.append("## API traffic, in the order the payload produced it")
    lines.append("")
    if summary["api"]:
        lines.append("| # | call | arguments | handler stack |")
        lines.append("| ---: | --- | --- | --- |")
        for index, call in enumerate(summary["api"], 1):
            detail = (call["detail"] or "").replace("|", "\\|")
            stack = " > ".join(call["stack"][:3]).replace("|", "\\|") or "-"
            lines.append(f"| {index} | `{call['api']}` | `{detail}` | `{stack}` |")
    else:
        lines.append("_No API calls were reached inside the capture budget._")
    lines.append("")

    lines.append("## Values recovered from registers")
    lines.append("")
    if summary["strings"]:
        lines.append("These strings were read out of the VM's registers while the "
                     "program was running, i.e. they are data the payload "
                     "actually computed or looked up - not guesses from the "
                     "constant pool.")
        lines.append("")
        for text in summary["strings"][:40]:
            lines.append(f"- `{text}`")
    else:
        lines.append("_The capture budget ended before any string reached a register._")
    lines.append("")

    if summary["urls"]:
        lines.append("## Network endpoints seen at runtime")
        lines.append("")
        for url in summary["urls"]:
            lines.append(f"- `{url}`")
        lines.append("")

    lines.append("## Opcode mix in the observed execution")
    lines.append("")
    lines.append("| opcode | dispatches |")
    lines.append("| ---: | ---: |")
    for op, count in list(summary["opcodes"].items())[:20]:
        lines.append(f"| {op} | {count:,} |")
    lines.append("")
    return "\n".join(lines)


def write_outputs(summary: dict, runtime: dict, listing: dict, out_dir: pathlib.Path,
                  reports_dir: pathlib.Path, stage: str,
                  trace_rel: str, ir_rel: str) -> dict:
    """Write trace.json / ir.txt / TRACE.md and return the paths."""
    trace_dir = out_dir / "trace" / stage
    trace_dir.mkdir(parents=True, exist_ok=True)
    trace_json = trace_dir / "trace.json"
    trace_json.write_text(json.dumps({
        "stage": stage,
        "summary": summary,
        "steps": steps(runtime),
    }, indent=1), encoding="utf-8")

    ir_path = trace_dir / "ir.txt"
    ir_path.write_text(render_ir(runtime, listing), encoding="utf-8",
                       errors="surrogateescape")

    report = reports_dir / "TRACE.md"
    report.write_text(render_markdown(summary, trace_rel, ir_rel), encoding="utf-8")
    return {"trace": str(trace_json), "ir": str(ir_path), "report": str(report)}
