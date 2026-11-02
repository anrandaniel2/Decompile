# Recovered program (VM disassembly)

The protected payload is not Luau source: it is a program for the Luraph bytecode
VM. The harness instruments the interpreter's dispatch site, so every executed
instruction is captured as `(proto, pc) -> opcode + operands`, and this listing
reconstructs the program from it. Opcodes are named from the interpreter's own
comparison tree, and operands are substituted into the branch body, so a line
reads like `R[545] = R[66] ~= R[2]` rather than `k[K[H]]=(k[j[H]]~=k[m[H]])`.

- instructions recovered: **2,342**
- protos (functions): **20**
- opcode variable: `N`

## Protos

| proto | instructions |
|---|---|
| `P1` | 1133 |
| `P2` | 326 |
| `P3` | 144 |
| `P4` | 135 |
| `P5` | 135 |
| `P6` | 90 |
| `P7` | 48 |
| `P8` | 43 |
| `P9` | 42 |
| `P10` | 38 |
| `P11` | 37 |
| `P12` | 37 |
| `P13` | 32 |
| `P14` | 29 |
| `P15` | 23 |
| `P16` | 13 |
| `P17` | 10 |
| `P18` | 10 |
| `P19` | 9 |
| `P20` | 8 |

## Instruction mix

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
| CALL | 25 |
| FORNLOOP | 22 |
| unclassified | 16 |
| register move | 16 |
| LOADNIL | 15 |
| compare (not equal) | 15 |
| compare (ge) | 15 |
| MUL | 8 |
| NEWTABLE (fresh table) | 7 |
| compare (equal) | 5 |
| MOD | 5 |
| POW | 5 |
| CONCAT | 2 |

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
    11  op227  990 4 182 126          if R[4]~=126 then goto 990; end;  -- conditional jump
    12  op190  0 0 2205               goto 2205;  -- JUMP
    17  op120  129 0 15               R[129]=R[15];  -- MOVE
    18  op194  130 148 102            z=R; x=130; J=R;  -- register read / table index
    19  op28   220 147 14             F=(14); J=(J[F]); (z)[x]=J;  -- register read / table index
    20  op120  131 0 127              R[131]=R[127];  -- MOVE
    21  op96   0 0 130                z=130; R[z]=R[z](R[z+1]); P=z;  -- CALL
    22  op190  0 0 5198               goto 5198;  -- JUMP
    25  op215  5 54 0                 R[54]=(d[17][5]);  -- register read / table index
    26  op47   453 4 0 31             R[4]=(31);  -- LOADK / LOADN
    27  op190  0 0 3792               goto 3792;  -- JUMP
    34  op164  710 1403 4 69          if not(not(R[4]<=69)) then else goto 1403; end;  -- compare (le)
    35  op190  0 0 1119               goto 1119;  -- JUMP
    47  op130  131 131 404 65536      R[131]=R[131]/65536;  -- register move / read
    48  op210  130 0 0                z=(130); (R[z])(R[z+1]); P=(z-1);  -- ADD
    49  op78   8 132 1 48             R[132]=(R[1][48]);  -- register move / read
    50  op47   20 133 0 19            R[133]=(19);  -- LOADK / LOADN
    51  op190  0 0 1285               goto 1285;  -- JUMP
    63  op106  56 0 85                z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[85]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;  -- NEWCLOSURE
    64  op78   62 86 1 73             R[86]=(R[1][73]);  -- register move / read
    65  op101  86 86 28               R[86]=R[28][R[86]];  -- GETTABLE
    66  op190  0 0 2731               goto 2731;  -- JUMP
    76  op78   1181 65 1 133          R[65]=(R[1][133]);  -- register move / read
    77  op47   128 4 0 27             R[4]=(27);  -- LOADK / LOADN
    78  op190  0 0 4246               goto 4246;  -- JUMP
   113  op69   0 125 4                z=125; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;  -- ADD
   114  op47   58 4 0 22              R[4]=(22);  -- LOADK / LOADN
   115  op190  0 0 3830               goto 3830;  -- JUMP
   135  op227  2304 4 1039 46         if R[4]~=46 then goto 2304; end;  -- conditional jump
   136  op190  0 0 4650               goto 4650;  -- JUMP
   145  op190  0 0 4304               goto 4304;  -- JUMP
   157  op190  0 0 1670               goto 1670;  -- JUMP
   158  op47   60 4 0 20              R[4]=(20);  -- LOADK / LOADN
   159  op190  0 0 3298               goto 3298;  -- JUMP
   167  op138  335 4 459 41           if not(not(41<R[4])) then else H=(335); end;  -- NOT
   168  op190  0 0 801                goto 801;  -- JUMP
   173  op215  13 18 0                R[18]=(d[17][13]);  -- register read / table index
   174  op190  0 0 1354               goto 1354;  -- JUMP
   175  op78   8 82 1 48              R[82]=(R[1][48]);  -- register move / read
   176  op216  0 0 83                 R[83]=nil;  -- LOADNIL
   177  op47   828 4 0 93             R[4]=(93);  -- LOADK / LOADN
   178  op190  0 0 669                goto 669;  -- JUMP
   184  op190  0 0 1035               goto 1035;  -- JUMP
   222  op137  506 4 1070 55          if not(not(R[4]<55)) then else goto 506; end;  -- NOT
   223  op190  0 0 5103               goto 5103;  -- JUMP
   265  op106  18 0 98                z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[98]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;  -- NEWCLOSURE
   266  op106  41 0 99                z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[99]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;  -- NEWCLOSURE
   267  op106  24 0 100               z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[100]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;  -- NEWCLOSURE
   268  op190  0 0 2510               goto 2510;  -- JUMP
   300  op78   326 117 1 176          R[117]=(R[1][176]);  -- register move / read
   301  op52   0 0 115                z=(115); (R[z])(R[z+1],R[z+2]); P=z-1;  -- ADD
   302  op47   49 4 0 124             R[4]=(124);  -- LOADK / LOADN
   303  op190  0 0 3722               goto 3722;  -- JUMP
   306  op78   115 91 1 44            R[91]=(R[1][44]);  -- register move / read
   307  op47   111 4 0 58             R[4]=(58);  -- LOADK / LOADN
   308  op190  0 0 1281               goto 1281;  -- JUMP
   316  op138  4960 4 221 14          if not(not(14<R[4])) then else H=(4960); end;  -- NOT
   317  op190  0 0 2904               goto 2904;  -- JUMP
   318  op101  43 43 35               R[43]=R[35][R[43]];  -- GETTABLE
```
