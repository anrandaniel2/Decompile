#!/usr/bin/env python3
"""Split a protected Luau file into its "stages".

Luraph output is not one monolithic blob: a protected file is usually

    do (function(...)  <VM stage A>  end)() end     -- obfuscated
    -- plaintext glue / config (key system, loader settings, ...)
    return({ ... })                                  -- VM stage B (obfuscated)

This module separates those regions so later passes can treat them
independently.  Detection is deliberately heuristic but conservative: a line is
considered part of an obfuscated payload when it is very long and/or carries an
`LPH` encrypted pool, which is what every Luraph build looks like.
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field

LONG_LINE = 4000
LPH_RE = re.compile(r"\[=*\[LPH")


@dataclass
class Stage:
    kind: str                     # "obfuscated" | "plaintext"
    index: int
    start_line: int               # 1-based, inclusive
    end_line: int                 # 1-based, inclusive
    text: str
    notes: list[str] = field(default_factory=list)

    @property
    def line_count(self) -> int:
        return self.end_line - self.start_line + 1

    def summary(self) -> dict:
        return {
            "kind": self.kind,
            "index": self.index,
            "start_line": self.start_line,
            "end_line": self.end_line,
            "bytes": len(self.text),
            "lines": self.line_count,
            "lph_pools": len(LPH_RE.findall(self.text)),
            "notes": self.notes,
        }


def _classify(line: str) -> str:
    if len(line) > LONG_LINE:
        return "obfuscated"
    if LPH_RE.search(line):
        return "obfuscated"
    return "plaintext"


def split_stages(text: str) -> list[Stage]:
    lines = text.split("\n")
    stages: list[Stage] = []
    current_kind = None
    current: list[str] = []
    start = 0

    def flush(end_line: int) -> None:
        nonlocal current, current_kind
        if current_kind is None:
            return
        body = "\n".join(current)
        if body.strip():
            stage = Stage(current_kind, len(stages), start + 1, end_line, body)
            _annotate(stage)
            stages.append(stage)
        current = []

    for idx, line in enumerate(lines):
        kind = _classify(line)
        if kind != current_kind:
            flush(idx)
            current_kind = kind
            start = idx
        current.append(line)
    flush(len(lines))

    return stages


def _annotate(stage: Stage) -> None:
    """Collect a few cheap facts that are useful in the reports."""
    if stage.kind != "obfuscated":
        return
    if "bit32" in stage.text:
        stage.notes.append("bit32-backed VM")
    if re.search(r"while true do", stage.text):
        stage.notes.append("flattened dispatch loops (`while true do ... continue`)")
    if re.search(r"0[bB][01_]+", stage.text) or re.search(r"0[xX][0-9a-fA-F_]*_", stage.text):
        stage.notes.append("mangled numeric literals (`0b10110_1`, `0Xf__`)")
    if re.search(r"buffer\.(readu32|writeu32)|\[0x21\]\(", stage.text):
        stage.notes.append("buffer-backed constant pool")
    if re.search(r"loadstring|setfenv", stage.text):
        stage.notes.append("dynamic chunk loading (loadstring/setfenv)")


def plaintext_settings(text: str) -> dict:
    """Pull `Key = value` pairs out of the plaintext glue, e.g. loader config."""
    out: dict[str, object] = {}
    for block in re.finditer(r"_G\.(\w+)\s*=\s*\{([^}]*)\}", text):
        name, body = block.group(1), block.group(2)
        cfg: dict[str, object] = {}
        for m in re.finditer(r"(\w+)\s*=\s*([^,\n]+)", body):
            key, raw = m.group(1), m.group(2).strip()
            if raw.startswith(("\"", "'")):
                cfg[key] = raw.strip("\"'")
            elif raw in ("true", "false"):
                cfg[key] = raw == "true"
            else:
                try:
                    cfg[key] = int(raw)
                except ValueError:
                    cfg[key] = raw
        out[name] = cfg
    for m in re.finditer(r"_G\.(\w+)\s*=\s*\"([^\"]*)\"", text):
        out[m.group(1)] = m.group(2)
    return out


def plaintext_urls(text: str) -> list[str]:
    return sorted(set(re.findall(r"https?://[^\s\"'\)<>,]+", text)))
