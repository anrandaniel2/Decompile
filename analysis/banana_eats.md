# Banana Eats script: identification and recovery status

## Result

The input is a **Prometheus-family VM-obfuscated Luau script**. The family attribution is strongly supported by its mixed Base64/Base85-style constant-table encoding, the matching distinct decoding prefixes/branches in Prometheus source, and a successful static lift with the pinned Prometheus-specific devirtualizer. The exact Prometheus version, fork, and configuration remain unknown.

A source-level static lift is checked in at [`../banana_eats.deobfuscated.luau`](../banana_eats.deobfuscated.luau). It recovers the UI construction, game automation, puzzle helpers, path overlay, and environmental toggles. Generic `f1`–`f59` helper identifiers have been replaced with behavior-based names; a complete inventory is in [`banana_eats.functions.md`](banana_eats.functions.md).

**This is not a demonstrated 100%-functional decompile.** The output compiles as Luau and is reproducible through CI, but compilation and reproducibility do not prove runtime equivalence. The upstream lifter's flattened control flow needed cleanup, and the script depends on Roblox/executor APIs plus a mutable remote WindUI download. It has not been run in Roblox or tested against the live game. Do not treat it as verified safe or equivalent.

## Evidence and observed behavior

- Original attachment: 649,869 bytes, one line. SHA-256: `3955a9c5fe2fa7b548dbcbedd28229d4a89befad12d07fe2b76682b090923c83`.
- The wrapper loads `https://github.com/Footagesus/WindUI/releases/latest/download/main.lua` with `game:HttpGet`, then calls `loadstring`. The `latest` URL is mutable. The request was intercepted in an isolated Luau probe; remote contents were not fetched or executed.
- A mocked initialization probe captured eight tabs: `Player`, `Visual`, `Anti`, `Banana`, `Runners`, `OP`, `Misc`, and `Credits`, with 40 controls. It used synthetic Roblox/executor and WindUI objects, not Roblox itself.
- First-stage string-table decoding yielded 2,143 entries in the current reproducible check. A previous separate probe reported 2,192 entries; that discrepancy is still unexplained, so neither count is asserted as the total logical constant count.
- Recovered strings and code indicate character movement/noclip, Banana Eats puzzle and collectible automation, ESP, path visualization, valve/cake/picture/combination puzzle logic, and lighting/effect toggles.

## Recovery pipeline and limits

The pinned tool is `prostone4/Prometheus-Deobfuscator` at commit `6ee3291ec83fdc58c04e17bb1f1703386619711a` (MIT). It lifts the VM into readable Luau. `tools/finish-decompile.mjs` removes the lift's unsupported Lua labels/gotos, repairs the `ComputeAsync` failure return, and renames the 59 numbered helpers. The CI workflow regenerates the file and fails if the checked-in result differs; it then compiles both the original and recovered chunks with Luau Web and checks that no generic `f1`–`f59` names remain.

The label cleanup is a narrow mechanical reconstruction: one jump returns `{}`, `false` on a path-computation failure; four jumps target adjacent end-of-branch labels and are treated as loop-continue fall-through. This was reasoned from the emitted source, but has **not** been behavior-tested in Roblox. Other obfuscator-lift inaccuracies may remain. The lift also retains decompiler temporaries and is not the original author's source.

No remote code is run in CI. The workflow downloads the pinned lifter from GitHub, creates a temporary raw lift, applies the local finishing pass, compares the recovered artifact, and performs syntax/string checks only. It is an automated static-decompilation pipeline, not a behavioral test suite.

## Verification performed

- Original input: Luau Web compilation passed.
- Recovered output (111,268 bytes): Luau Web compilation passed.
- Helper-name check: passed; no `f1`–`f59` identifiers remain.
- Static lift regeneration: output matches the checked-in recovered file.
- Mocked UI initialization: observed eight tabs and 40 controls; callbacks that rely on full Roblox events are not verified.
- Live Roblox execution, gameplay equivalence, and safety: **not tested**.
