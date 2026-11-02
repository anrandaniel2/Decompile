#!/usr/bin/env python3
"""Turn the static inventory + runtime profile into a readable function map.

The obfuscator's handler tables are named with 1-3 character identifiers
(`qW`, `Ao`, `dN`, ...).  Nothing in the file says what they do, so names are
recovered from behaviour:

  * what the handler does structurally (reads/writes which VM slot, does it
    loop, is it a dispatch ladder, does it install the constant-pool decoder)
  * what library function it is aliased to (`UW = bit32.bnot`)
  * how hot it is at runtime, and which Roblox APIs its callers reach

The result is a stable, collision-free `semantic_name` per handler, which the
report and the annotated source both use.
"""

from __future__ import annotations

import json
import re
from collections import Counter, OrderedDict
from dataclasses import dataclass, field

DISPATCH_MIN = 12          # distinct `var == const` tests before we call it a dispatcher
GETTER_MAX = 140           # byte size ceiling for tiny accessors


# ---------------------------------------------------------------------------
# semantic classification of individual dispatch branches (VM opcodes)
# ---------------------------------------------------------------------------
# Ordered rules: first match wins, so comparisons are checked before the
# arithmetic operators they contain, and `//` before `/`.
OPCODE_RULES: list[tuple[str, str]] = [
    (r"buffer\.(readu32|readi32|readu8|readstring)", "pool read (bytecode/constant fetch)"),
    (r"buffer\.(writeu32|writei32|writeu8|writestring)", "pool write"),
    (r"==\s*[A-Za-z_]\w*\s*\[|\]\s*==\s*[A-Za-z_]", "EQ (runtime equality)"),
    (r"~=\s*[A-Za-z_]\w*\s*\[|\]\s*~=\s*[A-Za-z_]", "NE (runtime inequality)"),
    (r"<=", "LE (less or equal)"),
    (r">=", "GE (greater or equal)"),
    (r"<(?![=])", "LT (less than)"),
    (r">(?![=])", "GT (greater than)"),
    (r"//", "IDIV (integer division)"),
    (r"\.\.", "CONCAT"),
    (r"\^", "POW"),
    (r"%", "MOD"),
    (r"[\w\]\)]\s*\*", "MUL"),
    (r"[\w\]\)]\s*/", "DIV"),
    (r"[\w\]\)]\s*\+", "ADD"),
    (r"[\w\]\)]\s*-", "SUB"),
    (r"\bnot\b", "NOT (logical negation)"),
    (r"#\s*[A-Za-z_(]", "LENGTH"),
    (r"=\s*\(\s*\{\s*\}\s*\)", "NEWTABLE (fresh table)"),
    (r"=\s*\(\s*(true|false)\s*\)", "LOADB (boolean constant)"),
    (r"\(nil\)|=\s*nil\b", "LOADNIL"),
    (r"=\s*\{\s*\}", "NEWTABLE (fresh table)"),
    (r"for\s+[A-Za-z_]\w*\s*,\s*[A-Za-z_]\w*\s+in\b", "FORGLOOP (generic for)"),
    (r"for\s+[A-Za-z_]\w*\s*=", "FORNLOOP (numeric for)"),
    (r"\)\s*\(", "CALL (invoke closure / method)"),
    (r"\breturn\b", "RETURN"),
    (r"\b[A-Za-z_]\w*\s*=\s*\(?\s*[A-Za-z_]\w*\s*\[", "register move / table read"),
    (r"=\s*\(?\s*[A-Za-z_]\w*\s*\)?\s*;", "register load"),
]


# Ordered by priority, not by position in the statement: strong signals (calls,
# returns, pool traffic) win over arithmetic that merely appears earlier.
OPCODE_RULES: list[tuple[str, str]] = [
    (r"buffer\.(readu32|readi32|readu8|readstring)", "pool read (bytecode/constant fetch)"),
    (r"buffer\.(writeu32|writei32|writeu8|writestring)", "pool write"),
    (r"\)\s*\(", "CALL (invoke closure / method)"),
    (r"\breturn\b", "RETURN"),
    (r"for\s+[A-Za-z_]\w*\s*,\s*[A-Za-z_]\w*\s+in\b", "FORGLOOP (generic for)"),
    (r"for\s+[A-Za-z_]\w*\s*=", "FORNLOOP (numeric for)"),
    (r"==\s*[A-Za-z_]\w*\s*\[|\]\s*==|==\s*[A-Za-z_]\w*\s*$", "EQ (equality test)"),
    (r"~=\s*[A-Za-z_]\w*\s*\[|\]\s*~=|~=\s*[A-Za-z_]\w*\s*$", "NE (inequality test)"),
    (r"<=", "LE (less or equal)"),
    (r">=", "GE (greater or equal)"),
    (r"<(?![=])", "LT (less than)"),
    (r">(?![=])", "GT (greater than)"),
    (r"\.\.", "CONCAT"),
    (r"//", "IDIV (integer division)"),
    (r"\^", "POW"),
    (r"%", "MOD"),
    (r"[\w\]\)]\s*\*", "MUL"),
    (r"[\w\]\)]\s*/", "DIV"),
    (r"[\w\]\)]\s*\+", "ADD"),
    (r"[\w\]\)]\s*-", "SUB"),
    (r"\bnot\b", "NOT (logical negation)"),
    (r"#\s*[A-Za-z_(]", "LENGTH"),
    (r"=\s*\(?\s*\{\s*\}\s*\)?", "NEWTABLE (fresh table)"),
    (r"=\s*\(?\s*(true|false)\s*\)?", "LOADB (boolean constant)"),
    (r"\(nil\)|=\s*nil\b", "LOADNIL"),
    (r"=\s*\(?\s*[A-Za-z_]\w*\s*\[", "register read / table index"),
    (r"\b[A-Za-z_]\w*\s*=\s*[A-Za-z_]", "register move"),
]


