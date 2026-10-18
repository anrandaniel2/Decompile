# Decompile

Behavioral decompilation of the MoonVeil 2.0.24 loader in `input/DevoidHubLoader.txt`.

The protected file is a flattened state machine plus an encrypted constant pool. `decompiled/DevoidHubLoader.luau` is the program that machine runs: a WindUI loader that opens three support tabs and, on each button, closes the window and `loadstring`s one remote script. Names that were not string constants are reconstructed. It is not a pretty-print of the obfuscated source.

## Check

The oracle is the protected build, executed under Luau 0.743 in `tests/harness.luau`. `tests/check.py` fails unless:

- the decompiled file and the protected build emit the same sandbox trace, including button callbacks
- the decompiled file is readable and does not still contain the MoonVeil wrapper
- those readability checks reject the protected fixture itself
- changing one recovered URL makes the traces diverge

```sh
python3 tests/check.py --luau /path/to/luau
```

GitHub Actions runs that check from `.github/workflows/ci.yml`.
