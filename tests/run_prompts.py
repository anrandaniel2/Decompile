#!/usr/bin/env python3
"""Exercise the actual first-run prompts with WindUI/Roblox test doubles."""
import subprocess
import sys
import tempfile
from pathlib import Path

root = Path(__file__).resolve().parent.parent
runtime = sys.argv[1] if len(sys.argv) > 1 else "luau"
standalone = (root / "cheesy.deobfuscated.luau").read_text()
start = standalone.index("\tif not loadUserData() then")
end = standalone.index("\n\tCheesyLanguageVersion =", start)
key_prompt = standalone[start:end]
end = standalone.index("\n\t\tCheesyWriteUserData()", standalone.index('Title = "Choose your language"'))
start = standalone.rindex("\n\t\tif k then", 0, end)
language_prompt = standalone[start:end]
parts = [root / "tests/wind_mock_prelude.luau", root / "tools/cheesy_ui_state.luau", root / "tests/wind_prompt_cases.luau"]
contents = [path.read_text() for path in parts]
contents[-1] = contents[-1].replace("-- KEY_PROMPT: populated from the standalone script by the test runner.", key_prompt)
contents[-1] = contents[-1].replace("-- LANGUAGE_PROMPT: populated from the standalone script by the test runner.", language_prompt)
with tempfile.TemporaryDirectory() as folder:
    script = Path(folder) / "prompts.luau"
    script.write_text("\n".join(contents))
    subprocess.run([runtime, str(script)], check=True)