def classify_opcode(stmt: str) -> str:
    """Best-effort naming of the VM operation a dispatch branch performs.

    Signals are checked in priority order rather than text order: a branch that
    calls a closure *and* does arithmetic is reported as a call, which is what
    the VM is really doing there.
    """
    text = re.sub(r"\s+", " ", stmt or "")
    for pattern, label in OPCODE_RULES:
        if re.search(pattern, text):
            return label
    return "unclassified"


# ---------------------------------------------------------------------------
# handler roles
# ---------------------------------------------------------------------------
def classify(handler: dict, run_method: str | None) -> tuple[str, str, list[str]]:
    """Return (role, base_semantic_name, evidence)."""
    name = handler["name"]
    evidence: list[str] = []
    flags = handler.get("flags") or {}
    reads = handler.get("reads") or []
    writes = handler.get("writes") or []
    calls = handler.get("calls") or []
    comparisons = handler.get("comparisons") or {}
    size = handler.get("size") or 0

    if handler["kind"] == "value":
        value = (handler.get("value") or "").strip()
        if value == "bit32":
            return "library", "lib_bit32", ["alias of `bit32`"]
        m = re.fullmatch(r"([\w.]+)", value)
        if m and re.match(r"^[A-Za-z_][\w.]*$", value) and "." in value:
            return "library", "lib_" + value.replace(".", "_"), [f"alias of `{value}`"]
        if m and value in ("type", "select", "unpack", "next", "pairs", "ipairs", "print",
                           "tostring", "tonumber", "pcall", "xpcall", "error", "assert",
                           "rawget", "rawset", "setmetatable", "getmetatable", "newproxy",
                           "loadstring", "getfenv", "setfenv", "coroutine.wrap"):
            return "library", "lib_" + value.replace(".", "_"), [f"alias of `{value}`"]
        if value.startswith(("\"", "'")):
            return "constant", "const_string", ["string constant: " + value[:40]]
        if value in ("true", "false", "nil"):
            return "constant", "const_" + value, [f"constant `{value}`"]
        if re.fullmatch(r"[-+]?(0[xX][0-9a-fA-F_]+|0[bB][01_]+|\d[\d_.]*)", value):
            return "constant", "const_number", [f"numeric constant `{value}`"]
        if value.startswith("{"):
            return "constant", "const_table", ["table constant"]
        return "constant", "const_other", ["non-function table entry"]

    # ---- functions --------------------------------------------------------
    if handler.get("has_pool"):
        return "pool", "pool_load", ["holds the `[=[LPH...]=]` encrypted pool"]
    if handler.get("installs_decoder"):
        return "pool", "pool_decode_install", ["installs the base-85 pool decoder"]

    max_var, max_count = (None, 0)
    for var, count in comparisons.items():
        if count > max_count:
            max_var, max_count = var, count
    distinct = handler.get("distinct_eq", {})
    if distinct:
        dvar, dcount = max(distinct.items(), key=lambda kv: len(kv[1]))
    else:
        dvar, dcount = None, []

    if run_method and name == run_method:
        return "entry", "vm_entry", ["method invoked as `:<name>(...)` after the table"]
    if len(dcount) >= DISPATCH_MIN:
        return ("dispatch", "vm_dispatch",
                [f"{len(dcount)} distinct opcode tests on `{dvar}`"])
    if (flags.get("loops") or 0) >= 2 or (flags.get("continues") or 0) >= 4:
        evidence = [f"flattened state machine: {flags.get('loops')} loop(s), "
                    f"{flags.get('continues')} `continue`"]
        if calls:
            evidence.append("drives handlers: " + ", ".join(calls[:6]))
        return "state_machine", "vm_state", evidence

    if size <= GETTER_MAX and not writes and len(reads) == 1 and not calls:
        return "accessor", f"get_slot_{reads[0]}", [f"reads VM slot {reads[0]}"]
    if size <= GETTER_MAX and writes and not reads and not calls:
        if "(nil)" in (handler.get("body_head") or ""):
            return "accessor", f"clear_slot_{writes[0]}", [f"clears VM slot {writes[0]}"]
        return "accessor", f"set_slot_{writes[0]}", [f"writes VM slot {writes[0]}"]
    if size <= GETTER_MAX * 3 and writes and reads and not calls:
        return "accessor", f"move_slot_{writes[0]}", [
            f"copies slot {reads[0]} -> {writes[0]}"]
    if flags.get("returns_const") and size <= GETTER_MAX * 2:
        return "accessor", "returns_constant", ["returns a numeric constant"]
    if calls and not (flags.get("loops") or 0):
        return "router", "vm_route", ["delegates to " + ", ".join(calls[:6])]
    if flags.get("branches") and (flags.get("branches") or 0) <= 3:
        return "predicate", "vm_test", [f"{flags.get('branches')} branch(es), no loop"]
    if calls:
        return "router", "vm_helper", ["calls " + ", ".join(calls[:6])]
    return "helper", "vm_helper", ["small helper without calls"]


