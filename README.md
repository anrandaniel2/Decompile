# Cheesy Luau reconstruction

**Start with [`cheesy.deobfuscated.luau`](cheesy.deobfuscated.luau).** This is a static, formatted reconstruction of the attached Roblox/DOORS utility script. It removes the obfuscator's string-table decoder and anti-tamper wrapper, decodes **11,771 encrypted string references**, folds constant expressions and gives descriptive names to top-level functions and key service/state variables. The original attachment is preserved as [`cheesy.obfuscated.luau.txt`](cheesy.obfuscated.luau.txt).

**Correction to the earlier version:** The previous unpacker handled the key-stream generator's retry condition incorrectly. It must skip state **1**, not 0. That one error produced 100 broken strings, including `string.split` and portions of the injected UI code. Those references now decode cleanly; [`deobfuscation_notes.md`](deobfuscation_notes.md) explains the correction.

The unpacker is [`tools/deobfuscate.py`](tools/deobfuscate.py), with lexical-scope renaming in [`tools/rename_scoped.py`](tools/rename_scoped.py) and inferred names in [`tools/function_names.py`](tools/function_names.py). All 176 local function declarations now have descriptive names, including 62 nested functions renamed in this pass. Original source-level identifier names are not available; names were chosen based on behavior. Some callback variables and parameters remain short. [`RECOVERY_SCOPE.md`](RECOVERY_SCOPE.md) distinguishes what is statically recovered from what the attachment cannot reveal.

**Limits:** This is **not runtime-verified in Roblox**. It still downloads and executes external libraries, uses executor-specific APIs, installs hooks and can contact a local RPC endpoint. The attachment and reconstructed Luau were *not executed*. A syntax check and known-plaintext checks establish static decoding consistency, not correct behavior in a game or with a particular executor.

## Reproduce and verify

```sh
python3 -m pip install tree-sitter==0.25.2 tree-sitter-luau==1.2.0
python3 tools/deobfuscate.py
python3 -m unittest discover -s tests -v
```

The generated source is checked with the Luau tree-sitter grammar. CI also builds the upstream Luau compiler and compiles the output with `--null` (without executing it). The checked-in deliverable was additionally formatted with StyLua 2.6.0 (optional). No Roblox APIs or downloaded game/UI scripts are invoked by these checks.
