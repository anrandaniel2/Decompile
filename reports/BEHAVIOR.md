# Runtime behaviour

Observations from the emulation harness (`tools/harness`). The payload is a
VM interpreted in Lua, so a budgeted run is used: the harness snapshots and
stops once the time budget is reached.

## Stage `A`

- run completed within the budget
- snapshot: reason=`budget`, buffers=2, buffer calls=86016, seconds=10.965661001999933
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
| `A.q` | 2,030,200 |
| `A.I` | 2,014,937 |
| `A.T` | 565,596 |
| `A.lq` | 181,962 |
| `A.qq` | 121,308 |
| `A.pN` | 74,487 |
| `A.fq` | 62,250 |
| `A.jq` | 62,250 |
| `A.nq` | 62,250 |
| `A.Qq` | 60,654 |
| `A.Eq` | 60,654 |
| `A.iq` | 43,339 |
| `A.yq` | 42,564 |
| `A.E` | 17,470 |
| `A.n` | 14,802 |
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
| `1` | `table: 0x0000556cd36c6f90` |
| `2` | `4294967296` |
| `3` | `table: 0x0000556cd36c6f60` |
| `4` | `table: 0x0000556cd36c6c60` |
| `5` | `function: 0x0000556cd356d060` |
| `6` | `function: 0x0000556cd356c0e0` |
| `7` | `4503599627370496` |
| `8` | `function: 0x0000556cd356c2e0` |
| `9` | `0` |
| `10` | `buffer.create (instrumented)` |
| `11` | `buffer.readu8 (instrumented)` |
| `12` | `buffer.readi16 (instrumented)` |
| `13` | `buffer.readu16 (instrumented)` |
| `14` | `_G.select` |
| `15` | `function: 0x0000556cd356f960` |
| `16` | `function: 0x0000556cd356bce0` |
| `17` | `buffer.readi32 (instrumented)` |
| `18` | `2147483648` |
| `19` | `buffer.readu32 (instrumented)` |
| `20` | `buffer.readf32 (instrumented)` |
| `21` | `string.gsub` |
| `22` | `buffer.readf64 (instrumented)` |
| `24` | `buffer.writeu32 (instrumented)` |
| `25` | `function: 0x0000556cd356df60` |
| `26` | `buffer.copy (instrumented)` |
| `27` | `function: 0x0000556cd356cfe0` |
| `28` | `function: 0x0000556cd36d9b30` |
| `29` | `function: 0x0000556cd36d9a70` |
| `30` | `function: 0x0000556cd36d19a0` |
| `31` | `table: 0x0000556cd36d9a40` |
| `32` | `45` |

### Obfuscator library table (`bq`)

The VM indexes its stdlib table numerically, so the slots are all that is visible in the source. Resolved live:

| slot | resolved |
|---|---|
| `1` | `table: 0x0000556cd36c6f90` |
| `2` | `4294967296` |
| `3` | `table: 0x0000556cd36c6f60` |
| `4` | `table: 0x0000556cd36c6c60` |
| `5` | `function: 0x0000556cd356d060` |
| `6` | `function: 0x0000556cd356c0e0` |
| `7` | `4503599627370496` |
| `8` | `function: 0x0000556cd356c2e0` |
| `9` | `0` |
| `10` | `buffer.create (instrumented)` |
| `11` | `buffer.readu8 (instrumented)` |
| `12` | `buffer.readi16 (instrumented)` |
| `13` | `buffer.readu16 (instrumented)` |
| `14` | `_G.select` |
| `15` | `function: 0x0000556cd356f960` |
| `16` | `function: 0x0000556cd356bce0` |
| `17` | `buffer.readi32 (instrumented)` |
| `18` | `2147483648` |
| `19` | `buffer.readu32 (instrumented)` |
| `20` | `buffer.readf32 (instrumented)` |
| `21` | `string.gsub` |
| `22` | `buffer.readf64 (instrumented)` |
| `24` | `buffer.writeu32 (instrumented)` |
| `25` | `function: 0x0000556cd356df60` |
| `26` | `buffer.copy (instrumented)` |
| `27` | `function: 0x0000556cd356cfe0` |
| `28` | `function: 0x0000556cd36d9b30` |
| `29` | `function: 0x0000556cd36d9a70` |
| `30` | `function: 0x0000556cd36d19a0` |
| `31` | `table: 0x0000556cd36d9a40` |
| `32` | `45` |
| `33` | `function: 0x0000556cd36d8ab0` |

## Stage `B`

- run completed within the budget
- snapshot: reason=`budget`, buffers=2, buffer calls=180224, seconds=11.243228922999833
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
| `B.RW` | 1,923,213 |
| `B.S` | 325,319 |
| `B.k` | 107,664 |
| `B.N` | 67,320 |
| `B.JO` | 45,391 |
| `B.aO` | 44,600 |
| `B.Ko` | 22,300 |
| `B.m` | 14,010 |
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
