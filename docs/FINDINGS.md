# Findings

## 1. What was protected

`input/Key.luau.txt` (796,511 bytes) is a Roblox/Luau script for a key-gated script hub. Only about
5 KB of it is plaintext:

* a **key watcher** (lines 4–100) that builds a device identity from `UserId`, `gethwid()`,
  `getfingerprintid()`, `RbxAnalyticsService:GetClientId()`, `readfile("PandaAuth_HWID.txt")` and the
  executor name, then polls
  `https://api.pandauth.com/api/v1/public/getkey/devoidhub/status` in batches and kicks the player
  when no key is active;
* a configuration block `_G.PandaKrypticCfg` for service `devoidhub`
  (`https://ads.pandauth.com/getkey/devoidhub`, `https://vss.pandauth.com/kv/62dcfcad9c9438a6/active`, …);
* the `Kryptic Loader [ Copyright(C) Panda-Pelican Development LLC ]` banner.

Everything else — 791 KB across two stages — is Luraph-protected. See
[`reports/PIPELINE.md`](../reports/PIPELINE.md) for the extracted configuration.

## 2. Obfuscator

**Luraph Obfuscator (Luraph Cloud), v14.x family, banner stripped.** Confidence 0.94; full evidence
table in [`reports/IDENTIFICATION.md`](../reports/IDENTIFICATION.md). The decisive indicators:

