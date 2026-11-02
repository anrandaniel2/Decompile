# Identification

**Obfuscator:** Luraph Obfuscator (Luraph Cloud)  
**Version family:** v14.x (header stripped)  
**Confidence:** 0.94

## Evidence

| check | kind | hits | weight | what it shows |
|---|---|---|---|---|
| `lph_pool` | static | 2 | 2 | `[=[LPH...]=]` encrypted constant pool (Luraph's pool signature) |
| `pool_watermark` | static | 0 | 0 | `PUSL_` watermark prefix built by the VM |
| `handler_table` | static | 1 | 2 | `return({ <name> = function(...) ... }):<run>(...)` stage shape |
| `flattened_dispatch` | static | 57 | 2 | statements flattened into `while true do if state==K then ... continue` |
| `opaque_numbers` | static | 604 | 1 | mangled numeric literals (`0Xf__`, `0b10110_1`) used to break pattern matching |
| `buffer_pool` | static | 1 | 1 | constant pool materialised into a `buffer` object |
| `bit32_vm` | static | 21 | 1 | bit32-based VM arithmetic |
| `env_probe` | static | 49 | 1 | executor-environment probing (key systems / anti-tamper) |
| `luraph_string` | runtime | 4 | 3 | runtime-decrypted string naming Luraph |
| `luraph_error` | runtime | 2 | 3 | runtime-decrypted Luraph platform error string |

### Decrypted strings that name the obfuscator

- `Your Lua environment does not support load or loadstring, therefore you are unable to use Luraph's 'LPH_NO_UPVALUES' macro.`
- `The debug library is required on Luau platforms. Please open a support ticket.`

## Notes

- No `-- This file was protected using Luraph Obfuscator vX [https://lura.ph/]` header is present; the file starts directly with the VM stage, which is the shape of a v14.x build whose banner was removed.
- Two independent VM stages are present: stage A is the loader/pool machinery and stage B is the protected payload.

## Constant pools

| pool | marker | encoded chars | decoded bytes | entropy | sha256 (decoded) |
|---|---|---|---|---|---|
| 0 | `LPH]` | 87,354 | 69,880 | 7.807 | `f711915edb50ad9662ad9c19eb248a73` |
| 1 | `LPH]` | 538,324 | 430,656 | 7.943 | `50e3350f2b106e0475637ae819d26173` |
