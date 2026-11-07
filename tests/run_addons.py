#!/usr/bin/env python3
"""Exercise the actual standalone addon loader with mocked WindUI/Roblox services."""
import subprocess
import sys
import tempfile
from pathlib import Path

root = Path(__file__).resolve().parent.parent
runtime = sys.argv[1] if len(sys.argv) > 1 else "luau"
standalone = (root / "cheesy.deobfuscated.luau").read_text()
start = standalone.index("\tdo\n\t\tlocal o\n\t\tLoadedAddonGroupboxes = {}")
end = standalone.index("\n\tlocal ju = UiLibrary:RegisterTab", start)
loader = standalone[start:end]
parts = [root / "tests/wind_mock_prelude.luau", root / "tools/cheesy_ui_state.luau", root / "tests/wind_addon_cases.luau"]
contents = [path.read_text() for path in parts]
contents[-1] = contents[-1].replace("-- ADDON_LOADER: populated from the standalone script by the test runner.", loader)
with tempfile.TemporaryDirectory() as folder:
    script = Path(folder) / "addons.luau"
    script.write_text("\n".join(contents))
    subprocess.run([runtime, str(script)], check=True)