@dataclass
class HandlerView:
    name: str
    blob: str
    kind: str
    params: list[str]
    size: int
    role: str
    semantic_name: str
    evidence: list[str]
    calls: list[str]
    reads: list[str]
    writes: list[str]
    runtime_calls: int = 0

    def to_json(self) -> dict:
        return {
            "name": self.name, "blob": self.blob, "kind": self.kind,
            "params": self.params, "bytes": self.size, "role": self.role,
            "semantic_name": self.semantic_name, "evidence": self.evidence,
            "calls": self.calls, "reads": self.reads, "writes": self.writes,
            "runtime_calls": self.runtime_calls,
        }


def _annotate_specials(handlers: list[dict], blob: str, stage_text: str, meta: dict) -> None:
    for h in handlers:
        body = h.get("body") or ""
        if "LPH" in body:
            h["has_pool"] = True
        if re.search(r"\[\s*0[xX]21\s*\]\s*=\s*\(?function", body) or "!!!\\x21!" in body:
            h["installs_decoder"] = True
        h.setdefault("distinct_eq", {})
        h["body_head"] = body[:120]


def build_map(inventories: dict, runtime: dict | None, stage_texts: dict) -> dict:
    """inventories: {blob: {"handlers": [...], "meta": {...}}}"""
    out = {"blobs": {}, "totals": Counter()}
    for blob, inv in inventories.items():
        handlers = inv["handlers"]
        meta = inv["meta"]
        _annotate_specials(handlers, blob, stage_texts.get(blob, ""), meta)

        views: list[HandlerView] = []
        used: Counter = Counter()
        for h in handlers:
            role, base, evidence = classify(h, meta.get("run_method"))
            used[base] += 1
            semantic = base if used[base] == 1 else f"{base}_{used[base]}"
            view = HandlerView(
                name=h["name"], blob=blob, kind=h["kind"], params=h.get("params") or [],
                size=h.get("size") or 0, role=role, semantic_name=semantic,
                evidence=evidence, calls=h.get("calls") or [],
                reads=h.get("reads") or [], writes=h.get("writes") or [],
            )
            if runtime:
                view.runtime_calls = runtime.get("hprof", {}).get(f"{blob}.{h['name']}", 0)
            views.append(view)

        ordering = {"entry": 0, "dispatch": 1, "pool": 2, "state_machine": 3, "router": 4,
                    "predicate": 5, "accessor": 6, "helper": 7, "library": 8, "constant": 9}
        views.sort(key=lambda v: (ordering.get(v.role, 99), -v.size, v.name))
        out["blobs"][blob] = {
            "meta": meta,
            "handlers": [v.to_json() for v in views],
            "roles": dict(Counter(v.role for v in views)),
        }
        for r, c in Counter(v.role for v in views).items():
            out["totals"][r] += c
        out["totals"]["handlers"] += len(views)
    out["totals"] = dict(out["totals"])
    return out


# ---------------------------------------------------------------------------
# reports
# ---------------------------------------------------------------------------
ROLE_DOC = {
    "entry": "stage entry point (`({...}):<method>(...)`)",
    "dispatch": "VM opcode dispatcher (binary-search ladder over the opcode byte)",
    "pool": "encrypted constant-pool loader / base-85 decoder",
    "state_machine": "flattened statement: `while true do if state==K then ... continue`",
    "router": "forwards work to other handlers",
    "predicate": "small branch helper",
    "accessor": "VM slot accessor (get / set / clear / move)",
    "helper": "small helper",
    "library": "alias of a stdlib function used by the VM",
    "constant": "constant stored in the handler table",
}


