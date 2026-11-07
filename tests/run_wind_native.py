#!/usr/bin/env python3
"""Run the UI state tests against Roblox/WindUI test doubles with Luau CLI."""
import re
import subprocess
import sys
import tempfile
from pathlib import Path

root = Path(__file__).resolve().parent.parent
runtime = sys.argv[1] if len(sys.argv) > 1 else "luau"
parts = [root / "tests/wind_mock_prelude.luau", root / "tools/cheesy_ui_state.luau", root / "tests/wind_native_cases.luau"]
with tempfile.TemporaryDirectory() as folder:
    script = Path(folder) / "test.luau"
    contents = [path.read_text() for path in parts]
    standalone = (root / "cheesy.deobfuscated.luau").read_text()
    renderers = {}
    for kind, method in {"Toggle": "Toggle", "Slider": "Slider", "Dropdown": "Dropdown", "Input": "Input",
                         "ColorPicker": "Colorpicker", "KeyPicker": "Keybind", "Button": "Button", "Label": "Paragraph"}.items():
        pattern = r"function\(state, spec\)\s*return state\.Section:" + method + r"\(\{.*?\}\)\s*end"
        match = re.search(pattern, standalone, re.S)
        if not match:
            raise RuntimeError("missing native renderer for " + kind)
        renderers[kind] = match.group(0)
    renderer_source = "local nativeRenderers = {\n" + ",\n".join(
        f"    {kind} = {code}" for kind, code in renderers.items()
    ) + "\n}"
    contents[-1] = contents[-1].replace("-- NATIVE_RENDERERS: populated from the standalone script by the test runner.", renderer_source)
    script.write_text("\n".join(contents))
    subprocess.run([runtime, str(script)], check=True)
