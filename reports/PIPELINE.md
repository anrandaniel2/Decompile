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
- constant slots recovered: 119
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
| `out/runtime/A/runtime.json` | 193,136 | `da63ab08020760f35d3baab1e2f89d69` |
| `out/runtime/B/runtime.json` | 908,008 | `1f4b74c0101ee25cb44982c366ede31f` |
| `out/runtime/Btrace/runtime.json` | 1,271,380 | `4ca20b1bc8beb954bb5faccdc72113ba` |
| `out/payload/program.disasm.txt` | 200,679 | `c73bc5b7185dc2b515141449612739e6` |
| `out/payload/program.json` | 635,471 | `c3f80e4b59bf9ea8c8dc1acf4506cf03` |
| `reports/PROGRAM.md` | 8,464 | `38b73872dafb3dc01c56083e15e381ee` |
| `out/identification.json` | 2,344 | `f62d6f12eb948cee519ed8dd19bc0c8c` |
| `out/function_map.json` | 149,480 | `e92becf468ca0b58cbf07c3e64d33bce` |
| `out/opcodes.json` | 23,085 | `3e4e944c1ac54ba40006f0bc671be4ce` |
| `out/deobfuscated/stageA.annotated.luau` | 164,653 | `71b622a25fc4b3de23ea287778e809b3` |
| `out/deobfuscated/stageB.annotated.luau` | 633,020 | `8f5a3e0b9354366550db06a576ad243e` |
| `reports/IDENTIFICATION.md` | 2,023 | `a5f79616775c0ab4addf9776e2b862e7` |
| `reports/FUNCTION_MAP.md` | 45,123 | `33a88af701478698ee0fc2f748dffc0f` |
| `reports/STRINGS.md` | 5,884 | `bc63be20f0c67cadecfd8c187d226c7b` |
| `reports/BEHAVIOR.md` | 4,786 | `a9f6b6449a25d22f69b2da490f842481` |
