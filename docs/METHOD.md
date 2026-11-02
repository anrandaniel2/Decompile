# Method

Everything in this repository is automated: `python3 tools/pipeline.py` produces every report and
artifact, and `.github/workflows/deobfuscate.yml` runs the same command in CI. This document
explains what each stage does, why it is needed, and where the approach stops.

```
input ──► identify ──► split ──► pools ──► inventory ──► runtime ──► names ──► opcodes ──► annotate ──► verify
             │           │        │          │            │          │          │            │
             ▼           ▼        ▼          ▼            ▼          ▼          ▼            ▼
        IDENTIFICATION  stages   pool*.bin  inventory   strings/API  FUNCTION_MAP  opcodes.json  stageX.annotated.luau
```

## 1. Identification — `tools/identify.py`

Luraph builds normally start with `-- This file was protected using Luraph Obfuscator vX
[https://lura.ph/]`. Here the banner is gone, so the verdict is assembled from independent
indicators with weights, and the score is reported as a confidence:

| indicator | why it points at Luraph |
|---|---|
| `[=[LPH...]=]` pools | Luraph's encrypted constant-pool signature |
| `return({ name = function(...) ... }):run(...)` | Luraph's stage shape (every handler is a table entry) |
| `while true do if state == K then ... continue` | Luraph's control-flow flattening |
| `0Xf__`, `0b10110_1`, `0B110101` | number-literal mangling used to break grep/pattern tooling |
| `bit32` + `buffer` | the VM's arithmetic and constant pool |
| runtime strings | `…unable to use Luraph's 'LPH_NO_UPVALUES' macro.`, `The debug library is required on Luau platforms. Please open a support ticket.` |

The last two only exist *after* the loader decrypts its own pool, which is why identification is
run after the dynamic stage.

## 2. Stage splitting — `tools/stages.py`

The file is not one blob:

```
line 1-2     do (function(...)                       ← wrapper
line 3       return({ l=bit32, dN=function ... })    ← stage A (obfuscated, 161 KB)
line 4-146   -- [Panda Key Watcher] ... config ...   ← plaintext glue (5 KB)
line 147     return({ qW=function ... })             ← stage B (obfuscated, 629 KB)
```

Long lines (>4 KB) or lines carrying an `LPH` pool are treated as obfuscated; everything else is
plaintext. The plaintext part is *not* obfuscated and is reported as-is: it is a key watcher plus a
`_G.PandaKrypticCfg` configuration block.

## 3. Constant pools — `tools/lph.py`

Each stage embeds one pool. The format is a private base-85:

* alphabet 0x21–0x75, five characters per 32-bit value (most significant character first),
* `z` is shorthand for a zero quintet (`!!!!!`),
* values are written little-endian, i.e. the decoded bytes are the raw pool.

The decode is verified against the running payload: the loader calls `buffer.create(69880)` for
stage A's pool and that is exactly the static decode length (see `out/runtime/A/runtime.json`).

The pool bytes are **not** the plaintext string table — Luraph decrypts entries lazily into the
buffer, which is why the strings are recovered dynamically (§5) rather than statically.

## 4. Handler inventory — `tools/inventory.py`

Every stage is a table literal:

```lua
return({ l = bit32, dN = function(w,N,q,n,v) ... end, ... }):p()(...)
```

The inventory recovers, per entry: name, kind (function vs. constant/alias), parameters, source
size, the VM slots it reads and writes (`(R)[7] = nil`), the numeric constants it compares against,
which sibling handlers it calls, and shape flags (loops, `continue` count, branches, library use).

Splitting the table needs care: the separator is a comma at bracket depth **and** block depth zero,
otherwise `local a, b = ...` inside a handler body would split the entry.

## 5. Runtime — `tools/harness/` + `tools/run_runtime.py`

The payload is a bytecode interpreter written in Luau, so static reading alone cannot tell you what
a handler does. The harness:

* emulates the Roblox + executor surface (services, instances, `task`, `getgenv`, `request`,
  `Drawing`, `Path2D…`, datatypes, file functions) and logs every call;
* runs the stage with `loadstring` in that environment;
* **wraps every handler** in the stage's table, which gives per-handler call counts, argument
  shapes, and a progress signal (this is what makes 8.8 M interpreter dispatches visible);
* hooks the `buffer` library, so every `readstring` out of the constant pool is captured — that is
  how the decrypted string table is obtained;
* dumps the obfuscator's numeric *library table* (`__probe`), resolving slots like `w[15]` to
  `bit32.bxor` and `w[21]` to `string.gsub`;
* records a stack chain for every API call and maps the live function identities back to the
  obfuscated names, so behaviour is attributed to handlers.

Two mechanical details matter:

* **Termination.** The payload is an eternal Roblox script and the VM swallows `pcall`-wrapped
  errors, so the harness snapshots at a time budget, pads the output past the stdio block size,
  prints an `@@END` marker and lets the driver kill the process.
* **Speed.** This VM is roughly three orders of magnitude slower than real Luau (it is an
  interpreter interpreting an interpreter), so a budgeted run is the only practical observation
  window; a 30 s budget already executes ~10 M handler calls.

