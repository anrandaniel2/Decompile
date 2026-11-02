# Dynamic trace: what the payload actually did

The payload was executed inside the emulated Roblox environment (`tools/harness/`) rather than read statically. The interpreter's dispatch site is instrumented, so every instruction the VM ran - with the values sitting in its operand registers - lands in the log.

- dispatches recorded: **20,968**
- protos reached: **20/20**
- instructions executed: **2,342 of 7,591**
- API calls observed: **3**
- distinct string values seen in registers: **58**
- raw log: `out/trace/B/trace.json`; rendered listing: `out/trace/B/ir.txt`

## Coverage per proto

| proto | instructions | executed | coverage | hot pcs (most re-executed) |
| --- | ---: | ---: | ---: | --- |
| `P1` | 5,739 | 1,133 | 19.7% | 2509, 34, 5296, 4217, 5321 |
| `P2` | 331 | 326 | 98.5% | 1, 215, 216, 217, 218 |
| `P3` | 217 | 144 | 66.4% | 1, 79, 29, 30, 31 |
| `P4` | 195 | 135 | 69.2% | 1, 154, 155, 156, 157 |
| `P6` | 153 | 135 | 88.2% | 1, 48, 49, 50, 51 |
| `P5` | 185 | 90 | 48.6% | 1, 50, 118, 119, 120 |
| `P13` | 49 | 48 | 98.0% | 1, 34, 8, 9, 10 |
| `P8` | 68 | 43 | 63.2% | 1, 56, 57, 58, 59 |
| `P9` | 65 | 42 | 64.6% | 1, 44, 35, 36, 37 |
| `P10` | 63 | 38 | 60.3% | 1, 16, 17, 18, 19 |
| `P19` | 38 | 37 | 97.4% | 1, 25, 16, 17, 18 |
| `P17` | 41 | 37 | 90.2% | 1, 27, 28, 29, 30 |
| `P11` | 56 | 32 | 57.1% | 1, 55, 56, 48, 35 |
| `P14` | 45 | 29 | 64.4% | 1, 15, 16, 17, 18 |
| `P20` | 37 | 23 | 62.2% | 1, 33, 19, 20, 21 |
| `P12` | 53 | 13 | 24.5% | 1, 11, 27, 28, 29 |
| `P16` | 43 | 10 | 23.3% | 1, 8, 9, 10, 11 |
| `P15` | 45 | 10 | 22.2% | 1, 21, 22, 23, 24 |
| `P7` | 129 | 9 | 7.0% | 1, 11, 12, 13, 95 |
| `P18` | 39 | 8 | 20.5% | 1, 22, 23, 24, 25 |

## API traffic, in the order the payload produced it

| # | call | arguments | handler stack |
| ---: | --- | --- | --- |
| 1 | `task.spawn` | `` | `0x000055edd8e7fb90@./out/runtime/Btrace/runner.luau:359 > 0x000055edd8e657e0@Key.luau:1 > 0x000055edd908fbb0@Key.luau:1` |
| 2 | `task.spawn` | `` | `0x000055edd8e7fb90@./out/runtime/Btrace/runner.luau:359 > 0x000055edd8e657e0@Key.luau:1 > 0x000055edd908fbb0@Key.luau:1` |
| 3 | `task.delay` | `` | `0x000055edd8e7fb90@./out/runtime/Btrace/runner.luau:367 > 0x000055edd8e65760@Key.luau:1 > 0x000055edd908fbb0@Key.luau:1` |

## Values recovered from registers

These strings were read out of the VM's registers while the program was running, i.e. they are data the payload actually computed or looked up - not guesses from the constant pool.

- `cancel`
- `spawn`
- `defer`
- `isyieldable`
- `running`
- `create`
- `resume`
- `delay`
- `status`
- `yield`
- `close`
- `gsub`
- `insert`
- `match`
- `info`
- `traceback`
- `The debug library is required on Luau platforms. Please open...`
- `readu8`
- `getinfo`
- `writeu8`
- `writeu16`
- `wait`
- `writeu32`
- `tostring`
- `concat`
- `namewhat`
- `source`
- `=[C]`
- `nparams`
- `lastlinedefined`
- `isvararg`
- `currentline`
- `short_src`
- `what`
- `linedefined`
- `getmetatable`
- `setmetatable`
- `tonumber`
- `rawset`
- `rawget`

## Opcode mix in the observed execution

| opcode | dispatches |
| ---: | ---: |
| n:190 | 2,816 |
| n:163 | 2,067 |
| n:85 | 2,055 |
| n:221 | 2,041 |
| n:210 | 2,018 |
| n:94 | 2,015 |
| n:133 | 2,012 |
| n:218 | 2,012 |
| n:211 | 2,011 |
| n:47 | 317 |
| n:78 | 234 |
| n:120 | 167 |
| n:180 | 124 |
| n:227 | 119 |
| n:138 | 85 |
| n:3 | 65 |
| n:137 | 57 |
| n:43 | 54 |
| n:23 | 52 |
| n:70 | 50 |
