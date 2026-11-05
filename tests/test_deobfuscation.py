"""Static reconstruction checks; never execute the Roblox script."""
import runpy
import unittest
from pathlib import Path
import tree_sitter
import tree_sitter_luau

ROOT = Path(__file__).resolve().parents[1]


class ReconstructionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.env = runpy.run_path(str(ROOT / 'tools' / 'deobfuscate.py'))
        cls.output = (ROOT / 'cheesy.deobfuscated.luau').read_bytes()

    def test_known_plaintexts(self):
        decrypt, uu = self.env['decrypt'], self.env['uu']
        self.assertEqual(decrypt(uu(45583), 30173066063300), b'wait')
        self.assertEqual(decrypt(uu(53576), 1226250585206), b'split')
        self.assertEqual(decrypt(uu(54445), 28224165177005), b'insert')
        self.assertEqual(decrypt(uu(54064), 10442457916925), b'Library.lua')

    def test_output_is_valid_luau(self):
        parser = tree_sitter.Parser(tree_sitter.Language(tree_sitter_luau.language()))
        self.assertFalse(parser.parse(self.output).root_node.has_error)

    def test_decryption_and_name_recovery(self):
        self.assertNotIn(b'bu[xu(', self.output)
        self.assertNotIn(b'local Bu=', self.output)
        for name in [b'local function forceTriggerPrompt',
                     b'local function refreshCurrentFloor',
                     b'local function setupCategoryESP',
                     b'local function unloadCheesy']:
            self.assertIn(name, self.output)

    def test_bootstrap_shuffle_bounds(self):
        self.assertEqual(self.env['number']('56055597%824347'), 1)
        self.assertEqual(self.env['number']('1225405933%14248800'), 9133)


if __name__ == '__main__':
    unittest.main()
