# Runtime behaviour

Observations from the emulation harness (`tools/harness`). The payload is a
VM interpreted in Lua, so a budgeted run is used: the harness snapshots and
stops once the time budget is reached.

## Stage `A`

- run completed within the budget
- snapshot: reason=`budget`, buffers=2, buffer calls=102400, seconds=47.33759401899988
- captured `buffer` objects: #1 (69,880 bytes), #2 (2,048 bytes)
- globals the emulator had to stub: `Path2DControlPoint`

### API calls (3)

| API | detail | handler chain |
|---|---|---|
| `task.spawn` |  | — |
| `task.spawn` |  | — |
| `task.delay` |  | — |

### Hottest handlers

| handler | calls |
|---|---|
| `A.q` | 9,189,850 |
| `A.I` | 9,121,553 |
| `A.T` | 2,580,904 |
| `A.lq` | 181,962 |
| `A.qq` | 121,308 |
| `A.pN` | 74,487 |
| `A.n` | 67,837 |
| `A.fq` | 62,250 |
| `A.jq` | 62,250 |
| `A.nq` | 62,250 |
| `A.Qq` | 60,654 |
| `A.Eq` | 60,654 |
| `A.iq` | 43,339 |
| `A.yq` | 42,564 |
| `A.E` | 17,470 |
| `A.j` | 13,245 |
| `A.fN` | 10,641 |
| `A.Sq` | 10,641 |
| `A.Kq` | 10,641 |
| `A.hN` | 1,210 |
| `A.PN` | 1,208 |
| `A.wN` | 1,164 |
| `A.aq` | 754 |
| `A.yN` | 626 |
| `A.cN` | 398 |

### Obfuscator library table (`uq`)

The VM indexes its stdlib table numerically, so the slots are all that is visible in the source. Resolved live:

| slot | resolved |
|---|---|
| `1` | `table: 0x00005610ded453a0` |
| `2` | `4294967296` |
| `3` | `table: 0x00005610ded45370` |
| `4` | `table: 0x00005610ded45070` |
| `5` | `function: 0x00005610ded41bd0` |
| `6` | `function: 0x00005610ded40c50` |
| `7` | `4503599627370496` |
| `8` | `function: 0x00005610ded40e50` |
| `9` | `0` |
| `10` | `buffer.create (instrumented)` |
| `11` | `buffer.readu8 (instrumented)` |
| `12` | `buffer.readi16 (instrumented)` |
| `13` | `buffer.readu16 (instrumented)` |
| `14` | `_G.select` |
| `15` | `function: 0x00005610ded444d0` |
| `16` | `function: 0x00005610ded40850` |
| `17` | `buffer.readi32 (instrumented)` |
| `18` | `2147483648` |
| `19` | `buffer.readu32 (instrumented)` |
| `20` | `buffer.readf32 (instrumented)` |
| `21` | `string.gsub` |
| `22` | `buffer.readf64 (instrumented)` |
| `24` | `buffer.writeu32 (instrumented)` |
| `25` | `function: 0x00005610ded42ad0` |
| `26` | `buffer.copy (instrumented)` |
| `27` | `function: 0x00005610ded41b50` |
| `28` | `function: 0x00005610ded57f40` |
| `29` | `function: 0x00005610ded57e80` |
| `30` | `function: 0x00005610ded4fda0` |
| `31` | `table: 0x00005610ded57e50` |
| `32` | `45` |

### Obfuscator library table (`bq`)

The VM indexes its stdlib table numerically, so the slots are all that is visible in the source. Resolved live:

| slot | resolved |
|---|---|
| `1` | `table: 0x00005610ded453a0` |
| `2` | `4294967296` |
| `3` | `table: 0x00005610ded45370` |
| `4` | `table: 0x00005610ded45070` |
| `5` | `function: 0x00005610ded41bd0` |
| `6` | `function: 0x00005610ded40c50` |
| `7` | `4503599627370496` |
| `8` | `function: 0x00005610ded40e50` |
| `9` | `0` |
| `10` | `buffer.create (instrumented)` |
| `11` | `buffer.readu8 (instrumented)` |
| `12` | `buffer.readi16 (instrumented)` |
| `13` | `buffer.readu16 (instrumented)` |
| `14` | `_G.select` |
| `15` | `function: 0x00005610ded444d0` |
| `16` | `function: 0x00005610ded40850` |
| `17` | `buffer.readi32 (instrumented)` |
| `18` | `2147483648` |
| `19` | `buffer.readu32 (instrumented)` |
| `20` | `buffer.readf32 (instrumented)` |
| `21` | `string.gsub` |
| `22` | `buffer.readf64 (instrumented)` |
| `24` | `buffer.writeu32 (instrumented)` |
| `25` | `function: 0x00005610ded42ad0` |
| `26` | `buffer.copy (instrumented)` |
| `27` | `function: 0x00005610ded41b50` |
| `28` | `function: 0x00005610ded57f40` |
| `29` | `function: 0x00005610ded57e80` |
| `30` | `function: 0x00005610ded4fda0` |
| `31` | `table: 0x00005610ded57e50` |
| `32` | `45` |
| `33` | `function: 0x00005610ded56ec0` |

## Stage `B`

- run completed within the budget
- snapshot: reason=`budget`, buffers=2, buffer calls=188416, seconds=49.68535136100036
- captured `buffer` objects: #1 (430,656 bytes), #2 (2,048 bytes)
- globals the emulator had to stub: `Path2DControlPoint`

### API calls (3)

| API | detail | handler chain |
|---|---|---|
| `task.spawn` |  | — |
| `task.spawn` |  | — |
| `task.delay` |  | — |

### Hottest handlers

| handler | calls |
|---|---|
| `B.RW` | 8,858,345 |
| `B.S` | 1,506,859 |
| `B.k` | 107,664 |
| `B.N` | 67,320 |
| `B.m` | 65,381 |
| `B.JO` | 45,391 |
| `B.aO` | 44,600 |
| `B.Ko` | 22,300 |
| `B.Po` | 11,150 |
| `B.xo` | 1,600 |
| `B.Zo` | 1,208 |
| `B.To` | 1,208 |
| `B.Mo` | 1,208 |
| `B.Go` | 1,208 |
| `B.Lo` | 816 |
| `B.Bo` | 454 |
| `B.Do` | 408 |
| `B.Eo` | 408 |
| `B.AO` | 394 |
| `B.ao` | 386 |
| `B.HO` | 385 |
| `B.pO` | 340 |
| `B._O` | 256 |
| `B.no` | 227 |
| `B.Jo` | 227 |
