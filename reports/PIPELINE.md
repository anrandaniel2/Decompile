# Pipeline run

- input: `input/Key.luau.txt` (796,511 bytes, sha256 `ea6275aceba86689c5f3a4643c4e3f93`)
- luau: `.tools/luau`
- budget per stage: 20s

## Stages

| stage | kind | lines | bytes | pools | notes |
|---|---|---|---|---|---|
| `plaintext1` | plaintext | 1–2 | 18 | 0 |  |
| `A` | obfuscated | 3–3 | 161,747 | 1 | bit32-backed VM, flattened dispatch loops (`while true do ... continue`), mangled numeric literals (`0b10110_1`, `0Xf__`), buffer-backed constant pool, dynamic chunk loading (loadstring/setfenv) |
| `plaintext2` | plaintext | 4–146 | 5,208 | 0 |  |
| `B` | obfuscated | 147–147 | 629,535 | 1 | bit32-backed VM, flattened dispatch loops (`while true do ... continue`), mangled numeric literals (`0b10110_1`, `0Xf__`), dynamic chunk loading (loadstring/setfenv) |

## Plaintext glue

### `_G.PandaKrypticCfg`

| key | value |
|---|---|
| `SlugID` | `62dcfcad9c9438a6` |
| `ServiceId` | `devoidhub` |
| `GetKeyUrl` | `https://ads.pandauth.com/getkey/devoidhub` |
| `KeyCheckUrl` | `https://api.pandauth.com/api/v1/public/getkey/devoidhub/status` |
| `ConfigUrl` | `https://api.pandauth.com/api/v1/cloud-configs/runtime/devoidhub` |
| `ActiveUrl` | `https://vss.pandauth.com/kv/62dcfcad9c9438a6/active` |
| `OwnerTier` | `BASIC` |
| `Init` | `false` |
| `Silent` | `false` |
| `Heartbeat` | `true` |
| `PuslHeartbeat` | `false` |
| `Perf` | `false` |
| `WaitGame` | `true` |
| `HookCheck` | `block` |
| `HookClip` | `false` |
| `EnvGuard` | `block` |
| `KwMsg` | `[Panda-Kryptic] No active key found for this device. Generate a key to continue.` |
| `KwInterval` | `600` |

- `_G.SlugID = 62dcfcad9c9438a6`

Referenced endpoints:

- `https://ads.pandauth.com/getkey/devoidhub`
- `https://api.pandauth.com/api/v1/cloud-configs/runtime/devoidhub`
- `https://api.pandauth.com/api/v1/public/getkey/devoidhub/status`
- `https://vss.pandauth.com/kv/62dcfcad9c9438a6/active`

## Verification of the annotated output

| stage | token stream identical | tokens | parses (luau-ast) |
|---|---|---|---|
| `A` | yes | 34,967 | yes |
| `B` | yes | 41,108 | yes |

The token stream check re-lexes both files and compares every token (numbers compared by value), so the annotations provably change presentation only.

## Recovered program (VM disassembly)

- capture budget: 10 (dispatch hook, stage `B`)
- dispatches observed: 164,406,420
- instructions: **2,342** (2,337 decoded) across **20** protos, 107 distinct opcodes
- listing: `out/payload/program.disasm.txt`

| semantics | count |
|---|---|
| JUMP | 650 |
| register move / read | 257 |
| register read / table index | 235 |
| LOADK / LOADN | 221 |
| SETTABLE | 194 |
| MOVE | 167 |
| NEWCLOSURE | 134 |
| NOT | 100 |
| ADD | 92 |
| conditional jump | 70 |
| GETTABLE | 33 |
| compare (le) | 30 |

## Artefacts

| file | bytes | sha256 |
|---|---|---|
| `out/stages/stageA.luau` | 161,748 | `50f1063473584028b91cea551b8bd846` |
| `out/stages/stageB.luau` | 629,536 | `6c03953738dd84a6d3649e80411b87fe` |
| `out/pools/pool0.bin` | 69,880 | `f711915edb50ad9662ad9c19eb248a73` |
| `out/pools/pool1.bin` | 430,656 | `50e3350f2b106e0475637ae819d26173` |
| `out/pools/pools.json` | 847 | `67c46e0cc32c608d7a89e0d2c97def13` |
| `out/inventory.json` | 416,708 | `890ea09905cd42b10428b8b3a1dd2e56` |
| `out/runtime/A/runtime.json` | 193,124 | `bae44d32c836f4755038cadaac17e25a` |
| `out/runtime/B/runtime.json` | 908,008 | `b784d1a2092cca983bd5b084908fc8e1` |
| `out/runtime/Btrace/runtime.json` | 1,269,059 | `e34002ecd75e2f7853137e5fda00f475` |
| `out/payload/program.disasm.txt` | 198,642 | `625410b2f1d2f710517e78b7b623bae5` |
| `out/payload/program.json` | 627,736 | `baf1066f6436816bb4ecdf5ed358c17f` |
| `reports/PROGRAM.md` | 7,072 | `af007bb552cfea1c6429ac9d6830f92f` |
| `out/identification.json` | 2,344 | `f62d6f12eb948cee519ed8dd19bc0c8c` |
| `out/function_map.json` | 149,480 | `24f54c969f37603f0b3f7739cfe1ff2b` |
| `out/opcodes.json` | 23,085 | `3e4e944c1ac54ba40006f0bc671be4ce` |
| `out/deobfuscated/stageA.annotated.luau` | 164,653 | `71b622a25fc4b3de23ea287778e809b3` |
| `out/deobfuscated/stageB.annotated.luau` | 633,020 | `8f5a3e0b9354366550db06a576ad243e` |
| `reports/IDENTIFICATION.md` | 2,023 | `a5f79616775c0ab4addf9776e2b862e7` |
| `reports/FUNCTION_MAP.md` | 45,123 | `bec8fdd41675ed7390b0cd00dd873928` |
| `reports/STRINGS.md` | 5,884 | `bc63be20f0c67cadecfd8c187d226c7b` |
| `reports/BEHAVIOR.md` | 4,786 | `744c846319754e113aba6d03bf99fdc8` |
