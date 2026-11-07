"""Static integration checks for the standalone native WindUI build."""
from collections import Counter
import json
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parent.parent
SCRIPT = ROOT / "cheesy.deobfuscated.luau"


class WindIntegration(unittest.TestCase):
    def test_embedded_state_matches_source(self):
        script = SCRIPT.read_text()
        actual = script.split("\t-- BEGIN EMBEDDED CHEESY UI STATE\n", 1)[1].split(
            "\t-- END EMBEDDED CHEESY UI STATE", 1
        )[0]
        state = (ROOT / "tools/cheesy_ui_state.luau").read_text().rstrip()
        expected = "\n".join("\t" + line if line else "" for line in state.splitlines()) + "\n"
        self.assertEqual(actual, expected)

    def test_control_inventory_and_native_renderers(self):
        script = SCRIPT.read_text().split("\t-- END EMBEDDED CHEESY UI STATE", 1)[1]
        inventory = json.loads((ROOT / "tests/ui_control_inventory.json").read_text())
        mounts = re.findall(r'UiLibrary:Mount\([^,\n]+,\s*"(\w+)"\s*,\s*([^,\n]+)', script)
        counts = Counter(kind for kind, _ in mounts)
        self.assertEqual(counts, inventory["counts"])
        for kind, ids in inventory["literal_ids"].items():
            found = sorted(id_.strip()[1:-1] for k, id_ in mounts
                           if k == kind and re.fullmatch(r'"[^"]+"', id_.strip()))
            self.assertEqual(found, ids, kind)
        methods = {"Toggle": "Toggle", "Slider": "Slider", "Dropdown": "Dropdown", "Input": "Input",
                   "ColorPicker": "Colorpicker", "KeyPicker": "Keybind", "Button": "Button", "Label": "Paragraph"}
        for kind, method in methods.items():
            self.assertEqual(script.count("return state.Section:" + method + "("), counts[kind], kind)
        self.assertNotRegex(script, r':Add(?:LeftGroupbox|RightGroupbox|LeftTabbox|RightTabbox|Toggle|Slider|Dropdown|Input|Button|Label|KeyPicker|ColorPicker|Divider|Tab)\(')

    def test_native_navigation_and_addons(self):
        body = SCRIPT.read_text().split("\t-- END EMBEDDED CHEESY UI STATE", 1)[1]
        self.assertIn('WindWindow:Tab({', body)
        self.assertIn('prompt:Section({ Title =', body)
        self.assertIn('section:Input({ Title = "Key"', body)
        self.assertIn('section:Dropdown({ Title = "Language"', body)
        self.assertIn('WindTabs.Home:Section(', body)
        self.assertIn('Groupboxes.HomeFunctions:Paragraph(', body)
        self.assertIn('function context:Tab(title, icon)', body)
        self.assertIn('function context:Section(title, tab)', body)
        self.assertIn('f(k, WindUI)', body)
        self.assertNotIn('createWindAdapter', body)

    def test_script_uses_wind_not_legacy_ui_loaders(self):
        script = SCRIPT.read_text()
        self.assertIn("Footagesus/WindUI/d2c9bac5f96f997418d680d19cb759892542e492/dist/main.lua", script)
        self.assertNotIn("deividcomsono/Obsidian", script)
        self.assertNotIn("doram44/linorialib", script)
        self.assertNotIn("https://raw.githubusercontent.com/doram44/cheesy/refs/heads/main/cheesy.lua", script)


if __name__ == "__main__":
    unittest.main()
