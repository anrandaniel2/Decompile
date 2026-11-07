# Cheesy Luau reconstruction

**Start with [`cheesy.deobfuscated.luau`](cheesy.deobfuscated.luau).** This is a static, formatted reconstruction of the attached Roblox/DOORS utility script. It removes the obfuscator's string-table decoder while preserving the anti-tamper guard and the cipher initialization's random draws, decodes **11,771 encrypted string references**, folds constant expressions and gives descriptive names to top-level functions and key service/state variables. The original attachment is preserved as [`cheesy.obfuscated.luau.txt`](cheesy.obfuscated.luau.txt).

**One readable script file:** the earlier separate movement variant has been merged into `cheesy.deobfuscated.luau` and removed. The generator now includes the narrowly scoped fixes for nil root physics, Noclip/Phase collision restoration, the Twerk animation toggle, and a godmode Crouch guard that stayed enabled permanently. Godmode's duplicate per-frame Crouch remote call is removed; the rate-limited call remains. Its Root joint is now counter-offset in the same update as the root-part shift, so the local avatar should not visibly sink; if the joint is missing, activation is skipped with a warning. On Fools/OldHotel, where this sink method returns without activating, enabling it reports that the method is unavailable. These repairs **intentionally depart from the obfuscated script**. They are not proof that godmode defeats a live game's anti-cheat or that every toggle works. See [`RECOVERY_SCOPE.md`](RECOVERY_SCOPE.md).

**Correction to the earlier version:** The previous unpacker handled the key-stream generator's retry condition incorrectly. It must skip state **1**, not 0. That one error produced 100 broken strings, including `string.split` and portions of the injected UI code. Those references now decode cleanly; [`deobfuscation_notes.md`](deobfuscation_notes.md) explains the correction.

The unpacker is [`tools/deobfuscate.py`](tools/deobfuscate.py), with lexical-scope renaming in [`tools/rename_scoped.py`](tools/rename_scoped.py) and inferred names in [`tools/function_names.py`](tools/function_names.py). All 176 local function declarations now have descriptive names, including 62 nested functions renamed in this pass. Original source-level identifier names are not available; names were chosen based on behavior. Some callback variables and parameters remain short. [`RECOVERY_SCOPE.md`](RECOVERY_SCOPE.md) distinguishes what is statically recovered from what the attachment cannot reveal.

**Limits:** This is **not runtime-verified in Roblox**. It still downloads and executes external libraries, uses executor-specific APIs, installs hooks and can contact a local RPC endpoint. Only the attachment's *isolated decoder, anti-tamper/bootstrap initialization and three pure functions*, plus *isolated movement and godmode helpers under mocks*, are run offline during validation; neither complete game script nor any downloaded code is run. This establishes exact string decoding and selected behavioral equivalence, **not** correctness for every Roblox feature or executor.

## Reproduce and verify

```sh
python3 -m pip install tree-sitter==0.25.2 tree-sitter-luau==1.2.0
python3 tools/deobfuscate.py
python3 -m unittest discover -s tests -v
# Tests regenerate the file; format it again with StyLua 2.6.0 before using it:
stylua --syntax Luau cheesy.deobfuscated.luau
# If you have upstream Luau CLI + compiler binaries in the same directory:
python3 tools/validate_hybrid.py --luau /path/to/luau
python3 tools/validate_movement.py --luau /path/to/luau
python3 tools/validate_godmode.py --luau /path/to/luau
```

The generated source is checked with the Luau tree-sitter grammar. CI builds the upstream Luau VM and compiler: the sandboxed validator compares all 11,771 original-decoder results (and their quoted literals), all 1,605 numeric folds, the isolated anti-tamper guard and every RNG call at three seeds (including the 256-draw shuffle), three isolated pure helpers on 13 inputs, and the generated-versus-formatted compiler instruction listings. CI tests extracted repairs with mock parts/signals and compiles the full file with `--null` without executing it. The checked-in deliverable was additionally formatted with StyLua 2.6.0. No Roblox APIs or downloaded game/UI scripts are invoked by these checks.
