# Recovered program (VM disassembly)

The protected payload is not Luau source: it is a program for the Luraph bytecode
VM. The harness instruments the interpreter's dispatch site, so every executed
instruction is captured as `(proto, pc) -> opcode + operands`, and this listing
reconstructs the program from it. Opcodes are named from the interpreter's own
comparison tree, and operands are substituted into the branch body, so a line
reads like `R[545] = R[66] ~= R[2]` rather than `k[K[H]]=(k[j[H]]~=k[m[H]])`.

- instructions recovered: **7,591** (whole protos, including paths this run never executed)
- executed in the captured run: 2,342
- protos (functions): **20**
- opcode variable: `N`

## Protos

| proto | instructions |
|---|---|
| `P1` | 5739 |
| `P2` | 331 |
| `P3` | 217 |
| `P4` | 195 |
| `P5` | 185 |
| `P6` | 153 |
| `P7` | 129 |
| `P8` | 68 |
| `P9` | 65 |
| `P10` | 63 |
| `P11` | 56 |
| `P12` | 53 |
| `P13` | 49 |
| `P14` | 45 |
| `P15` | 45 |
| `P16` | 43 |
| `P17` | 41 |
| `P18` | 39 |
| `P19` | 38 |
| `P20` | 37 |

## Instruction mix

| semantics | count |
|---|---|
| JUMP | 2142 |
| register move / read | 825 |
| LOADK / LOADN | 780 |
| MOVE | 759 |
| register read / table index | 666 |
| ADD | 541 |
| SETTABLE | 365 |
| NOT | 279 |
| NEWCLOSURE | 266 |
| conditional jump | 261 |
| GETTABLE | 131 |
| compare (le) | 105 |
| CALL | 96 |
| unclassified | 55 |
| MUL | 47 |
| FORNLOOP | 46 |
| compare (ge) | 43 |
| register move | 37 |
| SUB | 35 |
| compare (not equal) | 29 |
| NEWTABLE (fresh table) | 23 |
| LOADNIL | 20 |
| compare (equal) | 10 |
| MOD | 8 |
| CONCAT | 7 |

## Constant slots recovered from the listing

The VM pre-resolves constants into the operand slots, so **119** string constants appear directly in the disassembly, keyed by their slot in the proto's constant table.

| proto | slot | value |
|---|---|---|
| `P2` | 2 | `"isyieldable"` |
| `P2` | 3 | `"info"` |
| `P2` | 5 | `"GetAsync"` |
| `P2` | 7 | `"Size"` |
| `P2` | 15 | `"FromValue"` |
| `P2` | 16 | `"NextUnitVector"` |
| `P2` | 18 | `"Instance"` |
| `P2` | 19 | `"pack"` |
| `P2` | 22 | `"Random"` |
| `P2` | 24 | `"isvararg"` |
| `P2` | 26 | `"NextNumber"` |
| `P2` | 28 | `"writeu16"` |
| `P2` | 30 | `"Connect"` |
| `P2` | 32 | `"__index"` |
| `P2` | 33 | `"The metatable is locked"` |
| `P2` | 34 | `"gsub"` |
| `P2` | 35 | `"Clone"` |
| `P2` | 36 | `"tostring"` |
| `P2` | 37 | `"=[C]"` |
| `P2` | 38 | `"linedefined"` |
| `P2` | 39 | `"writeu32"` |
| `P2` | 40 | `"assert"` |
| `P2` | 41 | `"ScreenGui"` |
| `P2` | 42 | `"rawget"` |
| `P2` | 45 | `"IsClient"` |
| `P2` | 47 | `"pcall"` |
| `P2` | 49 | `"string"` |
| `P2` | 50 | `"Y"` |
| `P2` | 51 | `"insert"` |
| `P2` | 52 | `"nparams"` |
| `P2` | 55 | `"Changed"` |
| `P2` | 56 | `"find"` |
| `P2` | 57 | `"typeof"` |
| `P2` | 59 | `"EnumType"` |
| `P2` | 60 | `"what"` |
| `P2` | 61 | `"Parent"` |
| `P2` | 62 | `"RequestAsync"` |
| `P2` | 63 | `"GetChildren"` |
| `P2` | 64 | `"delay"` |
| `P2` | 65 | `"getmetatable"` |

## `P1` — first 60 instructions