## 6. Naming — `tools/name_map.py`

Names are derived, never guessed, in this priority order:

| role | test | recovered name |
|---|---|---|
| `entry` | is the method invoked as `({...}):name(...)` | `vm_entry` |
| `dispatch` | ≥12 distinct `var == const` tests on one variable | `vm_dispatch` |
| `pool` | holds the `LPH` literal / installs the base-85 decoder | `pool_load`, `pool_decode_install` |
| `state_machine` | ≥2 loops or ≥4 `continue`s | `vm_state` |
| `router` | calls other handlers, no loop | `vm_route` / `vm_helper` |
| `predicate` | 1–3 branches, no loop | `vm_test` |
| `accessor` | tiny, single slot read/write | `get_slot_25530`, `set_slot_3`, `clear_slot_7` |
| `library` | table entry aliases a stdlib function | `lib_bit32_bxor`, `lib_select` |
| `constant` | string/number/table constant | `const_string`, `const_number` |

Numeric suffixes are only disambiguators between handlers of the same class.

## 7. Opcode ladder — `tools/opcodes.py`

The dispatcher is a hand-flattened binary search over the opcode byte. The tool walks the
comparison tree, keeps the leaf branches (`if op == K then … end`, and for `if op ~= K then … else
… end` the else branch), and labels each leaf by the operation its statement performs (EQ, LE,
ADD, MUL, IDIV, CONCAT, NEWTABLE, LOADNIL, CALL, RETURN, VARARG, pool read, …). The resulting table
is a readable map of the VM's private opcode numbers; see the *Recovered VM opcode table* section of
`reports/FUNCTION_MAP.md`.

## 7b. Program recovery — `tools/disasm.py`

Section 7 recovers the opcode *table*; this step recovers the *program*. Two pieces:

1. **Capture.** `tools/harness/build_runner.py` splices a hook into the interpreter's dispatch
   site, exactly at `local N = X[H]; if N < …` — the moment before the ladder decides what to do —
   and passes the code array plus the six operand arrays. `__vmop` records one tuple per
   `(proto, pc)`: `record[pc] = {n, data}`, with an explicit operand count so that nil operands do
   not truncate the dump line. Operands are type-tagged (`n:12`, `s:IsA`, `-`), because the VM
   pre-resolves constants into those slots — which is how string constants survive into the
   listing. The hook fires ~1.6 × 10⁸ times per run, so it is opt-in
   (`cfg.vmTrace`) and gets its own short-budget pass (`DISASM_BUDGET = 10`); the capture saturates
   well before any larger budget does.
2. **Decode by evaluation.** Guessing at tree shapes is fragile (the generator mixes `~=`,
   reversed comparisons, `not(...)` wrappers and empty else branches), so `dispatch_tree()` walks
   the tree *numerically*: for every candidate opcode value it evaluates `if <cond>` and descends,
   until the condition stops mentioning the opcode variable — that span is the instruction body.
   Bodies are then rendered with the recorded operands substituted (`K[H]`→A, `j[H]`→B, …) and
   with `H = <pc>` rewritten as `goto <pc>`, which turns `k[m[H]][Y[H]]=(D[H])` into
   `R[62][4]=(3)` and `H=m[H]` into `goto 214`.

Instructions shaped `R[<table>][<slot>] = ("literal")` are a constant-pool store, so the tool also
collects them into a slot → value table (119 named constants in the current sample).

Output: `out/payload/program.disasm.txt` (full listing, per proto), `out/payload/program.json`
(machine readable) and `reports/PROGRAM.md` (summary + sample). Protos are labelled `P1..Pn` by
descending instruction count, because the runtime identity of a proto (`tostring` of its code
array) is an address and changes between runs — within one run it is a stable key.

## 8. Annotated output + verification — `tools/normalize.py`, `tools/verify.py`

The annotated stage files are the input with three semantics-preserving changes:

1. numeric literals canonicalised (`0Xf__` → `15`),
2. a newline after every `;` token (never inside a string — positions come from the lexer),
3. a comment before every handler-table entry with its recovered name and role.

Verification is automatic and blocking in CI:

* **token equality** — re-lexing both files must yield the same token stream (numbers compared by
  value), proving only presentation changed;
* **parse** — `luau-ast` must accept the file and emit an AST.

## Limits

* **Program recovery is partial by construction.** The listing covers every instruction the VM
  actually executed in the captured run (2,342 across 20 protos); instructions on paths the harness
  never reaches are absent, and constants are still VM operand numbers (`R[4]=(31)` means "load
  operand 31"), because the constants live in the LPH pools, not in the instruction stream. What is
  recovered is the program's control flow and register-level data flow, not the original script text.
* The harness is an emulator: globals it does not model are stubbed (`@@MISSING` in
  `out/runtime/*/runtime.json`), and code paths behind a real Roblox-only global may not be reached.
* The pure-Lua interpreter is ~1000× slower than Luau; longer budgets buy more of the executed
  path, not the whole program.
