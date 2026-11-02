#!/usr/bin/env python3
"""Decide which obfuscator produced a file, and show the evidence.

Luraph does not leave a plain banner in this build (the `-- This file was
protected using Luraph Obfuscator vX` comment has been stripped), so the verdict
is assembled from independent indicators, including strings that only exist
after the loader decrypts its own constant pool.
"""

from __future__ import annotations

import json
import re
from dataclasses import dataclass, field

STATIC_CHECKS = [
    ("lph_pool", r"\[=*\[LPH", "`[=[LPH...]=]` encrypted constant pool "
                                "(Luraph's pool signature)"),
    ("pool_watermark", r"PUSL_", "`PUSL_` watermark prefix built by the VM"),
    ("handler_table", r"return\(\{[A-Za-z_]\w*=function\([^)]*\)",
     "`return({ <name> = function(...) ... }):<run>(...)` stage shape"),
    ("flattened_dispatch", r"while true do[^\n]{0,400}?continue",
     "statements flattened into `while true do if state==K then ... continue`"),
    ("opaque_numbers", r"0[xX][0-9a-fA-F_]*_|0[bB][01][01_]*_",
     "mangled numeric literals (`0Xf__`, `0b10110_1`) used to break pattern matching"),
    ("buffer_pool", r"\[0x21\]\(|buffer\.(readu32|writeu32)",
     "constant pool materialised into a `buffer` object"),
    ("bit32_vm", r"bit32\.(bxor|rshift|lshift|bnot|rrotate)",
     "bit32-based VM arithmetic"),
    ("env_probe", r"\b(getgenv|getfenv|identifyexecutor|gethwid|isfile|setclipboard)\b",
     "executor-environment probing (key systems / anti-tamper)"),
]

RUNTIME_CHECKS = [
    ("luraph_string", lambda s: "Luraph" in s or "LPH_" in s,
     "runtime-decrypted string naming Luraph"),
    ("luraph_error", lambda s: "Please open a support ticket" in s,
     "runtime-decrypted Luraph platform error string"),
]


@dataclass
class Verdict:
    obfuscator: str
    version_family: str
    confidence: float
    indicators: list[dict] = field(default_factory=list)
    notes: list[str] = field(default_factory=list)

    def to_json(self) -> dict:
        return {
            "obfuscator": self.obfuscator,
            "version_family": self.version_family,
            "confidence": round(self.confidence, 2),
            "indicators": self.indicators,
            "notes": self.notes,
        }


def identify(source: str, runtime_strings: list[str] | None = None) -> Verdict:
    indicators: list[dict] = []
    score = 0
    for name, pattern, description in STATIC_CHECKS:
        hits = len(re.findall(pattern, source))
        if hits:
            weight = 2 if name in ("lph_pool", "handler_table", "flattened_dispatch") else 1
            score += weight
            indicators.append({"check": name, "kind": "static", "hits": hits,
                               "weight": weight, "description": description})
        else:
            indicators.append({"check": name, "kind": "static", "hits": 0, "weight": 0,
                               "description": description})

    strings = runtime_strings or []
    for name, predicate, description in RUNTIME_CHECKS:
        matched = [s for s in strings if predicate(s)]
        if matched:
            score += 3
            indicators.append({"check": name, "kind": "runtime", "hits": len(matched),
                               "weight": 3, "description": description,
                               "sample": matched[0][:160]})

    has_header = bool(re.search(r"This file was protected using Luraph Obfuscator", source))
    max_score = sum(2 if n in ("lph_pool", "handler_table", "flattened_dispatch") else 1
                    for n, _, _ in STATIC_CHECKS) + 3 * len(RUNTIME_CHECKS)
    confidence = min(0.99, score / max_score)

    verdict = Verdict(
        obfuscator="Luraph Obfuscator (Luraph Cloud)" if score >= 4 else "unknown",
        version_family="v14.x (header stripped)" if score >= 4 and not has_header else
                       ("v15" if has_header else "unknown"),
        confidence=confidence,
        indicators=indicators,
    )
    if not has_header:
        verdict.notes.append(
            "No `-- This file was protected using Luraph Obfuscator vX [https://lura.ph/]` "
            "header is present; the file starts directly with the VM stage, which is the "
            "shape of a v14.x build whose banner was removed.")
    verdict.notes.append(
        "Two independent VM stages are present: stage A is the loader/pool machinery and "
        "stage B is the protected payload.")
    return verdict


def render_markdown(verdict: dict, extras: dict | None = None) -> str:
    extras = extras or {}
    lines = []
    add = lines.append
    add("# Identification")
    add("")
    add(f"**Obfuscator:** {verdict['obfuscator']}  ")
    add(f"**Version family:** {verdict['version_family']}  ")
    add(f"**Confidence:** {verdict['confidence']}")
    add("")
    add("## Evidence")
    add("")
    add("| check | kind | hits | weight | what it shows |")
    add("|---|---|---|---|---|")
    for ind in verdict["indicators"]:
        add(f"| `{ind['check']}` | {ind['kind']} | {ind['hits']} | {ind['weight']} | {ind['description']} |")
    add("")
    samples = [i for i in verdict["indicators"] if i.get("sample")]
    if samples:
        add("### Decrypted strings that name the obfuscator")
        add("")
        for ind in samples:
            add(f"- `{ind['sample']}`")
        add("")
    if verdict.get("notes"):
        add("## Notes")
        add("")
        for note in verdict["notes"]:
            add(f"- {note}")
        add("")
    if extras.get("pools"):
        add("## Constant pools")
        add("")
        add("| pool | marker | encoded chars | decoded bytes | entropy | sha256 (decoded) |")
        add("|---|---|---|---|---|---|")
        for pool in extras["pools"]:
            add(f"| {pool['index']} | `{pool['signature']}` | {pool['encoded_chars']:,} | "
                f"{pool['decoded_bytes']:,} | {pool['entropy']} | `{pool['decoded_sha256'][:32]}` |")
        add("")
    if extras.get("detector_crosscheck"):
        add("## Cross-check with an off-the-shelf detector")
        add("")
        add("`Deobfuscator-Luraph-V15` (caomod2077) `--detect` reports:")
        add("")
        add("```")
        for line in extras["detector_crosscheck"].strip().splitlines():
            add(line)
        add("```")
        add("")
    return "\n".join(lines)


def main(argv: list[str]) -> int:
    import pathlib
    import sys
    if len(argv) < 3:
        print("usage: identify.py <script> <out.json> [runtime.json]", file=sys.stderr)
        return 2
    src = pathlib.Path(argv[1]).read_text(encoding="utf-8", errors="surrogateescape")
    strings: list[str] = []
    if len(argv) > 3:
        rt = json.loads(pathlib.Path(argv[3]).read_text(encoding="utf-8"))
        for bucket in rt.get("strings", {}).values():
            strings.extend(bucket)
    verdict = identify(src, strings)
    pathlib.Path(argv[2]).write_text(json.dumps(verdict.to_json(), indent=1), encoding="utf-8")
    print(f"{verdict.obfuscator} / {verdict.version_family} (confidence {verdict.confidence:.2f})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(__import__("sys").argv))