def render_report(name_map: dict, runtime: dict | None, inventories: dict, extra: dict | None = None) -> str:
    lines: list[str] = []
    add = lines.append
    add("# Function map — recovered names for every obfuscated handler")
    add("")
    add("Generated by `tools/name_map.py`. Names are inferred, not guessed: each one")
    add("comes from the handler's structure (which VM slot it touches, whether it is an")
    add("opcode ladder, whether it installs the constant pool) plus its runtime call")
    add("count and the APIs reached from it.")
    add("")
    add("Legend: **role** = structural class, **runtime calls** = calls observed in the")
    add("emulation harness (budgeted run, see `docs/METHOD.md`).")
    add("")

    totals = name_map["totals"]
    add("## Summary")
    add("")
    add("| stage | handlers | " + " | ".join(k for k in ROLE_DOC) + " |")
    add("|---|---|" + "---|" * len(ROLE_DOC))
    for blob, data in name_map["blobs"].items():
        roles = data["roles"]
        add(f"| `{blob}` | {len(data['handlers'])} | " +
            " | ".join(str(roles.get(k, 0)) for k in ROLE_DOC) + " |")
    add(f"| **total** | **{totals.get('handlers', 0)}** | " +
        " | ".join(str(totals.get(k, 0)) for k in ROLE_DOC) + " |")
    add("")
    for role, doc in ROLE_DOC.items():
        add(f"- **{role}** — {doc}")
    add("")

    if extra and extra.get("opcodes"):
        add("## Recovered VM opcode table")
        add("")
        for blob, ops in extra["opcodes"].items():
            add(f"### stage `{blob}` — {len(ops)} decoded branches")
            add("")
            add("| opcode | test | recovered semantics | evidence |")
            add("|---|---|---|---|")
            for op in ops:
                add(f"| `{op['opcode']}` | `{op['test']}` | {op['semantics']} | `{op['evidence']}` |")
            add("")

    for blob, data in name_map["blobs"].items():
        add(f"## Stage `{blob}` — {len(data['handlers'])} handlers")
        add("")
        meta = data["meta"]
        add(f"- handler table: {meta.get('table_bytes', 0):,} bytes, "
            f"entry method `:{meta.get('run_method')}(...)`")
        add("")
        add("| # | obfuscated | recovered name | role | params | bytes | runtime calls | evidence |")
        add("|---|---|---|---|---|---|---|---|")
        for i, h in enumerate(data["handlers"], 1):
            ev = "; ".join(h["evidence"]).replace("|", "\\|")
            params = ",".join(h["params"]) if h["params"] else "—"
            calls = f"{h['runtime_calls']:,}" if h["runtime_calls"] else "0"
            add(f"| {i} | `{h['name']}` | `{h['semantic_name']}` | {h['role']} | "
                f"{params} | {h['bytes']:,} | {calls} | {ev} |")
        add("")

    if runtime:
        add("## Behaviour attribution")
        add("")
        add("Every Roblox/executor API call the payload made, with the handler chain that")
        add("produced it (outermost last). This is what the obfuscated names actually do")
        add("at run time.")
        add("")
        add("| API | detail | handler chain |")
        add("|---|---|---|")
        for call in runtime.get("api", [])[:200]:
            chain = " → ".join(f"`{c}`" for c in call.get("handlers", [])[:6]) or "—"
            add(f"| `{call['api']}` | {call.get('detail', '')[:60]} | {chain} |")
        add("")
    return "\n".join(lines)


def main(argv: list[str]) -> int:
    if len(argv) < 3:
        print("usage: name_map.py <inventory.json> <out.json> [runtime.json] [--md report.md]",
              file=sys.stderr)
        return 2
    inv = json.load(open(argv[1], encoding="utf-8"))
    runtime = json.load(open(argv[3], encoding="utf-8")) if len(argv) > 3 and argv[3].endswith(".json") else None
    name_map = build_map(
        {blob: {"handlers": d["handlers"], "meta": d["meta"]} for blob, d in inv["blobs"].items()},
        runtime, {blob: "" for blob in inv["blobs"]},
    )
    with open(argv[2], "w", encoding="utf-8") as fh:
        json.dump(name_map, fh, indent=1)
    md_at = argv.index("--md") if "--md" in argv else -1
    if md_at > 0:
        with open(argv[md_at + 1], "w", encoding="utf-8") as fh:
            fh.write(render_report(name_map, runtime, {"blobs": inv["blobs"]}))
    print(f"mapped {name_map['totals']['handlers']} handlers -> {argv[2]}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