```lua
     1  op190  0 0 3000               goto 3000;  -- JUMP
     2  op138  850 157 475 9          if not(not(9<R[157])) then else goto 850; end;  -- NOT
     3  op190  0 0 1833               goto 1833;  -- JUMP
     4  op120  160 0 97               R[160]=R[97];  -- MOVE
     5  op120  161 0 159              R[161]=R[159];  -- MOVE
     6  op120  162 0 157              R[162]=R[157];  -- MOVE
     7  op78   10 163 1 4             R[163]=(R[1][4]);  -- register move / read
     8  op190  0 0 2595               goto 2595;  -- JUMP
     9  op138  1658 4 1062 57         if not(not(57<R[4])) then else goto 1658; end;  -- NOT
    10  op190  0 0 4132               goto 4132;  -- JUMP
    11  op227  990 4 182 126          if R[4]~=126 then goto 990; end;  -- conditional jump
    12  op190  0 0 2205               goto 2205;  -- JUMP
    13  op14   154 2542 0             if not R[154] then goto 2542; end;  -- conditional jump
    14  op190  0 0 555                goto 555;  -- JUMP
    15  op106  31 0 160               z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[160]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;  -- NEWCLOSURE
    16  op190  0 0 1849               goto 1849;  -- JUMP
    17  op120  129 0 15               R[129]=R[15];  -- MOVE
    18  op194  130 148 102            z=R; x=130; J=R;  -- register read / table index
    19  op28   220 147 14             F=(14); J=(J[F]); (z)[x]=J;  -- register read / table index
    20  op120  131 0 127              R[131]=R[127];  -- MOVE
    21  op96   0 0 130                z=130; R[z]=R[z](R[z+1]); P=z;  -- CALL
    22  op190  0 0 5198               goto 5198;  -- JUMP
    23  op227  2653 155 706 192       if R[155]~=192 then goto 2653; end;  -- conditional jump
    24  op190  0 0 964                goto 964;  -- JUMP
    25  op215  5 54 0                 R[54]=(d[17][5]);  -- register read / table index
    26  op47   453 4 0 31             R[4]=(31);  -- LOADK / LOADN
    27  op190  0 0 3792               goto 3792;  -- JUMP
    28  op138  680 154 103 40         if not(not(40<R[154])) then else goto 680; end;  -- NOT
    29  op190  0 0 1645               goto 1645;  -- JUMP
    30  op137  3093 152 1206 284      if not(not(R[152]<284)) then else goto 3093; end;  -- NOT
    31  op190  0 0 1329               goto 1329;  -- JUMP
    32  op138  1558 150 445 52        if not(not(52<R[150])) then else goto 1558; end;  -- NOT
    33  op190  0 0 2262               goto 2262;  -- JUMP
    34  op164  710 1403 4 69          if not(not(R[4]<=69)) then else goto 1403; end;  -- compare (le)
    35  op190  0 0 1119               goto 1119;  -- JUMP
    36  op138  4427 150 1111 74       if not(not(74<R[150])) then else goto 4427; end;  -- NOT
    37  op190  0 0 1963               goto 1963;  -- JUMP
    38  op227  1818 150 177 87        if R[150]~=87 then goto 1818; end;  -- conditional jump
    39  op190  0 0 3503               goto 3503;  -- JUMP
    40  op190  0 0 502                goto 502;  -- JUMP
    41  op138  2881 152 24 58         if not(not(58<R[152])) then else goto 2881; end;  -- NOT
    42  op190  0 0 2978               goto 2978;  -- JUMP
    43  op120  158 0 98               R[158]=R[98];  -- MOVE
    44  op39   153 159 443 "NextNumber" z=(159); x=R[153]; R[z+1]=(x); R[z]=x["NextNumber"];  -- ADD
    45  op96   0 0 159                z=159; R[z]=R[z](R[z+1]); P=z;  -- CALL
    46  op190  0 0 5460               goto 5460;  -- JUMP
    47  op130  131 131 404 65536      R[131]=R[131]/65536;  -- register move / read
    48  op210  130 0 0                z=(130); (R[z])(R[z+1]); P=(z-1);  -- ADD
    49  op78   8 132 1 48             R[132]=(R[1][48]);  -- register move / read
    50  op47   20 133 0 19            R[133]=(19);  -- LOADK / LOADN
    51  op190  0 0 1285               goto 1285;  -- JUMP
    52  op120  152 0 11               R[152]=R[11];  -- MOVE
    53  op143  0 0 152                P=152; R[P]=R[P]();  -- register read / table index
    54  op78   22 153 149 25          R[153]=(R[149][25]);  -- register move / read
    55  op47   65 154 0 1             R[154]=(1);  -- LOADK / LOADN
    56  op69   0 151 4                z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;  -- ADD
    57  op78   33 151 149 24          R[151]=(R[149][24]);  -- register move / read
    58  op190  0 0 4075               goto 4075;  -- JUMP
    59  op78   18 157 149 38          R[157]=(R[149][38]);  -- register move / read
    60  op47   65 158 0 1             R[158]=(1);  -- LOADK / LOADN
```

## Lifted Luau source

`reports/payload.luau` contains the same program as runnable Luau: **20** functions, 4,100 basic blocks, 17,430 lines. `luau-ast` accepts the file (yes).

Conventions: `R[n]` is the proto's register file, `Protos[n]` the proto table, `PC` the next block. Because the payload's basic blocks are laid out in permuted order and connected by explicit jumps (a block-flattening pass ran before Luraph did), control flow is a block dispatch loop; `tools/lift.py` re-lays the blocks out in reverse postorder first so the code reads in execution order.
