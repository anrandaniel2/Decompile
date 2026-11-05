# Cheesy Luau reconstruction

**Start with [`cheesy.deobfuscated.luau`](cheesy.deobfuscated.luau).** This is a static, formatted reconstruction of the attached Roblox/DOORS utility script. It retains the game's feature logic, removes the obfuscator's table decoder and anti-tamper wrapper, replaces 11,771 encrypted string references, folds constant expressions, and restores descriptive names for 100+ top-level functions. Short shadowed function names have inferred-name comments at their definitions.

The original attachment is preserved as [`cheesy.obfuscated.luau.txt`](cheesy.obfuscated.luau.txt). The unpacker is [`tools/deobfuscate.py`](tools/deobfuscate.py), with the inferred naming map in [`tools/function_names.py`](tools/function_names.py).

**Important limitations:** This is **not a runnable, verified replacement**. One hundred decoded references contain non-UTF-8 bytes (including some plainly damaged property names and UI source strings). They are preserved as byte escapes rather than guessed. See [`deobfuscation_notes.md`](deobfuscation_notes.md) for their indices, keys and previews. The code can fetch and execute remote Lua, install executor hooks, and contact a local RPC service. Neither the attachment nor the reconstructed Luau was executed here. Names describe inferred behavior, not recovered original identifiers.

## Reproduce and verify

```sh
python3 -m pip install tree-sitter==0.25.2 tree-sitter-luau==1.2.0
python3 tools/deobfuscate.py
python3 -m unittest discover -s tests -v
```

The generated source is syntactically checked with the Luau tree-sitter grammar. The checked-in deliverable was additionally formatted with StyLua 2.6.0 (formatting is optional and does not affect the tests). GitHub Actions runs the static reconstruction tests on pushes and pull requests. No Roblox APIs, external scripts or downloaded UI libraries are invoked by these checks.