* `[=[LPH…]=]` constant pools (Luraph's pool signature) — two of them;
* the stage shape `return({ name = function(...) … }):run(...)`;
* control-flow flattening `while true do if state == K then … continue end`;
* number-literal mangling (`0Xf__`, `0b1110__0__1`, `0B110101`) used to break pattern matching;
* decrypted-at-runtime strings that name the obfuscator outright:
  * `Your Lua environment does not support load or loadstring, therefore you are unable to use Luraph's 'LPH_NO_UPVALUES' macro.`
  * `The debug library is required on Luau platforms. Please open a support ticket.`

An independent public detector (`caomod2077/Deobfuscator-Luraph-V15 --detect`) agrees:
`luraph_v14 0.80`.

## 3. Structure of the protection

| stage | where | size | table entries | entry method | dispatcher | pool |
|---|---|---|---|---|---|---|
| `A` | line 3 | 161,747 B | 173 | `:p(...)` | `dN`, 64 opcode tests | 69,880 B (87,354 b85 chars) |
| `B` | line 147 | 629,535 B | 185 | `:o(...)` | `OW`, 101 opcode tests | 430,656 B (538,324 b85 chars) |

Each stage is a **bytecode VM written in Luau**: a table of ~180 tiny handlers plus one huge
handler (`IO`, 538,776 B in stage `B`) that holds the flattened program, and a dispatcher that
binary-searches the opcode byte. The constant pools are not plaintext: entries are decrypted lazily
into a `buffer` object (`buffer.create(69880)` for stage `A` — exactly the static base-85 decode
length, which cross-validates the static decoder).

## 4. Function map

All **358** handlers are named and classified — see
[`reports/FUNCTION_MAP.md`](../reports/FUNCTION_MAP.md) and the machine-readable
`out/function_map.json`.

| role | count | meaning | example |
|---|---|---|---|
| `entry` | 2 | stage entry (`({…}):p(...)`) | `p` → `vm_entry` |
| `dispatch` | 2 | opcode ladder | `dN` → `vm_dispatch` (64 opcodes), `OW` → `vm_dispatch` (101) |
| `pool` | 3 | pool loader / base-85 decoder | `bq` → `pool_load`, `uq` → `pool_decode_install` |
| `state_machine` | 18 | flattened statement (`while true do … continue`) | `fN` → `vm_state_3` (10,641 calls) |
| `router` | 103 | forwards to other handlers | `R` → `vm_route` |
| `predicate` | 34 | small branch helper | `zo` → `vm_test` |
| `accessor` | 73 | VM slot get/set/clear/move | `qW` → `get_slot_25530`, `qo` → `set_slot_3`, `Ao` → `set_slot_7` |
| `helper` | 50 | small helpers | `Mo` → `vm_helper` |
| `library` | 54 | stdlib aliases in the table | `UW` → `lib_bit32_bnot`, `S` → `lib_select`, `n` → `lib_bit32_rshift` |
| `constant` | 19 | constants in the table | `v` → `const_number`, `N` → `const_string` (`"\114ead\1023\50"` = `readf32`) |

The dispatchers were decoded further into an opcode table (`out/opcodes.json`, 52 leaves in `A`,
83 in `B`): each leaf of the comparison tree is labelled with the operation it performs — EQ/NE/LE/LT/
GT, ADD/SUB/MUL/DIV/IDIV/MOD/POW, CONCAT, LENGTH, NOT, NEWTABLE, LOADNIL, CALL, RETURN, VARARG,
pool read/write, register move. The VM therefore implements a Luau-like instruction set under a
private opcode permutation.

## 5. Two findings worth keeping

**The numeric "library table" is an environment fingerprint.** The VM does not call
`buffer.readu32` or `string.gsub` directly: it indexes a table built at startup (`w[10]`,
`w[15]`, `w[21]`, …). Probing it live resolves the slots:

| slot | function |
|---|---|
| 10 | `buffer.create` |
| 11, 12, 13 | `buffer.readu8`, `buffer.readi16`, `buffer.readu16` |
| 14 | `select` |
| 17, 19 | `buffer.readi32`, `buffer.readu32` |
| 21 | `string.gsub` (the `z` → `!!!!!` padding fix-up of the base-85 decoder) |
| 27, 30 | `table.create`, `string.sub` |

Slots are assigned from the *identity and order* of the globals the payload sees, so any emulator
whose environment differs shifts them. This is both an anti-tamper measure and the reason
third-party devirtualisers can fail on a build like this: if slot 10 is not `buffer.create`, the
pool decoder is handed a wrong size. That is exactly the error the public tool reports here
(`invalid argument #1 to 'create' (size out of range)`), even though its detector correctly
identifies Luraph v14.x. This repository's harness keeps the environment close enough that the
decoder and the pool load succeed.

**The payload never terminates.** It is an eternal Roblox script interpreted by a Lua-implemented
VM (~1000× slower than Luau). A 30 s budget already executes ~5.6 M `A.q` + 5.6 M `A.I` dispatches
(stage `A`) and 5.4 M `B.RW` (stage `B`). Observation therefore has to be budgeted and snapshotted
rather than run to completion — which is what `tools/harness` does.

## 6. Runtime observations

From [`reports/BEHAVIOR.md`](../reports/BEHAVIOR.md) and [`reports/STRINGS.md`](../reports/STRINGS.md):

* 167 unique constants decrypted from the pool on the executed path (`buffer.readstring`), including
  the Luraph platform errors, the `LPH_NO_UPVALUES` loadstring template
  (`--[[%s]] return setfenv(function(...) return %s(...) end, …)`), a large ASCII-art banner, the
  `Path2D` drawing API (`SetControlPoints`, `GetPositionOnCurveArcLength`,
  `GetTangentOnCurveArcLength`, `NextUnitVector`, `LockCurrentPosition`), and `identifyexecutor`.
* The loader probes the executor environment and reaches `task.spawn` / `task.delay`
  (attributed to the handlers on the stack) before entering its UI loop.
* The only global the emulator had to stub is `Path2DControlPoint`, i.e. the payload draws a custom
  UI through the executor's `Path2D` object.

## 6b. The payload's own program

Route 1 of section 7 turned out to be unnecessary: instead of running the payload in a real
executor, the interpreter can be instrumented where it already runs. See
[`reports/PROGRAM.md`](../reports/PROGRAM.md) and `out/payload/program.disasm.txt`.

* The harness hooks the dispatch site (`local N = X[H]; if N < …`) and, from the first dispatch of
  each proto, dumps that proto's **whole code array**. ~1.64 × 10⁸ dispatches touch 2,342 distinct
  instructions, and those reach **7,591 instructions across 20 protos** — one dominant proto of
  5,739 instructions (the loader's main body) plus 19 of 37–331. That is the entire program, not a
  sample of the executed path.
* `tools/lift.py` turns the listing into Luau source (`reports/payload.luau`, 20 functions,
  2,944 basic blocks) that `luau-ast` accepts, and `tools/structurize.py` **de-flattens** it:
  dominant/post-dominant analysis plus a follow-set walk restores `if`/`while`/`break`/`continue`,
  giving 20/20 protos structured (1,705 `if`, 299 `while`, 28.6k lines). The two regions that are
  genuinely irreducible are emitted as labelled numeric dispatch loops rather than pretending
  they are structured. A further pass folds the interpreter's scratch locals back into the
  operations they compute (`z=R; x=5; J=R[1]%2; z[x]=J` → `R[5] = R[1] % 2`), so the recovered
  source reads as register-level Luau rather than as handler fragments.
* The recovered program is **block-flattened**: 2,944 basic blocks for 7,591 instructions, joined
  by ~2,200 explicit jumps with almost no fall-through. That is a deobfuscation pass applied
  *before* Luraph — the source ran inside a control-flow flattening obfuscator, and Luraph then
  compiled and virtualised the result. It explains the instruction mix (few calls, many jumps) and
  it is why de-flattening needs a real structuring pass rather than more careful indentations.
* The opcode ladder is decoded by *evaluating* it for every candidate value, not by pattern
  matching, which is why it yields 2337/2342 decoded instructions with no manual table.
* The instruction mix is what a Roblox key-loader should look like: 650 jumps (the flattened
  control flow), 411 register→table stores, 257 register moves, 221 constant loads, 134 closure
  creations (the UI callback layer), 92 adds, 70 conditional jumps, 33 table reads, 25 calls,
  22 numeric `for` loops — and one `NEWCLOSURE` body that is a full upvalue-capture loop with
  `[1]=k`, `[3]=_` cells, i.e. the classic Luau closure-instantiation bytecode.
* Constants come for free: Luraph pre-resolves them into the operand slots, so the capture is
  type-tagged and the listing shows real literals — `R[123]=("delay")`, `R[68]=(B["debug"])`,
  `R[3]=(R[3]["char"])`, `R[2][112]=("The debug library is required on Luau platforms…")`. The
  constant-pool stores (`R[t][slot]=(literal)`) yield **119 named constant slots**, listed in
  [`reports/PROGRAM.md`](../reports/PROGRAM.md): `isyieldable`, `GetAsync`, `FromValue`,
  `NextUnitVector`, `pack`, `isvararg`, `gmatch`, `readu32`, … — i.e. exactly the surface a Roblox
  loader touches (executor introspection, `Path2D` UI, datastore calls).

## 6c. What the run actually did — dynamic trace

The listing says what the program *can* do. Running it says what it *did*, and the two agree:
the harness logs every dispatch (`proto, pc, opcode, operand registers, values`) and
`tools/trace_lift.py` turns the log into `reports/TRACE.md`, `out/trace/B/trace.json` and a
register-annotated copy of the source, `reports/payload.traced.luau`.

* 20,968 dispatches were logged (the first 20,000 plus the first visit to every pc), covering
  **2,342 of the 7,591 instructions across all 20 protos** — the same executed set the static
  capture reports, which is the cross-check that the two captures see the same program.
* Registers carried real data: **58 distinct string values** were read out of operand registers
  while the payload ran, and they are the executor/task surface the loader probes —
  `spawn`, `defer`, `delay`, `cancel`, `status`, `running`, `isyieldable`, `resume`, `yield`,
  `close`, `create`, `sub`, `gsub`. These are runtime *observations*, not constant-pool guesses.
* API traffic in order: `task.spawn`, `task.spawn`, `task.delay` — the loader's two watcher
  coroutines and the 600 s poll timer, matching the plaintext `KwInterval = 600`.
* The annotated source is the *same* code as `reports/payload.luau` with `-- trace: @pc n: R[..] = …`
  comments above the blocks the run reached (1,501 pcs annotated). Removing those comment lines
  reproduces `reports/payload.luau` byte for byte, so the trace documents the lift instead of
  altering it; `luau-ast` accepts both files.

## 7. What is *not* recovered, and what it would take

The original script text is not recovered: stage `B` is bytecode for the VM, not Luau source, and
the VM is an interpreter whose program is embedded in the giant `IO` handler. Section 6b lifts the
*executed* instruction stream back to readable pseudocode, but a listing is not source: there is no
expression structure, no local names, no literal constants, and code on unexecuted paths is absent.
Closing that gap further would mean lifting the listing into structured Luau (basic blocks →
`if`/`while`/`for`), which is mechanical for the 650 jumps above but was not attempted here.
Remaining routes if literal-level source is wanted:

1. run the payload in a real executor (or a much closer engine emulation) so the VM's own decoder
   table matches, and trace the opcode stream; or
2. extend a devirtualiser's engine model until the payload's numeric library table resolves
   identically — the failure mode above tells you exactly what to compare (slot 10 must be
   `buffer.create`, slot 21 `string.gsub`); or
3. use this repository's outputs to reconstruct behaviour instead of source: the constant pools,
   the decrypted strings, the API trace, and the handler map already describe what the loader does,
   what it contacts and which VM operation each function performs.
