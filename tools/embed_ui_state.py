#!/usr/bin/env python3
"""Embed the shared UI state/config code in the standalone script."""
from pathlib import Path

root = Path(__file__).resolve().parent.parent
script = root / "cheesy.deobfuscated.luau"
source = script.read_text()
start_marker = "\t-- BEGIN EMBEDDED CHEESY UI STATE\n"
end_marker = "\t-- END EMBEDDED CHEESY UI STATE"
start = source.index(start_marker) + len(start_marker)
end = source.index(end_marker, start)
state = (root / "tools/cheesy_ui_state.luau").read_text().rstrip()
embedded = "\n".join("\t" + line if line else "" for line in state.splitlines()) + "\n"
script.write_text(source[:start] + embedded + source[end:])
