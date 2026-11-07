"""Static reconstruction checks; never execute the Roblox script."""
import runpy
import unittest
from pathlib import Path
import tree_sitter
import tree_sitter_luau
from tools.rename_scoped import rename_top_level_bindings
from tools.function_names import NESTED_FUNCTION_NAMES

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
        # These keys encounter the special PRNG state 1. Skipping state 0
        # (as in the first reconstruction) corrupts these strings.
        self.assertEqual(decrypt(uu(48752), 301730660633), b'split')
        self.assertEqual(decrypt(uu(43355), 11241346214117), b'LatestRoom')
        self.assertEqual(decrypt(uu(45677), 12541687246240), b'HumanoidRootPart')
        tooltip = decrypt(uu(50561), 901970658120)
        self.assertIn(b'function Library:AddTooltip(InfoStr: string', tooltip)
        self.assertIn(b'local TooltipTable = {', tooltip)
        self.assertEqual(self.env['unresolved'], [])
        self.assertEqual(self.env['failures'], [])

    def test_output_is_valid_luau(self):
        parser = tree_sitter.Parser(tree_sitter.Language(tree_sitter_luau.language()))
        self.assertFalse(parser.parse(self.output).root_node.has_error)

    def test_decryption_and_name_recovery(self):
        self.assertNotIn(b'bu[xu(', self.output)
        self.assertNotIn(b'local Bu=', self.output)
        for name in [b'local function forceTriggerPrompt',
                     b'local function refreshCurrentFloor',
                     b'local function setupCategoryESP',
                     b'local function unloadCheesy',
                     b'local function loadObsidianUiLibrary',
                     b'local function adaptLinoriaSource',
                     b'local function startFigureGodmodeWatcher',
                     b'local function loadUserAddons',
                     b'local ReplicatedStorage',
                     b'local UiLibrary']:
            self.assertIn(name, self.output)
        self.assertNotIn(b'\\135\\153\\157<S', self.output)

    def test_all_short_local_functions_have_inferred_names(self):
        parser = tree_sitter.Parser(tree_sitter.Language(tree_sitter_luau.language()))
        tree = parser.parse(self.output)
        short = []
        def visit(node):
            if node.type == 'function_declaration' and node.children[0].type == 'local':
                name = node.child_by_field_name('name').text.decode()
                if len(name) <= 3:
                    short.append(name)
            for child in node.named_children:
                visit(child)
        visit(tree.root_node)
        self.assertEqual(short, [])
        self.assertEqual(len(NESTED_FUNCTION_NAMES), 62)

    def test_bootstrap_shuffle_bounds(self):
        self.assertEqual(self.env['number']('56055597%824347'), 1)
        self.assertEqual(self.env['number']('1225405933%14248800'), 9133)

    def test_scoped_renaming_preserves_shadowed_locals(self):
        parser = tree_sitter.Parser(tree_sitter.Language(tree_sitter_luau.language()))
        source = (b'local function w() return 1 end\n'
                  b'local T = w()\n'
                  b'local f = function(w) return w end\n'
                  b'for w=1,2 do print(w) end\n'
                  b'local g = function() return w() + T end\n')
        result, count = rename_top_level_bindings(source, parser,
                                                   {'w': 'loadUi'}, {'T': 'UiLibrary'})
        self.assertEqual(count, 5)
        self.assertIn(b'local function loadUi()', result)
        self.assertIn(b'local UiLibrary = loadUi()', result)
        self.assertIn(b'function(w) return w end', result)
        self.assertIn(b'for w=1,2 do print(w) end', result)
        self.assertIn(b'return loadUi() + UiLibrary', result)

    def test_nested_function_names_preserve_shadowed_variables(self):
        parser = tree_sitter.Parser(tree_sitter.Language(tree_sitter_luau.language()))
        source = (b'local function w()\n'
                  b'  local function k(x) local k=x; return k end\n'
                  b'  return k(1)\n'
                  b'end\n')
        result, count = rename_top_level_bindings(
            source, parser, {'w': 'outer'}, {}, [('k', 'inner')])
        self.assertEqual(count, 3)
        self.assertIn(b'local function inner(x) local k=x; return k end', result)
        self.assertIn(b'return inner(1)', result)


if __name__ == '__main__':
    unittest.main()
