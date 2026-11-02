# Decompile — Luraph-protected Roblox script: identification & automated deobfuscation

This repository identifies, deobfuscates and documents the protected Roblox/Luau script in
[`input/Key.luau.txt`](input/Key.luau.txt) — and, more importantly, ships the **automated
pipeline + CI workflow** that does it, so the analysis is reproducible instead of a one-off.

**Result at a glance**

| | |
|---|---|
| Obfuscator | **Luraph Obfuscator** (Luraph Cloud), **v14.x** family, banner stripped — confidence 0.94 |
| Protected stages | 2 VM stages (`A` loader/pool machinery, `B` payload) |
| Handlers recovered | **358** (173 in `A`, 185 in `B`), every one named and classified |
| Constant pools | 2 (`LPH` base-85 pools, 69,880 B and 430,656 B decoded) |
| String table | decrypted live — 167 unique strings from the executed path |
| Verification | annotated output is token-identical to the input and parses with `luau-ast` |
| Payload | a Roblox key-system / loader ("PandaAuth" key gate + `Kryptic` loader, `devoidhub` service) |
| Recovered program | **7,591** VM instructions across 20 protos (the whole program, not just the executed path), disassembled and lifted to Luau source |

📄 Reports: [identification](reports/IDENTIFICATION.md) ·
[function map](reports/FUNCTION_MAP.md) ·
[strings](reports/STRINGS.md) ·
[behaviour](reports/BEHAVIOR.md) ·
[recovered program](reports/PROGRAM.md) ·
[lifted source](reports/payload.luau) ·
[pipeline run](reports/PIPELINE.md) ·
[cross-check](reports/CROSSCHECK.md) ·
[method](docs/METHOD.md) ·
[findings](docs/FINDINGS.md)

---

## Quick start

```bash
# 1. build the Luau toolchain (luau + luau-ast, no cmake needed, ~5-8 min)
./tools/build_luau.sh                # -> .tools/luau, .tools/luau-ast

# 2. run everything
python3 tools/pipeline.py \
    --input input/Key.luau.txt \
    --out out --reports reports \
    --budget 45 \
    --luau .tools/luau --luau-ast .tools/luau-ast
```

Outputs:

```
reports/IDENTIFICATION.md    obfuscator + version + evidence table
reports/FUNCTION_MAP.md      every handler: obfuscated name -> recovered name/role/evidence
reports/STRINGS.md           decrypted string table per stage
reports/BEHAVIOR.md          API trace, hottest handlers, resolved stdlib slots
reports/PROGRAM.md           the payload's own program: protos, instruction mix, constants, sample listing
reports/program.disasm.txt   the full disassembly (every instruction, per proto)
reports/payload.luau         the same program lifted to Luau source, de-flattened and tidied (20 functions, parses)
reports/PIPELINE.md          stage split, plaintext config, artifact hashes, verification
out/stages/                  the two obfuscated stages, split out of the file
out/pools/                   decoded LPH pools (+ metadata)
out/deobfuscated/            annotated, still-executable copies of each stage
out/runtime/                 raw harness output (strings, API calls, profiles)
out/function_map.json        machine-readable name map
out/opcodes.json             recovered VM opcode table
out/payload/program.disasm.txt  full disassembly of every executed VM instruction
out/payload/program.json     the same listing as machine-readable JSON
out/deobfuscated/payload.luau   lifted Luau source of the whole program
```

## CI

[`.github/workflows/deobfuscate.yml`](.github/workflows/deobfuscate.yml) runs the whole thing on
every push:

1. **build-luau** — builds `luau` + `luau-ast` from a pinned upstream tag (cached).
2. **deobfuscate** — identify → split → decode pools → inventory → run under the emulation
   harness → name handlers → annotate → **verify**. Fails the build if the annotated stages stop
   round-tripping (token-identical + `luau-ast` clean).
3. **crosscheck** — advisory: runs a public Luraph devirtualiser
   ([`caomod2077/Deobfuscator-Luraph-V15`](https://github.com/caomod2077/Deobfuscator-Luraph-V15),
   pinned) and records its verdict/output in `reports/CROSSCHECK.md`.

Artifacts (`reports/` + `out/`) are uploaded for every run.

## How the deobfuscation works (short version)

* **Static**: split the file into stages, base-85-decode the `LPH` pools, parse each stage's
  handler table (`return({ name = function(...) ... }):run(...)`), canonicalise the mangled
  numeric literals (`0Xf__` → `15`), classify every handler by structure, and recover the VM's
  opcode ladder from the dispatch function's comparison tree.
* **Dynamic**: the stages are *not* regular Lua — they are a bytecode VM written in Luau, so the
  only way to see what the handlers do is to run them. `tools/harness/` emulates enough of the
  Roblox/executor surface to drive the payload, wraps every handler to profile it, hooks the
  `buffer` object that holds the constant pool to capture decrypted strings, and stops on a time
  budget (the payload never terminates on its own).
* **Naming**: structure + runtime profile + stack attribution produce a stable semantic name per
  handler (`vm_dispatch`, `pool_load`, `get_slot_25530`, `lib_bit32_bxor`, ...).
* **Program recovery**: the interpreter's dispatch site (`local N = X[H]; if N < ...`) is
  instrumented, so every instruction of every proto arrives as `(proto, pc, opcode, operands)` —
  including the ones the run never executed, because the whole code array is dumped at first
  dispatch. The
  opcode ladder is then decoded *by evaluating it* — each opcode value is walked through the
  comparison tree — and the operands are substituted into the matching branch body. The result is
  a per-proto listing that reads like Luau (`R[62][4]=(3)`, `if R[4]~=126 then goto 990`) instead
  of `k[m[H]][Y[H]]=(D[H])`.

Details and caveats: [docs/METHOD.md](docs/METHOD.md). Analysis narrative:
[docs/FINDINGS.md](docs/FINDINGS.md).

## Repository layout

```
input/Key.luau.txt        the sample (unmodified)
tools/
  pipeline.py             orchestrator (all stages, deterministic output)
  stages.py               split obfuscated stages from plaintext glue
  luau_lex.py             dependency-free Luau lexer (long brackets, \z, \u{}, mangled numbers)
  lph.py                  LPH pool extraction + base-85 decode
  inventory.py            handler-table recovery (names, params, slots, call graph)
  name_map.py             role classification + semantic names + report rendering
  opcodes.py              VM opcode-ladder recovery (structural)
  disasm.py               opcode ladder decoded by evaluation + program disassembly
  lift.py                 disassembly -> Luau source (reverse-postorder block layout)
  structurize.py          de-flattener: dominators/post-dominators -> if/while/break/continue
  simplify.py             folds the interpreter's scratch locals back into one statement
  trace_lift.py           dynamic pass: register values from the live run -> annotated source
  normalize.py            annotations + numeric canonicalisation (semantics preserving)
  verify.py               token-equality + parse verification
  identify.py             obfuscator/version verdict with evidence
  run_runtime.py          driver for the emulation harness
  harness/                Roblox/executor emulator + instrumentation (Luau)
  crosscheck.py           runs the public devirtualiser (advisory)
  build_luau.sh           builds luau + luau-ast from source
docs/                     method + findings
reports/                  generated, committed so the result is reviewable without running CI
```

`out/`, `.tools/` and `.build/` are generated and not committed.
