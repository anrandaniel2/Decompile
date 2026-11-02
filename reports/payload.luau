-- Recovered Luau source for the protected payload of Key.luau.
--
-- Produced by tools/lift.py from the VM program captured at the interpreter's
-- dispatch site (tools/harness). Every proto of the VM program became one Luau
-- function here. Conventions:
--
--   R[n]        register n of the proto (the VM's register file)
--   ...         parameters
--   Protos[n]   the proto table (closure creation reads it)
--   PC          the next block to run
--
-- The payload's basic blocks are laid out in permuted order and joined by
-- explicit jumps (a block-flattening pass ran before Luraph did), so control
-- flow is expressed as a block dispatch loop. Blocks were re-laid out in
-- reverse postorder first, so reading top to bottom follows the flow.
--
-- Constants were pre-resolved by the obfuscator and appear inline as literals.

-- proto P1: 5739 instructions, 3265 blocks, 1133 executed in the captured run
local function p1(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 9
            continue
        end
        -- block @ 40: 1 instruction
        if PC == 40 then
            if not(not(9<R[157])) then PC = 41 else PC = 883 end;
            continue
        end
        -- block @ 41: 1 instruction
        if PC == 41 then
            PC = 1861
            continue
        end
        -- block @ 42: 4 instructions
        if PC == 42 then
            R[160]=R[97];
            R[161]=R[159];
            R[162]=R[157];
            PC = 2618
            continue
        end
        -- block @ 47: 1 instruction
        if PC == 47 then
            if not(not(57<R[4])) then PC = 48 else PC = 1687 end;
            continue
        end
        -- block @ 48: 1 instruction
        if PC == 48 then
            PC = 4143
            continue
        end
        -- block @ 49: 1 instruction
        if PC == 49 then
            if R[4]~=126 then PC = 1022 else PC = 50 end;
            continue
        end
        -- block @ 50: 1 instruction
        if PC == 50 then
            PC = 2231
            continue
        end
        -- block @ 51: 1 instruction
        if PC == 51 then
            if not R[154] then PC = 2565 else PC = 52 end;
            continue
        end
        -- block @ 52: 1 instruction
        if PC == 52 then
            PC = 591
            continue
        end
        -- block @ 53: 1 instruction
        if PC == 53 then
            PC = 1876
            continue
        end
        -- block @ 55: 5 instructions
        if PC == 55 then
            R[129]=R[15];
            z=R; x=130; J=R;
            F=(14); J=(J[F]); (z)[x]=J;
            R[131]=R[127];
            PC = 5200
            continue
        end
        -- block @ 61: 1 instruction
        if PC == 61 then
            if R[155]~=192 then PC = 2675 else PC = 62 end;
            continue
        end
        -- block @ 62: 1 instruction
        if PC == 62 then
            PC = 996
            continue
        end
        -- block @ 63: 2 instructions
        if PC == 63 then
            R[54]=(d[17][5]);
            PC = 3808
            continue
        end
        -- block @ 66: 1 instruction
        if PC == 66 then
            if not(not(40<R[154])) then PC = 67 else PC = 715 end;
            continue
        end
        -- block @ 67: 1 instruction
        if PC == 67 then
            PC = 1674
            continue
        end
        -- block @ 68: 1 instruction
        if PC == 68 then
            if not(not(R[152]<284)) then PC = 69 else PC = 3110 end;
            continue
        end
        -- block @ 69: 1 instruction
        if PC == 69 then
            PC = 1359
            continue
        end
        -- block @ 70: 1 instruction
        if PC == 70 then
            if not(not(52<R[150])) then PC = 71 else PC = 1588 end;
            continue
        end
        -- block @ 71: 1 instruction
        if PC == 71 then
            PC = 2287
            continue
        end
        -- block @ 72: 1 instruction
        if PC == 72 then
            if not(not(R[4]<=69)) then PC = 73 else PC = 1433 end;
            continue
        end
        -- block @ 73: 1 instruction
        if PC == 73 then
            PC = 1151
            continue
        end
        -- block @ 74: 1 instruction
        if PC == 74 then
            if not(not(74<R[150])) then PC = 75 else PC = 4434 end;
            continue
        end
        -- block @ 75: 1 instruction
        if PC == 75 then
            PC = 1990
            continue
        end
        -- block @ 76: 1 instruction
        if PC == 76 then
            if R[150]~=87 then PC = 1846 else PC = 77 end;
            continue
        end
        -- block @ 77: 1 instruction
        if PC == 77 then
            PC = 3520
            continue
        end
        -- block @ 78: 1 instruction
        if PC == 78 then
            PC = 538
            continue
        end
        -- block @ 79: 1 instruction
        if PC == 79 then
            if not(not(58<R[152])) then PC = 80 else PC = 2901 end;
            continue
        end
        -- block @ 80: 1 instruction
        if PC == 80 then
            PC = 2997
            continue
        end
        -- block @ 81: 3 instructions
        if PC == 81 then
            R[158]=R[98];
            z=(159); x=R[153]; R[z+1]=(x); R[z]=x["NextNumber"];
            PC = 5462
            continue
        end
        -- block @ 85: 4 instructions
        if PC == 85 then
            R[131]=R[131]/65536;
            z=(130); (R[z])(R[z+1]); P=(z-1);
            R[132]=(R[1][48]);
            PC = 1315
            continue
        end
        -- block @ 90: 6 instructions
        if PC == 90 then
            R[152]=R[11];
            P=152; R[P]=R[P]();
            R[153]=(R[149][25]);
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 4087
            continue
        end
        -- block @ 97: 3 instructions
        if PC == 97 then
            R[157]=(R[149][38]);
            R[158]=(1);
            PC = 2880
            continue
        end
        -- block @ 101: 3 instructions
        if PC == 101 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[85]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            R[86]=(R[1][73]);
            PC = 2752
            continue
        end
        -- block @ 105: 6 instructions
        if PC == 105 then
            R[151]=R[98];
            R[153]=R[11];
            P=153; R[P]=R[P]();
            R[154]=(2);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 1872
            continue
        end
        -- block @ 112: 3 instructions
        if PC == 112 then
            R[179]=(R[66]..R[74]);
            R[65]=(R[1][133]);
            PC = 4255
            continue
        end
        -- block @ 117: 6 instructions
        if PC == 117 then
            R[153]=R[97];
            R[154]=(R[1][33]);
            R[155]=R[44];
            R[156]=R[148];
            z=155; R[z]=R[z](R[z+1]); P=z;
            PC = 3179
            continue
        end
        -- block @ 124: 1 instruction
        if PC == 124 then
            PC = 2518
            continue
        end
        -- block @ 126: 3 instructions
        if PC == 126 then
            R[148]=R[151];
            R[149]=R[152];
            PC = 5599
            continue
        end
        -- block @ 130: 3 instructions
        if PC == 130 then
            R[156]=R[113];
            P=156; R[P]=R[P]();
            PC = 2642
            continue
        end
        -- block @ 134: 1 instruction
        if PC == 134 then
            if R[153]~=68 then PC = 469 else PC = 135 end;
            continue
        end
        -- block @ 135: 1 instruction
        if PC == 135 then
            PC = 1404
            continue
        end
        -- block @ 136: 1 instruction
        if PC == 136 then
            PC = 27
            continue
        end
        -- block @ 137: 1 instruction
        if PC == 137 then
            if not(not(94<R[154])) then PC = 138 else PC = 3541 end;
            continue
        end
        -- block @ 138: 1 instruction
        if PC == 138 then
            PC = 2467
            continue
        end
        -- block @ 139: 3 instructions
        if PC == 139 then
            R[154]=(122);
            R[155]=(332);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(154); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 3289
            continue
        end
        -- block @ 143: 1 instruction
        if PC == 143 then
            if R[157]~=116 then PC = 945 else PC = 144 end;
            continue
        end
        -- block @ 144: 1 instruction
        if PC == 144 then
            PC = 3414
            continue
        end
        -- block @ 145: 1 instruction
        if PC == 145 then
            if R[148] then PC = 4039 else PC = 146 end;
            continue
        end
        -- block @ 146: 1 instruction
        if PC == 146 then
            PC = 3539
            continue
        end
        -- block @ 147: 3 instructions
        if PC == 147 then
            R[149]=(41);
            R[150]=R[98];
            PC = 4612
            continue
        end
        -- block @ 151: 2 instructions
        if PC == 151 then
            z=125; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 3846
            continue
        end
        -- block @ 154: 1 instruction
        if PC == 154 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 155 else R[160+3]=y; PC = 3931 end;
            continue
        end
        -- block @ 155: 1 instruction
        if PC == 155 then
            PC = 77
            continue
        end
        -- block @ 156: 5 instructions
        if PC == 156 then
            R[153]=(R[148][22]);
            z=R; x=154;
            J=1; z[x]=J;
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 3829
            continue
        end
        -- block @ 162: 1 instruction
        if PC == 162 then
            if not(not(R[4]<113)) then PC = 163 else PC = 1402 end;
            continue
        end
        -- block @ 163: 1 instruction
        if PC == 163 then
            PC = 588
            continue
        end
        -- block @ 164: 3 instructions
        if PC == 164 then
            R[160]=R[153];
            z=158; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 3097
            continue
        end
        -- block @ 168: 1 instruction
        if PC == 168 then
            if R[149]~=41 then PC = 2992 else PC = 169 end;
            continue
        end
        -- block @ 169: 1 instruction
        if PC == 169 then
            PC = 5442
            continue
        end
        -- block @ 170: 1 instruction
        if PC == 170 then
            PC = 4856
            continue
        end
        -- block @ 171: 1 instruction
        if PC == 171 then
            PC = 4363
            continue
        end
        -- block @ 172: 1 instruction
        if PC == 172 then
            PC = 1259
            continue
        end
        -- block @ 173: 1 instruction
        if PC == 173 then
            if R[4]~=46 then PC = 2329 else PC = 174 end;
            continue
        end
        -- block @ 174: 1 instruction
        if PC == 174 then
            PC = 4657
            continue
        end
        -- block @ 175: 7 instructions
        if PC == 175 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[156]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            R[157]=R[156];
            R[158]=R[151];
            z=157; R[z]=R[z](R[z+1]); P=z;
            R[158]=(R[1][48]);
            R[159]=(R[1][48]);
            PC = 244
            continue
        end
        -- block @ 183: 2 instructions
        if PC == 183 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 2080
            continue
        end
        -- block @ 186: 3 instructions
        if PC == 186 then
            R[151]=(R[148][18]);
            R[138][3]=R[151];
            PC = 4228
            continue
        end
        -- block @ 190: 1 instruction
        if PC == 190 then
            PC = 2196
            continue
        end
        -- block @ 191: 2 instructions
        if PC == 191 then
            R[155]=(R[149][62]);
            PC = 3894
            continue
        end
        -- block @ 194: 1 instruction
        if PC == 194 then
            PC = 1699
            continue
        end
        -- block @ 195: 1 instruction
        if PC == 195 then
            PC = 3315
            continue
        end
        -- block @ 197: 1 instruction
        if PC == 197 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 198 else R[151+3]=y; PC = 4736 end;
            continue
        end
        -- block @ 198: 1 instruction
        if PC == 198 then
            PC = 965
            continue
        end
        -- block @ 199: 1 instruction
        if PC == 199 then
            if not(not(R[153]<43)) then PC = 200 else PC = 1689 end;
            continue
        end
        -- block @ 200: 1 instruction
        if PC == 200 then
            PC = 590
            continue
        end
        -- block @ 201: 2 instructions
        if PC == 201 then
            R[156]=R[66];
            PC = 4761
            continue
        end
        -- block @ 204: 1 instruction
        if PC == 204 then
            if not(not(41<R[4])) then PC = 205 else PC = 371 end;
            continue
        end
        -- block @ 205: 1 instruction
        if PC == 205 then
            PC = 834
            continue
        end
        -- block @ 206: 3 instructions
        if PC == 206 then
            R[155]=R[97];
            R[156]=R[11];
            PC = 3493
            continue
        end
        -- block @ 210: 1 instruction
        if PC == 210 then
            PC = 1384
            continue
        end
        -- block @ 212: 3 instructions
        if PC == 212 then
            R[82]=(R[1][48]);
            R[83]=nil;
            PC = 704
            continue
        end
        -- block @ 216: 1 instruction
        if PC == 216 then
            if not(not(136<R[154])) then PC = 217 else PC = 3918 end;
            continue
        end
        -- block @ 217: 1 instruction
        if PC == 217 then
            PC = 1522
            continue
        end
        -- block @ 218: 2 instructions
        if PC == 218 then
            R[158]=(1);
            PC = 37
            continue
        end
        -- block @ 221: 1 instruction
        if PC == 221 then
            PC = 1067
            continue
        end
        -- block @ 222: 2 instructions
        if PC == 222 then
            R[155]=R[156];
            PC = 855
            continue
        end
        -- block @ 225: 1 instruction
        if PC == 225 then
            PC = 3838
            continue
        end
        -- block @ 226: 3 instructions
        if PC == 226 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(R[149][70]);
            PC = 4648
            continue
        end
        -- block @ 230: 1 instruction
        if PC == 230 then
            if R[150]~=8 then PC = 231 else PC = 2211 end;
            continue
        end
        -- block @ 231: 1 instruction
        if PC == 231 then
            PC = 2774
            continue
        end
        -- block @ 232: 1 instruction
        if PC == 232 then
            PC = 1010
            continue
        end
        -- block @ 233: 1 instruction
        if PC == 233 then
            PC = 5198
            continue
        end
        -- block @ 235: 2 instructions
        if PC == 235 then
            R[155]=(R[149][60]);
            PC = 2492
            continue
        end
        -- block @ 238: 3 instructions
        if PC == 238 then
            R[153]=(R[148][18]);
            R[154]=(1);
            PC = 4585
            continue
        end
        -- block @ 242: 1 instruction
        if PC == 242 then
            if not(not(R[150]<50)) then PC = 243 else PC = 2856 end;
            continue
        end
        -- block @ 243: 1 instruction
        if PC == 243 then
            PC = 1943
            continue
        end
        -- block @ 244: 1 instruction
        if PC == 244 then
            PC = 2080
            continue
        end
        -- block @ 245: 2 instructions
        if PC == 245 then
            R[161]=(153);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(160); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 153
            continue
        end
        -- block @ 248: 6 instructions
        if PC == 248 then
            R[153]=(R[1][174]);
            z=R; x=154; J=R;
            F=(123); J=(J[F]); (z)[x]=J;
            R[155]=(0);
            R[156]=(0);
            PC = 2567
            continue
        end
        -- block @ 255: 1 instruction
        if PC == 255 then
            if R[150]~=63 then PC = 3970 else PC = 256 end;
            continue
        end
        -- block @ 256: 1 instruction
        if PC == 256 then
            PC = 4820
            continue
        end
        -- block @ 257: 1 instruction
        if PC == 257 then
            PC = 1105
            continue
        end
        -- block @ 259: 1 instruction
        if PC == 259 then
            if not(not(R[4]<55)) then PC = 260 else PC = 542 end;
            continue
        end
        -- block @ 260: 1 instruction
        if PC == 260 then
            PC = 5106
            continue
        end
        -- block @ 261: 1 instruction
        if PC == 261 then
            if R[154]~=156 then PC = 2543 else PC = 262 end;
            continue
        end
        -- block @ 262: 1 instruction
        if PC == 262 then
            PC = 2821
            continue
        end
        -- block @ 263: 3 instructions
        if PC == 263 then
            R[150]=(33);
            R[151]=(R[149][15]);
            PC = 5612
            continue
        end
        -- block @ 267: 5 instructions
        if PC == 267 then
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[149][32]);
            R[158]=(2);
            PC = 2604
            continue
        end
        -- block @ 273: 5 instructions
        if PC == 273 then
            R[135]=R[131];
            R[136]=R[52];
            z=(135); (R[z])(R[z+1]); P=(z-1);
            R[135]=(R[1][48]);
            PC = 3256
            continue
        end
        -- block @ 279: 1 instruction
        if PC == 279 then
            PC = 161
            continue
        end
        -- block @ 281: 1 instruction
        if PC == 281 then
            if not(not(14<R[160])) then PC = 282 else PC = 1157 end;
            continue
        end
        -- block @ 282: 1 instruction
        if PC == 282 then
            PC = 2449
            continue
        end
        -- block @ 283: 3 instructions
        if PC == 283 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[157]=(R[1][155]);
            PC = 5476
            continue
        end
        -- block @ 287: 1 instruction
        if PC == 287 then
            PC = 2903
            continue
        end
        -- block @ 289: 2 instructions
        if PC == 289 then
            R[155]=R[29];
            PC = 1209
            continue
        end
        -- block @ 292: 2 instructions
        if PC == 292 then
            R[151]=(0);
            PC = 1793
            continue
        end
        -- block @ 295: 3 instructions
        if PC == 295 then
            R[151]=R[148][R[151]];
            R[152]=(R[1][62]);
            PC = 3481
            continue
        end
        -- block @ 299: 2 instructions
        if PC == 299 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[131]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 4443
            continue
        end
        -- block @ 302: 3 instructions
        if PC == 302 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[98]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[99]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 2533
            continue
        end
        -- block @ 306: 3 instructions
        if PC == 306 then
            R[166]=R[69];
            R[167]=R[163];
            PC = 4861
            continue
        end
        -- block @ 310: 1 instruction
        if PC == 310 then
            PC = 3879
            continue
        end
        -- block @ 311: 2 instructions
        if PC == 311 then
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 3861
            continue
        end
        -- block @ 315: 6 instructions
        if PC == 315 then
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            R[153]=(R[149][11]);
            R[154]=(2);
            PC = 5508
            continue
        end
        -- block @ 322: 1 instruction
        if PC == 322 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 5184
            continue
        end
        -- block @ 324: 4 instructions
        if PC == 324 then
            R[144]=R[94];
            R[145]=R[47];
            R[146]=(R[1][96]);
            PC = 1536
            continue
        end
        -- block @ 329: 1 instruction
        if PC == 329 then
            if R[154]~=211 then PC = 5395 else PC = 330 end;
            continue
        end
        -- block @ 330: 1 instruction
        if PC == 330 then
            PC = 4603
            continue
        end
        -- block @ 331: 5 instructions
        if PC == 331 then
            R[165]=(0);
            z=163; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[164]=(77);
            R[165]=(103);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(164); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2512
            continue
        end
        -- block @ 337: 3 instructions
        if PC == 337 then
            R[117]=(R[1][176]);
            z=(115); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3738
            continue
        end
        -- block @ 341: 1 instruction
        if PC == 341 then
            if R[4]~=33 then PC = 3774 else PC = 342 end;
            continue
        end
        -- block @ 342: 1 instruction
        if PC == 342 then
            PC = 4503
            continue
        end
        -- block @ 343: 2 instructions
        if PC == 343 then
            R[91]=(R[1][44]);
            PC = 26
            continue
        end
        -- block @ 346: 1 instruction
        if PC == 346 then
            if R[158]~=105 then PC = 5521 else PC = 347 end;
            continue
        end
        -- block @ 347: 2 instructions
        if PC == 347 then
            R[155]=(R[149][17]);
            PC = 5395
            continue
        end
        -- block @ 350: 1 instruction
        if PC == 350 then
            if R[152]~=62 then PC = 1144 else PC = 351 end;
            continue
        end
        -- block @ 351: 1 instruction
        if PC == 351 then
            PC = 3851
            continue
        end
        -- block @ 352: 1 instruction
        if PC == 352 then
            if not(not(14<R[4])) then PC = 353 else PC = 4964 end;
            continue
        end
        -- block @ 353: 1 instruction
        if PC == 353 then
            PC = 2923
            continue
        end
        -- block @ 354: 7 instructions
        if PC == 354 then
            R[43]=R[35][R[43]];
            R[44]=(R[1][13]);
            R[45]=(R[1][31]);
            R[46]=(R[1][48]);
            R[47]=(R[1][48]);
            R[48]=nil;
            PC = 3447
            continue
        end
        -- block @ 362: 1 instruction
        if PC == 362 then
            if not(not(R[4]<32)) then PC = 363 else PC = 5136 end;
            continue
        end
        -- block @ 363: 1 instruction
        if PC == 363 then
            PC = 3656
            continue
        end
        -- block @ 364: 3 instructions
        if PC == 364 then
            R[153]=(R[149][16]);
            R[154]=(2);
            PC = 5145
            continue
        end
        -- block @ 368: 1 instruction
        if PC == 368 then
            PC = 3057
            continue
        end
        -- block @ 369: 2 instructions
        if PC == 369 then
            R[158]=(2);
            PC = 669
            continue
        end
        -- block @ 372: 1 instruction
        if PC == 372 then
            if not(not(67<R[4])) then PC = 373 else PC = 4971 end;
            continue
        end
        -- block @ 373: 1 instruction
        if PC == 373 then
            PC = 3364
            continue
        end
        -- block @ 374: 6 instructions
        if PC == 374 then
            R[158]=R[92];
            R[159]=(R[154]["Parent"]);
            R[160]=(R[1][4]);
            z=(158); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[158]=R[92];
            PC = 3732
            continue
        end
        -- block @ 381: 2 instructions
        if PC == 381 then
            R[154]=(2);
            PC = 4363
            continue
        end
        -- block @ 384: 1 instruction
        if PC == 384 then
            PC = 2756
            continue
        end
        -- block @ 385: 5 instructions
        if PC == 385 then
            R[149]=R[149][R[150]];
            R[150]=R[97];
            R[151]=R[88];
            R[152]=R[149];
            PC = 1834
            continue
        end
        -- block @ 391: 1 instruction
        if PC == 391 then
            PC = 5024
            continue
        end
        -- block @ 392: 3 instructions
        if PC == 392 then
            R[151]=R[88];
            R[152]=R[149];
            PC = 5121
            continue
        end
        -- block @ 396: 1 instruction
        if PC == 396 then
            if R[4]~=40 then PC = 1318 else PC = 397 end;
            continue
        end
        -- block @ 397: 1 instruction
        if PC == 397 then
            PC = 2959
            continue
        end
        -- block @ 398: 1 instruction
        if PC == 398 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 399 else R[152+3]=y; PC = 3176 end;
            continue
        end
        -- block @ 399: 1 instruction
        if PC == 399 then
            PC = 3318
            continue
        end
        -- block @ 400: 1 instruction
        if PC == 400 then
            PC = 2987
            continue
        end
        -- block @ 401: 1 instruction
        if PC == 401 then
            if not(not(R[152]<54)) then PC = 402 else PC = 5629 end;
            continue
        end
        -- block @ 402: 1 instruction
        if PC == 402 then
            PC = 3382
            continue
        end
        -- block @ 403: 6 instructions
        if PC == 403 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(R[149][12]);
            R[138][55]=R[151];
            R[151]=(59);
            R[152]=(76);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 1476
            continue
        end
        -- block @ 410: 3 instructions
        if PC == 410 then
            R[156]=R[98];
            R[157]=(R[1][61]);
            PC = 2157
            continue
        end
        -- block @ 414: 5 instructions
        if PC == 414 then
            z=R; x=136; J=R;
            F=(131); J=(J[F]); (z)[x]=J;
            R[137]=R[58];
            z=(136); (R[z])(R[z+1]); P=(z-1);
            PC = 3256
            continue
        end
        -- block @ 420: 3 instructions
        if PC == 420 then
            R[135]=R[131];
            R[136]=R[45];
            PC = 272
            continue
        end
        -- block @ 424: 1 instruction
        if PC == 424 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 425 else R[158+3]=y; PC = 994 end;
            continue
        end
        -- block @ 425: 1 instruction
        if PC == 425 then
            PC = 169
            continue
        end
        -- block @ 426: 1 instruction
        if PC == 426 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 3894
            continue
        end
        -- block @ 427: 1 instruction
        if PC == 427 then
            PC = 1203
            continue
        end
        -- block @ 428: 1 instruction
        if PC == 428 then
            PC = 1427
            continue
        end
        -- block @ 429: 3 instructions
        if PC == 429 then
            R[157]=(R[1][48]);
            R[158]=(R[1][48]);
            PC = 3569
            continue
        end
        -- block @ 433: 1 instruction
        if PC == 433 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(163); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 3729
            continue
        end
        -- block @ 434: 5 instructions
        if PC == 434 then
            R[150]=(115);
            R[151]=R[98];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 380
            continue
        end
        -- block @ 440: 4 instructions
        if PC == 440 then
            R[158]=R[98];
            R[159]=R[154];
            R[160]=R[155];
            PC = 5085
            continue
        end
        -- block @ 445: 1 instruction
        if PC == 445 then
            if not(not(0<R[4])) then PC = 446 else PC = 4983 end;
            continue
        end
        -- block @ 446: 1 instruction
        if PC == 446 then
            PC = 3424
            continue
        end
        -- block @ 447: 1 instruction
        if PC == 447 then
            if not(not(R[154]<108)) then PC = 448 else PC = 4415 end;
            continue
        end
        -- block @ 448: 1 instruction
        if PC == 448 then
            PC = 3769
            continue
        end
        -- block @ 449: 3 instructions
        if PC == 449 then
            R[143]=R[131];
            R[144]=R[51];
            PC = 1143
            continue
        end
        -- block @ 453: 3 instructions
        if PC == 453 then
            R[161]=(R[1][48]);
            R[162]=(R[1][48]);
            PC = 3866
            continue
        end
        -- block @ 457: 1 instruction
        if PC == 457 then
            PC = 5650
            continue
        end
        -- block @ 458: 1 instruction
        if PC == 458 then
            PC = 3470
            continue
        end
        -- block @ 460: 3 instructions
        if PC == 460 then
            R[113]=R[94];
            R[114]=R[52];
            PC = 613
            continue
        end
        -- block @ 464: 5 instructions
        if PC == 464 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[154]=(R[1][48]);
            R[155]=(100);
            R[156]=(278);
            PC = 685
            continue
        end
        -- block @ 470: 1 instruction
        if PC == 470 then
            if R[153]~=83 then PC = 133 else PC = 471 end;
            continue
        end
        -- block @ 471: 1 instruction
        if PC == 471 then
            PC = 5390
            continue
        end
        -- block @ 472: 2 instructions
        if PC == 472 then
            z=(148); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 1809
            continue
        end
        -- block @ 475: 4 instructions
        if PC == 475 then
            R[159]=(R[1][48]);
            R[160]=(37);
            R[161]=(104);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(160); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2373
            continue
        end
        -- block @ 480: 2 instructions
        if PC == 480 then
            R[82]=(R[1][78]);
            PC = 4034
            continue
        end
        -- block @ 483: 1 instruction
        if PC == 483 then
            if not(not(R[4]<58)) then PC = 484 else PC = 5070 end;
            continue
        end
        -- block @ 484: 1 instruction
        if PC == 484 then
            PC = 1435
            continue
        end
        -- block @ 485: 1 instruction
        if PC == 485 then
            if R[154]~=403 then PC = 2304 else PC = 486 end;
            continue
        end
        -- block @ 486: 1 instruction
        if PC == 486 then
            PC = 367
            continue
        end
        -- block @ 487: 1 instruction
        if PC == 487 then
            if not(not(R[4]<66)) then PC = 488 else PC = 1360 end;
            continue
        end
        -- block @ 488: 1 instruction
        if PC == 488 then
            PC = 5242
            continue
        end
        -- block @ 489: 2 instructions
        if PC == 489 then
            R[155]=(R[149][69]);
            PC = 2389
            continue
        end
        -- block @ 492: 1 instruction
        if PC == 492 then
            PC = 2901
            continue
        end
        -- block @ 493: 1 instruction
        if PC == 493 then
            PC = 2829
            continue
        end
        -- block @ 494: 3 instructions
        if PC == 494 then
            R[151]=R[98];
            R[152]=(R[148][10]);
            PC = 5614
            continue
        end
        -- block @ 498: 3 instructions
        if PC == 498 then
            R[138]=R[131];
            R[139]=R[15];
            PC = 3784
            continue
        end
        -- block @ 502: 5 instructions
        if PC == 502 then
            R[151]=(R[149][68]);
            R[138][87]=R[151];
            R[151]=(7);
            R[152]=(16);
            PC = 4620
            continue
        end
        -- block @ 508: 1 instruction
        if PC == 508 then
            if not(not(R[157]<77)) then PC = 509 else PC = 1 end;
            continue
        end
        -- block @ 509: 1 instruction
        if PC == 509 then
            PC = 2194
            continue
        end
        -- block @ 510: 5 instructions
        if PC == 510 then
            R[150]=R[38][R[150]];
            z=149; R[z]=R[z](R[z+1]); P=z;
            R[149]=(not R[149]);
            R[150]=(R[1][4]);
            PC = 2709
            continue
        end
        -- block @ 516: 1 instruction
        if PC == 516 then
            if not(not(122<R[157])) then PC = 517 else PC = 3543 end;
            continue
        end
        -- block @ 517: 1 instruction
        if PC == 517 then
            PC = 3123
            continue
        end
        -- block @ 518: 3 instructions
        if PC == 518 then
            R[155]=R[88];
            R[156]=R[153];
            PC = 867
            continue
        end
        -- block @ 522: 1 instruction
        if PC == 522 then
            if R[154]~=75 then PC = 3972 else PC = 523 end;
            continue
        end
        -- block @ 523: 1 instruction
        if PC == 523 then
            PC = 5262
            continue
        end
        -- block @ 524: 1 instruction
        if PC == 524 then
            if R[155]~=150 then PC = 5039 else PC = 525 end;
            continue
        end
        -- block @ 525: 1 instruction
        if PC == 525 then
            PC = 2692
            continue
        end
        -- block @ 526: 1 instruction
        if PC == 526 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(152); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 397
            continue
        end
        -- block @ 528: 3 instructions
        if PC == 528 then
            R[112]=({});
            R[107]=R[112];
            PC = 5007
            continue
        end
        -- block @ 532: 2 instructions
        if PC == 532 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 1627
            continue
        end
        -- block @ 535: 1 instruction
        if PC == 535 then
            if not(not(169<R[157])) then PC = 536 else PC = 515 end;
            continue
        end
        -- block @ 536: 1 instruction
        if PC == 536 then
            PC = 1721
            continue
        end
        -- block @ 537: 1 instruction
        if PC == 537 then
            if R[154]~=70 then PC = 5647 else PC = 538 end;
            continue
        end
        -- block @ 538: 1 instruction
        if PC == 538 then
            PC = 795
            continue
        end
        -- block @ 539: 3 instructions
        if PC == 539 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[160]=R[97];
            PC = 3071
            continue
        end
        -- block @ 543: 1 instruction
        if PC == 543 then
            if not(not(R[4]<42)) then PC = 544 else PC = 1495 end;
            continue
        end
        -- block @ 544: 1 instruction
        if PC == 544 then
            PC = 5527
            continue
        end
        -- block @ 545: 4 instructions
        if PC == 545 then
            P=152; R[P]=R[P]();
            R[153]=(R[149][4]);
            R[154]=(1);
            PC = 2827
            continue
        end
        -- block @ 550: 5 instructions
        if PC == 550 then
            R[155]=R[98];
            R[156]=(R[149][59]);
            R[157]=R[11];
            P=157; R[P]=R[P]();
            PC = 4941
            continue
        end
        -- block @ 556: 1 instruction
        if PC == 556 then
            if not(not(R[151]<=1)) then PC = 557 else PC = 4919 end;
            continue
        end
        -- block @ 557: 1 instruction
        if PC == 557 then
            PC = 4746
            continue
        end
        -- block @ 558: 4 instructions
        if PC == 558 then
            z=(166); x=R[150]; R[z+1]=(x); R[z]=x["Destroy"];
            z=(166); (R[z])(R[z+1]); P=(z-1);
            local w=148; if not(i) then else for u,e in i do if not(u>=w) then else(e)[1]=e; (e)[2]=(R[u]); (e)[3]=2; (i)[u]=(nil); end; end; end;
            PC = 2080
            continue
        end
        -- block @ 563: 1 instruction
        if PC == 563 then
            if not(not(R[4]<74)) then PC = 564 else PC = 2093 end;
            continue
        end
        -- block @ 564: 1 instruction
        if PC == 564 then
            PC = 497
            continue
        end
        -- block @ 565: 1 instruction
        if PC == 565 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 196
            continue
        end
        -- block @ 566: 1 instruction
        if PC == 566 then
            PC = 5117
            continue
        end
        -- block @ 567: 3 instructions
        if PC == 567 then
            R[164]=(0);
            R[165]=(255);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(164); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2851
            continue
        end
        -- block @ 571: 1 instruction
        if PC == 571 then
            PC = 2080
            continue
        end
        -- block @ 572: 4 instructions
        if PC == 572 then
            R[150]=(88);
            R[151]=R[97];
            R[152]=R[11];
            PC = 651
            continue
        end
        -- block @ 577: 1 instruction
        if PC == 577 then
            if not(not(R[150]<100)) then PC = 578 else PC = 4363 end;
            continue
        end
        -- block @ 578: 1 instruction
        if PC == 578 then
            PC = 2511
            continue
        end
        -- block @ 579: 2 instructions
        if PC == 579 then
            R[156]=(227);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(155); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 4878
            continue
        end
        -- block @ 582: 2 instructions
        if PC == 582 then
            R[71]=(R[37]["readu32"]);
            PC = 4281
            continue
        end
        -- block @ 585: 1 instruction
        if PC == 585 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 1459
            continue
        end
        -- block @ 587: 1 instruction
        if PC == 587 then
            if R[159]~=127 then PC = 588 else PC = 3698 end;
            continue
        end
        -- block @ 588: 1 instruction
        if PC == 588 then
            PC = 4727
            continue
        end
        -- block @ 589: 1 instruction
        if PC == 589 then
            if not(not(28<R[4])) then PC = 590 else PC = 1402 end;
            continue
        end
        -- block @ 590: 1 instruction
        if PC == 590 then
            PC = 2128
            continue
        end
        -- block @ 591: 1 instruction
        if PC == 591 then
            PC = 744
            continue
        end
        -- block @ 592: 1 instruction
        if PC == 592 then
            PC = 5361
            continue
        end
        -- block @ 593: 1 instruction
        if PC == 593 then
            PC = 2948
            continue
        end
        -- block @ 595: 2 instructions
        if PC == 595 then
            R[152]=(499);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 5395
            continue
        end
        -- block @ 598: 1 instruction
        if PC == 598 then
            PC = 4078
            continue
        end
        -- block @ 599: 1 instruction
        if PC == 599 then
            if not(not(58<R[4])) then PC = 600 else PC = 4492 end;
            continue
        end
        -- block @ 600: 1 instruction
        if PC == 600 then
            PC = 3647
            continue
        end
        -- block @ 601: 1 instruction
        if PC == 601 then
            if R[154]~=113 then PC = 3691 else PC = 602 end;
            continue
        end
        -- block @ 602: 1 instruction
        if PC == 602 then
            PC = 4890
            continue
        end
        -- block @ 603: 2 instructions
        if PC == 603 then
            R[156]=(R[1][48]);
            PC = 822
            continue
        end
        -- block @ 606: 3 instructions
        if PC == 606 then
            R[155]=R[98];
            R[156]=R[11];
            PC = 1299
            continue
        end
        -- block @ 610: 3 instructions
        if PC == 610 then
            R[158]=(76);
            R[159]=(185);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(158); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 423
            continue
        end
        -- block @ 614: 3 instructions
        if PC == 614 then
            z=(113); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[113]=(R[1][48]);
            PC = 3349
            continue
        end
        -- block @ 618: 3 instructions
        if PC == 618 then
            R[153]=(R[1][7]);
            R[154]=R[123];
            PC = 5292
            continue
        end
        -- block @ 622: 10 instructions
        if PC == 622 then
            z=R; x=(163); J=k;
            F=(1);
            J=J[F]; F=155; J=(J[F]);
            z[x]=J;
            R[163]=R[158][R[163]];
            R[164]=(R[1][104]);
            R[163]=R[163][R[164]];
            R[163]=(R[163]*100);
            R[65]=(d[30](R[163],Y[H]));
            PC = 1313
            continue
        end
        -- block @ 633: 1 instruction
        if PC == 633 then
            PC = 100
            continue
        end
        -- block @ 635: 1 instruction
        if PC == 635 then
            PC = 2683
            continue
        end
        -- block @ 636: 9 instructions
        if PC == 636 then
            R[158]=R[98];
            z=(159); x=R[153]; R[z+1]=(x); R[z]=x["NextInteger"];
            R[161]=(95);
            R[162]=(405);
            z=159; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[160]=(150);
            R[161]=(R[1][4]);
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 3423
            continue
        end
        -- block @ 646: 4 instructions
        if PC == 646 then
            R[153]=R[148];
            R[154]=(1988356356);
            z=153; R[z]=R[z](R[z+1]); P=z;
            PC = 517
            continue
        end
        -- block @ 651: 1 instruction
        if PC == 651 then
            PC = 3724
            continue
        end
        -- block @ 652: 3 instructions
        if PC == 652 then
            R[153]=(R[148][16]);
            R[154]=(2);
            PC = 1201
            continue
        end
        -- block @ 656: 1 instruction
        if PC == 656 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(152); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2463
            continue
        end
        -- block @ 658: 3 instructions
        if PC == 658 then
            R[155]=R[98];
            R[156]=R[11];
            PC = 2256
            continue
        end
        -- block @ 662: 3 instructions
        if PC == 662 then
            z=(159); x=R[153]; R[z+1]=(x); R[z]=x["Clone"];
            z=159; R[z]=R[z](R[z+1]); P=z;
            PC = 4878
            continue
        end
        -- block @ 666: 3 instructions
        if PC == 666 then
            R[159]=(12);
            R[160]=(244);
            PC = 3209
            continue
        end
        -- block @ 670: 1 instruction
        if PC == 670 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 671 else R[151+3]=y; PC = 3948 end;
            continue
        end
        -- block @ 671: 1 instruction
        if PC == 671 then
            PC = 5051
            continue
        end
        -- block @ 672: 1 instruction
        if PC == 672 then
            PC = 971
            continue
        end
        -- block @ 673: 3 instructions
        if PC == 673 then
            R[19]=(R[1][64]);
            R[17]=R[2][R[19]];
            PC = 4831
            continue
        end
        -- block @ 677: 1 instruction
        if PC == 677 then
            PC = 3004
            continue
        end
        -- block @ 679: 4 instructions
        if PC == 679 then
            R[8]=(R[1][48]);
            R[9]=(R[1][48]);
            R[10]=(R[1][48]);
            PC = 3374
            continue
        end
        -- block @ 684: 1 instruction
        if PC == 684 then
            if R[154]~=17 then PC = 3250 else PC = 685 end;
            continue
        end
        -- block @ 685: 1 instruction
        if PC == 685 then
            PC = 3082
            continue
        end
        -- block @ 686: 1 instruction
        if PC == 686 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(155); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 3119
            continue
        end
        -- block @ 687: 3 instructions
        if PC == 687 then
            R[119]=R[94];
            R[120]=R[20];
            PC = 3744
            continue
        end
        -- block @ 691: 5 instructions
        if PC == 691 then
            R[148]=({});
            R[149]=(R[1][159]);
            R[149]=(R[149]["nfcnormalize"]);
            R[150]=(R[1][102]);
            PC = 2539
            continue
        end
        -- block @ 697: 3 instructions
        if PC == 697 then
            R[151]=(8);
            R[152]=(30);
            PC = 564
            continue
        end
        -- block @ 701: 3 instructions
        if PC == 701 then
            R[157]=(114);
            z=(158); x=R[154]; R[z+1]=(x); R[z]=x["Clone"];
            PC = 1331
            continue
        end
        -- block @ 705: 1 instruction
        if PC == 705 then
            PC = 4034
            continue
        end
        -- block @ 707: 1 instruction
        if PC == 707 then
            if R[150]~=28 then PC = 14 else PC = 708 end;
            continue
        end
        -- block @ 708: 1 instruction
        if PC == 708 then
            PC = 3555
            continue
        end
        -- block @ 709: 1 instruction
        if PC == 709 then
            PC = 3309
            continue
        end
        -- block @ 710: 5 instructions
        if PC == 710 then
            R[70]=(R[1][48]);
            R[71]=(R[1][48]);
            R[72]=(R[1][48]);
            R[73]=(R[1][48]);
            PC = 4281
            continue
        end
        -- block @ 716: 1 instruction
        if PC == 716 then
            if not(not(R[154]<66)) then PC = 717 else PC = 2457 end;
            continue
        end
        -- block @ 717: 1 instruction
        if PC == 717 then
            PC = 1230
            continue
        end
        -- block @ 718: 2 instructions
        if PC == 718 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[104]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 1462
            continue
        end
        -- block @ 721: 2 instructions
        if PC == 721 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 5612
            continue
        end
        -- block @ 724: 1 instruction
        if PC == 724 then
            if R[4]~=15 then PC = 1563 else PC = 725 end;
            continue
        end
        -- block @ 725: 1 instruction
        if PC == 725 then
            PC = 5407
            continue
        end
        -- block @ 726: 9 instructions
        if PC == 726 then
            R[31]=(d[17][11]);
            R[32]=(R[1][48]);
            R[33]=(R[1][48]);
            R[34]=(R[1][48]);
            R[35]=(R[1][48]);
            R[36]=(R[1][48]);
            R[37]=(R[1][48]);
            R[38]=(R[1][48]);
            PC = 935
            continue
        end
        -- block @ 736: 3 instructions
        if PC == 736 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=R[97];
            PC = 5159
            continue
        end
        -- block @ 740: 4 instructions
        if PC == 740 then
            R[62]=(R[1][48]);
            R[63]=(R[1][48]);
            R[64]=(R[1][48]);
            PC = 1757
            continue
        end
        -- block @ 745: 3 instructions
        if PC == 745 then
            R[154]=({});
            R[155]=(R[1][129]);
            PC = 5076
            continue
        end
        -- block @ 749: 4 instructions
        if PC == 749 then
            z=(161); x=R[153]; R[z+1]=(x); R[z]=x["GetPositionOnCurve"];
            R[163]=(0);
            z=161; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 27
            continue
        end
        -- block @ 754: 2 instructions
        if PC == 754 then
            R[12]=(0);
            PC = 2203
            continue
        end
        -- block @ 757: 2 instructions
        if PC == 757 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 229
            continue
        end
        -- block @ 760: 1 instruction
        if PC == 760 then
            PC = 857
            continue
        end
        -- block @ 761: 3 instructions
        if PC == 761 then
            R[149]=R[149]+R[158];
            R[151]=(R[151]+1);
            if not(not(50<R[151])) then PC = 764 else PC = 4909 end;
            continue
        end
        -- block @ 764: 1 instruction
        if PC == 764 then
            PC = 2872
            continue
        end
        -- block @ 765: 1 instruction
        if PC == 765 then
            if R[4]~=91 then PC = 766 else PC = 2190 end;
            continue
        end
        -- block @ 766: 1 instruction
        if PC == 766 then
            PC = 1592
            continue
        end
        -- block @ 767: 1 instruction
        if PC == 767 then
            if not(not(88<R[160])) then PC = 768 else PC = 27 end;
            continue
        end
        -- block @ 768: 1 instruction
        if PC == 768 then
            PC = 5512
            continue
        end
        -- block @ 770: 1 instruction
        if PC == 770 then
            PC = 3063
            continue
        end
        -- block @ 771: 3 instructions
        if PC == 771 then
            z=(120); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[120]=nil;
            PC = 3415
            continue
        end
        -- block @ 775: 1 instruction
        if PC == 775 then
            PC = 2492
            continue
        end
        -- block @ 777: 1 instruction
        if PC == 777 then
            if R[4]~=7 then PC = 4610 else PC = 778 end;
            continue
        end
        -- block @ 778: 1 instruction
        if PC == 778 then
            PC = 5153
            continue
        end
        -- block @ 779: 2 instructions
        if PC == 779 then
            R[154]=(1);
            PC = 2728
            continue
        end
        -- block @ 782: 1 instruction
        if PC == 782 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 783 else R[152+3]=y; PC = 3343 end;
            continue
        end
        -- block @ 783: 1 instruction
        if PC == 783 then
            PC = 5588
            continue
        end
        -- block @ 784: 1 instruction
        if PC == 784 then
            PC = 1648
            continue
        end
        -- block @ 786: 4 instructions
        if PC == 786 then
            z=(159); x=R[153]; R[z+1]=(x); R[z]=x["GetLength"];
            z=159; R[z]=R[z](R[z+1]); P=z;
            R[154]=R[159];
            PC = 3417
            continue
        end
        -- block @ 790: 1 instruction
        if PC == 790 then
            if R[504]<=l[H] then PC = 544 else PC = 791 end;
            continue
        end
        -- block @ 791: 3 instructions
        if PC == 791 then
            R[121]=R[94];
            R[122]=R[67];
            PC = 861
            continue
        end
        -- block @ 795: 1 instruction
        if PC == 795 then
            PC = 2444
            continue
        end
        -- block @ 796: 2 instructions
        if PC == 796 then
            R[155]=(R[148][23]);
            PC = 5213
            continue
        end
        -- block @ 799: 3 instructions
        if PC == 799 then
            R[155]=R[44];
            R[156]=R[152];
            PC = 2006
            continue
        end
        -- block @ 803: 1 instruction
        if PC == 803 then
            PC = 3978
            continue
        end
        -- block @ 804: 1 instruction
        if PC == 804 then
            if R[154]~=499 then PC = 328 else PC = 805 end;
            continue
        end
        -- block @ 805: 3 instructions
        if PC == 805 then
            z=(150); x=R[148]; R[z+1]=(x); R[z]=x["IsServer"];
            z=150; R[z]=R[z](R[z+1]); P=z;
            if not R[150] then PC = 2894 else PC = 808 end;
            continue
        end
        -- block @ 808: 1 instruction
        if PC == 808 then
            PC = 2342
            continue
        end
        -- block @ 809: 1 instruction
        if PC == 809 then
            if R[4]~=122 then PC = 5517 else PC = 810 end;
            continue
        end
        -- block @ 810: 1 instruction
        if PC == 810 then
            PC = 3926
            continue
        end
        -- block @ 811: 3 instructions
        if PC == 811 then
            R[153]=(D[H]);
            z=150; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            if R[141] then PC = 3481 else PC = 814 end;
            continue
        end
        -- block @ 814: 1 instruction
        if PC == 814 then
            PC = 5325
            continue
        end
        -- block @ 815: 3 instructions
        if PC == 815 then
            R[152]=(1);
            R[153]=(R[1][11]);
            PC = 1175
            continue
        end
        -- block @ 819: 3 instructions
        if PC == 819 then
            R[162]=R[144][R[158]];
            z=161; x=2; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            PC = 4979
            continue
        end
        -- block @ 823: 1 instruction
        if PC == 823 then
            if R[157]~=41 then PC = 142 else PC = 824 end;
            continue
        end
        -- block @ 824: 1 instruction
        if PC == 824 then
            PC = 3534
            continue
        end
        -- block @ 825: 1 instruction
        if PC == 825 then
            if not(not(57<R[153])) then PC = 826 else PC = 21 end;
            continue
        end
        -- block @ 826: 1 instruction
        if PC == 826 then
            PC = 2811
            continue
        end
        -- block @ 827: 1 instruction
        if PC == 827 then
            if not(not(100<R[158])) then PC = 828 else PC = 3119 end;
            continue
        end
        -- block @ 828: 1 instruction
        if PC == 828 then
            PC = 2679
            continue
        end
        -- block @ 829: 1 instruction
        if PC == 829 then
            PC = 9
            continue
        end
        -- block @ 831: 1 instruction
        if PC == 831 then
            if not(not(33<R[4])) then PC = 832 else PC = 562 end;
            continue
        end
        -- block @ 832: 1 instruction
        if PC == 832 then
            PC = 3810
            continue
        end
        -- block @ 833: 1 instruction
        if PC == 833 then
            PC = 254
            continue
        end
        -- block @ 835: 1 instruction
        if PC == 835 then
            if not(not(R[4]<70)) then PC = 836 else PC = 371 end;
            continue
        end
        -- block @ 836: 1 instruction
        if PC == 836 then
            PC = 2815
            continue
        end
        -- block @ 837: 3 instructions
        if PC == 837 then
            R[137]=(R[1][4]);
            z=134; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 1315
            continue
        end
        -- block @ 841: 1 instruction
        if PC == 841 then
            if not(not(R[4]<35)) then PC = 842 else PC = 3639 end;
            continue
        end
        -- block @ 842: 1 instruction
        if PC == 842 then
            PC = 2438
            continue
        end
        -- block @ 843: 2 instructions
        if PC == 843 then
            R[140]=(R[1][142]);
            PC = 1687
            continue
        end
        -- block @ 846: 1 instruction
        if PC == 846 then
            if not(not(49<R[4])) then PC = 847 else PC = 4952 end;
            continue
        end
        -- block @ 847: 1 instruction
        if PC == 847 then
            PC = 4036
            continue
        end
        -- block @ 848: 1 instruction
        if PC == 848 then
            if R[4]~=95 then PC = 2677 else PC = 849 end;
            continue
        end
        -- block @ 849: 1 instruction
        if PC == 849 then
            PC = 5728
            continue
        end
        -- block @ 850: 1 instruction
        if PC == 850 then
            PC = 4562
            continue
        end
        -- block @ 851: 2 instructions
        if PC == 851 then
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 5145
            continue
        end
        -- block @ 854: 1 instruction
        if PC == 854 then
            if not(not(R[4]<107)) then PC = 855 else PC = 5491 end;
            continue
        end
        -- block @ 855: 1 instruction
        if PC == 855 then
            PC = 3091
            continue
        end
        -- block @ 856: 1 instruction
        if PC == 856 then
            if not(not(2<R[153])) then PC = 857 else PC = 129 end;
            continue
        end
        -- block @ 857: 1 instruction
        if PC == 857 then
            PC = 2178
            continue
        end
        -- block @ 858: 3 instructions
        if PC == 858 then
            R[154]=(17);
            R[155]=R[94];
            PC = 4230
            continue
        end
        -- block @ 862: 2 instructions
        if PC == 862 then
            z=(121); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3415
            continue
        end
        -- block @ 865: 2 instructions
        if PC == 865 then
            R[2]=(R[1][58]);
            PC = 5422
            continue
        end
        -- block @ 868: 5 instructions
        if PC == 868 then
            R[156]=(R[1][101]);
            R[157]=(R[1][4]);
            z=154; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[154]=R[98];
            PC = 1551
            continue
        end
        -- block @ 874: 1 instruction
        if PC == 874 then
            PC = 1362
            continue
        end
        -- block @ 875: 4 instructions
        if PC == 875 then
            R[76]=(d[17][16]);
            R[77]=(R[1][48]);
            R[78]=(R[1][48]);
            PC = 2097
            continue
        end
        -- block @ 880: 3 instructions
        if PC == 880 then
            R[136]=R[131];
            R[137]=R[46];
            PC = 1840
            continue
        end
        -- block @ 884: 1 instruction
        if PC == 884 then
            if not(not(R[157]<84)) then PC = 885 else PC = 2978 end;
            continue
        end
        -- block @ 885: 1 instruction
        if PC == 885 then
            PC = 3827
            continue
        end
        -- block @ 886: 1 instruction
        if PC == 886 then
            if not(not(28<R[4])) then PC = 887 else PC = 4114 end;
            continue
        end
        -- block @ 887: 1 instruction
        if PC == 887 then
            PC = 399
            continue
        end
        -- block @ 888: 1 instruction
        if PC == 888 then
            PC = 1672
            continue
        end
        -- block @ 889: 3 instructions
        if PC == 889 then
            R[163]=(R[1][50]);
            R[163]=R[162][R[163]];
            PC = 1972
            continue
        end
        -- block @ 893: 3 instructions
        if PC == 893 then
            R[153]=(94);
            R[154]=(102);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(153); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 4072
            continue
        end
        -- block @ 897: 1 instruction
        if PC == 897 then
            PC = 3136
            continue
        end
        -- block @ 899: 6 instructions
        if PC == 899 then
            R[161]=(210);
            R[162]=(1208);
            z=159; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[160]=(488);
            R[161]=(R[1][4]);
            PC = 1461
            continue
        end
        -- block @ 906: 1 instruction
        if PC == 906 then
            if not(not(80<R[152])) then PC = 907 else PC = 4891 end;
            continue
        end
        -- block @ 907: 1 instruction
        if PC == 907 then
            PC = 5704
            continue
        end
        -- block @ 908: 7 instructions
        if PC == 908 then
            R[148]=R[106];
            R[149]=R[62];
            R[150]=({});
            R[150][4146596219]=(1716559149);
            R[150][1563741888]=(264828765);
            R[150][1776813596]=(1829265575);
            PC = 5625
            continue
        end
        -- block @ 916: 1 instruction
        if PC == 916 then
            PC = 391
            continue
        end
        -- block @ 917: 3 instructions
        if PC == 917 then
            R[151]=(3);
            R[152]=(77);
            PC = 951
            continue
        end
        -- block @ 921: 6 instructions
        if PC == 921 then
            R[158]=R[157][R[158]];
            R[159]=(R[1][104]);
            R[158]=R[158][R[159]];
            R[158]=(R[158]*100);
            R[65]=(d[30](R[158],Y[H]));
            PC = 609
            continue
        end
        -- block @ 928: 7 instructions
        if PC == 928 then
            R[166]=(R[164]["Y"]);
            R[166]=(R[166]*100);
            R[65]=(d[30](R[166],Y[H]));
            R[138][119]=R[166];
            R[166]=R[149];
            R[167]=(R[1][50]);
            PC = 4386
            continue
        end
        -- block @ 936: 1 instruction
        if PC == 936 then
            PC = 71
            continue
        end
        -- block @ 938: 4 instructions
        if PC == 938 then
            R[150]=R[97];
            R[151]=R[38];
            R[152]=(R[1][61]);
            PC = 810
            continue
        end
        -- block @ 943: 2 instructions
        if PC == 943 then
            R[165]=(R[1][4]);
            PC = 2537
            continue
        end
        -- block @ 946: 1 instruction
        if PC == 946 then
            if R[157]~=67 then PC = 1345 else PC = 947 end;
            continue
        end
        -- block @ 947: 1 instruction
        if PC == 947 then
            PC = 4639
            continue
        end
        -- block @ 948: 3 instructions
        if PC == 948 then
            R[165]=(-1);
            R[166]=(0);
            PC = 4165
            continue
        end
        -- block @ 952: 1 instruction
        if PC == 952 then
            if not(not(272<R[160])) then PC = 953 else PC = 1133 end;
            continue
        end
        -- block @ 953: 1 instruction
        if PC == 953 then
            PC = 2905
            continue
        end
        -- block @ 954: 2 instructions
        if PC == 954 then
            R[131]=R[66];
            PC = 2110
            continue
        end
        -- block @ 957: 1 instruction
        if PC == 957 then
            if R[4]~=60 then PC = 5286 else PC = 958 end;
            continue
        end
        -- block @ 958: 1 instruction
        if PC == 958 then
            PC = 5623
            continue
        end
        -- block @ 959: 1 instruction
        if PC == 959 then
            PC = 2459
            continue
        end
        -- block @ 961: 1 instruction
        if PC == 961 then
            PC = 1036
            continue
        end
        -- block @ 962: 3 instructions
        if PC == 962 then
            R[151]=(R[149][25]);
            R[138][79]=R[151];
            PC = 89
            continue
        end
        -- block @ 966: 5 instructions
        if PC == 966 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=R; x=151;
            J=70; z[x]=J;
            R[152]=(328);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 5213
            continue
        end
        -- block @ 972: 1 instruction
        if PC == 972 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 973 else R[151+3]=y; PC = 2885 end;
            continue
        end
        -- block @ 973: 1 instruction
        if PC == 973 then
            PC = 5318
            continue
        end
        -- block @ 974: 1 instruction
        if PC == 974 then
            PC = 3506
            continue
        end
        -- block @ 975: 1 instruction
        if PC == 975 then
            PC = 3041
            continue
        end
        -- block @ 976: 6 instructions
        if PC == 976 then
            R[11]=(R[1][2]);
            R[10]=R[3][R[11]];
            R[11]=(d[17][3]);
            R[12]=(R[1][48]);
            R[13]=(R[1][48]);
            PC = 2203
            continue
        end
        -- block @ 983: 1 instruction
        if PC == 983 then
            if R[4]~=3 then PC = 3497 else PC = 984 end;
            continue
        end
        -- block @ 984: 1 instruction
        if PC == 984 then
            PC = 2010
            continue
        end
        -- block @ 985: 3 instructions
        if PC == 985 then
            R[151]=(43);
            R[152]=(262);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2471
            continue
        end
        -- block @ 989: 2 instructions
        if PC == 989 then
            R[160]=R[66];
            PC = 5049
            continue
        end
        -- block @ 992: 2 instructions
        if PC == 992 then
            R[155]=(R[148][4]);
            PC = 33
            continue
        end
        -- block @ 995: 1 instruction
        if PC == 995 then
            if not(not(R[161]<134)) then PC = 996 else PC = 3757 end;
            continue
        end
        -- block @ 996: 1 instruction
        if PC == 996 then
            PC = 3958
            continue
        end
        -- block @ 997: 4 instructions
        if PC == 997 then
            R[156]=R[131];
            R[157]=(R[1][167]);
            R[157]=R[149][R[157]];
            PC = 5039
            continue
        end
        -- block @ 1002: 8 instructions
        if PC == 1002 then
            R[151]=(R[149][36]);
            R[138][67]=R[151];
            R[151]=R[98];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            R[153]=(R[149][36]);
            R[154]=(2);
            PC = 3966
            continue
        end
        -- block @ 1011: 3 instructions
        if PC == 1011 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[150]=R[131];
            PC = 4635
            continue
        end
        -- block @ 1015: 3 instructions
        if PC == 1015 then
            R[158]=R[105];
            R[159]=R[157];
            PC = 1828
            continue
        end
        -- block @ 1019: 1 instruction
        if PC == 1019 then
            if not(not(10<R[154])) then PC = 1020 else PC = 2432 end;
            continue
        end
        -- block @ 1020: 1 instruction
        if PC == 1020 then
            PC = 2016
            continue
        end
        -- block @ 1021: 1 instruction
        if PC == 1021 then
            PC = 4827
            continue
        end
        -- block @ 1023: 2 instructions
        if PC == 1023 then
            R[33]=(d[17][9]);
            PC = 71
            continue
        end
        -- block @ 1026: 4 instructions
        if PC == 1026 then
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(R[149][72]);
            R[138][37]=R[151];
            PC = 3359
            continue
        end
        -- block @ 1031: 5 instructions
        if PC == 1031 then
            R[118]=R[94];
            R[119]=R[21];
            R[120]=(R[1][70]);
            z=(118); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 5723
            continue
        end
        -- block @ 1037: 3 instructions
        if PC == 1037 then
            R[157]=(84);
            R[158]=R[135];
            PC = 163
            continue
        end
        -- block @ 1041: 2 instructions
        if PC == 1041 then
            R[158]=(2);
            PC = 3918
            continue
        end
        -- block @ 1044: 1 instruction
        if PC == 1044 then
            if not(not(14<R[4])) then PC = 1045 else PC = 1914 end;
            continue
        end
        -- block @ 1045: 1 instruction
        if PC == 1045 then
            PC = 2368
            continue
        end
        -- block @ 1046: 3 instructions
        if PC == 1046 then
            R[164]=R[161][R[164]];
            R[165]=(R[1][104]);
            PC = 942
            continue
        end
        -- block @ 1050: 13 instructions
        if PC == 1050 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=R; x=(151); J=k;
            F=(149);
            J=J[F]; F=51; J=(J[F]);
            z[x]=J;
            R[138][47]=R[151];
            R[151]=R[98];
            R[152]=(R[149][51]);
            R[153]=R[11];
            P=153; R[P]=R[P]();
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 4363
            continue
        end
        -- block @ 1064: 2 instructions
        if PC == 1064 then
            R[32]=(d[17][18]);
            PC = 71
            continue
        end
        -- block @ 1067: 1 instruction
        if PC == 1067 then
            PC = 2496
            continue
        end
        -- block @ 1068: 3 instructions
        if PC == 1068 then
            R[21]=(R[1][149]);
            R[22]=(R[1][14]);
            PC = 5679
            continue
        end
        -- block @ 1072: 1 instruction
        if PC == 1072 then
            PC = 3012
            continue
        end
        -- block @ 1074: 1 instruction
        if PC == 1074 then
            PC = 538
            continue
        end
        -- block @ 1075: 1 instruction
        if PC == 1075 then
            PC = 2018
            continue
        end
        -- block @ 1077: 1 instruction
        if PC == 1077 then
            if not(not(R[154]<147)) then PC = 1078 else PC = 4257 end;
            continue
        end
        -- block @ 1078: 1 instruction
        if PC == 1078 then
            PC = 2052
            continue
        end
        -- block @ 1079: 9 instructions
        if PC == 1079 then
            R[153]=R[11];
            P=153; R[P]=R[P]();
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(R[149][5]);
            R[138][57]=R[151];
            R[151]=(57);
            R[152]=(281);
            PC = 425
            continue
        end
        -- block @ 1089: 1 instruction
        if PC == 1089 then
            if R[4]~=20 then PC = 3315 else PC = 1090 end;
            continue
        end
        -- block @ 1090: 1 instruction
        if PC == 1090 then
            PC = 2931
            continue
        end
        -- block @ 1091: 1 instruction
        if PC == 1091 then
            if R[155] then PC = 4827 else PC = 1092 end;
            continue
        end
        -- block @ 1092: 1 instruction
        if PC == 1092 then
            PC = 1020
            continue
        end
        -- block @ 1093: 4 instructions
        if PC == 1093 then
            R[74]=(R[1][66]);
            R[68]=R[37][R[74]];
            R[69]=(R[1][173]);
            PC = 5701
            continue
        end
        -- block @ 1098: 7 instructions
        if PC == 1098 then
            z=(118); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[118]=R[94];
            R[119]=R[19];
            R[120]=(R[1][79]);
            z=(118); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[118]=(R[1][48]);
            PC = 5719
            continue
        end
        -- block @ 1106: 1 instruction
        if PC == 1106 then
            if R[149]~=89 then PC = 1107 else PC = 5553 end;
            continue
        end
        -- block @ 1107: 1 instruction
        if PC == 1107 then
            PC = 2260
            continue
        end
        -- block @ 1108: 6 instructions
        if PC == 1108 then
            R[155]=R[97];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[149][45]);
            R[158]=(1);
            PC = 4030
            continue
        end
        -- block @ 1115: 1 instruction
        if PC == 1115 then
            PC = 1090
            continue
        end
        -- block @ 1117: 1 instruction
        if PC == 1117 then
            if R[4]~=52 then PC = 3712 else PC = 1118 end;
            continue
        end
        -- block @ 1118: 1 instruction
        if PC == 1118 then
            PC = 3848
            continue
        end
        -- block @ 1119: 3 instructions
        if PC == 1119 then
            R[151]=(R[149][53]);
            R[138][48]=R[151];
            PC = 170
            continue
        end
        -- block @ 1123: 1 instruction
        if PC == 1123 then
            if R[149]~=84 then PC = 1138 else PC = 1124 end;
            continue
        end
        -- block @ 1124: 1 instruction
        if PC == 1124 then
            PC = 2349
            continue
        end
        -- block @ 1125: 5 instructions
        if PC == 1125 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[130]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            x=P; J=k; F=P;
            x=(1); z-=x;
            z=261; P=z+186-1; R[z](d[28](k,z+1,P)); P=z-1;
            if not(not(R[4]<38)) then PC = 1131 else PC = 1600 end;
            continue
        end
        -- block @ 1131: 1 instruction
        if PC == 1131 then
            PC = 474
            continue
        end
        -- block @ 1132: 1 instruction
        if PC == 1132 then
            if not(not(R[154]<138)) then PC = 1133 else PC = 1459 end;
            continue
        end
        -- block @ 1133: 1 instruction
        if PC == 1133 then
            PC = 3141
            continue
        end
        -- block @ 1134: 1 instruction
        if PC == 1134 then
            if not(not(R[160]<272)) then PC = 1135 else PC = 27 end;
            continue
        end
        -- block @ 1135: 1 instruction
        if PC == 1135 then
            PC = 766
            continue
        end
        -- block @ 1136: 2 instructions
        if PC == 1136 then
            R[117]=(19998);
            PC = 5723
            continue
        end
        -- block @ 1139: 1 instruction
        if PC == 1139 then
            if R[149]~=9 then PC = 1122 else PC = 1140 end;
            continue
        end
        -- block @ 1140: 1 instruction
        if PC == 1140 then
            PC = 3594
            continue
        end
        -- block @ 1141: 2 instructions
        if PC == 1141 then
            R[156]=(R[1][136]);
            PC = 5039
            continue
        end
        -- block @ 1144: 1 instruction
        if PC == 1144 then
            PC = 3210
            continue
        end
        -- block @ 1145: 1 instruction
        if PC == 1145 then
            if R[152]~=82 then PC = 5711 else PC = 1146 end;
            continue
        end
        -- block @ 1146: 1 instruction
        if PC == 1146 then
            PC = 2370
            continue
        end
        -- block @ 1147: 1 instruction
        if PC == 1147 then
            if not(R[148]<=R[149]) then PC = 4761 else PC = 1148 end;
            continue
        end
        -- block @ 1148: 1 instruction
        if PC == 1148 then
            PC = 200
            continue
        end
        -- block @ 1149: 1 instruction
        if PC == 1149 then
            PC = 5579
            continue
        end
        -- block @ 1150: 1 instruction
        if PC == 1150 then
            PC = 3974
            continue
        end
        -- block @ 1152: 1 instruction
        if PC == 1152 then
            if not(not(18<R[4])) then PC = 1153 else PC = 3964 end;
            continue
        end
        -- block @ 1153: 1 instruction
        if PC == 1153 then
            PC = 5668
            continue
        end
        -- block @ 1154: 3 instructions
        if PC == 1154 then
            R[114]=(R[1][145]);
            R[115]=R[94];
            PC = 336
            continue
        end
        -- block @ 1158: 1 instruction
        if PC == 1158 then
            if not(not(R[160]<104)) then PC = 1159 else PC = 2915 end;
            continue
        end
        -- block @ 1159: 1 instruction
        if PC == 1159 then
            PC = 4938
            continue
        end
        -- block @ 1160: 4 instructions
        if PC == 1160 then
            R[163]=R[149];
            R[164]=(R[1][50]);
            R[164]=R[162][R[164]];
            PC = 3791
            continue
        end
        -- block @ 1165: 4 instructions
        if PC == 1165 then
            z=R; x=29;
            J=(d[17]); F=(2); J=(J[F]);
            z[x]=J;
            PC = 2531
            continue
        end
        -- block @ 1170: 1 instruction
        if PC == 1170 then
            if not(not(71<R[4])) then PC = 1171 else PC = 3325 end;
            continue
        end
        -- block @ 1171: 1 instruction
        if PC == 1171 then
            PC = 3857
            continue
        end
        -- block @ 1172: 3 instructions
        if PC == 1172 then
            R[158]=R[98];
            R[159]=R[153];
            PC = 4154
            continue
        end
        -- block @ 1176: 8 instructions
        if PC == 1176 then
            R[155]=(R[144][7]);
            R[156]=(R[144][4]);
            R[155]=R[155]-R[156];
            R[156]=(R[144][6]);
            R[157]=(R[144][5]);
            z=154; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[155]=(R[144][5]);
            PC = 50
            continue
        end
        -- block @ 1185: 1 instruction
        if PC == 1185 then
            PC = 720
            continue
        end
        -- block @ 1186: 4 instructions
        if PC == 1186 then
            R[155]=R[98];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            PC = 1987
            continue
        end
        -- block @ 1191: 3 instructions
        if PC == 1191 then
            R[136]=(R[1][96]);
            R[135]=R[101][R[136]];
            PC = 3256
            continue
        end
        -- block @ 1195: 4 instructions
        if PC == 1195 then
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[155]=R[94];
            R[156]=(R[1][165]);
            PC = 4719
            continue
        end
        -- block @ 1200: 1 instruction
        if PC == 1200 then
            if not(not(83<R[4])) then PC = 1201 else PC = 1468 end;
            continue
        end
        -- block @ 1201: 1 instruction
        if PC == 1201 then
            PC = 3356
            continue
        end
        -- block @ 1202: 1 instruction
        if PC == 1202 then
            if R[150]~=88 then PC = 2409 else PC = 1203 end;
            continue
        end
        -- block @ 1203: 1 instruction
        if PC == 1203 then
            PC = 3291
            continue
        end
        -- block @ 1204: 3 instructions
        if PC == 1204 then
            R[164]=R[156];
            R[165]=R[153];
            PC = 5545
            continue
        end
        -- block @ 1208: 1 instruction
        if PC == 1208 then
            if R[157]~=70 then PC = 822 else PC = 1209 end;
            continue
        end
        -- block @ 1209: 1 instruction
        if PC == 1209 then
            PC = 3582
            continue
        end
        -- block @ 1210: 1 instruction
        if PC == 1210 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1211 else R[151+3]=y; PC = 288 end;
            continue
        end
        -- block @ 1211: 1 instruction
        if PC == 1211 then
            PC = 4966
            continue
        end
        -- block @ 1212: 4 instructions
        if PC == 1212 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[149]=(79);
            R[150]=(91);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(149); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 3923
            continue
        end
        -- block @ 1217: 1 instruction
        if PC == 1217 then
            PC = 735
            continue
        end
        -- block @ 1218: 5 instructions
        if PC == 1218 then
            z=R; x=118; J=R;
            F=(94); J=(J[F]); (z)[x]=J;
            R[119]=R[57];
            R[120]=(R[1][19]);
            PC = 492
            continue
        end
        -- block @ 1224: 2 instructions
        if PC == 1224 then
            R[160]=R[66];
            PC = 2047
            continue
        end
        -- block @ 1227: 3 instructions
        if PC == 1227 then
            R[151]=(R[148][12]);
            R[138][4]=R[151];
            PC = 4228
            continue
        end
        -- block @ 1231: 2 instructions
        if PC == 1231 then
            R[155]=(R[149][39]);
            PC = 2457
            continue
        end
        -- block @ 1234: 1 instruction
        if PC == 1234 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1235 else R[150+3]=y; PC = 198 end;
            continue
        end
        -- block @ 1235: 1 instruction
        if PC == 1235 then
            PC = 2444
            continue
        end
        -- block @ 1236: 2 instructions
        if PC == 1236 then
            R[65]=(d[30](R[161],Y[H]));
            PC = 4876
            continue
        end
        -- block @ 1239: 1 instruction
        if PC == 1239 then
            if R[152]~=20 then PC = 1240 else PC = 5326 end;
            continue
        end
        -- block @ 1240: 1 instruction
        if PC == 1240 then
            PC = 1254
            continue
        end
        -- block @ 1241: 1 instruction
        if PC == 1241 then
            if not(not(R[154]<170)) then PC = 1242 else PC = 5397 end;
            continue
        end
        -- block @ 1242: 1 instruction
        if PC == 1242 then
            PC = 1560
            continue
        end
        -- block @ 1243: 2 instructions
        if PC == 1243 then
            R[139]=(R[1][48]);
            PC = 2518
            continue
        end
        -- block @ 1246: 1 instruction
        if PC == 1246 then
            if not(not(134<R[154])) then PC = 1247 else PC = 4725 end;
            continue
        end
        -- block @ 1247: 1 instruction
        if PC == 1247 then
            PC = 1107
            continue
        end
        -- block @ 1248: 3 instructions
        if PC == 1248 then
            R[157]=(R[149][61]);
            R[158]=(2);
            PC = 3506
            continue
        end
        -- block @ 1252: 2 instructions
        if PC == 1252 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[94]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 26
            continue
        end
        -- block @ 1255: 1 instruction
        if PC == 1255 then
            PC = 1629
            continue
        end
        -- block @ 1256: 3 instructions
        if PC == 1256 then
            P=153; R[P]=R[P]();
            R[154]=(2);
            PC = 1848
            continue
        end
        -- block @ 1260: 4 instructions
        if PC == 1260 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=R[98];
            R[152]=R[11];
            PC = 155
            continue
        end
        -- block @ 1265: 4 instructions
        if PC == 1265 then
            R[115]=R[94];
            R[116]=R[113];
            R[117]=(R[1][84]);
            PC = 4056
            continue
        end
        -- block @ 1270: 1 instruction
        if PC == 1270 then
            PC = 1532
            continue
        end
        -- block @ 1272: 1 instruction
        if PC == 1272 then
            if not(not(R[150]<95)) then PC = 1273 else PC = 5599 end;
            continue
        end
        -- block @ 1273: 1 instruction
        if PC == 1273 then
            PC = 3302
            continue
        end
        -- block @ 1274: 1 instruction
        if PC == 1274 then
            if R[168]~=88 then PC = 1749 else PC = 1275 end;
            continue
        end
        -- block @ 1275: 1 instruction
        if PC == 1275 then
            PC = 5542
            continue
        end
        -- block @ 1276: 1 instruction
        if PC == 1276 then
            if not(not(7<R[4])) then PC = 1277 else PC = 5198 end;
            continue
        end
        -- block @ 1277: 1 instruction
        if PC == 1277 then
            PC = 650
            continue
        end
        -- block @ 1278: 5 instructions
        if PC == 1278 then
            R[115]=R[94];
            R[116]=R[46];
            R[117]=("format");
            z=(115); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3738
            continue
        end
        -- block @ 1284: 3 instructions
        if PC == 1284 then
            z=67; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[62]=R[67];
            PC = 4255
            continue
        end
        -- block @ 1288: 1 instruction
        if PC == 1288 then
            PC = 2138
            continue
        end
        -- block @ 1289: 1 instruction
        if PC == 1289 then
            if not(not(107<R[154])) then PC = 1290 else PC = 5384 end;
            continue
        end
        -- block @ 1290: 1 instruction
        if PC == 1290 then
            PC = 1508
            continue
        end
        -- block @ 1291: 1 instruction
        if PC == 1291 then
            PC = 5124
            continue
        end
        -- block @ 1292: 3 instructions
        if PC == 1292 then
            R[115]=(R[1][48]);
            R[116]=(R[1][48]);
            PC = 1699
            continue
        end
        -- block @ 1296: 3 instructions
        if PC == 1296 then
            R[157]=(R[149][19]);
            R[158]=(2);
            PC = 671
            continue
        end
        -- block @ 1300: 3 instructions
        if PC == 1300 then
            R[157]=(R[149][20]);
            R[158]=(2);
            PC = 190
            continue
        end
        -- block @ 1304: 1 instruction
        if PC == 1304 then
            PC = 2537
            continue
        end
        -- block @ 1306: 7 instructions
        if PC == 1306 then
            R[161]=(R[155]["Y"]);
            R[162]=(R[1][104]);
            R[161]=R[161][R[162]];
            R[161]=(R[161]*100);
            R[65]=(d[30](R[161],Y[H]));
            R[138][101]=R[161];
            if not(not(R[4]<=43)) then PC = 1313 else PC = 5519 end;
            continue
        end
        -- block @ 1313: 1 instruction
        if PC == 1313 then
            PC = 4327
            continue
        end
        -- block @ 1314: 1 instruction
        if PC == 1314 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1315 else R[159+3]=y; PC = 2952 end;
            continue
        end
        -- block @ 1315: 1 instruction
        if PC == 1315 then
            PC = 1833
            continue
        end
        -- block @ 1316: 1 instruction
        if PC == 1316 then
            if R[133]~=19 then PC = 5489 else PC = 1317 end;
            continue
        end
        -- block @ 1317: 1 instruction
        if PC == 1317 then
            PC = 1782
            continue
        end
        -- block @ 1318: 1 instruction
        if PC == 1318 then
            PC = 2792
            continue
        end
        -- block @ 1319: 1 instruction
        if PC == 1319 then
            if R[4]~=103 then PC = 4831 else PC = 1320 end;
            continue
        end
        -- block @ 1320: 1 instruction
        if PC == 1320 then
            PC = 672
            continue
        end
        -- block @ 1321: 1 instruction
        if PC == 1321 then
            if R[133]~=61 then PC = 1315 else PC = 1322 end;
            continue
        end
        -- block @ 1322: 1 instruction
        if PC == 1322 then
            PC = 3462
            continue
        end
        -- block @ 1323: 1 instruction
        if PC == 1323 then
            if R[154]~=144 then PC = 3944 else PC = 1324 end;
            continue
        end
        -- block @ 1324: 1 instruction
        if PC == 1324 then
            PC = 4082
            continue
        end
        -- block @ 1325: 4 instructions
        if PC == 1325 then
            R[155]=R[97];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            PC = 3644
            continue
        end
        -- block @ 1330: 1 instruction
        if PC == 1330 then
            if not(not(R[157]<82)) then PC = 1331 else PC = 507 end;
            continue
        end
        -- block @ 1331: 1 instruction
        if PC == 1331 then
            PC = 974
            continue
        end
        -- block @ 1332: 1 instruction
        if PC == 1332 then
            PC = 822
            continue
        end
        -- block @ 1334: 3 instructions
        if PC == 1334 then
            R[100]=(R[1][48]);
            R[101]=(R[1][48]);
            PC = 3909
            continue
        end
        -- block @ 1338: 1 instruction
        if PC == 1338 then
            PC = 1981
            continue
        end
        -- block @ 1339: 1 instruction
        if PC == 1339 then
            if R[167]~=87 then PC = 5402 else PC = 1340 end;
            continue
        end
        -- block @ 1340: 1 instruction
        if PC == 1340 then
            PC = 1317
            continue
        end
        -- block @ 1341: 4 instructions
        if PC == 1341 then
            R[150][3543833154]=(534737002);
            R[150][1143294960]=(1766110994);
            z=(148); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 570
            continue
        end
        -- block @ 1346: 1 instruction
        if PC == 1346 then
            if R[157]~=31 then PC = 2282 else PC = 1347 end;
            continue
        end
        -- block @ 1347: 1 instruction
        if PC == 1347 then
            PC = 700
            continue
        end
        -- block @ 1348: 3 instructions
        if PC == 1348 then
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 5204
            continue
        end
        -- block @ 1352: 1 instruction
        if PC == 1352 then
            PC = 781
            continue
        end
        -- block @ 1354: 1 instruction
        if PC == 1354 then
            PC = 2714
            continue
        end
        -- block @ 1355: 2 instructions
        if PC == 1355 then
            R[169]=(R[161][10]);
            PC = 531
            continue
        end
        -- block @ 1358: 1 instruction
        if PC == 1358 then
            if R[4]~=11 then PC = 3564 else PC = 1359 end;
            continue
        end
        -- block @ 1359: 1 instruction
        if PC == 1359 then
            PC = 2331
            continue
        end
        -- block @ 1360: 1 instruction
        if PC == 1360 then
            PC = 645
            continue
        end
        -- block @ 1361: 1 instruction
        if PC == 1361 then
            if not(not(R[4]<57)) then PC = 1362 else PC = 46 end;
            continue
        end
        -- block @ 1362: 1 instruction
        if PC == 1362 then
            PC = 2866
            continue
        end
        -- block @ 1363: 5 instructions
        if PC == 1363 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[89]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            R[91]=(R[1][48]);
            R[92]=(R[1][48]);
            R[93]=(R[1][48]);
            PC = 4880
            continue
        end
        -- block @ 1369: 1 instruction
        if PC == 1369 then
            PC = 3366
            continue
        end
        -- block @ 1370: 4 instructions
        if PC == 1370 then
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(98);
            R[152]=(321);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 3918
            continue
        end
        -- block @ 1375: 3 instructions
        if PC == 1375 then
            R[154]=(2);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 1691
            continue
        end
        -- block @ 1379: 3 instructions
        if PC == 1379 then
            z=160; R[z]=R[z](R[z+1]); P=z;
            z=158; R[z]=R[z](R[z+1],R[z+2]); P=z;
            if not R[158] then PC = 4909 else PC = 1382 end;
            continue
        end
        -- block @ 1382: 1 instruction
        if PC == 1382 then
            PC = 2411
            continue
        end
        -- block @ 1383: 1 instruction
        if PC == 1383 then
            PC = 3415
            continue
        end
        -- block @ 1385: 7 instructions
        if PC == 1385 then
            R[19]=(R[1][48]);
            R[20]=(R[1][48]);
            R[21]=(R[1][48]);
            R[22]=(R[1][48]);
            R[23]=(899092935);
            R[24]=(R[1][48]);
            PC = 2421
            continue
        end
        -- block @ 1393: 6 instructions
        if PC == 1393 then
            R[155]=R[98];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[149][43]);
            R[158]=(2);
            PC = 1985
            continue
        end
        -- block @ 1400: 2 instructions
        if PC == 1400 then
            R[158]=(R[1][61]);
            PC = 2535
            continue
        end
        -- block @ 1403: 1 instruction
        if PC == 1403 then
            if not(not(R[4]<75)) then PC = 1404 else PC = 2398 end;
            continue
        end
        -- block @ 1404: 1 instruction
        if PC == 1404 then
            PC = 2131
            continue
        end
        -- block @ 1405: 1 instruction
        if PC == 1405 then
            PC = 1723
            continue
        end
        -- block @ 1406: 4 instructions
        if PC == 1406 then
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(60);
            R[152]=(162);
            PC = 321
            continue
        end
        -- block @ 1410: 1 instruction
        if PC == 1410 then
            if not(not(R[167]<l[H])) then PC = 1411 else PC = 312 end;
            continue
        end
        -- block @ 1411: 1 instruction
        if PC == 1411 then
            PC = 1777
            continue
        end
        -- block @ 1412: 2 instructions
        if PC == 1412 then
            R[158]=(R[1][108]);
            PC = 439
            continue
        end
        -- block @ 1415: 3 instructions
        if PC == 1415 then
            R[158]=R[98];
            R[159]=(395);
            PC = 4532
            continue
        end
        -- block @ 1419: 3 instructions
        if PC == 1419 then
            R[155]=R[97];
            R[156]=R[11];
            PC = 4323
            continue
        end
        -- block @ 1423: 1 instruction
        if PC == 1423 then
            PC = 282
            continue
        end
        -- block @ 1424: 3 instructions
        if PC == 1424 then
            R[168]=R[149];
            R[169]=(R[1][50]);
            PC = 2771
            continue
        end
        -- block @ 1428: 1 instruction
        if PC == 1428 then
            if not(not(R[152]<=5)) then PC = 1429 else PC = 2526 end;
            continue
        end
        -- block @ 1429: 1 instruction
        if PC == 1429 then
            PC = 1410
            continue
        end
        -- block @ 1430: 3 instructions
        if PC == 1430 then
            R[11]=(R[1][171]);
            R[7]=R[2][R[11]];
            PC = 4121
            continue
        end
        -- block @ 1434: 1 instruction
        if PC == 1434 then
            if not(not(96<R[4])) then PC = 1435 else PC = 764 end;
            continue
        end
        -- block @ 1435: 1 instruction
        if PC == 1435 then
            PC = 48
            continue
        end
        -- block @ 1436: 6 instructions
        if PC == 1436 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[87]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=R; x=(88); J=k;
            F=(1);
            J=J[F]; F=8; J=(J[F]);
            z[x]=J;
            PC = 482
            continue
        end
        -- block @ 1443: 1 instruction
        if PC == 1443 then
            PC = 5130
            continue
        end
        -- block @ 1444: 3 instructions
        if PC == 1444 then
            R[155]=(1);
            R[156]=(9);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(155); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 4979
            continue
        end
        -- block @ 1448: 4 instructions
        if PC == 1448 then
            R[151]=(R[148][19]);
            R[138][21]=R[151];
            R[150]=(75);
            PC = 5438
            continue
        end
        -- block @ 1453: 1 instruction
        if PC == 1453 then
            PC = 832
            continue
        end
        -- block @ 1454: 5 instructions
        if PC == 1454 then
            R[153]=(R[148][12]);
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(114);
            PC = 584
            continue
        end
        -- block @ 1460: 1 instruction
        if PC == 1460 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1461 else R[151+3]=y; PC = 5288 end;
            continue
        end
        -- block @ 1461: 1 instruction
        if PC == 1461 then
            PC = 171
            continue
        end
        -- block @ 1462: 1 instruction
        if PC == 1462 then
            PC = 822
            continue
        end
        -- block @ 1463: 1 instruction
        if PC == 1463 then
            if not(not(38<R[4])) then PC = 1464 else PC = 840 end;
            continue
        end
        -- block @ 1464: 1 instruction
        if PC == 1464 then
            PC = 3900
            continue
        end
        -- block @ 1465: 3 instructions
        if PC == 1465 then
            R[132]=(R[1][48]);
            R[4]=(105);
            PC = 4443
            continue
        end
        -- block @ 1469: 4 instructions
        if PC == 1469 then
            R[125]=R[94];
            R[126]=R[51];
            R[127]=(R[1][48]);
            PC = 150
            continue
        end
        -- block @ 1474: 2 instructions
        if PC == 1474 then
            R[157]=(R[1][59]);
            PC = 4072
            continue
        end
        -- block @ 1477: 1 instruction
        if PC == 1477 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1478 else R[151+3]=y; PC = 5568 end;
            continue
        end
        -- block @ 1478: 1 instruction
        if PC == 1478 then
            PC = 3317
            continue
        end
        -- block @ 1479: 2 instructions
        if PC == 1479 then
            R[168]=(R[1][4]);
            PC = 557
            continue
        end
        -- block @ 1482: 1 instruction
        if PC == 1482 then
            PC = 1502
            continue
        end
        -- block @ 1483: 8 instructions
        if PC == 1483 then
            R[170]=(-8);
            z=166; x=5; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=163; x=0; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=(160); x=(0); J=R;
            F=(z);
            J=J[F];
            F=d[2]; U=R; _=(z); t=(1); _+=t; t=P; O=x; Z=(1); O+=Z; Z=(J); F(U,_,t,O,Z);
            PC = 2535
            continue
        end
        -- block @ 1492: 3 instructions
        if PC == 1492 then
            R[148]=R[135];
            R[149]=(R[1][140]);
            PC = 2119
            continue
        end
        -- block @ 1496: 1 instruction
        if PC == 1496 then
            if not(not(42<R[4])) then PC = 1497 else PC = 2386 end;
            continue
        end
        -- block @ 1497: 1 instruction
        if PC == 1497 then
            PC = 2284
            continue
        end
        -- block @ 1498: 1 instruction
        if PC == 1498 then
            if R[154]~=147 then PC = 521 else PC = 1499 end;
            continue
        end
        -- block @ 1499: 1 instruction
        if PC == 1499 then
            PC = 1680
            continue
        end
        -- block @ 1500: 2 instructions
        if PC == 1500 then
            R[168]=R[158];
            PC = 1627
            continue
        end
        -- block @ 1503: 1 instruction
        if PC == 1503 then
            if not(not(99<R[150])) then PC = 1504 else PC = 2490 end;
            continue
        end
        -- block @ 1504: 1 instruction
        if PC == 1504 then
            PC = 2748
            continue
        end
        -- block @ 1505: 1 instruction
        if PC == 1505 then
            PC = 1171
            continue
        end
        -- block @ 1506: 2 instructions
        if PC == 1506 then
            R[166]=(495);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(165); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 4756
            continue
        end
        -- block @ 1509: 4 instructions
        if PC == 1509 then
            R[155]=(R[149][64]);
            R[138][32]=R[155];
            R[155]=R[98];
            PC = 1705
            continue
        end
        -- block @ 1514: 8 instructions
        if PC == 1514 then
            R[155]=R[98];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[148][5]);
            R[158]=(1);
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[155]=(R[148][20]);
            PC = 1569
            continue
        end
        -- block @ 1523: 1 instruction
        if PC == 1523 then
            if not(not(R[154]<212)) then PC = 1524 else PC = 3918 end;
            continue
        end
        -- block @ 1524: 1 instruction
        if PC == 1524 then
            PC = 2818
            continue
        end
        -- block @ 1525: 2 instructions
        if PC == 1525 then
            R[154]=({});
            PC = 21
            continue
        end
        -- block @ 1528: 4 instructions
        if PC == 1528 then
            R[164]=R[156];
            R[165]=R[155];
            z=164; R[z]=R[z](R[z+1]); P=z;
            PC = 153
            continue
        end
        -- block @ 1533: 3 instructions
        if PC == 1533 then
            R[81]=R[40];
            R[82]=(2048);
            PC = 211
            continue
        end
        -- block @ 1537: 1 instruction
        if PC == 1537 then
            PC = 3776
            continue
        end
        -- block @ 1539: 6 instructions
        if PC == 1539 then
            R[157]=R[98];
            R[158]=R[88];
            R[159]=R[151];
            z=158; R[z]=R[z](R[z+1]); P=z;
            R[159]=(R[1][82]);
            PC = 4150
            continue
        end
        -- block @ 1546: 4 instructions
        if PC == 1546 then
            R[152]=(2);
            R[161]=(R[1][155]);
            R[161]=R[160][R[161]];
            PC = 1235
            continue
        end
        -- block @ 1551: 1 instruction
        if PC == 1551 then
            PC = 953
            continue
        end
        -- block @ 1552: 5 instructions
        if PC == 1552 then
            R[156]=R[25];
            R[157]=R[153];
            z=156; R[z]=R[z](R[z+1]); P=z;
            R[157]=(D[H]);
            PC = 1709
            continue
        end
        -- block @ 1557: 1 instruction
        if PC == 1557 then
            PC = 2798
            continue
        end
        -- block @ 1560: 1 instruction
        if PC == 1560 then
            PC = 3104
            continue
        end
        -- block @ 1561: 2 instructions
        if PC == 1561 then
            R[155]=(R[149][45]);
            PC = 4030
            continue
        end
        -- block @ 1564: 3 instructions
        if PC == 1564 then
            R[74]=(R[1][6]);
            R[70]=R[62][R[74]];
            PC = 4281
            continue
        end
        -- block @ 1568: 1 instruction
        if PC == 1568 then
            PC = 1687
            continue
        end
        -- block @ 1570: 1 instruction
        if PC == 1570 then
            PC = 196
            continue
        end
        -- block @ 1571: 1 instruction
        if PC == 1571 then
            PC = 4469
            continue
        end
        -- block @ 1572: 2 instructions
        if PC == 1572 then
            z=(119); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 5719
            continue
        end
        -- block @ 1575: 1 instruction
        if PC == 1575 then
            if not(not(R[4]<77)) then PC = 1576 else PC = 1129 end;
            continue
        end
        -- block @ 1576: 1 instruction
        if PC == 1576 then
            PC = 3566
            continue
        end
        -- block @ 1577: 5 instructions
        if PC == 1577 then
            R[155]=R[97];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[149][60]);
            PC = 1713
            continue
        end
        -- block @ 1583: 1 instruction
        if PC == 1583 then
            if R[154]~=3 then PC = 5377 else PC = 1584 end;
            continue
        end
        -- block @ 1584: 1 instruction
        if PC == 1584 then
            PC = 4944
            continue
        end
        -- block @ 1585: 1 instruction
        if PC == 1585 then
            if not R[150] then PC = 5049 else PC = 1586 end;
            continue
        end
        -- block @ 1586: 1 instruction
        if PC == 1586 then
            PC = 988
            continue
        end
        -- block @ 1587: 1 instruction
        if PC == 1587 then
            if R[4]~=53 then PC = 2585 else PC = 1588 end;
            continue
        end
        -- block @ 1588: 1 instruction
        if PC == 1588 then
            PC = 2393
            continue
        end
        -- block @ 1589: 3 instructions
        if PC == 1589 then
            R[151]=R[98];
            R[152]=R[11];
            PC = 1453
            continue
        end
        -- block @ 1593: 2 instructions
        if PC == 1593 then
            R[37]=(R[1][89]);
            PC = 71
            continue
        end
        -- block @ 1596: 1 instruction
        if PC == 1596 then
            if not(not(65<R[166])) then PC = 1597 else PC = 3012 end;
            continue
        end
        -- block @ 1597: 1 instruction
        if PC == 1597 then
            PC = 2296
            continue
        end
        -- block @ 1598: 2 instructions
        if PC == 1598 then
            R[137]=(R[1][48]);
            PC = 4070
            continue
        end
        -- block @ 1601: 1 instruction
        if PC == 1601 then
            if not(not(38<R[4])) then PC = 1602 else PC = 3569 end;
            continue
        end
        -- block @ 1602: 1 instruction
        if PC == 1602 then
            PC = 1730
            continue
        end
        -- block @ 1603: 6 instructions
        if PC == 1603 then
            R[169]=(d[37](R[159],127));
            R[170]=R[112];
            R[171]=R[159];
            z=170; R[z]=R[z](R[z+1]); P=z;
            R[132][R[169]]=R[170];
            PC = 3763
            continue
        end
        -- block @ 1610: 3 instructions
        if PC == 1610 then
            R[168]=(R[1][155]);
            R[168]=R[163][R[168]];
            PC = 5450
            continue
        end
        -- block @ 1614: 3 instructions
        if PC == 1614 then
            R[159]=R[152][R[150]];
            R[160]=(R[1][4]);
            PC = 4072
            continue
        end
        -- block @ 1618: 4 instructions
        if PC == 1618 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[149]=(R[1][85]);
            R[149]=R[148][R[149]];
            PC = 384
            continue
        end
        -- block @ 1623: 1 instruction
        if PC == 1623 then
            PC = 1766
            continue
        end
        -- block @ 1624: 3 instructions
        if PC == 1624 then
            R[157]=(R[149][44]);
            R[158]=(2);
            PC = 1184
            continue
        end
        -- block @ 1628: 1 instruction
        if PC == 1628 then
            if not(not(R[165]<=42)) then PC = 1629 else PC = 2354 end;
            continue
        end
        -- block @ 1629: 1 instruction
        if PC == 1629 then
            PC = 4794
            continue
        end
        -- block @ 1630: 7 instructions
        if PC == 1630 then
            R[163]=R[149];
            R[164]=(R[1][155]);
            R[164]=R[161][R[164]];
            R[165]=(R[1][104]);
            R[164]=R[164][R[165]];
            R[165]=(R[1][4]);
            PC = 1303
            continue
        end
        -- block @ 1638: 3 instructions
        if PC == 1638 then
            R[81]=(R[1][39]);
            R[78]=R[37][R[81]];
            PC = 598
            continue
        end
        -- block @ 1642: 6 instructions
        if PC == 1642 then
            R[152]=("IsStudio");
            z=(150); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[150]=R[94];
            R[151]=(R[1][45]);
            R[151]=R[148][R[151]];
            PC = 2601
            continue
        end
        -- block @ 1649: 1 instruction
        if PC == 1649 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1650 else R[156+3]=y; PC = 4355 end;
            continue
        end
        -- block @ 1650: 1 instruction
        if PC == 1650 then
            PC = 5676
            continue
        end
        -- block @ 1651: 11 instructions
        if PC == 1651 then
            R[152]=R[11];
            z=(152); P=z;
            z=k;
            x=P; J=k; F=P;
            J=(J[F]); J=J(); (z)[x]=(J);
            R[153]=(R[149][26]);
            R[154]=(2);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(R[149][37]);
            PC = 1452
            continue
        end
        -- block @ 1663: 9 instructions
        if PC == 1663 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[157]=R[149];
            R[158]=(R[1][50]);
            R[158]=R[156][R[158]];
            R[159]=(R[1][104]);
            R[158]=R[158][R[159]];
            R[158]=R[97];
            z=(159); x=R[155]; R[z+1]=(x); R[z]=x["NextInteger"];
            PC = 1731
            continue
        end
        -- block @ 1673: 1 instruction
        if PC == 1673 then
            if not(not(R[150]<112)) then PC = 1674 else PC = 4511 end;
            continue
        end
        -- block @ 1674: 1 instruction
        if PC == 1674 then
            PC = 4784
            continue
        end
        -- block @ 1675: 1 instruction
        if PC == 1675 then
            PC = 2141
            continue
        end
        -- block @ 1676: 4 instructions
        if PC == 1676 then
            z=159; R[z]=R[z](R[z+1]); P=z;
            R[160]=(0);
            R[161]=(D[H]);
            PC = 5334
            continue
        end
        -- block @ 1681: 2 instructions
        if PC == 1681 then
            R[155]=(R[149][30]);
            PC = 23
            continue
        end
        -- block @ 1684: 2 instructions
        if PC == 1684 then
            R[151]=R[66];
            PC = 12
            continue
        end
        -- block @ 1687: 1 instruction
        if PC == 1687 then
            PC = 3842
            continue
        end
        -- block @ 1688: 1 instruction
        if PC == 1688 then
            if not(not(47<R[4])) then PC = 1689 else PC = 1360 end;
            continue
        end
        -- block @ 1689: 1 instruction
        if PC == 1689 then
            PC = 486
            continue
        end
        -- block @ 1690: 1 instruction
        if PC == 1690 then
            if not(not(3<R[153])) then PC = 1691 else PC = 1233 end;
            continue
        end
        -- block @ 1691: 1 instruction
        if PC == 1691 then
            PC = 4139
            continue
        end
        -- block @ 1692: 1 instruction
        if PC == 1692 then
            if R[150]~=22 then PC = 5604 else PC = 1693 end;
            continue
        end
        -- block @ 1693: 1 instruction
        if PC == 1693 then
            PC = 4222
            continue
        end
        -- block @ 1694: 1 instruction
        if PC == 1694 then
            if not(not(5<R[4])) then PC = 1695 else PC = 2514 end;
            continue
        end
        -- block @ 1695: 1 instruction
        if PC == 1695 then
            PC = 4826
            continue
        end
        -- block @ 1696: 3 instructions
        if PC == 1696 then
            R[157]=(R[149][6]);
            R[158]=(2);
            PC = 5388
            continue
        end
        -- block @ 1700: 1 instruction
        if PC == 1700 then
            if R[4]~=56 then PC = 3902 else PC = 1701 end;
            continue
        end
        -- block @ 1701: 1 instruction
        if PC == 1701 then
            PC = 2489
            continue
        end
        -- block @ 1702: 3 instructions
        if PC == 1702 then
            P=157; R[P]=R[P]();
            R[158]=(2);
            PC = 2389
            continue
        end
        -- block @ 1706: 3 instructions
        if PC == 1706 then
            P=156; R[P]=R[P]();
            R[157]=(R[149][64]);
            PC = 2078
            continue
        end
        -- block @ 1710: 2 instructions
        if PC == 1710 then
            z=154; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 683
            continue
        end
        -- block @ 1713: 1 instruction
        if PC == 1713 then
            PC = 5499
            continue
        end
        -- block @ 1714: 1 instruction
        if PC == 1714 then
            PC = 2492
            continue
        end
        -- block @ 1716: 1 instruction
        if PC == 1716 then
            PC = 5523
            continue
        end
        -- block @ 1718: 2 instructions
        if PC == 1718 then
            R[113]=(R[1][157]);
            PC = 3349
            continue
        end
        -- block @ 1721: 1 instruction
        if PC == 1721 then
            PC = 1795
            continue
        end
        -- block @ 1722: 1 instruction
        if PC == 1722 then
            if not(not(R[157]<263)) then PC = 1723 else PC = 515 end;
            continue
        end
        -- block @ 1723: 1 instruction
        if PC == 1723 then
            PC = 2954
            continue
        end
        -- block @ 1724: 6 instructions
        if PC == 1724 then
            R[153]=(83);
            R[154]=R[98];
            R[155]=(R[1][125]);
            R[156]=R[25];
            R[157]=R[152];
            PC = 3802
            continue
        end
        -- block @ 1731: 1 instruction
        if PC == 1731 then
            PC = 3477
            continue
        end
        -- block @ 1732: 3 instructions
        if PC == 1732 then
            R[162]=(1171);
            z=159; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            PC = 2971
            continue
        end
        -- block @ 1736: 5 instructions
        if PC == 1736 then
            R[150]=(85);
            R[151]=R[98];
            R[152]=(R[149][10]);
            R[153]=R[11];
            PC = 778
            continue
        end
        -- block @ 1742: 1 instruction
        if PC == 1742 then
            if R[154]~=78 then PC = 1919 else PC = 1743 end;
            continue
        end
        -- block @ 1743: 1 instruction
        if PC == 1743 then
            PC = 4329
            continue
        end
        -- block @ 1744: 1 instruction
        if PC == 1744 then
            PC = 400
            continue
        end
        -- block @ 1745: 4 instructions
        if PC == 1745 then
            R[154]=(2);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            z=R; x=151;
            PC = 3641
            continue
        end
        -- block @ 1750: 1 instruction
        if PC == 1750 then
            if R[168]~=270 then PC = 5143 else PC = 1751 end;
            continue
        end
        -- block @ 1751: 1 instruction
        if PC == 1751 then
            PC = 4429
            continue
        end
        -- block @ 1752: 5 instructions
        if PC == 1752 then
            R[112]=R[94];
            R[113]=R[91];
            R[114]=(R[1][160]);
            z=(112); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 2350
            continue
        end
        -- block @ 1758: 2 instructions
        if PC == 1758 then
            R[66]=(R[1][48]);
            PC = 4255
            continue
        end
        -- block @ 1761: 4 instructions
        if PC == 1761 then
            R[114]=R[94];
            z=R; x=115; J=R;
            F=(60); J=(J[F]); (z)[x]=J;
            PC = 4954
            continue
        end
        -- block @ 1766: 1 instruction
        if PC == 1766 then
            PC = 2002
            continue
        end
        -- block @ 1767: 3 instructions
        if PC == 1767 then
            R[122]=R[94];
            R[123]=R[63];
            PC = 4262
            continue
        end
        -- block @ 1771: 2 instructions
        if PC == 1771 then
            z=(137); (R[z])(R[z+1]); P=(z-1);
            PC = 36
            continue
        end
        -- block @ 1774: 1 instruction
        if PC == 1774 then
            if not(not(114<R[154])) then PC = 1775 else PC = 1459 end;
            continue
        end
        -- block @ 1775: 1 instruction
        if PC == 1775 then
            PC = 1131
            continue
        end
        -- block @ 1776: 1 instruction
        if PC == 1776 then
            if not R[160] then PC = 52 else PC = 1777 end;
            continue
        end
        -- block @ 1777: 1 instruction
        if PC == 1777 then
            PC = 4334
            continue
        end
        -- block @ 1778: 4 instructions
        if PC == 1778 then
            z=(162); x=R[153]; R[z+1]=(x); R[z]=x["GetPositionOnCurveArcLength"];
            z=R; x=164;
            J=0; z[x]=J;
            PC = 4913
            continue
        end
        -- block @ 1783: 5 instructions
        if PC == 1783 then
            R[134]=R[115];
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[135]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=134; R[z]=R[z](R[z+1]); P=z;
            R[132]=R[134];
            PC = 1315
            continue
        end
        -- block @ 1789: 4 instructions
        if PC == 1789 then
            R[40]=(R[1][48]);
            R[41]=nil;
            R[4]=(111);
            PC = 4054
            continue
        end
        -- block @ 1794: 1 instruction
        if PC == 1794 then
            if R[153]~=123 then PC = 5570 else PC = 1795 end;
            continue
        end
        -- block @ 1795: 1 instruction
        if PC == 1795 then
            PC = 3150
            continue
        end
        -- block @ 1796: 3 instructions
        if PC == 1796 then
            R[148]=(R[1][48]);
            R[149]=(R[1][48]);
            PC = 2937
            continue
        end
        -- block @ 1800: 2 instructions
        if PC == 1800 then
            z=(135); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 4443
            continue
        end
        -- block @ 1803: 3 instructions
        if PC == 1803 then
            R[130]=R[85];
            R[131]=(R[120]%65536);
            PC = 84
            continue
        end
        -- block @ 1807: 1 instruction
        if PC == 1807 then
            PC = 3606
            continue
        end
        -- block @ 1808: 1 instruction
        if PC == 1808 then
            if R[155] then PC = 1929 else PC = 1809 end;
            continue
        end
        -- block @ 1809: 1 instruction
        if PC == 1809 then
            PC = 3134
            continue
        end
        -- block @ 1810: 1 instruction
        if PC == 1810 then
            if R[4]~=17 then PC = 2636 else PC = 1811 end;
            continue
        end
        -- block @ 1811: 1 instruction
        if PC == 1811 then
            PC = 2669
            continue
        end
        -- block @ 1812: 4 instructions
        if PC == 1812 then
            z=l[H]; x=z[8]; z=(#x); J=z>0 and{}; if not(J) then else for w=1,z do F=(x[w]); U=F[1]; _=(F[3]); if U==1 then J[w-1]=(Protos[_]); else if U==2 then J[w-1]=R[_]; else if U==3 then if not(not i) then else i=({}); end; F=(i[_]); if not F then F={[1]=k,[3]=_}; (i)[_]=(F); end; (J)[w-1]=F; end; end; end; end; end; x=R["u"](J); d[29](x,B); R[126]=x;
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[127]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            R[128]=(R[1][48]);
            PC = 2294
            continue
        end
        -- block @ 1817: 8 instructions
        if PC == 1817 then
            R[154]=(2);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(R[149][67]);
            R[138][95]=R[151];
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 4775
            continue
        end
        -- block @ 1826: 2 instructions
        if PC == 1826 then
            R[156]=R[11];
            PC = 2463
            continue
        end
        -- block @ 1829: 2 instructions
        if PC == 1829 then
            R[158]=R[155][R[158]];
            if R[158] then PC = 760 else PC = 1831 end;
            continue
        end
        -- block @ 1831: 1 instruction
        if PC == 1831 then
            PC = 3878
            continue
        end
        -- block @ 1832: 1 instruction
        if PC == 1832 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1833 else R[151+3]=y; PC = 5302 end;
            continue
        end
        -- block @ 1833: 1 instruction
        if PC == 1833 then
            PC = 1049
            continue
        end
        -- block @ 1834: 1 instruction
        if PC == 1834 then
            PC = 3330
            continue
        end
        -- block @ 1835: 5 instructions
        if PC == 1835 then
            R[152]=(R[1][101]);
            R[153]=(R[1][4]);
            z=150; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[150]=R[98];
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1840 else R[151+3]=y; PC = 1582 end;
            continue
        end
        -- block @ 1840: 1 instruction
        if PC == 1840 then
            PC = 1216
            continue
        end
        -- block @ 1841: 1 instruction
        if PC == 1841 then
            PC = 3256
            continue
        end
        -- block @ 1843: 1 instruction
        if PC == 1843 then
            if R[4]~=12 then PC = 2080 else PC = 1844 end;
            continue
        end
        -- block @ 1844: 1 instruction
        if PC == 1844 then
            PC = 2165
            continue
        end
        -- block @ 1845: 1 instruction
        if PC == 1845 then
            if i then for f,w in i do if not(f>=1) then else(w)[1]=(w); w[2]=(R[f]); w[3]=2; (i)[f]=nil; end; end; end; z=(128);
            return
        end
        -- block @ 1846: 2 instructions
        if PC == 1846 then
            z=k; x=488;
            if R[150]~=29 then PC = 1201 else PC = 1848 end;
            continue
        end
        -- block @ 1848: 1 instruction
        if PC == 1848 then
            PC = 571
            continue
        end
        -- block @ 1849: 1 instruction
        if PC == 1849 then
            PC = 14
            continue
        end
        -- block @ 1851: 6 instructions
        if PC == 1851 then
            z=159; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            z=R; x=160;
            J=689; z[x]=J;
            R[161]=(R[1][4]);
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 5139
            continue
        end
        -- block @ 1858: 1 instruction
        if PC == 1858 then
            if R[4]~=113 then PC = 2798 else PC = 1859 end;
            continue
        end
        -- block @ 1859: 1 instruction
        if PC == 1859 then
            PC = 1933
            continue
        end
        -- block @ 1860: 1 instruction
        if PC == 1860 then
            if not(not(R[154]<109)) then PC = 1861 else PC = 3789 end;
            continue
        end
        -- block @ 1861: 1 instruction
        if PC == 1861 then
            PC = 2660
            continue
        end
        -- block @ 1862: 1 instruction
        if PC == 1862 then
            if not(not(R[157]<38)) then PC = 1863 else PC = 883 end;
            continue
        end
        -- block @ 1863: 1 instruction
        if PC == 1863 then
            PC = 1504
            continue
        end
        -- block @ 1864: 2 instructions
        if PC == 1864 then
            R[155]=(R[149][47]);
            PC = 5395
            continue
        end
        -- block @ 1867: 4 instructions
        if PC == 1867 then
            R[158]=R[131];
            R[159]=(R[1][172]);
            R[159]=R[152][R[159]];
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1871 else R[151+3]=y; PC = 4397 end;
            continue
        end
        -- block @ 1871: 1 instruction
        if PC == 1871 then
            PC = 1765
            continue
        end
        -- block @ 1872: 1 instruction
        if PC == 1872 then
            PC = 1693
            continue
        end
        -- block @ 1873: 3 instructions
        if PC == 1873 then
            R[151]=(55);
            R[152]=(376);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 1985
            continue
        end
        -- block @ 1877: 8 instructions
        if PC == 1877 then
            d[17][4]=R[160];
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[159]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=(159); P=z;
            z=k;
            x=P; J=k; F=P;
            J=(J[F]); J=J(); (z)[x]=(J);
            PC = 2314
            continue
        end
        -- block @ 1886: 5 instructions
        if PC == 1886 then
            R[153]=R[94];
            z=R; x=154; J=R;
            F=(148); J=(J[F]); (z)[x]=J;
            R[155]=(R[1][96]);
            PC = 4749
            continue
        end
        -- block @ 1892: 3 instructions
        if PC == 1892 then
            R[143]=R[131];
            R[144]=R[67];
            PC = 278
            continue
        end
        -- block @ 1896: 3 instructions
        if PC == 1896 then
            R[156][1241304712]=R[150];
            R[156][1644906186]=R[150];
            PC = 3025
            continue
        end
        -- block @ 1900: 1 instruction
        if PC == 1900 then
            PC = 3069
            continue
        end
        -- block @ 1902: 3 instructions
        if PC == 1902 then
            R[117]=(R[1][92]);
            R[115]=R[3][R[117]];
            PC = 193
            continue
        end
        -- block @ 1906: 2 instructions
        if PC == 1906 then
            z=(150); (R[z])(R[z+1]); P=(z-1);
            PC = 1105
            continue
        end
        -- block @ 1909: 3 instructions
        if PC == 1909 then
            R[154]=(2);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 3849
            continue
        end
        -- block @ 1913: 1 instruction
        if PC == 1913 then
            if not(not(115<R[153])) then PC = 1914 else PC = 2430 end;
            continue
        end
        -- block @ 1914: 1 instruction
        if PC == 1914 then
            PC = 3100
            continue
        end
        -- block @ 1915: 4 instructions
        if PC == 1915 then
            R[137]=R[131];
            R[138]=R[21];
            z=(137); (R[z])(R[z+1]); P=(z-1);
            PC = 2665
            continue
        end
        -- block @ 1920: 1 instruction
        if PC == 1920 then
            if R[154]~=60 then PC = 4234 else PC = 1921 end;
            continue
        end
        -- block @ 1921: 1 instruction
        if PC == 1921 then
            PC = 3911
            continue
        end
        -- block @ 1922: 1 instruction
        if PC == 1922 then
            PC = 785
            continue
        end
        -- block @ 1923: 6 instructions
        if PC == 1923 then
            R[135]=R[131];
            R[136]=R[69];
            z=(135); (R[z])(R[z+1]); P=(z-1);
            R[135]=R[131];
            R[136]=R[91];
            PC = 2277
            continue
        end
        -- block @ 1930: 3 instructions
        if PC == 1930 then
            R[156]=(R[144][5]);
            R[155]=(R[155]>=R[156]);
            if not R[155] then PC = 1090 else PC = 1933 end;
            continue
        end
        -- block @ 1933: 1 instruction
        if PC == 1933 then
            PC = 1114
            continue
        end
        -- block @ 1934: 9 instructions
        if PC == 1934 then
            z=R; x=(143); J=k;
            F=(1);
            J=J[F]; F=48; J=(J[F]);
            z[x]=J;
            R[144]=R[94];
            R[145]=R[136];
            R[146]=(R[1][96]);
            z=(144); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3776
            continue
        end
        -- block @ 1944: 6 instructions
        if PC == 1944 then
            R[150]=(95);
            R[151]=R[98];
            R[152]=(R[148][8]);
            R[153]=R[11];
            P=153; R[P]=R[P]();
            PC = 4549
            continue
        end
        -- block @ 1951: 3 instructions
        if PC == 1951 then
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 887
            continue
        end
        -- block @ 1955: 4 instructions
        if PC == 1955 then
            P=152; R[P]=R[P]();
            R[153]=(R[149][28]);
            R[154]=(1);
            PC = 229
            continue
        end
        -- block @ 1960: 1 instruction
        if PC == 1960 then
            PC = 2535
            continue
        end
        -- block @ 1962: 2 instructions
        if PC == 1962 then
            R[154]=(2);
            PC = 501
            continue
        end
        -- block @ 1965: 7 instructions
        if PC == 1965 then
            R[136]=R[131];
            R[137]=R[25];
            z=(136); (R[z])(R[z+1]); P=(z-1);
            R[136]=R[131];
            R[137]=R[34];
            z=(136); (R[z])(R[z+1]); P=(z-1);
            PC = 3256
            continue
        end
        -- block @ 1973: 4 instructions
        if PC == 1973 then
            R[163]=R[163][R[164]];
            R[163]=(R[163]*100);
            R[65]=(d[30](R[163],Y[H]));
            PC = 1159
            continue
        end
        -- block @ 1978: 3 instructions
        if PC == 1978 then
            R[135]=R[131];
            R[136]=R[44];
            PC = 3067
            continue
        end
        -- block @ 1982: 3 instructions
        if PC == 1982 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=(164); x=R[153]; R[z+1]=(x); R[z]=x["GetTangentOnCurveArcLength"];
            PC = 3486
            continue
        end
        -- block @ 1986: 1 instruction
        if PC == 1986 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 1987 else R[151+3]=y; PC = 5091 end;
            continue
        end
        -- block @ 1987: 1 instruction
        if PC == 1987 then
            PC = 225
            continue
        end
        -- block @ 1988: 2 instructions
        if PC == 1988 then
            R[158]=(2);
            PC = 196
            continue
        end
        -- block @ 1991: 3 instructions
        if PC == 1991 then
            R[150]=(74);
            R[151]=(R[149][42]);
            PC = 4434
            continue
        end
        -- block @ 1995: 4 instructions
        if PC == 1995 then
            R[104]=nil;
            R[105]=(R[1][48]);
            R[106]=(R[1][48]);
            PC = 5041
            continue
        end
        -- block @ 2000: 2 instructions
        if PC == 2000 then
            z=(137); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 36
            continue
        end
        -- block @ 2003: 3 instructions
        if PC == 2003 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(R[149][13]);
            PC = 5696
            continue
        end
        -- block @ 2007: 3 instructions
        if PC == 2007 then
            R[156]=(R[1][33]);
            R[157]=(R[1][4]);
            PC = 133
            continue
        end
        -- block @ 2011: 1 instruction
        if PC == 2011 then
            PC = 4373
            continue
        end
        -- block @ 2012: 1 instruction
        if PC == 2012 then
            PC = 146
            continue
        end
        -- block @ 2013: 3 instructions
        if PC == 2013 then
            R[137]=R[131];
            R[138]=R[112];
            PC = 1999
            continue
        end
        -- block @ 2017: 1 instruction
        if PC == 2017 then
            if R[154]~=46 then PC = 488 else PC = 2018 end;
            continue
        end
        -- block @ 2018: 1 instruction
        if PC == 2018 then
            PC = 5587
            continue
        end
        -- block @ 2019: 1 instruction
        if PC == 2019 then
            if R[4]~=26 then PC = 2089 else PC = 2020 end;
            continue
        end
        -- block @ 2020: 1 instruction
        if PC == 2020 then
            PC = 4127
            continue
        end
        -- block @ 2021: 4 instructions
        if PC == 2021 then
            z=159; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[160]=R[149];
            R[161]=(R[1][4]);
            PC = 1066
            continue
        end
        -- block @ 2026: 2 instructions
        if PC == 2026 then
            R[155]=(R[149][2]);
            PC = 1985
            continue
        end
        -- block @ 2029: 5 instructions
        if PC == 2029 then
            R[162]=R[123];
            R[163]=(0);
            R[164]=(-4);
            R[165]=(0);
            PC = 5304
            continue
        end
        -- block @ 2035: 1 instruction
        if PC == 2035 then
            PC = 2550
            continue
        end
        -- block @ 2036: 7 instructions
        if PC == 2036 then
            P=152; R[P]=R[P]();
            R[153]=(R[149][17]);
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(R[149][48]);
            R[138][94]=R[151];
            PC = 2048
            continue
        end
        -- block @ 2044: 1 instruction
        if PC == 2044 then
            PC = 5458
            continue
        end
        -- block @ 2045: 2 instructions
        if PC == 2045 then
            R[38]=(R[1][80]);
            PC = 71
            continue
        end
        -- block @ 2048: 1 instruction
        if PC == 2048 then
            PC = 1648
            continue
        end
        -- block @ 2049: 3 instructions
        if PC == 2049 then
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 1816
            continue
        end
        -- block @ 2053: 6 instructions
        if PC == 2053 then
            R[155]=R[98];
            R[156]=R[88];
            R[157]=R[144];
            z=156; R[z]=R[z](R[z+1]); P=z;
            R[157]=("table");
            PC = 2690
            continue
        end
        -- block @ 2060: 4 instructions
        if PC == 2060 then
            R[118]=R[94];
            R[119]=R[13];
            R[120]=("running");
            PC = 2520
            continue
        end
        -- block @ 2065: 1 instruction
        if PC == 2065 then
            PC = 2018
            continue
        end
        -- block @ 2067: 1 instruction
        if PC == 2067 then
            PC = 4443
            continue
        end
        -- block @ 2069: 4 instructions
        if PC == 2069 then
            R[163]=(R[1][104]);
            R[162]=R[162][R[163]];
            R[163]=(R[1][4]);
            PC = 27
            continue
        end
        -- block @ 2074: 1 instruction
        if PC == 2074 then
            PC = 4740
            continue
        end
        -- block @ 2075: 3 instructions
        if PC == 2075 then
            R[62]=(R[1][81]);
            R[58]=R[35][R[62]];
            PC = 845
            continue
        end
        -- block @ 2079: 1 instruction
        if PC == 2079 then
            PC = 971
            continue
        end
        -- block @ 2081: 1 instruction
        if PC == 2081 then
            if R[4]~=30 then PC = 3664 else PC = 2082 end;
            continue
        end
        -- block @ 2082: 1 instruction
        if PC == 2082 then
            PC = 4864
            continue
        end
        -- block @ 2083: 1 instruction
        if PC == 2083 then
            if R[152]~=80 then PC = 4876 else PC = 2084 end;
            continue
        end
        -- block @ 2084: 1 instruction
        if PC == 2084 then
            PC = 5348
            continue
        end
        -- block @ 2085: 3 instructions
        if PC == 2085 then
            R[155]=(R[149][66]);
            R[138][60]=R[155];
            PC = 4451
            continue
        end
        -- block @ 2089: 1 instruction
        if PC == 2089 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 1831
            continue
        end
        -- block @ 2090: 3 instructions
        if PC == 2090 then
            R[154]=R[31];
            P=154; R[P]=R[P]();
            PC = 1074
            continue
        end
        -- block @ 2094: 1 instruction
        if PC == 2094 then
            if not(not(74<R[4])) then PC = 2095 else PC = 4070 end;
            continue
        end
        -- block @ 2095: 1 instruction
        if PC == 2095 then
            PC = 3232
            continue
        end
        -- block @ 2096: 1 instruction
        if PC == 2096 then
            if not(not(35<R[4])) then PC = 2097 else PC = 1462 end;
            continue
        end
        -- block @ 2097: 1 instruction
        if PC == 2097 then
            PC = 3553
            continue
        end
        -- block @ 2098: 2 instructions
        if PC == 2098 then
            R[80]=nil;
            PC = 598
            continue
        end
        -- block @ 2101: 1 instruction
        if PC == 2101 then
            PC = 3575
            continue
        end
        -- block @ 2103: 4 instructions
        if PC == 2103 then
            R[137]=R[131];
            R[138]=R[57];
            z=(137); (R[z])(R[z+1]); P=(z-1);
            PC = 4502
            continue
        end
        -- block @ 2108: 1 instruction
        if PC == 2108 then
            if not(not(92<R[152])) then PC = 2109 else PC = 1885 end;
            continue
        end
        -- block @ 2109: 1 instruction
        if PC == 2109 then
            PC = 4694
            continue
        end
        -- block @ 2110: 1 instruction
        if PC == 2110 then
            PC = 2294
            continue
        end
        -- block @ 2111: 3 instructions
        if PC == 2111 then
            local w=130; if not(i) then else for u,e in i do if not(u>=w) then else(e)[1]=e; (e)[2]=(R[u]); (e)[3]=2; (i)[u]=(nil); end; end; end;
            R[130]=(R[1][48]);
            PC = 1464
            continue
        end
        -- block @ 2115: 4 instructions
        if PC == 2115 then
            R[159]=R[60];
            R[160]=R[51];
            R[161]=R[46];
            PC = 3426
            continue
        end
        -- block @ 2120: 6 instructions
        if PC == 2120 then
            R[149]=R[145];
            R[150]=R[148];
            R[151]=(R[1][140]);
            z=(149); (R[z])(R[z+1],R[z+2]); P=z-1;
            z=(149); x=R[148]; R[z+1]=(x); R[z]=x["GetChildren"];
            PC = 2721
            continue
        end
        -- block @ 2127: 1 instruction
        if PC == 2127 then
            if not(not(R[157]<35)) then PC = 2128 else PC = 9 end;
            continue
        end
        -- block @ 2128: 1 instruction
        if PC == 2128 then
            PC = 960
            continue
        end
        -- block @ 2129: 1 instruction
        if PC == 2129 then
            PC = 448
            continue
        end
        -- block @ 2130: 1 instruction
        if PC == 2130 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2131 else R[151+3]=y; PC = 4495 end;
            continue
        end
        -- block @ 2131: 1 instruction
        if PC == 2131 then
            PC = 720
            continue
        end
        -- block @ 2132: 4 instructions
        if PC == 2132 then
            R[143]=R[131];
            R[144]=R[63];
            z=(143); (R[z])(R[z+1]); P=(z-1);
            PC = 2572
            continue
        end
        -- block @ 2137: 1 instruction
        if PC == 2137 then
            if not(not(40<R[154])) then PC = 2138 else PC = 234 end;
            continue
        end
        -- block @ 2138: 1 instruction
        if PC == 2138 then
            PC = 4723
            continue
        end
        -- block @ 2139: 2 instructions
        if PC == 2139 then
            R[136]=(R[1][48]);
            PC = 2705
            continue
        end
        -- block @ 2142: 8 instructions
        if PC == 2142 then
            R[155]=R[98];
            z=R; x=(156); J=k;
            F=(149);
            J=J[F]; F=39; J=(J[F]);
            z[x]=J;
            R[157]=R[11];
            P=157; R[P]=R[P]();
            PC = 3740
            continue
        end
        -- block @ 2151: 1 instruction
        if PC == 2151 then
            PC = 9
            continue
        end
        -- block @ 2153: 3 instructions
        if PC == 2153 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(R[148][1]);
            PC = 676
            continue
        end
        -- block @ 2157: 1 instruction
        if PC == 2157 then
            PC = 1014
            continue
        end
        -- block @ 2158: 4 instructions
        if PC == 2158 then
            R[158]=R[38];
            z=(156); (R[z])(R[z+1],R[z+2]); P=z-1;
            z=(156); x=R[150]; R[z+1]=(x); R[z]=x["GetChildren"];
            PC = 5152
            continue
        end
        -- block @ 2163: 2 instructions
        if PC == 2163 then
            z=(114); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3349
            continue
        end
        -- block @ 2166: 3 instructions
        if PC == 2166 then
            R[148]=(R[1][48]);
            R[149]=(R[1][48]);
            PC = 2630
            continue
        end
        -- block @ 2170: 2 instructions
        if PC == 2170 then
            R[142]=(R[1][137]);
            PC = 3997
            continue
        end
        -- block @ 2172: 6 instructions
        if PC == 2172 then
            R[15]=d[22](52);
            P=152; R[P]=R[P]();
            R[153]=(R[149][29]);
            R[154]=(2);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 594
            continue
        end
        -- block @ 2179: 1 instruction
        if PC == 2179 then
            if R[153]~=121 then PC = 2180 else PC = 1146 end;
            continue
        end
        -- block @ 2180: 1 instruction
        if PC == 2180 then
            PC = 3768
            continue
        end
        -- block @ 2181: 3 instructions
        if PC == 2181 then
            R[151]=(R[149][26]);
            R[138][76]=R[151];
            PC = 1650
            continue
        end
        -- block @ 2185: 5 instructions
        if PC == 2185 then
            R[112][R[113]]=R[114];
            R[113]=(R[1][38]);
            R[112][R[113]]=(-1);
            R[108]=R[112];
            PC = 1462
            continue
        end
        -- block @ 2191: 3 instructions
        if PC == 2191 then
            R[40]=(R[1][158]);
            R[34]=(R[40]["gmatch"]);
            PC = 71
            continue
        end
        -- block @ 2195: 1 instruction
        if PC == 2195 then
            if not(not(38<R[157])) then PC = 2196 else PC = 1 end;
            continue
        end
        -- block @ 2196: 1 instruction
        if PC == 2196 then
            PC = 1411
            continue
        end
        -- block @ 2197: 3 instructions
        if PC == 2197 then
            R[136]=R[131];
            R[137]=R[43];
            PC = 1287
            continue
        end
        -- block @ 2201: 2 instructions
        if PC == 2201 then
            R[164]=(D[H]);
            PC = 423
            continue
        end
        -- block @ 2204: 1 instruction
        if PC == 2204 then
            if R[4]~=49 then PC = 4068 else PC = 2205 end;
            continue
        end
        -- block @ 2205: 1 instruction
        if PC == 2205 then
            PC = 753
            continue
        end
        -- block @ 2206: 3 instructions
        if PC == 2206 then
            R[114]=(R[1][42]);
            z=(112); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 2573
            continue
        end
        -- block @ 2210: 1 instruction
        if PC == 2210 then
            PC = 2915
            continue
        end
        -- block @ 2212: 4 instructions
        if PC == 2212 then
            R[151]=(R[149][63]);
            R[138][63]=R[151];
            R[151]=R[98];
            PC = 3874
            continue
        end
        -- block @ 2217: 1 instruction
        if PC == 2217 then
            PC = 2531
            continue
        end
        -- block @ 2219: 5 instructions
        if PC == 2219 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[155]=R[97];
            z=(156); x=R[153]; R[z+1]=(x); R[z]=x["NextInteger"];
            R[158]=(300);
            PC = 4787
            continue
        end
        -- block @ 2225: 4 instructions
        if PC == 2225 then
            R[155]=R[97];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            PC = 5486
            continue
        end
        -- block @ 2230: 1 instruction
        if PC == 2230 then
            PC = 2335
            continue
        end
        -- block @ 2232: 2 instructions
        if PC == 2232 then
            R[35]=(R[1][158]);
            PC = 71
            continue
        end
        -- block @ 2235: 5 instructions
        if PC == 2235 then
            R[155]=R[98];
            R[156]=(R[149][55]);
            R[157]=R[11];
            P=157; R[P]=R[P]();
            PC = 1194
            continue
        end
        -- block @ 2241: 3 instructions
        if PC == 2241 then
            R[43]=(R[1][127]);
            R[40]=R[37][R[43]];
            PC = 4054
            continue
        end
        -- block @ 2245: 8 instructions
        if PC == 2245 then
            R[155]=R[98];
            z=R; x=(156); J=k;
            F=(149);
            J=J[F]; F=50; J=(J[F]);
            z[x]=J;
            R[157]=R[11];
            P=157; R[P]=R[P]();
            PC = 4545
            continue
        end
        -- block @ 2254: 2 instructions
        if PC == 2254 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 855
            continue
        end
        -- block @ 2257: 3 instructions
        if PC == 2257 then
            R[157]=(R[149][5]);
            R[158]=(2);
            PC = 3894
            continue
        end
        -- block @ 2261: 6 instructions
        if PC == 2261 then
            R[150]=R[131];
            R[151]=(R[1][120]);
            R[151]=R[148][R[151]];
            z=(150); (R[z])(R[z+1]); P=(z-1);
            z=163; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            PC = 5047
            continue
        end
        -- block @ 2268: 9 instructions
        if PC == 2268 then
            R[158]=R[97];
            R[159]=(R[1][61]);
            R[159]=R[154][R[159]];
            R[160]=(R[1][61]);
            R[160]=R[154][R[160]];
            R[161]=(R[1][4]);
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[158]=(R[1][111]);
            PC = 2150
            continue
        end
        -- block @ 2278: 1 instruction
        if PC == 2278 then
            PC = 5472
            continue
        end
        -- block @ 2280: 2 instructions
        if PC == 2280 then
            R[158]=(2);
            PC = 4030
            continue
        end
        -- block @ 2283: 1 instruction
        if PC == 2283 then
            if R[157]~=114 then PC = 1207 else PC = 2284 end;
            continue
        end
        -- block @ 2284: 1 instruction
        if PC == 2284 then
            PC = 2589
            continue
        end
        -- block @ 2285: 2 instructions
        if PC == 2285 then
            R[119]=(d[17][17]);
            PC = 2386
            continue
        end
        -- block @ 2288: 1 instruction
        if PC == 2288 then
            if not(not(R[150]<105)) then PC = 2289 else PC = 1226 end;
            continue
        end
        -- block @ 2289: 1 instruction
        if PC == 2289 then
            PC = 185
            continue
        end
        -- block @ 2290: 4 instructions
        if PC == 2290 then
            R[159]=(R[1][48]);
            d[17][10]=R[159];
            R[159]=(R[1][48]);
            PC = 3230
            continue
        end
        -- block @ 2295: 1 instruction
        if PC == 2295 then
            if not(not(43<R[4])) then PC = 2296 else PC = 5220 end;
            continue
        end
        -- block @ 2296: 1 instruction
        if PC == 2296 then
            PC = 3711
            continue
        end
        -- block @ 2297: 3 instructions
        if PC == 2297 then
            R[167]=R[72];
            R[168]=R[154];
            PC = 3273
            continue
        end
        -- block @ 2301: 1 instruction
        if PC == 2301 then
            if not(not(R[157]<309)) then PC = 2302 else PC = 2494 end;
            continue
        end
        -- block @ 2302: 1 instruction
        if PC == 2302 then
            PC = 4109
            continue
        end
        -- block @ 2303: 1 instruction
        if PC == 2303 then
            if R[163]~=10 then PC = 153 else PC = 2304 end;
            continue
        end
        -- block @ 2304: 1 instruction
        if PC == 2304 then
            PC = 426
            continue
        end
        -- block @ 2305: 1 instruction
        if PC == 2305 then
            if R[154]~=307 then PC = 803 else PC = 2306 end;
            continue
        end
        -- block @ 2306: 1 instruction
        if PC == 2306 then
            PC = 3984
            continue
        end
        -- block @ 2307: 5 instructions
        if PC == 2307 then
            R[156]=R[98];
            R[157]=("The metatable is locked");
            R[158]=R[44];
            R[159]=R[149];
            PC = 3238
            continue
        end
        -- block @ 2313: 1 instruction
        if PC == 2313 then
            if R[155]~=234 then PC = 523 else PC = 2314 end;
            continue
        end
        -- block @ 2314: 1 instruction
        if PC == 2314 then
            PC = 3266
            continue
        end
        -- block @ 2315: 1 instruction
        if PC == 2315 then
            PC = 5359
            continue
        end
        -- block @ 2317: 10 instructions
        if PC == 2317 then
            R[138][26]=R[151];
            z=R; x=151; J=R;
            F=(97); J=(J[F]); (z)[x]=J;
            R[152]=R[11];
            P=152; R[P]=R[P]();
            R[153]=(R[148][14]);
            R[154]=(2);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(R[149][57]);
            PC = 5484
            continue
        end
        -- block @ 2328: 1 instruction
        if PC == 2328 then
            if R[154]~=328 then PC = 5175 else PC = 2329 end;
            continue
        end
        -- block @ 2329: 1 instruction
        if PC == 2329 then
            PC = 1353
            continue
        end
        -- block @ 2330: 1 instruction
        if PC == 2330 then
            if R[4]~=53 then PC = 172 else PC = 2331 end;
            continue
        end
        -- block @ 2331: 1 instruction
        if PC == 2331 then
            PC = 2059
            continue
        end
        -- block @ 2332: 3 instructions
        if PC == 2332 then
            R[77]=(R[1][161]);
            R[74]=R[2][R[77]];
            PC = 2406
            continue
        end
        -- block @ 2336: 6 instructions
        if PC == 2336 then
            R[155]=(R[144][5]);
            R[154]=R[154]+R[155];
            R[155]=(R[144][1]);
            R[156]=(R[144][1]);
            z=153; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            PC = 655
            continue
        end
        -- block @ 2343: 1 instruction
        if PC == 2343 then
            PC = 4292
            continue
        end
        -- block @ 2344: 1 instruction
        if PC == 2344 then
            PC = 2839
            continue
        end
        -- block @ 2345: 1 instruction
        if PC == 2345 then
            if not(not(18<R[4])) then PC = 2346 else PC = 3415 end;
            continue
        end
        -- block @ 2346: 1 instruction
        if PC == 2346 then
            PC = 5419
            continue
        end
        -- block @ 2347: 1 instruction
        if PC == 2347 then
            if not(not(48<R[152])) then PC = 2348 else PC = 5386 end;
            continue
        end
        -- block @ 2348: 1 instruction
        if PC == 2348 then
            PC = 4623
            continue
        end
        -- block @ 2349: 1 instruction
        if PC == 2349 then
            PC = 5166
            continue
        end
        -- block @ 2350: 1 instruction
        if PC == 2350 then
            PC = 2622
            continue
        end
        -- block @ 2351: 3 instructions
        if PC == 2351 then
            R[113]=R[65];
            R[114]=(R[1][36]);
            PC = 182
            continue
        end
        -- block @ 2355: 1 instruction
        if PC == 2355 then
            if not(not(R[165]<=55)) then PC = 2356 else PC = 2506 end;
            continue
        end
        -- block @ 2356: 1 instruction
        if PC == 2356 then
            PC = 305
            continue
        end
        -- block @ 2357: 1 instruction
        if PC == 2357 then
            if not(not(l[H]<R[366])) then PC = 2359 else PC = 107 end;
            continue
        end
        -- block @ 2359: 5 instructions
        if PC == 2359 then
            R[151]=R[98];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            R[153]=(R[149][9]);
            PC = 1025
            continue
        end
        -- block @ 2365: 3 instructions
        if PC == 2365 then
            R[74]=(R[1][87]);
            R[72]=R[37][R[74]];
            PC = 4281
            continue
        end
        -- block @ 2369: 1 instruction
        if PC == 2369 then
            if not(21<=R[4]) then PC = 4306 else PC = 2370 end;
            continue
        end
        -- block @ 2370: 1 instruction
        if PC == 2370 then
            PC = 2102
            continue
        end
        -- block @ 2371: 1 instruction
        if PC == 2371 then
            PC = 5209
            continue
        end
        -- block @ 2372: 1 instruction
        if PC == 2372 then
            if not(not(147<R[154])) then PC = 2373 else PC = 3148 end;
            continue
        end
        -- block @ 2373: 1 instruction
        if PC == 2373 then
            PC = 1443
            continue
        end
        -- block @ 2374: 1 instruction
        if PC == 2374 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2375 else R[160+3]=y; PC = 4361 end;
            continue
        end
        -- block @ 2375: 1 instruction
        if PC == 2375 then
            PC = 5404
            continue
        end
        -- block @ 2376: 1 instruction
        if PC == 2376 then
            if not(not(75<R[154])) then PC = 2377 else PC = 2129 end;
            continue
        end
        -- block @ 2377: 1 instruction
        if PC == 2377 then
            PC = 1712
            continue
        end
        -- block @ 2378: 1 instruction
        if PC == 2378 then
            if R[154]~=78 then PC = 2824 else PC = 2379 end;
            continue
        end
        -- block @ 2379: 1 instruction
        if PC == 2379 then
            PC = 3456
            continue
        end
        -- block @ 2380: 2 instructions
        if PC == 2380 then
            R[4]=(7);
            PC = 482
            continue
        end
        -- block @ 2383: 3 instructions
        if PC == 2383 then
            R[156]=(R[1][166]);
            R[143]=(d[17][10]);
            PC = 428
            continue
        end
        -- block @ 2387: 1 instruction
        if PC == 2387 then
            if not(not(1<R[4])) then PC = 2388 else PC = 542 end;
            continue
        end
        -- block @ 2388: 1 instruction
        if PC == 2388 then
            PC = 258
            continue
        end
        -- block @ 2389: 2 instructions
        if PC == 2389 then
            z=Protos[143]; R[395]=z[1][z[3]][R[478]];
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2391 else R[151+3]=y; PC = 1018 end;
            continue
        end
        -- block @ 2391: 1 instruction
        if PC == 2391 then
            if not(not(R[4]<=21)) then PC = 2392 else PC = 3668 end;
            continue
        end
        -- block @ 2392: 1 instruction
        if PC == 2392 then
            PC = 1043
            continue
        end
        -- block @ 2393: 1 instruction
        if PC == 2393 then
            PC = 3256
            continue
        end
        -- block @ 2394: 4 instructions
        if PC == 2394 then
            R[136]=R[131];
            R[137]=R[36];
            z=(136); (R[z])(R[z+1]); P=(z-1);
            PC = 3256
            continue
        end
        -- block @ 2399: 1 instruction
        if PC == 2399 then
            if not(not(75<R[4])) then PC = 2400 else PC = 161 end;
            continue
        end
        -- block @ 2400: 1 instruction
        if PC == 2400 then
            PC = 2871
            continue
        end
        -- block @ 2401: 4 instructions
        if PC == 2401 then
            R[156]=(a);
            F=R; U=(272);
            z=225; (R[z])(d[28](k,z+1,P)); P=z-1;
            if R[154]~=285 then PC = 600 else PC = 2406 end;
            continue
        end
        -- block @ 2406: 1 instruction
        if PC == 2406 then
            PC = 2853
            continue
        end
        -- block @ 2407: 2 instructions
        if PC == 2407 then
            R[75]=R[35][R[77]];
            PC = 1357
            continue
        end
        -- block @ 2410: 1 instruction
        if PC == 2410 then
            if R[150]~=74 then PC = 75 else PC = 2411 end;
            continue
        end
        -- block @ 2411: 1 instruction
        if PC == 2411 then
            PC = 4779
            continue
        end
        -- block @ 2412: 2 instructions
        if PC == 2412 then
            R[158]=(#R[157]);
            if not(not(R[158]<20)) then PC = 2414 else PC = 4909 end;
            continue
        end
        -- block @ 2414: 1 instruction
        if PC == 2414 then
            PC = 2156
            continue
        end
        -- block @ 2415: 6 instructions
        if PC == 2415 then
            R[135]=R[26];
            R[136]=R[7];
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[137]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=136; R[z]=R[z](R[z+1]); P=z;
            z=(135); (R[z])(R[z+1]); P=(z-1);
            PC = 4443
            continue
        end
        -- block @ 2422: 5 instructions
        if PC == 2422 then
            R[26]=nil;
            R[27]=(43881333);
            R[28]=(R[1][48]);
            R[29]=(R[1][48]);
            PC = 2216
            continue
        end
        -- block @ 2428: 2 instructions
        if PC == 2428 then
            R[165]=(R[1][4]);
            PC = 3330
            continue
        end
        -- block @ 2431: 1 instruction
        if PC == 2431 then
            if not(not(R[153]<173)) then PC = 2432 else PC = 21 end;
            continue
        end
        -- block @ 2432: 1 instruction
        if PC == 2432 then
            PC = 824
            continue
        end
        -- block @ 2433: 3 instructions
        if PC == 2433 then
            R[155]=R[98];
            R[156]=(R[149][58]);
            PC = 1701
            continue
        end
        -- block @ 2437: 1 instruction
        if PC == 2437 then
            if not(not(R[150]<102)) then PC = 2438 else PC = 1502 end;
            continue
        end
        -- block @ 2438: 1 instruction
        if PC == 2438 then
            PC = 4445
            continue
        end
        -- block @ 2439: 5 instructions
        if PC == 2439 then
            z=R; x=112; J=R;
            F=(94); J=(J[F]); (z)[x]=J;
            R[113]=R[44];
            R[114]=(R[1][65]);
            PC = 4259
            continue
        end
        -- block @ 2445: 4 instructions
        if PC == 2445 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[150]=R[98];
            R[151]=R[11];
            PC = 3243
            continue
        end
        -- block @ 2450: 5 instructions
        if PC == 2450 then
            R[161]=(R[156]["Y"]);
            R[162]=(R[1][104]);
            R[161]=R[161][R[162]];
            R[161]=(R[161]*100);
            PC = 3289
            continue
        end
        -- block @ 2456: 1 instruction
        if PC == 2456 then
            if not(not(R[150]<85)) then PC = 2457 else PC = 2728 end;
            continue
        end
        -- block @ 2457: 1 instruction
        if PC == 2457 then
            PC = 4895
            continue
        end
        -- block @ 2458: 1 instruction
        if PC == 2458 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2459 else R[151+3]=y; PC = 65 end;
            continue
        end
        -- block @ 2459: 1 instruction
        if PC == 2459 then
            PC = 4491
            continue
        end
        -- block @ 2460: 1 instruction
        if PC == 2460 then
            if not(not(13<R[150])) then PC = 2461 else PC = 3549 end;
            continue
        end
        -- block @ 2461: 1 instruction
        if PC == 2461 then
            PC = 4369
            continue
        end
        -- block @ 2462: 1 instruction
        if PC == 2462 then
            if R[4]~=19 then PC = 3349 else PC = 2463 end;
            continue
        end
        -- block @ 2463: 1 instruction
        if PC == 2463 then
            PC = 2593
            continue
        end
        -- block @ 2464: 1 instruction
        if PC == 2464 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2465 else R[152+3]=y; PC = 1825 end;
            continue
        end
        -- block @ 2465: 1 instruction
        if PC == 2465 then
            PC = 2587
            continue
        end
        -- block @ 2466: 1 instruction
        if PC == 2466 then
            PC = 3014
            continue
        end
        -- block @ 2468: 1 instruction
        if PC == 2468 then
            if not(168<=R[154]) then PC = 605 else PC = 2469 end;
            continue
        end
        -- block @ 2469: 1 instruction
        if PC == 2469 then
            PC = 1442
            continue
        end
        -- block @ 2470: 1 instruction
        if PC == 2470 then
            if not(not(R[152]<81)) then PC = 2471 else PC = 2901 end;
            continue
        end
        -- block @ 2471: 1 instruction
        if PC == 2471 then
            PC = 78
            continue
        end
        -- block @ 2472: 1 instruction
        if PC == 2472 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2473 else R[151+3]=y; PC = 3631 end;
            continue
        end
        -- block @ 2473: 1 instruction
        if PC == 2473 then
            PC = 2948
            continue
        end
        -- block @ 2474: 3 instructions
        if PC == 2474 then
            R[155]=(R[1][134]);
            R[156]=(R[1][4]);
            PC = 116
            continue
        end
        -- block @ 2478: 5 instructions
        if PC == 2478 then
            z=R; x=155; J=R;
            F=(97); J=(J[F]); (z)[x]=J;
            R[156]=R[11];
            P=156; R[P]=R[P]();
            PC = 368
            continue
        end
        -- block @ 2484: 1 instruction
        if PC == 2484 then
            if not(124<=R[4]) then PC = 4617 else PC = 2485 end;
            continue
        end
        -- block @ 2485: 1 instruction
        if PC == 2485 then
            PC = 1251
            continue
        end
        -- block @ 2486: 3 instructions
        if PC == 2486 then
            R[161]=(R[1][4]);
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 822
            continue
        end
        -- block @ 2490: 1 instruction
        if PC == 2490 then
            PC = 1901
            continue
        end
        -- block @ 2491: 1 instruction
        if PC == 2491 then
            if not(not(R[150]<99)) then PC = 2492 else PC = 2638 end;
            continue
        end
        -- block @ 2492: 1 instruction
        if PC == 2492 then
            PC = 314
            continue
        end
        -- block @ 2493: 1 instruction
        if PC == 2493 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2494 else R[151+3]=y; PC = 5721 end;
            continue
        end
        -- block @ 2494: 1 instruction
        if PC == 2494 then
            PC = 5114
            continue
        end
        -- block @ 2495: 1 instruction
        if PC == 2495 then
            if not(not(309<R[157])) then PC = 2496 else PC = 2535 end;
            continue
        end
        -- block @ 2496: 1 instruction
        if PC == 2496 then
            PC = 1559
            continue
        end
        -- block @ 2497: 5 instructions
        if PC == 2497 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[154]=R[97];
            R[155]=R[149];
            z=(156); x=R[152]; R[z+1]=(x); R[z]=x["FromValue"];
            PC = 4566
            continue
        end
        -- block @ 2503: 2 instructions
        if PC == 2503 then
            R[155]=(R[149][19]);
            PC = 971
            continue
        end
        -- block @ 2506: 1 instruction
        if PC == 2506 then
            PC = 5215
            continue
        end
        -- block @ 2507: 3 instructions
        if PC == 2507 then
            R[165]=(55);
            R[166]=R[69];
            PC = 1499
            continue
        end
        -- block @ 2511: 1 instruction
        if PC == 2511 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(159); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 5047
            continue
        end
        -- block @ 2512: 1 instruction
        if PC == 2512 then
            PC = 1118
            continue
        end
        -- block @ 2513: 1 instruction
        if PC == 2513 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2514 else R[164+3]=y; PC = 3742 end;
            continue
        end
        -- block @ 2514: 1 instruction
        if PC == 2514 then
            PC = 1337
            continue
        end
        -- block @ 2515: 1 instruction
        if PC == 2515 then
            if not(not(R[4]<27)) then PC = 2516 else PC = 2784 end;
            continue
        end
        -- block @ 2516: 1 instruction
        if PC == 2516 then
            PC = 4275
            continue
        end
        -- block @ 2517: 1 instruction
        if PC == 2517 then
            if not(not(R[154]<199)) then PC = 2518 else PC = 2471 end;
            continue
        end
        -- block @ 2518: 1 instruction
        if PC == 2518 then
            PC = 2700
            continue
        end
        -- block @ 2519: 1 instruction
        if PC == 2519 then
            if R[4]~=17 then PC = 4854 else PC = 2520 end;
            continue
        end
        -- block @ 2520: 1 instruction
        if PC == 2520 then
            PC = 5346
            continue
        end
        -- block @ 2521: 4 instructions
        if PC == 2521 then
            R[118]=R[94];
            R[119]=R[14];
            R[120]=(R[1][127]);
            PC = 1097
            continue
        end
        -- block @ 2525: 2 instructions
        if PC == 2525 then
            z=R; x=(182);
            if R[152]~=62 then PC = 4771 else PC = 2528 end;
            continue
        end
        -- block @ 2528: 1 instruction
        if PC == 2528 then
            PC = 4247
            continue
        end
        -- block @ 2529: 2 instructions
        if PC == 2529 then
            R[155]=(R[149][3]);
            PC = 1476
            continue
        end
        -- block @ 2532: 1 instruction
        if PC == 2532 then
            if R[4]~=8 then PC = 5297 else PC = 2533 end;
            continue
        end
        -- block @ 2533: 1 instruction
        if PC == 2533 then
            PC = 4686
            continue
        end
        -- block @ 2534: 1 instruction
        if PC == 2534 then
            PC = 3252
            continue
        end
        -- block @ 2536: 1 instruction
        if PC == 2536 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2537 else R[154+3]=y; PC = 5674 end;
            continue
        end
        -- block @ 2537: 1 instruction
        if PC == 2537 then
            PC = 463
            continue
        end
        -- block @ 2538: 1 instruction
        if PC == 2538 then
            if not(not(73<R[152])) then PC = 2539 else PC = 1238 end;
            continue
        end
        -- block @ 2539: 1 instruction
        if PC == 2539 then
            PC = 5525
            continue
        end
        -- block @ 2540: 3 instructions
        if PC == 2540 then
            z=(149); x=R[149]; R[z+1]=(x); R[z]=x["byte"];
            R[151]=(1);
            PC = 4849
            continue
        end
        -- block @ 2544: 1 instruction
        if PC == 2544 then
            if R[154]~=109 then PC = 1831 else PC = 2545 end;
            continue
        end
        -- block @ 2545: 1 instruction
        if PC == 2545 then
            PC = 1806
            continue
        end
        -- block @ 2546: 4 instructions
        if PC == 2546 then
            z=R; x=135; J=R;
            F=(131); J=(J[F]); (z)[x]=J;
            R[136]=R[39];
            PC = 5057
            continue
        end
        -- block @ 2551: 7 instructions
        if PC == 2551 then
            R[155]=R[97];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[149][71]);
            R[158]=(2);
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 4279
            continue
        end
        -- block @ 2559: 3 instructions
        if PC == 2559 then
            R[138]=R[131];
            R[139]=R[26];
            PC = 5412
            continue
        end
        -- block @ 2563: 1 instruction
        if PC == 2563 then
            PC = 4410
            continue
        end
        -- block @ 2564: 1 instruction
        if PC == 2564 then
            PC = 4210
            continue
        end
        -- block @ 2566: 1 instruction
        if PC == 2566 then
            if R[154] then PC = 2335 else PC = 2567 end;
            continue
        end
        -- block @ 2567: 1 instruction
        if PC == 2567 then
            PC = 2229
            continue
        end
        -- block @ 2568: 4 instructions
        if PC == 2568 then
            R[158]=(0);
            z=154; P=z+5-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[151][R[153]]=R[154];
            PC = 491
            continue
        end
        -- block @ 2573: 1 instruction
        if PC == 2573 then
            PC = 161
            continue
        end
        -- block @ 2574: 1 instruction
        if PC == 2574 then
            PC = 4114
            continue
        end
        -- block @ 2576: 1 instruction
        if PC == 2576 then
            if not(not(10<R[154])) then PC = 2577 else PC = 4023 end;
            continue
        end
        -- block @ 2577: 1 instruction
        if PC == 2577 then
            PC = 2034
            continue
        end
        -- block @ 2578: 1 instruction
        if PC == 2578 then
            if R[156]~=102 then PC = 4072 else PC = 2579 end;
            continue
        end
        -- block @ 2579: 1 instruction
        if PC == 2579 then
            PC = 4652
            continue
        end
        -- block @ 2580: 1 instruction
        if PC == 2580 then
            if R[154]~=30 then PC = 196 else PC = 2581 end;
            continue
        end
        -- block @ 2581: 1 instruction
        if PC == 2581 then
            PC = 1185
            continue
        end
        -- block @ 2582: 3 instructions
        if PC == 2582 then
            z=(143); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[143]=(R[1][48]);
            PC = 2798
            continue
        end
        -- block @ 2586: 1 instruction
        if PC == 2586 then
            if R[4]~=28 then PC = 4032 else PC = 2587 end;
            continue
        end
        -- block @ 2587: 1 instruction
        if PC == 2587 then
            PC = 565
            continue
        end
        -- block @ 2588: 1 instruction
        if PC == 2588 then
            PC = 3114
            continue
        end
        -- block @ 2590: 1 instruction
        if PC == 2590 then
            PC = 5338
            continue
        end
        -- block @ 2591: 1 instruction
        if PC == 2591 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2592 else R[157+3]=y; PC = 452 end;
            continue
        end
        -- block @ 2592: 1 instruction
        if PC == 2592 then
            PC = 4175
            continue
        end
        -- block @ 2593: 1 instruction
        if PC == 2593 then
            PC = 3989
            continue
        end
        -- block @ 2594: 1 instruction
        if PC == 2594 then
            PC = 1760
            continue
        end
        -- block @ 2595: 2 instructions
        if PC == 2595 then
            z=150; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 1122
            continue
        end
        -- block @ 2598: 3 instructions
        if PC == 2598 then
            z=(120); (R[z])(R[z+1],R[z+2]); P=z-1;
            z=R; x=4;
            PC = 2386
            continue
        end
        -- block @ 2602: 2 instructions
        if PC == 2602 then
            z=(150); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 2640
            continue
        end
        -- block @ 2605: 1 instruction
        if PC == 2605 then
            PC = 5114
            continue
        end
        -- block @ 2606: 1 instruction
        if PC == 2606 then
            if not(not(R[154]<10)) then PC = 2607 else PC = 669 end;
            continue
        end
        -- block @ 2607: 1 instruction
        if PC == 2607 then
            PC = 2477
            continue
        end
        -- block @ 2608: 1 instruction
        if PC == 2608 then
            if not(112<=R[4]) then PC = 1092 else PC = 2609 end;
            continue
        end
        -- block @ 2609: 1 instruction
        if PC == 2609 then
            PC = 2364
            continue
        end
        -- block @ 2610: 4 instructions
        if PC == 2610 then
            R[162]=(R[1][48]);
            R[163]=(R[1][48]);
            R[164]=(R[1][48]);
            PC = 1505
            continue
        end
        -- block @ 2615: 1 instruction
        if PC == 2615 then
            if not(not(37<R[163])) then PC = 2616 else PC = 2373 end;
            continue
        end
        -- block @ 2616: 1 instruction
        if PC == 2616 then
            PC = 566
            continue
        end
        -- block @ 2617: 1 instruction
        if PC == 2617 then
            PC = 2940
            continue
        end
        -- block @ 2619: 3 instructions
        if PC == 2619 then
            z=160; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[122]=R[157];
            PC = 5523
            continue
        end
        -- block @ 2623: 5 instructions
        if PC == 2623 then
            R[150]=R[145];
            z=R; x=151; J=R;
            F=(148); J=(J[F]); (z)[x]=J;
            R[152]=(R[1][131]);
            PC = 4873
            continue
        end
        -- block @ 2629: 1 instruction
        if PC == 2629 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(157); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 27
            continue
        end
        -- block @ 2631: 4 instructions
        if PC == 2631 then
            R[151]=(236);
            R[152]=(58);
            R[4]=(33);
            PC = 2080
            continue
        end
        -- block @ 2636: 1 instruction
        if PC == 2636 then
            PC = 247
            continue
        end
        -- block @ 2637: 1 instruction
        if PC == 2637 then
            if R[4]~=122 then PC = 1809 else PC = 2638 end;
            continue
        end
        -- block @ 2638: 1 instruction
        if PC == 2638 then
            PC = 3172
            continue
        end
        -- block @ 2639: 1 instruction
        if PC == 2639 then
            if not(not(13<R[150])) then PC = 2640 else PC = 1502 end;
            continue
        end
        -- block @ 2640: 1 instruction
        if PC == 2640 then
            PC = 2436
            continue
        end
        -- block @ 2641: 1 instruction
        if PC == 2641 then
            if R[149]~=116 then PC = 167 else PC = 2642 end;
            continue
        end
        -- block @ 2642: 1 instruction
        if PC == 2642 then
            PC = 4498
            continue
        end
        -- block @ 2643: 1 instruction
        if PC == 2643 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; P=(156); z=d[3](function(...)(d[42])(); for w,u in...do(d[42])(true,w,u); end; end); (z)(R[P],R[P+1],R[P+2]); y=z;
            PC = 4909
            continue
        end
        -- block @ 2644: 3 instructions
        if PC == 2644 then
            R[155]=R[98];
            R[156]=(R[149][69]);
            PC = 4704
            continue
        end
        -- block @ 2648: 2 instructions
        if PC == 2648 then
            R[53]=(R[1][48]);
            PC = 1169
            continue
        end
        -- block @ 2651: 1 instruction
        if PC == 2651 then
            if not(not(80<R[162])) then PC = 2652 else PC = 5047 end;
            continue
        end
        -- block @ 2652: 1 instruction
        if PC == 2652 then
            PC = 2843
            continue
        end
        -- block @ 2653: 5 instructions
        if PC == 2653 then
            R[153]=(R[1][25]);
            R[154]=(R[1][152]);
            R[155]=(R[144][5]);
            z=154; R[z]=R[z](R[z+1]); P=z;
            PC = 4009
            continue
        end
        -- block @ 2659: 1 instruction
        if PC == 2659 then
            if not(not(R[154]<110)) then PC = 2660 else PC = 971 end;
            continue
        end
        -- block @ 2660: 1 instruction
        if PC == 2660 then
            PC = 2502
            continue
        end
        -- block @ 2661: 2 instructions
        if PC == 2661 then
            R[155]=(R[149][33]);
            PC = 5388
            continue
        end
        -- block @ 2664: 1 instruction
        if PC == 2664 then
            if not(not(40<R[4])) then PC = 2665 else PC = 2734 end;
            continue
        end
        -- block @ 2665: 1 instruction
        if PC == 2665 then
            PC = 3614
            continue
        end
        -- block @ 2666: 1 instruction
        if PC == 2666 then
            PC = 36
            continue
        end
        -- block @ 2667: 1 instruction
        if PC == 2667 then
            PC = 5691
            continue
        end
        -- block @ 2668: 1 instruction
        if PC == 2668 then
            if not(not(39<R[154])) then PC = 2669 else PC = 3789 end;
            continue
        end
        -- block @ 2669: 1 instruction
        if PC == 2669 then
            PC = 1859
            continue
        end
        -- block @ 2670: 5 instructions
        if PC == 2670 then
            R[148]=R[97];
            R[149]=R[38];
            R[150]=(R[142]["Parent"]);
            R[151]=(R[1][4]);
            PC = 3446
            continue
        end
        -- block @ 2676: 1 instruction
        if PC == 2676 then
            if R[155]~=108 then PC = 3451 else PC = 2677 end;
            continue
        end
        -- block @ 2677: 1 instruction
        if PC == 2677 then
            PC = 2306
            continue
        end
        -- block @ 2678: 1 instruction
        if PC == 2678 then
            if R[4]~=123 then PC = 340 else PC = 2679 end;
            continue
        end
        -- block @ 2679: 1 instruction
        if PC == 2679 then
            PC = 2348
            continue
        end
        -- block @ 2680: 3 instructions
        if PC == 2680 then
            R[159]=(R[154]*100);
            R[65]=(d[30](R[159],Y[H]));
            PC = 5333
            continue
        end
        -- block @ 2684: 5 instructions
        if PC == 2684 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[152]=R[98];
            R[153]=R[88];
            R[154]=R[150];
            PC = 3822
            continue
        end
        -- block @ 2690: 1 instruction
        if PC == 2690 then
            PC = 1597
            continue
        end
        -- block @ 2691: 1 instruction
        if PC == 2691 then
            PC = 2471
            continue
        end
        -- block @ 2693: 5 instructions
        if PC == 2693 then
            R[156]=R[94];
            R[157]=(R[1][167]);
            R[157]=R[149][R[157]];
            R[158]=(R[1][167]);
            PC = 5039
            continue
        end
        -- block @ 2699: 1 instruction
        if PC == 2699 then
            if R[150]~=54 then PC = 4799 else PC = 2700 end;
            continue
        end
        -- block @ 2700: 1 instruction
        if PC == 2700 then
            PC = 1290
            continue
        end
        -- block @ 2701: 3 instructions
        if PC == 2701 then
            R[155]=R[98];
            R[156]=(9);
            PC = 5725
            continue
        end
        -- block @ 2705: 1 instruction
        if PC == 2705 then
            PC = 323
            continue
        end
        -- block @ 2706: 3 instructions
        if PC == 2706 then
            R[67]=R[52];
            R[68]=(B["debug"]);
            PC = 1283
            continue
        end
        -- block @ 2710: 4 instructions
        if PC == 2710 then
            R[148]=(R[1][48]);
            R[149]=(48);
            R[150]=(94);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(149); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2903
            continue
        end
        -- block @ 2715: 6 instructions
        if PC == 2715 then
            R[155]=R[98];
            R[156]=(R[148][11]);
            R[157]=R[11];
            P=157; R[P]=R[P]();
            R[158]=(1);
            PC = 4260
            continue
        end
        -- block @ 2722: 1 instruction
        if PC == 2722 then
            PC = 3621
            continue
        end
        -- block @ 2723: 5 instructions
        if PC == 2723 then
            R[150]=(12);
            R[151]=R[98];
            R[152]=(R[149][15]);
            R[153]=R[11];
            PC = 5560
            continue
        end
        -- block @ 2729: 1 instruction
        if PC == 2729 then
            if not(not(78<R[150])) then PC = 2730 else PC = 2455 end;
            continue
        end
        -- block @ 2730: 1 instruction
        if PC == 2730 then
            PC = 1001
            continue
        end
        -- block @ 2731: 3 instructions
        if PC == 2731 then
            R[65]=(d[30](R[165],Y[H]));
            R[138][118]=R[165];
            PC = 3254
            continue
        end
        -- block @ 2735: 1 instruction
        if PC == 2735 then
            if not(not(26<R[4])) then PC = 2736 else PC = 3380 end;
            continue
        end
        -- block @ 2736: 1 instruction
        if PC == 2736 then
            PC = 4921
            continue
        end
        -- block @ 2737: 3 instructions
        if PC == 2737 then
            R[151]=(R[148][13]);
            R[138][18]=R[151];
            PC = 4542
            continue
        end
        -- block @ 2741: 1 instruction
        if PC == 2741 then
            if not(not(R[160]<180)) then PC = 2742 else PC = 5602 end;
            continue
        end
        -- block @ 2742: 1 instruction
        if PC == 2742 then
            PC = 4261
            continue
        end
        -- block @ 2743: 5 instructions
        if PC == 2743 then
            R[117]=R[94];
            R[118]=R[43];
            R[119]=(R[1][34]);
            z=(117); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 1699
            continue
        end
        -- block @ 2749: 3 instructions
        if PC == 2749 then
            R[151]=(R[149][11]);
            R[138][81]=R[151];
            PC = 1481
            continue
        end
        -- block @ 2753: 3 instructions
        if PC == 2753 then
            R[87]=(R[1][48]);
            R[88]=(R[1][48]);
            PC = 2379
            continue
        end
        -- block @ 2757: 3 instructions
        if PC == 2757 then
            R[155]=R[97];
            R[156]=R[11];
            PC = 1295
            continue
        end
        -- block @ 2761: 2 instructions
        if PC == 2761 then
            R[154]=(2);
            PC = 1201
            continue
        end
        -- block @ 2764: 1 instruction
        if PC == 2764 then
            PC = 1866
            continue
        end
        -- block @ 2765: 1 instruction
        if PC == 2765 then
            if R[4]~=40 then PC = 1116 else PC = 2766 end;
            continue
        end
        -- block @ 2766: 1 instruction
        if PC == 2766 then
            PC = 2545
            continue
        end
        -- block @ 2767: 3 instructions
        if PC == 2767 then
            R[169]=(249*R[159]);
            R[169]=(R[169]+37);
            PC = 2851
            continue
        end
        -- block @ 2771: 1 instruction
        if PC == 2771 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2492
            continue
        end
        -- block @ 2772: 2 instructions
        if PC == 2772 then
            R[170]=(R[1][4]);
            PC = 1981
            continue
        end
        -- block @ 2775: 1 instruction
        if PC == 2775 then
            PC = 3345
            continue
        end
        -- block @ 2776: 3 instructions
        if PC == 2776 then
            R[164]=(R[1][4]);
            z=(162); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 427
            continue
        end
        -- block @ 2780: 4 instructions
        if PC == 2780 then
            R[150]=R[131];
            R[151]=(R[1][107]);
            R[151]=R[148][R[151]];
            PC = 256
            continue
        end
        -- block @ 2785: 1 instruction
        if PC == 2785 then
            if not(not(27<R[4])) then PC = 2786 else PC = 5359 end;
            continue
        end
        -- block @ 2786: 1 instruction
        if PC == 2786 then
            PC = 2114
            continue
        end
        -- block @ 2787: 2 instructions
        if PC == 2787 then
            z=(166); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3654
            continue
        end
        -- block @ 2790: 2 instructions
        if PC == 2790 then
            R[60]=(B["pcall"]);
            PC = 845
            continue
        end
        -- block @ 2793: 3 instructions
        if PC == 2793 then
            R[168]=(R[1][50]);
            R[168]=R[163][R[168]];
            PC = 4184
            continue
        end
        -- block @ 2797: 1 instruction
        if PC == 2797 then
            if not(not(33<R[150])) then PC = 2798 else PC = 2722 end;
            continue
        end
        -- block @ 2798: 1 instruction
        if PC == 2798 then
            PC = 262
            continue
        end
        -- block @ 2799: 1 instruction
        if PC == 2799 then
            if R[4]~=90 then PC = 1857 else PC = 2800 end;
            continue
        end
        -- block @ 2800: 1 instruction
        if PC == 2800 then
            PC = 4551
            continue
        end
        -- block @ 2801: 4 instructions
        if PC == 2801 then
            R[74]=nil;
            R[75]=(R[1][48]);
            R[76]=(R[1][48]);
            PC = 1357
            continue
        end
        -- block @ 2806: 5 instructions
        if PC == 2806 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(R[149][8]);
            R[138][69]=R[151];
            R[151]=R[98];
            PC = 3438
            continue
        end
        -- block @ 2812: 1 instruction
        if PC == 2812 then
            PC = 21
            continue
        end
        -- block @ 2814: 1 instruction
        if PC == 2814 then
            PC = 5491
            continue
        end
        -- block @ 2816: 1 instruction
        if PC == 2816 then
            PC = 4094
            continue
        end
        -- block @ 2817: 1 instruction
        if PC == 2817 then
            if not(not(R[157]<169)) then PC = 2818 else PC = 534 end;
            continue
        end
        -- block @ 2818: 1 instruction
        if PC == 2818 then
            PC = 4436
            continue
        end
        -- block @ 2819: 2 instructions
        if PC == 2819 then
            R[155]=(R[149][61]);
            PC = 3918
            continue
        end
        -- block @ 2822: 2 instructions
        if PC == 2822 then
            R[155]=(R[149][1]);
            PC = 1831
            continue
        end
        -- block @ 2825: 1 instruction
        if PC == 2825 then
            if R[154]~=136 then PC = 4465 else PC = 2826 end;
            continue
        end
        -- block @ 2826: 1 instruction
        if PC == 2826 then
            PC = 3633
            continue
        end
        -- block @ 2827: 1 instruction
        if PC == 2827 then
            PC = 2152
            continue
        end
        -- block @ 2828: 1 instruction
        if PC == 2828 then
            if not(not(25<R[150])) then PC = 2829 else PC = 3689 end;
            continue
        end
        -- block @ 2829: 1 instruction
        if PC == 2829 then
            PC = 3321
            continue
        end
        -- block @ 2830: 9 instructions
        if PC == 2830 then
            R[118]=R[94];
            R[119]=R[86];
            R[120]=(R[1][73]);
            z=(118); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[118]=R[94];
            R[119]=R[48];
            R[120]=(R[1][51]);
            z=(118); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 2329
            continue
        end
        -- block @ 2840: 3 instructions
        if PC == 2840 then
            R[155]=R[97];
            R[156]=R[11];
            PC = 3749
            continue
        end
        -- block @ 2844: 3 instructions
        if PC == 2844 then
            R[163]=(1);
            R[164]=R[158];
            PC = 432
            continue
        end
        -- block @ 2848: 1 instruction
        if PC == 2848 then
            if not(not(R[166]<137)) then PC = 2849 else PC = 1595 end;
            continue
        end
        -- block @ 2849: 1 instruction
        if PC == 2849 then
            PC = 1368
            continue
        end
        -- block @ 2850: 1 instruction
        if PC == 2850 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2851 else R[150+3]=y; PC = 3453 end;
            continue
        end
        -- block @ 2851: 1 instruction
        if PC == 2851 then
            PC = 231
            continue
        end
        -- block @ 2852: 1 instruction
        if PC == 2852 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2853 else R[164+3]=y; PC = 5290 end;
            continue
        end
        -- block @ 2853: 1 instruction
        if PC == 2853 then
            PC = 4148
            continue
        end
        -- block @ 2854: 2 instructions
        if PC == 2854 then
            R[155]=(R[148][11]);
            PC = 5213
            continue
        end
        -- block @ 2857: 4 instructions
        if PC == 2857 then
            R[150]=(105);
            R[151]=R[98];
            R[152]=R[11];
            PC = 237
            continue
        end
        -- block @ 2862: 1 instruction
        if PC == 2862 then
            if R[150]~=113 then PC = 3295 else PC = 2863 end;
            continue
        end
        -- block @ 2863: 1 instruction
        if PC == 2863 then
            PC = 1686
            continue
        end
        -- block @ 2864: 2 instructions
        if PC == 2864 then
            R[160]=(R[1][48]);
            PC = 4876
            continue
        end
        -- block @ 2867: 4 instructions
        if PC == 2867 then
            R[141]=R[131];
            R[142]=R[7];
            z=(141); (R[z])(R[z+1]); P=(z-1);
            PC = 2914
            continue
        end
        -- block @ 2872: 1 instruction
        if PC == 2872 then
            PC = 1891
            continue
        end
        -- block @ 2873: 1 instruction
        if PC == 2873 then
            PC = 2253
            continue
        end
        -- block @ 2874: 6 instructions
        if PC == 2874 then
            R[67]=(R[1][20]);
            z=R; x=(68); J=k;
            F=(1);
            J=J[F]; F=48; J=(J[F]);
            z[x]=J;
            PC = 709
            continue
        end
        -- block @ 2881: 1 instruction
        if PC == 2881 then
            PC = 2492
            continue
        end
        -- block @ 2882: 3 instructions
        if PC == 2882 then
            R[164]=R[164][R[165]];
            R[165]=(R[1][4]);
            PC = 888
            continue
        end
        -- block @ 2886: 1 instruction
        if PC == 2886 then
            if not(not(R[154]<109)) then PC = 2887 else PC = 5384 end;
            continue
        end
        -- block @ 2887: 1 instruction
        if PC == 2887 then
            PC = 1288
            continue
        end
        -- block @ 2888: 6 instructions
        if PC == 2888 then
            R[135]=R[26];
            R[136]=R[17];
            R[137]=(846);
            R[138]=R[66];
            z=136; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 5045
            continue
        end
        -- block @ 2895: 3 instructions
        if PC == 2895 then
            R[148]=R[89];
            R[149]=R[60];
            PC = 509
            continue
        end
        -- block @ 2899: 2 instructions
        if PC == 2899 then
            R[155]=(R[149][20]);
            PC = 3894
            continue
        end
        -- block @ 2902: 1 instruction
        if PC == 2902 then
            if not(not(R[152]<58)) then PC = 2903 else PC = 4655 end;
            continue
        end
        -- block @ 2903: 1 instruction
        if PC == 2903 then
            PC = 5606
            continue
        end
        -- block @ 2904: 1 instruction
        if PC == 2904 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2905 else R[149+3]=y; PC = 2346 end;
            continue
        end
        -- block @ 2905: 1 instruction
        if PC == 2905 then
            PC = 1617
            continue
        end
        -- block @ 2906: 8 instructions
        if PC == 2906 then
            R[161]=R[149];
            R[162]=(R[1][50]);
            R[162]=R[155][R[162]];
            R[163]=(R[1][104]);
            R[162]=R[162][R[163]];
            R[163]=(R[1][4]);
            z=(161); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 27
            continue
        end
        -- block @ 2914: 1 instruction
        if PC == 2914 then
            PC = 1687
            continue
        end
        -- block @ 2916: 1 instruction
        if PC == 2916 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 2917 else R[157+3]=y; PC = 280 end;
            continue
        end
        -- block @ 2917: 1 instruction
        if PC == 2917 then
            PC = 4494
            continue
        end
        -- block @ 2918: 5 instructions
        if PC == 2918 then
            R[119]=R[94];
            R[120]=R[115];
            R[121]=(R[1][92]);
            z=(119); (R[z])(R[z+1],R[z+2]); P=z-1;
            z=(149); x,J,F=y();
            if not(x) then PC = 2923 else R[z+1]=(J); R[z+2]=(F); PC = 1683 end;
            continue
        end
        -- block @ 2923: 1 instruction
        if PC == 2923 then
            PC = 1211
            continue
        end
        -- block @ 2924: 4 instructions
        if PC == 2924 then
            R[115]=R[94];
            R[116]=R[34];
            R[117]=(R[1][67]);
            PC = 1277
            continue
        end
        -- block @ 2929: 1 instruction
        if PC == 2929 then
            PC = 4201
            continue
        end
        -- block @ 2930: 1 instruction
        if PC == 2930 then
            z=(159); x,J,F=y();
            if not(x) then PC = 2931 else R[z+1]=(J); R[z+2]=(F); PC = 2609 end;
            continue
        end
        -- block @ 2931: 1 instruction
        if PC == 2931 then
            PC = 3618
            continue
        end
        -- block @ 2932: 5 instructions
        if PC == 2932 then
            R[112]=R[94];
            R[113]=R[69];
            R[114]=("setmetatable");
            z=(112); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3315
            continue
        end
        -- block @ 2938: 2 instructions
        if PC == 2938 then
            R[151]=(47);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(150); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 3575
            continue
        end
        -- block @ 2941: 1 instruction
        if PC == 2941 then
            PC = 1809
            continue
        end
        -- block @ 2943: 5 instructions
        if PC == 2943 then
            R[133]=R[26];
            R[134]=R[130];
            z=132; R[z]=R[z](R[z+1],R[z+2]); P=z;
            z=131; R[z]=R[z](R[z+1]); P=z;
            if not R[131] then PC = 2110 else PC = 2948 end;
            continue
        end
        -- block @ 2948: 1 instruction
        if PC == 2948 then
            PC = 1550
            continue
        end
        -- block @ 2949: 3 instructions
        if PC == 2949 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(1);
            PC = 2652
            continue
        end
        -- block @ 2953: 1 instruction
        if PC == 2953 then
            if not(not(R[162]<130)) then PC = 2954 else PC = 5446 end;
            continue
        end
        -- block @ 2954: 1 instruction
        if PC == 2954 then
            PC = 621
            continue
        end
        -- block @ 2955: 4 instructions
        if PC == 2955 then
            R[158]=R[131];
            R[159]=(R[1][15]);
            R[159]=R[152][R[159]];
            PC = 3289
            continue
        end
        -- block @ 2960: 3 instructions
        if PC == 2960 then
            R[19]=(R[1][97]);
            R[15]=R[3][R[19]];
            PC = 4831
            continue
        end
        -- block @ 2964: 1 instruction
        if PC == 2964 then
            if R[157]~=13 then PC = 5336 else PC = 2965 end;
            continue
        end
        -- block @ 2965: 1 instruction
        if PC == 2965 then
            PC = 3630
            continue
        end
        -- block @ 2966: 5 instructions
        if PC == 2966 then
            R[56]=R[93]>=D[H];
            R[155]=(R[144][8]);
            R[156]=(R[144][6]);
            z=153; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            PC = 525
            continue
        end
        -- block @ 2972: 6 instructions
        if PC == 2972 then
            R[161]=(R[1][4]);
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[158]=(R[1][48]);
            R[159]=(80);
            R[160]=(182);
            PC = 2510
            continue
        end
        -- block @ 2979: 1 instruction
        if PC == 2979 then
            if not(not(82<R[157])) then PC = 2980 else PC = 4100 end;
            continue
        end
        -- block @ 2980: 1 instruction
        if PC == 2980 then
            PC = 3218
            continue
        end
        -- block @ 2981: 6 instructions
        if PC == 2981 then
            R[160]=R[158][R[160]];
            R[161]=(R[1][104]);
            R[160]=R[160][R[161]];
            R[161]=(R[1][4]);
            z=(159); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3815
            continue
        end
        -- block @ 2988: 4 instructions
        if PC == 2988 then
            R[113]=R[94];
            R[114]=R[59];
            R[115]=(R[1][110]);
            PC = 459
            continue
        end
        -- block @ 2993: 1 instruction
        if PC == 2993 then
            if R[149]~=114 then PC = 2640 else PC = 2994 end;
            continue
        end
        -- block @ 2994: 1 instruction
        if PC == 2994 then
            PC = 2011
            continue
        end
        -- block @ 2995: 2 instructions
        if PC == 2995 then
            R[157]=(9);
            PC = 9
            continue
        end
        -- block @ 2998: 5 instructions
        if PC == 2998 then
            R[152]=(7);
            R[153]=R[135];
            R[154]=(R[1][41]);
            z=153; R[z]=R[z](R[z+1]); P=z;
            PC = 2901
            continue
        end
        -- block @ 3004: 1 instruction
        if PC == 3004 then
            PC = 527
            continue
        end
        -- block @ 3005: 2 instructions
        if PC == 3005 then
            R[119]=nil;
            PC = 2386
            continue
        end
        -- block @ 3008: 4 instructions
        if PC == 3008 then
            R[65]=(d[30](R[162],Y[H]));
            R[138][112]=R[162];
            R[162]=nil;
            PC = 2537
            continue
        end
        -- block @ 3013: 1 instruction
        if PC == 3013 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 3014 else R[163+3]=y; PC = 2847 end;
            continue
        end
        -- block @ 3014: 1 instruction
        if PC == 3014 then
            PC = 3987
            continue
        end
        -- block @ 3015: 1 instruction
        if PC == 3015 then
            PC = 400
            continue
        end
        -- block @ 3017: 7 instructions
        if PC == 3017 then
            R[151]=(R[149][41]);
            R[138][52]=R[151];
            z=({...}); for a=1,1 do R[a]=z[a]; end;
            R[2]=(R[1][48]);
            R[3]=(R[1][48]);
            R[4]=(39);
            PC = 5422
            continue
        end
        -- block @ 3025: 1 instruction
        if PC == 3025 then
            PC = 3753
            continue
        end
        -- block @ 3026: 11 instructions
        if PC == 3026 then
            R[156][853858866]=R[150];
            R[156][3685222790]=R[150];
            R[156][3729050996]=R[150];
            R[156][3522207924]=R[150];
            R[156][2160315220]=R[150];
            R[156][1305367400]=R[152];
            R[156][3906991527]=R[150];
            R[156][3790118390]=R[150];
            R[156][1996164462]=R[150];
            R[156][2397126568]=R[150];
            PC = 4160
            continue
        end
        -- block @ 3038: 3 instructions
        if PC == 3038 then
            R[155]=R[98];
            R[156]=R[11];
            PC = 96
            continue
        end
        -- block @ 3042: 6 instructions
        if PC == 3042 then
            R[157]=(72);
            z=R; x=158; J=R;
            F=(131); J=(J[F]); (z)[x]=J;
            R[159]=R[155];
            R[160]=(R[1][48]);
            PC = 4406
            continue
        end
        -- block @ 3049: 1 instruction
        if PC == 3049 then
            if not(not(R[160]<364)) then PC = 3050 else PC = 2740 end;
            continue
        end
        -- block @ 3050: 1 instruction
        if PC == 3050 then
            PC = 4888
            continue
        end
        -- block @ 3051: 1 instruction
        if PC == 3051 then
            if R[4]~=40 then PC = 982 else PC = 3052 end;
            continue
        end
        -- block @ 3052: 1 instruction
        if PC == 3052 then
            PC = 1217
            continue
        end
        -- block @ 3053: 1 instruction
        if PC == 3053 then
            if R[4]~=4 then PC = 5540 else PC = 3054 end;
            continue
        end
        -- block @ 3054: 1 instruction
        if PC == 3054 then
            PC = 1717
            continue
        end
        -- block @ 3055: 2 instructions
        if PC == 3055 then
            R[155]=(R[149][28]);
            PC = 756
            continue
        end
        -- block @ 3058: 3 instructions
        if PC == 3058 then
            R[155]=R[97];
            R[156]=R[11];
            PC = 4923
            continue
        end
        -- block @ 3062: 1 instruction
        if PC == 3062 then
            PC = 4114
            continue
        end
        -- block @ 3063: 1 instruction
        if PC == 3063 then
            PC = 1831
            continue
        end
        -- block @ 3064: 3 instructions
        if PC == 3064 then
            R[155]=(R[149][32]);
            R[138][85]=R[155];
            PC = 266
            continue
        end
        -- block @ 3068: 1 instruction
        if PC == 3068 then
            PC = 5472
            continue
        end
        -- block @ 3070: 1 instruction
        if PC == 3070 then
            if R[4]~=84 then PC = 4977 else PC = 3071 end;
            continue
        end
        -- block @ 3071: 1 instruction
        if PC == 3071 then
            PC = 4547
            continue
        end
        -- block @ 3072: 6 instructions
        if PC == 3072 then
            R[162]=R[159];
            z=R; x=(163); J=k;
            F=(1);
            J=J[F]; F=4; J=(J[F]);
            z[x]=J;
            PC = 41
            continue
        end
        -- block @ 3079: 3 instructions
        if PC == 3079 then
            R[157]=(R[148][17]);
            R[158]=(2);
            PC = 5474
            continue
        end
        -- block @ 3083: 3 instructions
        if PC == 3083 then
            R[155]=R[94];
            R[156]=(R[1][113]);
            PC = 4869
            continue
        end
        -- block @ 3087: 4 instructions
        if PC == 3087 then
            R[154]=(2);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(R[148][26]);
            PC = 3418
            continue
        end
        -- block @ 3092: 5 instructions
        if PC == 3092 then
            R[141]=(R[1][72]);
            R[143]=R[131];
            R[144]=R[74];
            R[145]=({});
            PC = 2813
            continue
        end
        -- block @ 3098: 2 instructions
        if PC == 3098 then
            R[65]=(d[30](R[166],Y[H]));
            PC = 3654
            continue
        end
        -- block @ 3101: 3 instructions
        if PC == 3101 then
            R[154]=R[94];
            R[155]=R[114];
            PC = 4754
            continue
        end
        -- block @ 3105: 3 instructions
        if PC == 3105 then
            z=(158); x=R[153]; R[z+1]=(x); R[z]=x["SetControlPoints"];
            R[160]=d[22](2);
            PC = 2028
            continue
        end
        -- block @ 3109: 1 instruction
        if PC == 3109 then
            if R[4]~=2 then PC = 4054 else PC = 3110 end;
            continue
        end
        -- block @ 3110: 1 instruction
        if PC == 3110 then
            PC = 3024
            continue
        end
        -- block @ 3111: 3 instructions
        if PC == 3111 then
            R[153]=(R[1][48]);
            R[154]=(R[1][48]);
            PC = 578
            continue
        end
        -- block @ 3115: 4 instructions
        if PC == 3115 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[151]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            P=151; R[P]=R[P]();
            R[152]=(R[1][48]);
            PC = 2064
            continue
        end
        -- block @ 3120: 1 instruction
        if PC == 3120 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 3121 else R[155+3]=y; PC = 5420 end;
            continue
        end
        -- block @ 3121: 1 instruction
        if PC == 3121 then
            PC = 4346
            continue
        end
        -- block @ 3122: 1 instruction
        if PC == 3122 then
            if R[4]~=113 then PC = 3256 else PC = 3123 end;
            continue
        end
        -- block @ 3123: 1 instruction
        if PC == 3123 then
            PC = 1190
            continue
        end
        -- block @ 3124: 1 instruction
        if PC == 3124 then
            if not(not(R[157]<216)) then PC = 3125 else PC = 3543 end;
            continue
        end
        -- block @ 3125: 1 instruction
        if PC == 3125 then
            PC = 2763
            continue
        end
        -- block @ 3126: 1 instruction
        if PC == 3126 then
            if not(not(R[150]<84)) then PC = 3127 else PC = 3782 end;
            continue
        end
        -- block @ 3127: 1 instruction
        if PC == 3127 then
            PC = 2073
            continue
        end
        -- block @ 3128: 2 instructions
        if PC == 3128 then
            R[155]=(R[149][44]);
            PC = 2129
            continue
        end
        -- block @ 3131: 3 instructions
        if PC == 3131 then
            R[148]=R[106];
            R[149]=R[2];
            PC = 4959
            continue
        end
        -- block @ 3135: 1 instruction
        if PC == 3135 then
            PC = 1929
            continue
        end
        -- block @ 3137: 4 instructions
        if PC == 3137 then
            R[153]=(R[1][48]);
            R[154]=(67);
            R[155]=(430);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(154); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2535
            continue
        end
        -- block @ 3142: 6 instructions
        if PC == 3142 then
            R[155]=R[98];
            R[156]=(R[148][15]);
            R[157]=R[11];
            P=157; R[P]=R[P]();
            R[158]=(2);
            PC = 1459
            continue
        end
        -- block @ 3149: 1 instruction
        if PC == 3149 then
            if not(not(43<R[154])) then PC = 3150 else PC = 4257 end;
            continue
        end
        -- block @ 3150: 1 instruction
        if PC == 3150 then
            PC = 1076
            continue
        end
        -- block @ 3151: 1 instruction
        if PC == 3151 then
            PC = 4420
            continue
        end
        -- block @ 3153: 1 instruction
        if PC == 3153 then
            if not(not(R[157]<430)) then PC = 3154 else PC = 3504 end;
            continue
        end
        -- block @ 3154: 1 instruction
        if PC == 3154 then
            PC = 1959
            continue
        end
        -- block @ 3155: 6 instructions
        if PC == 3155 then
            R[155]=R[98];
            R[156]=(R[149][40]);
            R[157]=R[11];
            P=157; R[P]=R[P]();
            R[158]=(2);
            PC = 669
            continue
        end
        -- block @ 3162: 5 instructions
        if PC == 3162 then
            R[129]=R[85];
            R[130]=(R[120]%256);
            R[130]=R[120]-R[130];
            R[130]=R[130]/256;
            PC = 4582
            continue
        end
        -- block @ 3168: 4 instructions
        if PC == 3168 then
            R[151]=(R[1][48]);
            R[152]=(120);
            R[153]=(172);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(152); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 781
            continue
        end
        -- block @ 3173: 3 instructions
        if PC == 3173 then
            R[148]=R[145];
            R[149]=R[142];
            PC = 471
            continue
        end
        -- block @ 3177: 2 instructions
        if PC == 3177 then
            R[156]=R[31];
            PC = 397
            continue
        end
        -- block @ 3180: 1 instruction
        if PC == 3180 then
            PC = 2903
            continue
        end
        -- block @ 3182: 6 instructions
        if PC == 3182 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=R; x=150; J=R;
            F=(148); J=(J[F]); (z)[x]=J;
            R[151]=nil;
            R[152]=(R[1][48]);
            PC = 1793
            continue
        end
        -- block @ 3189: 3 instructions
        if PC == 3189 then
            R[169]=R[163][R[169]];
            R[170]=(R[1][4]);
            PC = 2512
            continue
        end
        -- block @ 3193: 6 instructions
        if PC == 3193 then
            R[160]=(0);
            R[161]=(R[1][4]);
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[157]=(13);
            R[158]=R[97];
            PC = 1675
            continue
        end
        -- block @ 3200: 4 instructions
        if PC == 3200 then
            R[157]=(14);
            z=R; x=158;
            J=104; z[x]=J;
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(157); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2915
            continue
        end
        -- block @ 3205: 4 instructions
        if PC == 3205 then
            R[154]=R[94];
            R[155]=(R[152]["FromName"]);
            R[156]=(R[1][172]);
            PC = 138
            continue
        end
        -- block @ 3210: 1 instruction
        if PC == 3210 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(159); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 1313
            continue
        end
        -- block @ 3211: 3 instructions
        if PC == 3211 then
            R[143]=R[94];
            R[144]=R[135];
            PC = 2581
            continue
        end
        -- block @ 3215: 3 instructions
        if PC == 3215 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=R[98];
            PC = 1078
            continue
        end
        -- block @ 3219: 3 instructions
        if PC == 3219 then
            R[157]=(35);
            R[158]=R[145];
            PC = 3832
            continue
        end
        -- block @ 3223: 4 instructions
        if PC == 3223 then
            R[136]=R[131];
            R[137]=R[50];
            z=(136); (R[z])(R[z+1]); P=(z-1);
            PC = 3256
            continue
        end
        -- block @ 3228: 1 instruction
        if PC == 3228 then
            if not(not(R[153]<47)) then PC = 3229 else PC = 3575 end;
            continue
        end
        -- block @ 3229: 1 instruction
        if PC == 3229 then
            PC = 2100
            continue
        end
        -- block @ 3230: 1 instruction
        if PC == 3230 then
            PC = 1427
            continue
        end
        -- block @ 3231: 1 instruction
        if PC == 3231 then
            PC = 5359
            continue
        end
        -- block @ 3233: 5 instructions
        if PC == 3233 then
            z=R; x=(137); J=k;
            F=(1);
            J=J[F]; F=103; J=(J[F]);
            z[x]=J;
            PC = 4070
            continue
        end
        -- block @ 3239: 2 instructions
        if PC == 3239 then
            R[159]=(R[1][4]);
            PC = 5039
            continue
        end
        -- block @ 3242: 1 instruction
        if PC == 3242 then
            if R[156]~=94 then PC = 2577 else PC = 3243 end;
            continue
        end
        -- block @ 3243: 1 instruction
        if PC == 3243 then
            PC = 1473
            continue
        end
        -- block @ 3244: 6 instructions
        if PC == 3244 then
            R[152]=(R[148][9]);
            R[153]=(1);
            z=150; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[150]=(R[148][8]);
            R[138][2]=R[150];
            PC = 4228
            continue
        end
        -- block @ 3251: 1 instruction
        if PC == 3251 then
            if R[154]~=122 then PC = 1741 else PC = 3252 end;
            continue
        end
        -- block @ 3252: 1 instruction
        if PC == 3252 then
            PC = 759
            continue
        end
        -- block @ 3253: 1 instruction
        if PC == 3253 then
            if not(not(R[4]<=33)) then PC = 3254 else PC = 301 end;
            continue
        end
        -- block @ 3254: 1 instruction
        if PC == 3254 then
            PC = 4907
            continue
        end
        -- block @ 3255: 1 instruction
        if PC == 3255 then
            PC = 4891
            continue
        end
        -- block @ 3257: 1 instruction
        if PC == 3257 then
            if R[4]~=75 then PC = 1586 else PC = 3258 end;
            continue
        end
        -- block @ 3258: 1 instruction
        if PC == 3258 then
            PC = 879
            continue
        end
        -- block @ 3259: 1 instruction
        if PC == 3259 then
            PC = 5583
            continue
        end
        -- block @ 3260: 1 instruction
        if PC == 3260 then
            PC = 5723
            continue
        end
        -- block @ 3262: 2 instructions
        if PC == 3262 then
            R[151]=(R[148][21]);
            PC = 916
            continue
        end
        -- block @ 3265: 1 instruction
        if PC == 3265 then
            PC = 3598
            continue
        end
        -- block @ 3267: 2 instructions
        if PC == 3267 then
            R[156]=(R[1][108]);
            PC = 5039
            continue
        end
        -- block @ 3270: 1 instruction
        if PC == 3270 then
            if not(not(89<R[150])) then PC = 3271 else PC = 576 end;
            continue
        end
        -- block @ 3271: 1 instruction
        if PC == 3271 then
            PC = 4738
            continue
        end
        -- block @ 3272: 1 instruction
        if PC == 3272 then
            if not(not(108<R[155])) then PC = 3273 else PC = 4919 end;
            continue
        end
        -- block @ 3273: 1 instruction
        if PC == 3273 then
            PC = 4932
            continue
        end
        -- block @ 3274: 2 instructions
        if PC == 3274 then
            R[170]=(d[37](R[161],R[162]));
            PC = 3987
            continue
        end
        -- block @ 3277: 4 instructions
        if PC == 3277 then
            R[163]=R[149];
            R[164]=(R[1][155]);
            R[164]=R[158][R[164]];
            PC = 2427
            continue
        end
        -- block @ 3282: 1 instruction
        if PC == 3282 then
            PC = 2917
            continue
        end
        -- block @ 3283: 4 instructions
        if PC == 3283 then
            R[138][96]=R[151];
            R[151]=(10);
            R[152]=(135);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2389
            continue
        end
        -- block @ 3288: 1 instruction
        if PC == 3288 then
            PC = 1429
            continue
        end
        -- block @ 3289: 1 instruction
        if PC == 3289 then
            PC = 4194
            continue
        end
        -- block @ 3290: 1 instruction
        if PC == 3290 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 3291 else R[154+3]=y; PC = 2816 end;
            continue
        end
        -- block @ 3291: 1 instruction
        if PC == 3291 then
            PC = 2496
            continue
        end
        -- block @ 3292: 3 instructions
        if PC == 3292 then
            R[150]=(87);
            R[151]=(R[148][3]);
            PC = 1201
            continue
        end
        -- block @ 3296: 1 instruction
        if PC == 3296 then
            if R[150]~=46 then PC = 706 else PC = 3297 end;
            continue
        end
        -- block @ 3297: 1 instruction
        if PC == 3297 then
            PC = 3261
            continue
        end
        -- block @ 3298: 4 instructions
        if PC == 3298 then
            R[158]=R[93];
            R[159]=(R[1][49]);
            R[160]=R[88];
            PC = 1378
            continue
        end
        -- block @ 3303: 4 instructions
        if PC == 3303 then
            R[151]=R[60];
            R[152]=R[52];
            R[153]=(R[1][53]);
            PC = 125
            continue
        end
        -- block @ 3308: 1 instruction
        if PC == 3308 then
            if not(not(R[154]<127)) then PC = 3309 else PC = 2375 end;
            continue
        end
        -- block @ 3309: 1 instruction
        if PC == 3309 then
            PC = 3127
            continue
        end
        -- block @ 3310: 3 instructions
        if PC == 3310 then
            R[151]=R[97];
            R[152]=R[11];
            PC = 5263
            continue
        end
        -- block @ 3314: 1 instruction
        if PC == 3314 then
            PC = 760
            continue
        end
        -- block @ 3316: 1 instruction
        if PC == 3316 then
            if R[4]~=99 then PC = 1088 else PC = 3317 end;
            continue
        end
        -- block @ 3317: 1 instruction
        if PC == 3317 then
            PC = 1751
            continue
        end
        -- block @ 3318: 1 instruction
        if PC == 3318 then
            PC = 3214
            continue
        end
        -- block @ 3319: 2 instructions
        if PC == 3319 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 5410
            continue
        end
        -- block @ 3322: 3 instructions
        if PC == 3322 then
            R[150]=(25);
            R[151]=R[98];
            PC = 544
            continue
        end
        -- block @ 3326: 1 instruction
        if PC == 3326 then
            if not(not(R[4]<122)) then PC = 3327 else PC = 1169 end;
            continue
        end
        -- block @ 3327: 1 instruction
        if PC == 3327 then
            PC = 3546
            continue
        end
        -- block @ 3328: 2 instructions
        if PC == 3328 then
            R[155]=(R[148][24]);
            PC = 5213
            continue
        end
        -- block @ 3331: 3 instructions
        if PC == 3331 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[159]=(R[1][50]);
            PC = 4640
            continue
        end
        -- block @ 3335: 2 instructions
        if PC == 3335 then
            R[155]=(R[149][6]);
            PC = 5388
            continue
        end
        -- block @ 3338: 5 instructions
        if PC == 3338 then
            R[159][R[160]]=R[161];
            z=R; x=158; J=R;
            F=(159); J=(J[F]); (z)[x]=J;
            R[159]=R[139];
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; P=(159); z=d[3](function(...)(d[42])(); for w,u in...do(d[42])(true,w,u); end; end); (z)(R[P],R[P+1],R[P+2]); y=z;
            PC = 2929
            continue
        end
        -- block @ 3344: 1 instruction
        if PC == 3344 then
            if R[155]~=172 then PC = 5089 else PC = 3345 end;
            continue
        end
        -- block @ 3345: 1 instruction
        if PC == 3345 then
            PC = 5072
            continue
        end
        -- block @ 3346: 3 instructions
        if PC == 3346 then
            R[150]=(8);
            R[151]=R[97];
            PC = 1954
            continue
        end
        -- block @ 3350: 1 instruction
        if PC == 3350 then
            if R[4]~=86 then PC = 3052 else PC = 3351 end;
            continue
        end
        -- block @ 3351: 1 instruction
        if PC == 3351 then
            PC = 597
            continue
        end
        -- block @ 3352: 4 instructions
        if PC == 3352 then
            R[156]=({});
            R[156][3497127490]=R[150];
            R[156][545045668]=R[150];
            PC = 1895
            continue
        end
        -- block @ 3357: 2 instructions
        if PC == 3357 then
            z=l[H]; x=z[8]; z=(#x); J=z>0 and{}; if not(J) then else for w=1,z do F=(x[w]); U=F[1]; _=(F[3]); if U==1 then J[w-1]=(Protos[_]); else if U==2 then J[w-1]=R[_]; else if U==3 then if not(not i) then else i=({}); end; F=(i[_]); if not F then F={[1]=k,[3]=_}; (i)[_]=(F); end; (J)[w-1]=F; end; end; end; end; end; x=R["_"](J); d[29](x,B); R[125]=x;
            PC = 1811
            continue
        end
        -- block @ 3360: 4 instructions
        if PC == 3360 then
            R[152]=R[11];
            P=152; R[P]=R[P]();
            R[153]=(R[149][72]);
            PC = 1369
            continue
        end
        -- block @ 3365: 1 instruction
        if PC == 3365 then
            if not(not(R[4]<116)) then PC = 3366 else PC = 4971 end;
            continue
        end
        -- block @ 3366: 1 instruction
        if PC == 3366 then
            PC = 3281
            continue
        end
        -- block @ 3367: 7 instructions
        if PC == 3367 then
            R[167]=R[68];
            R[168]=R[154];
            R[169]=R[153]+R[160];
            z=167; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[161]=R[167];
            R[167]=(R[160]%8);
            PC = 1071
            continue
        end
        -- block @ 3375: 1 instruction
        if PC == 3375 then
            if not(not(R[4]<=49)) then PC = 3376 else PC = 4432 end;
            continue
        end
        -- block @ 3376: 1 instruction
        if PC == 3376 then
            PC = 5497
            continue
        end
        -- block @ 3377: 3 instructions
        if PC == 3377 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[148]=(R[1][48]);
            PC = 1122
            continue
        end
        -- block @ 3381: 1 instruction
        if PC == 3381 then
            if not(not(R[4]<40)) then PC = 3382 else PC = 845 end;
            continue
        end
        -- block @ 3382: 1 instruction
        if PC == 3382 then
            PC = 2789
            continue
        end
        -- block @ 3383: 3 instructions
        if PC == 3383 then
            R[163]=R[149];
            R[164]=(R[162]["X"]);
            PC = 2881
            continue
        end
        -- block @ 3387: 8 instructions
        if PC == 3387 then
            R[167]=(0);
            R[168]=(0);
            R[169]=(0);
            z=165; P=z+5-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[166]=R[123];
            R[167]=(0);
            R[168]=(-7);
            PC = 1482
            continue
        end
        -- block @ 3396: 3 instructions
        if PC == 3396 then
            R[158]=R[97];
            z=(159); x=R[153]; R[z+1]=(x); R[z]=x["NextNumber"];
            PC = 3192
            continue
        end
        -- block @ 3400: 8 instructions
        if PC == 3400 then
            R[51]=(R[1][4]);
            R[49][R[50]]=R[51];
            R[50]=(R[1][4]);
            R[51]=(R[1][53]);
            R[49][R[50]]=R[51];
            R[50]=(R[1][48]);
            R[51]=(R[1][48]);
            PC = 2647
            continue
        end
        -- block @ 3409: 5 instructions
        if PC == 3409 then
            z=(155); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[155]=(R[1][48]);
            R[156]=(R[1][48]);
            R[157]=(88);
            PC = 2628
            continue
        end
        -- block @ 3415: 1 instruction
        if PC == 3415 then
            PC = 5431
            continue
        end
        -- block @ 3416: 1 instruction
        if PC == 3416 then
            if not(not(R[4]<63)) then PC = 3417 else PC = 4759 end;
            continue
        end
        -- block @ 3417: 1 instruction
        if PC == 3417 then
            PC = 3714
            continue
        end
        -- block @ 3418: 1 instruction
        if PC == 3418 then
            PC = 3119
            continue
        end
        -- block @ 3419: 4 instructions
        if PC == 3419 then
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 2760
            continue
        end
        -- block @ 3424: 1 instruction
        if PC == 3424 then
            PC = 5334
            continue
        end
        -- block @ 3425: 1 instruction
        if PC == 3425 then
            if not(not(R[4]<101)) then PC = 3426 else PC = 4983 end;
            continue
        end
        -- block @ 3426: 1 instruction
        if PC == 3426 then
            PC = 419
            continue
        end
        -- block @ 3427: 4 instructions
        if PC == 3427 then
            R[163]=("\n");
            R[164]=(R[1][71]);
            R[165]=(R[1][71]);
            PC = 3577
            continue
        end
        -- block @ 3432: 6 instructions
        if PC == 3432 then
            R[150]=R[94];
            R[151]=(R[1][5]);
            R[151]=R[148][R[151]];
            R[152]=(R[1][5]);
            z=(150); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 4399
            continue
        end
        -- block @ 3439: 7 instructions
        if PC == 3439 then
            R[153]=R[11];
            P=153; R[P]=R[P]();
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(R[149][59]);
            R[138][70]=R[151];
            PC = 5315
            continue
        end
        -- block @ 3447: 1 instruction
        if PC == 3447 then
            PC = 1491
            continue
        end
        -- block @ 3448: 1 instruction
        if PC == 3448 then
            if not(not(18<R[4])) then PC = 3449 else PC = 4808 end;
            continue
        end
        -- block @ 3449: 1 instruction
        if PC == 3449 then
            PC = 4074
            continue
        end
        -- block @ 3450: 1 instruction
        if PC == 3450 then
            if not(225<=R[154]) then PC = 4990 else PC = 3451 end;
            continue
        end
        -- block @ 3451: 1 instruction
        if PC == 3451 then
            PC = 769
            continue
        end
        -- block @ 3452: 1 instruction
        if PC == 3452 then
            if R[155]~=276 then PC = 2312 else PC = 3453 end;
            continue
        end
        -- block @ 3453: 1 instruction
        if PC == 3453 then
            PC = 1140
            continue
        end
        -- block @ 3454: 1 instruction
        if PC == 3454 then
            if not(not(R[153]<115)) then PC = 3455 else PC = 1912 end;
            continue
        end
        -- block @ 3455: 1 instruction
        if PC == 3455 then
            PC = 1524
            continue
        end
        -- block @ 3456: 1 instruction
        if PC == 3456 then
            PC = 5213
            continue
        end
        -- block @ 3457: 5 instructions
        if PC == 3457 then
            R[155]=(R[148][17]);
            R[138][7]=R[155];
            R[155]=R[97];
            R[156]=R[11];
            PC = 3078
            continue
        end
        -- block @ 3463: 7 instructions
        if PC == 3463 then
            R[134]=R[97];
            R[135]=R[132];
            P=135; R[P]=R[P]();
            R[136]=(2002649144);
            R[137]=(R[1][4]);
            z=134; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 4610
            continue
        end
        -- block @ 3471: 1 instruction
        if PC == 3471 then
            PC = 3526
            continue
        end
        -- block @ 3473: 4 instructions
        if PC == 3473 then
            R[153]=(R[149][24]);
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 1502
            continue
        end
        -- block @ 3478: 3 instructions
        if PC == 3478 then
            R[159]=({});
            R[160]=(R[1][32]);
            PC = 3337
            continue
        end
        -- block @ 3482: 4 instructions
        if PC == 3482 then
            z=(148); x=R[38]; R[z+1]=(x); R[z]=x["GetService"];
            R[150]=(R[1][121]);
            z=148; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 3715
            continue
        end
        -- block @ 3487: 4 instructions
        if PC == 3487 then
            z=164; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[165]=(R[1][155]);
            R[165]=R[164][R[165]];
            PC = 2730
            continue
        end
        -- block @ 3492: 1 instruction
        if PC == 3492 then
            if R[4]~=90 then PC = 3121 else PC = 3493 end;
            continue
        end
        -- block @ 3493: 1 instruction
        if PC == 3493 then
            PC = 2562
            continue
        end
        -- block @ 3494: 3 instructions
        if PC == 3494 then
            R[157]=(R[149][33]);
            R[158]=(2);
            PC = 4290
            continue
        end
        -- block @ 3498: 1 instruction
        if PC == 3498 then
            if R[4]~=6 then PC = 5723 else PC = 3499 end;
            continue
        end
        -- block @ 3499: 1 instruction
        if PC == 3499 then
            PC = 1135
            continue
        end
        -- block @ 3500: 4 instructions
        if PC == 3500 then
            R[155]=R[92];
            R[156]=(not R[144]);
            R[157]=(R[1][4]);
            PC = 2471
            continue
        end
        -- block @ 3505: 1 instruction
        if PC == 3505 then
            if not(not(R[157]<188)) then PC = 3506 else PC = 4571 end;
            continue
        end
        -- block @ 3506: 1 instruction
        if PC == 3506 then
            PC = 1399
            continue
        end
        -- block @ 3507: 7 instructions
        if PC == 3507 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(R[149][49]);
            R[138][40]=R[151];
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 1744
            continue
        end
        -- block @ 3515: 1 instruction
        if PC == 3515 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(152); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 5039
            continue
        end
        -- block @ 3517: 3 instructions
        if PC == 3517 then
            R[135]=R[131];
            R[136]=R[113];
            PC = 1799
            continue
        end
        -- block @ 3521: 5 instructions
        if PC == 3521 then
            R[150]=(74);
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 3086
            continue
        end
        -- block @ 3527: 2 instructions
        if PC == 3527 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 361
            continue
        end
        -- block @ 3530: 4 instructions
        if PC == 3530 then
            R[155]=(R[144][1]);
            R[156]=(R[144][9]);
            R[155]=(R[155]==R[156]);
            if not R[155] then PC = 1807 else PC = 3534 end;
            continue
        end
        -- block @ 3534: 1 instruction
        if PC == 3534 then
            PC = 5601
            continue
        end
        -- block @ 3535: 4 instructions
        if PC == 3535 then
            R[157]=(116);
            z=(158); x=R[155]; R[z+1]=(x); R[z]=x["Clone"];
            z=158; R[z]=R[z](R[z+1]); P=z;
            PC = 822
            continue
        end
        -- block @ 3540: 1 instruction
        if PC == 3540 then
            if not R[149] then PC = 4039 else PC = 3541 end;
            continue
        end
        -- block @ 3541: 1 instruction
        if PC == 3541 then
            PC = 915
            continue
        end
        -- block @ 3542: 1 instruction
        if PC == 3542 then
            if R[154]~=57 then PC = 3543 else PC = 657 end;
            continue
        end
        -- block @ 3543: 1 instruction
        if PC == 3543 then
            PC = 2898
            continue
        end
        -- block @ 3544: 1 instruction
        if PC == 3544 then
            if not(not(216<R[157])) then PC = 3545 else PC = 3289 end;
            continue
        end
        -- block @ 3545: 1 instruction
        if PC == 3545 then
            if not(not(72<R[157])) then PC = 3546 else PC = 507 end;
            continue
        end
        -- block @ 3546: 1 instruction
        if PC == 3546 then
            PC = 1329
            continue
        end
        -- block @ 3547: 2 instructions
        if PC == 3547 then
            R[50]=(R[1][169]);
            PC = 1169
            continue
        end
        -- block @ 3550: 1 instruction
        if PC == 3550 then
            if not(not(R[150]<102)) then PC = 3551 else PC = 2459 end;
            continue
        end
        -- block @ 3551: 1 instruction
        if PC == 3551 then
            PC = 1570
            continue
        end
        -- block @ 3552: 1 instruction
        if PC == 3552 then
            PC = 5719
            continue
        end
        -- block @ 3553: 1 instruction
        if PC == 3553 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 1209
            continue
        end
        -- block @ 3554: 1 instruction
        if PC == 3554 then
            if not(not(R[4]<72)) then PC = 3555 else PC = 1462 end;
            continue
        end
        -- block @ 3555: 1 instruction
        if PC == 3555 then
            PC = 3889
            continue
        end
        -- block @ 3556: 1 instruction
        if PC == 3556 then
            PC = 1447
            continue
        end
        -- block @ 3557: 2 instructions
        if PC == 3557 then
            x=(362); J=(D[H]); (z)[x]=(J);
            if not(Y[H]<=R[261]) then PC = 215 else PC = 3559 end;
            continue
        end
        -- block @ 3559: 5 instructions
        if PC == 3559 then
            z=l[H]; x=z[8]; z=(#x); J=z>0 and{}; if not(J) then else for w=1,z do F=(x[w]); U=F[1]; _=(F[3]); if U==1 then J[w-1]=(Protos[_]); else if U==2 then J[w-1]=R[_]; else if U==3 then if not(not i) then else i=({}); end; F=(i[_]); if not F then F={[1]=k,[3]=_}; (i)[_]=(F); end; (J)[w-1]=F; end; end; end; end; end; x=R[Y[H]](J); d[29](x,B); R[354]=x;
            R[154]=d[36];
            z=k;
            x=(155); J=nil; (z)[x]=(J);
            PC = 232
            continue
        end
        -- block @ 3565: 1 instruction
        if PC == 3565 then
            if R[4]~=110 then PC = 1357 else PC = 3566 end;
            continue
        end
        -- block @ 3566: 1 instruction
        if PC == 3566 then
            PC = 4077
            continue
        end
        -- block @ 3567: 2 instructions
        if PC == 3567 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[157]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 3569
            continue
        end
        -- block @ 3570: 1 instruction
        if PC == 3570 then
            if not(not(35<R[4])) then PC = 3571 else PC = 1129 end;
            continue
        end
        -- block @ 3571: 1 instruction
        if PC == 3571 then
            PC = 1574
            continue
        end
        -- block @ 3572: 3 instructions
        if PC == 3572 then
            R[113]=(R[1][52]);
            R[112][R[113]]=(0);
            PC = 4269
            continue
        end
        -- block @ 3576: 1 instruction
        if PC == 3576 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 3577 else R[150+3]=y; PC = 5563 end;
            continue
        end
        -- block @ 3577: 1 instruction
        if PC == 3577 then
            PC = 3181
            continue
        end
        -- block @ 3578: 4 instructions
        if PC == 3578 then
            R[162]=(R[1][105]);
            R[163]=(R[1][48]);
            z=159; x=5; J=3; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            if not R[159] then PC = 52 else PC = 3582 end;
            continue
        end
        -- block @ 3582: 1 instruction
        if PC == 3582 then
            PC = 1775
            continue
        end
        -- block @ 3583: 1 instruction
        if PC == 3583 then
            PC = 1414
            continue
        end
        -- block @ 3584: 5 instructions
        if PC == 3584 then
            R[161]=R[149];
            R[162]=(R[1][155]);
            R[162]=R[156][R[162]];
            R[162]=(R[162]["Scale"]);
            PC = 2209
            continue
        end
        -- block @ 3590: 4 instructions
        if PC == 3590 then
            R[3]=(B["coroutine"]);
            R[6]=(R[1][69]);
            R[6]=R[2][R[6]];
            PC = 678
            continue
        end
        -- block @ 3595: 3 instructions
        if PC == 3595 then
            R[149]=(84);
            z=(150); x=R[38]; R[z+1]=(x); R[z]=x["GetService"];
            PC = 2594
            continue
        end
        -- block @ 3599: 1 instruction
        if PC == 3599 then
            z=(156); x,J,F=y();
            if not(x) then PC = 3600 else R[z+1]=(J); R[z+2]=(F); PC = 3264 end;
            continue
        end
        -- block @ 3600: 1 instruction
        if PC == 3600 then
            PC = 3929
            continue
        end
        -- block @ 3601: 5 instructions
        if PC == 3601 then
            R[157]=(77);
            R[158]=R[94];
            R[159]=R[155];
            R[160]=(R[1][111]);
            PC = 9
            continue
        end
        -- block @ 3607: 5 instructions
        if PC == 3607 then
            R[155]=R[98];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[149][31]);
            PC = 4367
            continue
        end
        -- block @ 3613: 1 instruction
        if PC == 3613 then
            if R[152]~=2 then PC = 2082 else PC = 3614 end;
            continue
        end
        -- block @ 3614: 1 instruction
        if PC == 3614 then
            PC = 5183
            continue
        end
        -- block @ 3615: 3 instructions
        if PC == 3615 then
            R[62]=({});
            R[62][4]=(3);
            PC = 3835
            continue
        end
        -- block @ 3619: 2 instructions
        if PC == 3619 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 5359
            continue
        end
        -- block @ 3622: 3 instructions
        if PC == 3622 then
            R[119]=R[94];
            R[120]=R[26];
            PC = 1571
            continue
        end
        -- block @ 3626: 4 instructions
        if PC == 3626 then
            R[59]=(R[1][48]);
            R[60]=(R[1][48]);
            R[61]=(R[1][48]);
            PC = 845
            continue
        end
        -- block @ 3631: 1 instruction
        if PC == 3631 then
            PC = 635
            continue
        end
        -- block @ 3632: 1 instruction
        if PC == 3632 then
            if not(not(R[154]<95)) then PC = 3633 else PC = 2371 end;
            continue
        end
        -- block @ 3633: 1 instruction
        if PC == 3633 then
            PC = 3499
            continue
        end
        -- block @ 3634: 2 instructions
        if PC == 3634 then
            R[155]=(R[148][16]);
            PC = 4465
            continue
        end
        -- block @ 3637: 2 instructions
        if PC == 3637 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[130]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 4443
            continue
        end
        -- block @ 3640: 1 instruction
        if PC == 3640 then
            if not(not(72<R[4])) then PC = 3641 else PC = 4765 end;
            continue
        end
        -- block @ 3641: 1 instruction
        if PC == 3641 then
            PC = 4973
            continue
        end
        -- block @ 3642: 2 instructions
        if PC == 3642 then
            R[152]=(291);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 23
            continue
        end
        -- block @ 3645: 2 instructions
        if PC == 3645 then
            R[158]=(1);
            PC = 5213
            continue
        end
        -- block @ 3648: 1 instruction
        if PC == 3648 then
            if not(not(R[4]<81)) then PC = 3649 else PC = 1269 end;
            continue
        end
        -- block @ 3649: 1 instruction
        if PC == 3649 then
            PC = 4690
            continue
        end
        -- block @ 3650: 1 instruction
        if PC == 3650 then
            PC = 3982
            continue
        end
        -- block @ 3651: 3 instructions
        if PC == 3651 then
            P=157; R[P]=R[P]();
            R[158]=(1);
            PC = 3455
            continue
        end
        -- block @ 3655: 1 instruction
        if PC == 3655 then
            if R[152]~=32 then PC = 349 else PC = 3656 end;
            continue
        end
        -- block @ 3656: 1 instruction
        if PC == 3656 then
            PC = 4340
            continue
        end
        -- block @ 3657: 5 instructions
        if PC == 3657 then
            R[148]=(R[1][96]);
            R[148]=R[55][R[148]];
            R[149]=(92);
            R[150]=(323);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(149); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 4749
            continue
        end
        -- block @ 3663: 1 instruction
        if PC == 3663 then
            if not(not(R[155]<159)) then PC = 3664 else PC = 5331 end;
            continue
        end
        -- block @ 3664: 1 instruction
        if PC == 3664 then
            PC = 555
            continue
        end
        -- block @ 3665: 1 instruction
        if PC == 3665 then
            if R[4]~=0 then PC = 847 else PC = 3666 end;
            continue
        end
        -- block @ 3666: 1 instruction
        if PC == 3666 then
            PC = 4896
            continue
        end
        -- block @ 3667: 1 instruction
        if PC == 3667 then
            PC = 5565
            continue
        end
        -- block @ 3669: 1 instruction
        if PC == 3669 then
            if not(not(43<R[4])) then PC = 3670 else PC = 4192 end;
            continue
        end
        -- block @ 3670: 1 instruction
        if PC == 3670 then
            PC = 4676
            continue
        end
        -- block @ 3671: 7 instructions
        if PC == 3671 then
            R[137]=R[131];
            R[138]=R[86];
            z=(137); (R[z])(R[z+1]); P=(z-1);
            R[137]=R[131];
            R[138]=R[48];
            z=(137); (R[z])(R[z+1]); P=(z-1);
            PC = 36
            continue
        end
        -- block @ 3679: 5 instructions
        if PC == 3679 then
            R[154]=(R[1][48]);
            R[155]=(R[1][48]);
            R[156]=(92);
            R[157]=(197);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(156); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 1648
            continue
        end
        -- block @ 3685: 4 instructions
        if PC == 3685 then
            P=157; R[P]=R[P]();
            z=R; x=158;
            J=2; z[x]=J;
            PC = 2152
            continue
        end
        -- block @ 3690: 1 instruction
        if PC == 3690 then
            if not(not(R[150]<34)) then PC = 3691 else PC = 2827 end;
            continue
        end
        -- block @ 3691: 1 instruction
        if PC == 3691 then
            PC = 3258
            continue
        end
        -- block @ 3692: 1 instruction
        if PC == 3692 then
            if R[154]~=156 then PC = 5213 else PC = 3693 end;
            continue
        end
        -- block @ 3693: 1 instruction
        if PC == 3693 then
            PC = 1324
            continue
        end
        -- block @ 3694: 1 instruction
        if PC == 3694 then
            PC = 2873
            continue
        end
        -- block @ 3696: 1 instruction
        if PC == 3696 then
            if not(not(R[4]<38)) then PC = 3697 else PC = 2095 end;
            continue
        end
        -- block @ 3697: 1 instruction
        if PC == 3697 then
            PC = 717
            continue
        end
        -- block @ 3698: 1 instruction
        if PC == 3698 then
            PC = 617
            continue
        end
        -- block @ 3699: 5 instructions
        if PC == 3699 then
            R[160]=R[60];
            R[161]=R[119];
            z=160; x=2; J=3; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            R[152]=R[160];
            PC = 1648
            continue
        end
        -- block @ 3705: 1 instruction
        if PC == 3705 then
            if not(not(R[4]<73)) then PC = 3706 else PC = 3415 end;
            continue
        end
        -- block @ 3706: 1 instruction
        if PC == 3706 then
            PC = 2344
            continue
        end
        -- block @ 3707: 2 instructions
        if PC == 3707 then
            R[155]=(R[148][15]);
            PC = 1459
            continue
        end
        -- block @ 3710: 1 instruction
        if PC == 3710 then
            if R[154]~=269 then PC = 4874 else PC = 3711 end;
            continue
        end
        -- block @ 3711: 1 instruction
        if PC == 3711 then
            PC = 2025
            continue
        end
        -- block @ 3712: 1 instruction
        if PC == 3712 then
            PC = 54
            continue
        end
        -- block @ 3713: 1 instruction
        if PC == 3713 then
            if R[4]~=6 then PC = 4443 else PC = 3714 end;
            continue
        end
        -- block @ 3714: 1 instruction
        if PC == 3714 then
            PC = 298
            continue
        end
        -- block @ 3715: 1 instruction
        if PC == 3715 then
            PC = 790
            continue
        end
        -- block @ 3716: 4 instructions
        if PC == 3716 then
            R[150]=R[148];
            R[151]=(R[1][121]);
            z=(149); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 2640
            continue
        end
        -- block @ 3721: 3 instructions
        if PC == 3721 then
            R[31]=(R[1][177]);
            R[20]=R[3][R[31]];
            PC = 2531
            continue
        end
        -- block @ 3725: 3 instructions
        if PC == 3725 then
            R[157]=R[32];
            P=157; R[P]=R[P]();
            PC = 2382
            continue
        end
        -- block @ 3729: 1 instruction
        if PC == 3729 then
            PC = 814
            continue
        end
        -- block @ 3730: 1 instruction
        if PC == 3730 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 3731 else R[163+3]=y; PC = 5299 end;
            continue
        end
        -- block @ 3731: 1 instruction
        if PC == 3731 then
            PC = 457
            continue
        end
        -- block @ 3732: 1 instruction
        if PC == 3732 then
            PC = 4039
            continue
        end
        -- block @ 3733: 5 instructions
        if PC == 3733 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[160]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=159; R[z]=R[z](R[z+1]); P=z;
            R[160]=(R[1][4]);
            z=(158); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3923
            continue
        end
        -- block @ 3739: 1 instruction
        if PC == 3739 then
            if not(not(R[4]<124)) then PC = 3740 else PC = 4964 end;
            continue
        end
        -- block @ 3740: 1 instruction
        if PC == 3740 then
            PC = 351
            continue
        end
        -- block @ 3741: 1 instruction
        if PC == 3741 then
            PC = 2457
            continue
        end
        -- block @ 3743: 1 instruction
        if PC == 3743 then
            if R[167]~=97 then PC = 1338 else PC = 3744 end;
            continue
        end
        -- block @ 3744: 1 instruction
        if PC == 3744 then
            PC = 1423
            continue
        end
        -- block @ 3745: 3 instructions
        if PC == 3745 then
            z=(119); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[118]=(d[17][15]);
            PC = 5719
            continue
        end
        -- block @ 3749: 1 instruction
        if PC == 3749 then
            PC = 3276
            continue
        end
        -- block @ 3750: 3 instructions
        if PC == 3750 then
            R[157]=(R[148][13]);
            R[158]=(1);
            PC = 7
            continue
        end
        -- block @ 3754: 3 instructions
        if PC == 3754 then
            R[43]=(R[1][75]);
            R[41]=R[35][R[43]];
            PC = 353
            continue
        end
        -- block @ 3758: 5 instructions
        if PC == 3758 then
            R[162]=(R[1][50]);
            R[162]=R[157][R[162]];
            R[162]=(R[162]["Scale"]);
            R[162]=(R[162]*100);
            PC = 4573
            continue
        end
        -- block @ 3764: 1 instruction
        if PC == 3764 then
            PC = 4818
            continue
        end
        -- block @ 3765: 3 instructions
        if PC == 3765 then
            R[137]=R[131];
            R[138]=R[19];
            PC = 2689
            continue
        end
        -- block @ 3769: 1 instruction
        if PC == 3769 then
            PC = 3351
            continue
        end
        -- block @ 3770: 4 instructions
        if PC == 3770 then
            z=R; x=155; J=R;
            F=(98); J=(J[F]); (z)[x]=J;
            R[156]=(R[149][70]);
            PC = 4382
            continue
        end
        -- block @ 3775: 1 instruction
        if PC == 3775 then
            if R[4]~=101 then PC = 1842 else PC = 3776 end;
            continue
        end
        -- block @ 3776: 1 instruction
        if PC == 3776 then
            PC = 3130
            continue
        end
        -- block @ 3777: 1 instruction
        if PC == 3777 then
            if R[4]~=125 then PC = 4129 else PC = 3778 end;
            continue
        end
        -- block @ 3778: 1 instruction
        if PC == 3778 then
            PC = 2704
            continue
        end
        -- block @ 3779: 3 instructions
        if PC == 3779 then
            R[156]=(R[1][4]);
            z=153; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 133
            continue
        end
        -- block @ 3783: 1 instruction
        if PC == 3783 then
            if not(not(9<R[150])) then PC = 3784 else PC = 3125 end;
            continue
        end
        -- block @ 3784: 1 instruction
        if PC == 3784 then
            PC = 4516
            continue
        end
        -- block @ 3785: 4 instructions
        if PC == 3785 then
            R[138]=R[131];
            R[139]=R[115];
            z=(138); (R[z])(R[z+1]); P=(z-1);
            PC = 1242
            continue
        end
        -- block @ 3790: 1 instruction
        if PC == 3790 then
            if not(not(R[154]<39)) then PC = 3791 else PC = 5388 end;
            continue
        end
        -- block @ 3791: 1 instruction
        if PC == 3791 then
            PC = 3334
            continue
        end
        -- block @ 3792: 4 instructions
        if PC == 3792 then
            R[164]=R[164][R[165]];
            R[165]=(D[H]);
            z=(163); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 330
            continue
        end
        -- block @ 3797: 5 instructions
        if PC == 3797 then
            z=R; x=(155); J=k;
            F=(149);
            J=J[F]; F=38; J=(J[F]);
            z[x]=J;
            PC = 2492
            continue
        end
        -- block @ 3803: 3 instructions
        if PC == 3803 then
            R[157]=(R[1][4]);
            z=154; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 798
            continue
        end
        -- block @ 3807: 1 instruction
        if PC == 3807 then
            if not(not(57<R[155])) then PC = 3808 else PC = 5331 end;
            continue
        end
        -- block @ 3808: 1 instruction
        if PC == 3808 then
            PC = 3662
            continue
        end
        -- block @ 3809: 1 instruction
        if PC == 3809 then
            if R[4]~=31 then PC = 62 else PC = 3810 end;
            continue
        end
        -- block @ 3810: 1 instruction
        if PC == 3810 then
            PC = 2563
            continue
        end
        -- block @ 3811: 1 instruction
        if PC == 3811 then
            PC = 2558
            continue
        end
        -- block @ 3812: 3 instructions
        if PC == 3812 then
            R[116]=R[50];
            R[117]=(R[1][130]);
            PC = 1291
            continue
        end
        -- block @ 3816: 6 instructions
        if PC == 3816 then
            R[161]=(0);
            z=159; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[160]=(R[1][155]);
            R[160]=R[159][R[160]];
            R[160]=(R[160]*100);
            PC = 5732
            continue
        end
        -- block @ 3823: 4 instructions
        if PC == 3823 then
            R[154]=(R[1][49]);
            R[155]=(R[1][4]);
            z=152; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 892
            continue
        end
        -- block @ 3828: 1 instruction
        if PC == 3828 then
            if not(not(77<R[157])) then PC = 3829 else PC = 2978 end;
            continue
        end
        -- block @ 3829: 1 instruction
        if PC == 3829 then
            PC = 2994
            continue
        end
        -- block @ 3830: 2 instructions
        if PC == 3830 then
            R[152]=(136);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 4465
            continue
        end
        -- block @ 3833: 2 instructions
        if PC == 3833 then
            R[160]=("Folder");
            PC = 9
            continue
        end
        -- block @ 3836: 2 instructions
        if PC == 3836 then
            R[62][5]=(1);
            PC = 739
            continue
        end
        -- block @ 3839: 3 instructions
        if PC == 3839 then
            R[155]=R[98];
            R[156]=R[11];
            PC = 5670
            continue
        end
        -- block @ 3843: 3 instructions
        if PC == 3843 then
            R[151]=R[98];
            R[152]=(R[148][1]);
            PC = 1255
            continue
        end
        -- block @ 3847: 1 instruction
        if PC == 3847 then
            if not(not(R[4]<=22)) then PC = 3848 else PC = 1199 end;
            continue
        end
        -- block @ 3848: 1 instruction
        if PC == 3848 then
            PC = 5232
            continue
        end
        -- block @ 3849: 1 instruction
        if PC == 3849 then
            PC = 2887
            continue
        end
        -- block @ 3850: 1 instruction
        if PC == 3850 then
            PC = 14
            continue
        end
        -- block @ 3852: 5 instructions
        if PC == 3852 then
            R[152]=(5);
            R[166]=(R[1][155]);
            R[166]=R[165][R[166]];
            R[166]=(R[166]*100);
            PC = 4378
            continue
        end
        -- block @ 3858: 3 instructions
        if PC == 3858 then
            R[51]=(R[1][135]);
            R[52]=(R[1][46]);
            PC = 4487
            continue
        end
        -- block @ 3862: 4 instructions
        if PC == 3862 then
            R[138][45]=R[151];
            R[151]=(109);
            R[152]=(203);
            PC = 2088
            continue
        end
        -- block @ 3867: 2 instructions
        if PC == 3867 then
            R[164]=(219);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(163); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 3012
            continue
        end
        -- block @ 3870: 4 instructions
        if PC == 3870 then
            R[122]=(R[1][48]);
            R[123]=nil;
            R[124]=(R[1][48]);
            PC = 3846
            continue
        end
        -- block @ 3875: 3 instructions
        if PC == 3875 then
            P=152; R[P]=R[P]();
            R[153]=(R[149][63]);
            PC = 5379
            continue
        end
        -- block @ 3879: 1 instruction
        if PC == 3879 then
            PC = 3313
            continue
        end
        -- block @ 3880: 5 instructions
        if PC == 3880 then
            R[163]=(R[1][155]);
            R[163]=R[162][R[163]];
            R[164]=(R[1][104]);
            R[163]=R[163][R[164]];
            PC = 5680
            continue
        end
        -- block @ 3886: 3 instructions
        if PC == 3886 then
            R[120]=R[94];
            R[121]=R[8];
            PC = 770
            continue
        end
        -- block @ 3890: 2 instructions
        if PC == 3890 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[105]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 1462
            continue
        end
        -- block @ 3893: 1 instruction
        if PC == 3893 then
            if not(not(7<R[152])) then PC = 3894 else PC = 2469 end;
            continue
        end
        -- block @ 3894: 1 instruction
        if PC == 3894 then
            PC = 2635
            continue
        end
        -- block @ 3895: 1 instruction
        if PC == 3895 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 3896 else R[151+3]=y; PC = 136 end;
            continue
        end
        -- block @ 3896: 1 instruction
        if PC == 3896 then
            PC = 4122
            continue
        end
        -- block @ 3897: 2 instructions
        if PC == 3897 then
            R[9]=(R[1][23]);
            PC = 3374
            continue
        end
        -- block @ 3900: 1 instruction
        if PC == 3900 then
            PC = 5213
            continue
        end
        -- block @ 3901: 1 instruction
        if PC == 3901 then
            if not(not(R[4]<77)) then PC = 3902 else PC = 840 end;
            continue
        end
        -- block @ 3902: 1 instruction
        if PC == 3902 then
            PC = 3003
            continue
        end
        -- block @ 3903: 1 instruction
        if PC == 3903 then
            if R[4]~=55 then PC = 4380 else PC = 3904 end;
            continue
        end
        -- block @ 3904: 1 instruction
        if PC == 3904 then
            PC = 2742
            continue
        end
        -- block @ 3905: 4 instructions
        if PC == 3905 then
            R[121]=R[94];
            R[122]=R[74];
            R[123]=(R[1][161]);
            PC = 1382
            continue
        end
        -- block @ 3910: 1 instruction
        if PC == 3910 then
            PC = 3252
            continue
        end
        -- block @ 3912: 6 instructions
        if PC == 3912 then
            R[155]=R[94];
            R[156]=(R[1][26]);
            R[156]=R[153][R[156]];
            R[157]=(R[1][26]);
            z=(155); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 683
            continue
        end
        -- block @ 3919: 1 instruction
        if PC == 3919 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 3920 else R[151+3]=y; PC = 4004 end;
            continue
        end
        -- block @ 3920: 1 instruction
        if PC == 3920 then
            PC = 973
            continue
        end
        -- block @ 3921: 2 instructions
        if PC == 3921 then
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 3125
            continue
        end
        -- block @ 3924: 1 instruction
        if PC == 3924 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 3925 else R[149+3]=y; PC = 4810 end;
            continue
        end
        -- block @ 3925: 1 instruction
        if PC == 3925 then
            PC = 3376
            continue
        end
        -- block @ 3926: 1 instruction
        if PC == 3926 then
            PC = 1264
            continue
        end
        -- block @ 3927: 2 instructions
        if PC == 3927 then
            R[28]=(R[1][86]);
            PC = 2531
            continue
        end
        -- block @ 3930: 1 instruction
        if PC == 3930 then
            PC = 4919
            continue
        end
        -- block @ 3932: 1 instruction
        if PC == 3932 then
            if R[163]~=59 then PC = 5370 else PC = 3933 end;
            continue
        end
        -- block @ 3933: 1 instruction
        if PC == 3933 then
            PC = 1527
            continue
        end
        -- block @ 3934: 2 instructions
        if PC == 3934 then
            R[156]=R[66];
            PC = 174
            continue
        end
        -- block @ 3937: 2 instructions
        if PC == 3937 then
            R[151]=(R[1][48]);
            PC = 2901
            continue
        end
        -- block @ 3940: 4 instructions
        if PC == 3940 then
            R[67]=(R[1][3]);
            R[63]=R[62][R[67]];
            R[67]=(R[1][122]);
            PC = 113
            continue
        end
        -- block @ 3945: 3 instructions
        if PC == 3945 then
            R[155]=R[98];
            R[156]=(R[148][6]);
            PC = 3684
            continue
        end
        -- block @ 3949: 1 instruction
        if PC == 3949 then
            if not(not(R[154]<13)) then PC = 3950 else PC = 4969 end;
            continue
        end
        -- block @ 3950: 1 instruction
        if PC == 3950 then
            PC = 4981
            continue
        end
        -- block @ 3951: 7 instructions
        if PC == 3951 then
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[158]=R[97];
            z=(159); x=R[155]; R[z+1]=(x); R[z]=x["NextInteger"];
            R[161]=(265);
            R[159]=R[148];
            R[160]=(1382252944);
            PC = 4557
            continue
        end
        -- block @ 3960: 2 instructions
        if PC == 3960 then
            R[153]=R[159];
            PC = 4878
            continue
        end
        -- block @ 3962: 2 instructions
        if PC == 3962 then
            z=k; F=(478); z=z[F];
            if R[168]~=452 then PC = 4756 else PC = 3964 end;
            continue
        end
        -- block @ 3964: 1 instruction
        if PC == 3964 then
            PC = 1354
            continue
        end
        -- block @ 3965: 1 instruction
        if PC == 3965 then
            if not(not(R[4]<18)) then PC = 3966 else PC = 5157 end;
            continue
        end
        -- block @ 3966: 1 instruction
        if PC == 3966 then
            PC = 1063
            continue
        end
        -- block @ 3967: 3 instructions
        if PC == 3967 then
            R[151]=(40);
            R[152]=(66);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2457
            continue
        end
        -- block @ 3971: 1 instruction
        if PC == 3971 then
            if R[150]~=96 then PC = 254 else PC = 3972 end;
            continue
        end
        -- block @ 3972: 1 instruction
        if PC == 3972 then
            PC = 708
            continue
        end
        -- block @ 3973: 1 instruction
        if PC == 3973 then
            if R[154]~=219 then PC = 4911 else PC = 3974 end;
            continue
        end
        -- block @ 3974: 1 instruction
        if PC == 3974 then
            PC = 5273
            continue
        end
        -- block @ 3975: 3 instructions
        if PC == 3975 then
            R[25]=(R[1][9]);
            R[31]=(R[1][123]);
            PC = 5375
            continue
        end
        -- block @ 3979: 3 instructions
        if PC == 3979 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=R[97];
            PC = 2035
            continue
        end
        -- block @ 3983: 1 instruction
        if PC == 3983 then
            PC = 3654
            continue
        end
        -- block @ 3985: 2 instructions
        if PC == 3985 then
            R[155]=(R[149][54]);
            PC = 5395
            continue
        end
        -- block @ 3988: 1 instruction
        if PC == 3988 then
            PC = 2590
            continue
        end
        -- block @ 3990: 4 instructions
        if PC == 3990 then
            R[152]=(80);
            R[161]=(R[1][50]);
            R[161]=R[159][R[161]];
            PC = 5572
            continue
        end
        -- block @ 3995: 2 instructions
        if PC == 3995 then
            R[155]=(R[149][43]);
            PC = 1985
            continue
        end
        -- block @ 3998: 1 instruction
        if PC == 3998 then
            PC = 161
            continue
        end
        -- block @ 4000: 4 instructions
        if PC == 4000 then
            R[161]=R[149];
            R[162]=(R[1][155]);
            R[162]=R[160][R[162]];
            PC = 33
            continue
        end
        -- block @ 4005: 1 instruction
        if PC == 4005 then
            if not(not(R[154]<174)) then PC = 4006 else PC = 5196 end;
            continue
        end
        -- block @ 4006: 1 instruction
        if PC == 4006 then
            PC = 5030
            continue
        end
        -- block @ 4007: 2 instructions
        if PC == 4007 then
            R[155]=(R[148][22]);
            PC = 1259
            continue
        end
        -- block @ 4010: 13 instructions
        if PC == 4010 then
            z=153; R[z]=R[z](R[z+1],R[z+2]); P=z;
            z=R; x=(154); J=k;
            F=(144);
            J=J[F]; F=1; J=(J[F]);
            z[x]=J;
            R[155]=(R[144][5]);
            z=152; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[153]=(R[144][9]);
            R[152]=R[152]-R[153];
            R[153]=(R[144][2]);
            R[152]=R[152]+R[153];
            R[152]=(-2013771605+R[152]);
            PC = 3552
            continue
        end
        -- block @ 4024: 1 instruction
        if PC == 4024 then
            if not(not(13<R[154])) then PC = 4025 else PC = 2605 end;
            continue
        end
        -- block @ 4025: 1 instruction
        if PC == 4025 then
            PC = 3154
            continue
        end
        -- block @ 4026: 4 instructions
        if PC == 4026 then
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 1347
            continue
        end
        -- block @ 4031: 1 instruction
        if PC == 4031 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4032 else R[151+3]=y; PC = 5482 end;
            continue
        end
        -- block @ 4032: 1 instruction
        if PC == 4032 then
            PC = 756
            continue
        end
        -- block @ 4033: 1 instruction
        if PC == 4033 then
            if R[4]~=16 then PC = 4287 else PC = 4034 end;
            continue
        end
        -- block @ 4034: 1 instruction
        if PC == 4034 then
            PC = 3222
            continue
        end
        -- block @ 4035: 1 instruction
        if PC == 4035 then
            if not(not(R[4]<93)) then PC = 4036 else PC = 479 end;
            continue
        end
        -- block @ 4036: 1 instruction
        if PC == 4036 then
            PC = 632
            continue
        end
        -- block @ 4037: 2 instructions
        if PC == 4037 then
            R[59]=(R[1][118]);
            PC = 845
            continue
        end
        -- block @ 4040: 8 instructions
        if PC == 4040 then
            R[151]=R[66];
            z=151;
            P=(z); z=R;
            x=(P); z=z[x]; (z)();
            z=(P);
            x=(1); z-=x;
            P=z;
            PC = 5414
            continue
        end
        -- block @ 4049: 4 instructions
        if PC == 4049 then
            z=(163); x=R[156]; R[z+1]=(x); R[z]=x["NextInteger"];
            R[165]=(163);
            R[166]=(757);
            if R[150]~=75 then PC = 2861 else PC = 4053 end;
            continue
        end
        -- block @ 4053: 1 instruction
        if PC == 4053 then
            PC = 493
            continue
        end
        -- block @ 4054: 1 instruction
        if PC == 4054 then
            PC = 2329
            continue
        end
        -- block @ 4055: 1 instruction
        if PC == 4055 then
            if R[4]~=111 then PC = 3108 else PC = 4056 end;
            continue
        end
        -- block @ 4056: 1 instruction
        if PC == 4056 then
            PC = 2240
            continue
        end
        -- block @ 4057: 8 instructions
        if PC == 4057 then
            R[115]=R[94];
            R[116]=R[39];
            R[117]=(R[1][151]);
            z=(115); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[115]=R[94];
            R[116]=R[25];
            R[117]=(R[1][57]);
            PC = 4301
            continue
        end
        -- block @ 4066: 2 instructions
        if PC == 4066 then
            R[151]=(86);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(150); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 1233
            continue
        end
        -- block @ 4069: 1 instruction
        if PC == 4069 then
            if R[4]~=92 then PC = 2203 else PC = 4070 end;
            continue
        end
        -- block @ 4070: 1 instruction
        if PC == 4070 then
            PC = 4842
            continue
        end
        -- block @ 4071: 1 instruction
        if PC == 4071 then
            if not(not(R[4]<87)) then PC = 4072 else PC = 562 end;
            continue
        end
        -- block @ 4072: 1 instruction
        if PC == 4072 then
            PC = 830
            continue
        end
        -- block @ 4073: 1 instruction
        if PC == 4073 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4074 else R[153+3]=y; PC = 3241 end;
            continue
        end
        -- block @ 4074: 1 instruction
        if PC == 4074 then
            PC = 4205
            continue
        end
        -- block @ 4075: 2 instructions
        if PC == 4075 then
            R[46]=(R[1][1]);
            PC = 3447
            continue
        end
        -- block @ 4078: 1 instruction
        if PC == 4078 then
            PC = 874
            continue
        end
        -- block @ 4079: 3 instructions
        if PC == 4079 then
            R[114]=R[94];
            R[115]=R[88];
            PC = 5470
            continue
        end
        -- block @ 4083: 4 instructions
        if PC == 4083 then
            R[155]=(R[148][6]);
            R[138][19]=R[155];
            R[155]=(R[149][50]);
            PC = 5184
            continue
        end
        -- block @ 4088: 2 instructions
        if PC == 4088 then
            R[138][80]=R[151];
            PC = 1502
            continue
        end
        -- block @ 4091: 3 instructions
        if PC == 4091 then
            R[162]=(R[162]*100);
            R[65]=(d[30](R[162],Y[H]));
            PC = 3229
            continue
        end
        -- block @ 4095: 5 instructions
        if PC == 4095 then
            R[119]=R[94];
            R[120]=R[15];
            R[121]=(R[1][97]);
            z=(119); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3551
            continue
        end
        -- block @ 4101: 1 instruction
        if PC == 4101 then
            if not(not(R[157]<72)) then PC = 4102 else PC = 2126 end;
            continue
        end
        -- block @ 4102: 1 instruction
        if PC == 4102 then
            PC = 4158
            continue
        end
        -- block @ 4103: 1 instruction
        if PC == 4103 then
            if not(not(R[160]<456)) then PC = 4104 else PC = 1133 end;
            continue
        end
        -- block @ 4104: 5 instructions
        if PC == 4104 then
            R[162]=(R[1][155]);
            R[162]=R[161][R[162]];
            R[163]=(R[1][104]);
            R[162]=R[162][R[163]];
            PC = 3007
            continue
        end
        -- block @ 4110: 4 instructions
        if PC == 4110 then
            R[158]=R[135];
            R[159]=("Path2D");
            z=158; R[z]=R[z](R[z+1]); P=z;
            PC = 2535
            continue
        end
        -- block @ 4115: 1 instruction
        if PC == 4115 then
            if not(not(R[4]<75)) then PC = 4116 else PC = 885 end;
            continue
        end
        -- block @ 4116: 1 instruction
        if PC == 4116 then
            PC = 4133
            continue
        end
        -- block @ 4117: 4 instructions
        if PC == 4117 then
            R[153]=(R[149][22]);
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 5372
            continue
        end
        -- block @ 4122: 1 instruction
        if PC == 4122 then
            PC = 3374
            continue
        end
        -- block @ 4123: 4 instructions
        if PC == 4123 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(98);
            R[152]=(293);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 4030
            continue
        end
        -- block @ 4128: 1 instruction
        if PC == 4128 then
            PC = 3559
            continue
        end
        -- block @ 4130: 3 instructions
        if PC == 4130 then
            R[144]=R[94];
            R[145]=R[123];
            PC = 5636
            continue
        end
        -- block @ 4134: 5 instructions
        if PC == 4134 then
            R[113]=R[94];
            R[114]=R[82];
            R[115]=(R[1][68]);
            z=(113); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3061
            continue
        end
        -- block @ 4140: 3 instructions
        if PC == 4140 then
            R[154]=(R[148][9]);
            R[138][1]=R[154];
            if R[23]==R[16] then PC = 4591 else PC = 4143 end;
            continue
        end
        -- block @ 4143: 1 instruction
        if PC == 4143 then
            PC = 794
            continue
        end
        -- block @ 4144: 1 instruction
        if PC == 4144 then
            PC = 5035
            continue
        end
        -- block @ 4145: 3 instructions
        if PC == 4145 then
            R[155]=R[97];
            R[156]=R[11];
            PC = 1247
            continue
        end
        -- block @ 4149: 1 instruction
        if PC == 4149 then
            PC = 2373
            continue
        end
        -- block @ 4151: 3 instructions
        if PC == 4151 then
            z=157; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[157]=R[97];
            PC = 1613
            continue
        end
        -- block @ 4155: 3 instructions
        if PC == 4155 then
            R[160]=R[154][R[160]];
            R[161]=(R[1][4]);
            PC = 2267
            continue
        end
        -- block @ 4159: 1 instruction
        if PC == 4159 then
            if not(not(35<R[157])) then PC = 4160 else PC = 2126 end;
            continue
        end
        -- block @ 4160: 1 instruction
        if PC == 4160 then
            PC = 3600
            continue
        end
        -- block @ 4161: 4 instructions
        if PC == 4161 then
            R[156][56830864]=R[152];
            R[156][2776134316]=R[154];
            R[156][2225957886]=R[154];
            PC = 5282
            continue
        end
        -- block @ 4166: 9 instructions
        if PC == 4166 then
            z=163; P=z+5-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[164]=R[123];
            R[165]=(0);
            R[166]=(0);
            R[167]=(0);
            R[168]=(0);
            z=164; x=5; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=161; R[z]=R[z](d[28](k,z+1,P)); P=z;
            PC = 4663
            continue
        end
        -- block @ 4176: 2 instructions
        if PC == 4176 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 5198
            continue
        end
        -- block @ 4179: 1 instruction
        if PC == 4179 then
            PC = 3289
            continue
        end
        -- block @ 4181: 3 instructions
        if PC == 4181 then
            R[161]=R[149];
            R[162]=(R[1][155]);
            PC = 2068
            continue
        end
        -- block @ 4185: 2 instructions
        if PC == 4185 then
            R[65]=(d[30](R[168],Y[H]));
            PC = 2512
            continue
        end
        -- block @ 4188: 4 instructions
        if PC == 4188 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(R[149][10]);
            R[138][66]=R[151];
            PC = 2728
            continue
        end
        -- block @ 4193: 1 instruction
        if PC == 4193 then
            if not(not(R[4]<=34)) then PC = 4194 else PC = 2012 end;
            continue
        end
        -- block @ 4194: 1 instruction
        if PC == 4194 then
            PC = 3764
            continue
        end
        -- block @ 4195: 4 instructions
        if PC == 4195 then
            R[155]=R[98];
            R[156]=(R[149][18]);
            R[157]=R[11];
            PC = 1040
            continue
        end
        -- block @ 4200: 1 instruction
        if PC == 4200 then
            if not(not(R[154]<=23)) then PC = 4201 else PC = 1322 end;
            continue
        end
        -- block @ 4201: 1 instruction
        if PC == 4201 then
            PC = 2343
            continue
        end
        -- block @ 4202: 3 instructions
        if PC == 4202 then
            R[155]=R[98];
            R[156]=R[11];
            PC = 4251
            continue
        end
        -- block @ 4206: 3 instructions
        if PC == 4206 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[153]=R[97];
            PC = 5235
            continue
        end
        -- block @ 4210: 1 instruction
        if PC == 4210 then
            PC = 4144
            continue
        end
        -- block @ 4211: 3 instructions
        if PC == 4211 then
            R[56]=(R[1][93]);
            R[57]=(R[1][12]);
            PC = 3625
            continue
        end
        -- block @ 4215: 7 instructions
        if PC == 4215 then
            R[153]=(R[1][48]);
            R[154]=(R[1][48]);
            R[155]=(R[1][48]);
            R[156]=(R[1][48]);
            R[157]=(82);
            R[169]=(R[161][3]);
            PC = 4756
            continue
        end
        -- block @ 4223: 3 instructions
        if PC == 4223 then
            R[151]=(R[149][9]);
            R[138][36]=R[151];
            PC = 1691
            continue
        end
        -- block @ 4227: 1 instruction
        if PC == 4227 then
            if R[4]~=17 then PC = 5322 else PC = 4228 end;
            continue
        end
        -- block @ 4228: 1 instruction
        if PC == 4228 then
            PC = 1164
            continue
        end
        -- block @ 4229: 1 instruction
        if PC == 4229 then
            if not(not(R[150]<=50)) then PC = 4230 else PC = 69 end;
            continue
        end
        -- block @ 4230: 1 instruction
        if PC == 4230 then
            PC = 241
            continue
        end
        -- block @ 4231: 3 instructions
        if PC == 4231 then
            R[156]=R[153][R[156]];
            R[157]=(R[1][16]);
            PC = 683
            continue
        end
        -- block @ 4235: 1 instruction
        if PC == 4235 then
            if R[154]~=107 then PC = 683 else PC = 4236 end;
            continue
        end
        -- block @ 4236: 1 instruction
        if PC == 4236 then
            PC = 2849
            continue
        end
        -- block @ 4237: 4 instructions
        if PC == 4237 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[92]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            R[4]=(81);
            R[65]=(d[30](R[161],Y[H]));
            PC = 2915
            continue
        end
        -- block @ 4242: 1 instruction
        if PC == 4242 then
            if R[4]~=3 then PC = 4816 else PC = 4243 end;
            continue
        end
        -- block @ 4243: 1 instruction
        if PC == 4243 then
            PC = 3636
            continue
        end
        -- block @ 4244: 3 instructions
        if PC == 4244 then
            R[65]=(d[30](R[163],Y[H]));
            R[138][113]=R[163];
            PC = 4289
            continue
        end
        -- block @ 4248: 3 instructions
        if PC == 4248 then
            R[162]=R[149];
            R[163]=(R[1][50]);
            PC = 2775
            continue
        end
        -- block @ 4252: 3 instructions
        if PC == 4252 then
            R[157]=(R[149][2]);
            R[158]=(1);
            PC = 4268
            continue
        end
        -- block @ 4256: 1 instruction
        if PC == 4256 then
            if not(not(R[4]<=27)) then PC = 4257 else PC = 4833 end;
            continue
        end
        -- block @ 4257: 1 instruction
        if PC == 4257 then
            PC = 3693
            continue
        end
        -- block @ 4258: 1 instruction
        if PC == 4258 then
            if not(not(95<R[154])) then PC = 4259 else PC = 2471 end;
            continue
        end
        -- block @ 4259: 1 instruction
        if PC == 4259 then
            PC = 2516
            continue
        end
        -- block @ 4260: 1 instruction
        if PC == 4260 then
            PC = 194
            continue
        end
        -- block @ 4261: 1 instruction
        if PC == 4261 then
            PC = 5213
            continue
        end
        -- block @ 4262: 1 instruction
        if PC == 4262 then
            PC = 5246
            continue
        end
        -- block @ 4263: 5 instructions
        if PC == 4263 then
            z=(122); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[122]=R[94];
            R[123]=R[64];
            R[124]=(R[1][122]);
            PC = 1899
            continue
        end
        -- block @ 4269: 1 instruction
        if PC == 4269 then
            PC = 1985
            continue
        end
        -- block @ 4270: 5 instructions
        if PC == 4270 then
            R[112][R[113]]=(-1);
            R[113]=(R[1][24]);
            R[112][R[113]]=(l[H]);
            R[113]=(R[1][139]);
            PC = 5177
            continue
        end
        -- block @ 4276: 3 instructions
        if PC == 4276 then
            R[159]=R[128];
            R[160]=R[155];
            z=159; x=(3); P=(z+x-1); if i then for w,u in i do if not(w>=1) then else(u)[1]=u; (u)[2]=(R[w]); u[3]=(2); (i)[w]=nil; end; end; end;
            return
        end
        -- block @ 4280: 1 instruction
        if PC == 4280 then
            PC = 669
            continue
        end
        -- block @ 4282: 1 instruction
        if PC == 4282 then
            if not(not(15<R[4])) then PC = 4283 else PC = 723 end;
            continue
        end
        -- block @ 4283: 1 instruction
        if PC == 4283 then
            PC = 4751
            continue
        end
        -- block @ 4284: 1 instruction
        if PC == 4284 then
            if not(not(174<R[154])) then PC = 4285 else PC = 215 end;
            continue
        end
        -- block @ 4285: 1 instruction
        if PC == 4285 then
            PC = 4209
            continue
        end
        -- block @ 4286: 1 instruction
        if PC == 4286 then
            if R[4]~=100 then PC = 5523 else PC = 4287 end;
            continue
        end
        -- block @ 4287: 1 instruction
        if PC == 4287 then
            PC = 984
            continue
        end
        -- block @ 4288: 1 instruction
        if PC == 4288 then
            if R[4]~=47 then PC = 4936 else PC = 4289 end;
            continue
        end
        -- block @ 4289: 1 instruction
        if PC == 4289 then
            PC = 189
            continue
        end
        -- block @ 4290: 1 instruction
        if PC == 4290 then
            PC = 2537
            continue
        end
        -- block @ 4291: 1 instruction
        if PC == 4291 then
            PC = 5388
            continue
        end
        -- block @ 4292: 1 instruction
        if PC == 4292 then
            PC = 549
            continue
        end
        -- block @ 4293: 8 instructions
        if PC == 4293 then
            z=(150); x=R[38]; R[z+1]=(x); R[z]=x["GetService"];
            R[152]=("StarterPlayer");
            z=150; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[151]=(0);
            R[152]=R[145];
            R[153]=R[150];
            R[154]=(R[1][156]);
            PC = 4351
            continue
        end
        -- block @ 4302: 1 instruction
        if PC == 4302 then
            PC = 3738
            continue
        end
        -- block @ 4304: 2 instructions
        if PC == 4304 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 1201
            continue
        end
        -- block @ 4307: 4 instructions
        if PC == 4307 then
            R[137]=R[131];
            R[138]=R[14];
            z=(137); (R[z])(R[z+1]); P=(z-1);
            PC = 36
            continue
        end
        -- block @ 4312: 1 instruction
        if PC == 4312 then
            if R[168]~=361 then PC = 3962 else PC = 4313 end;
            continue
        end
        -- block @ 4313: 6 instructions
        if PC == 4313 then
            R[112]=R[94];
            R[113]=R[24];
            R[114]=(R[1][115]);
            z=(112); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[112]=R[94];
            PC = 2205
            continue
        end
        -- block @ 4320: 3 instructions
        if PC == 4320 then
            R[11]=(R[1][126]);
            R[8]=R[2][R[11]];
            PC = 3374
            continue
        end
        -- block @ 4324: 3 instructions
        if PC == 4324 then
            R[157]=(R[149][1]);
            R[158]=(1);
            PC = 3062
            continue
        end
        -- block @ 4328: 1 instruction
        if PC == 4328 then
            if R[4]~=43 then PC = 4329 else PC = 4393 end;
            continue
        end
        -- block @ 4329: 1 instruction
        if PC == 4329 then
            PC = 342
            continue
        end
        -- block @ 4330: 4 instructions
        if PC == 4330 then
            R[155]=R[94];
            R[156]=(R[153]["Clone"]);
            R[157]=(R[1][35]);
            PC = 4989
            continue
        end
        -- block @ 4335: 5 instructions
        if PC == 4335 then
            R[161]=R[88];
            R[162]=R[160];
            z=161; R[z]=R[z](R[z+1]); P=z;
            R[162]=(R[1][168]);
            if R[161]==R[162] then PC = 1876 else PC = 4340 end;
            continue
        end
        -- block @ 4340: 1 instruction
        if PC == 4340 then
            PC = 52
            continue
        end
        -- block @ 4341: 5 instructions
        if PC == 4341 then
            z=R; x=152;
            J=82; z[x]=J;
            R[166]=(R[165]["Y"]);
            R[166]=(R[166]*100);
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4346 else R[151+3]=y; PC = 4199 end;
            continue
        end
        -- block @ 4346: 1 instruction
        if PC == 4346 then
            PC = 2826
            continue
        end
        -- block @ 4347: 4 instructions
        if PC == 4347 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[155]=R[149];
            R[156]=R[154];
            PC = 3408
            continue
        end
        -- block @ 4352: 3 instructions
        if PC == 4352 then
            R[152]=(57);
            R[153]=(163);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(152); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 4919
            continue
        end
        -- block @ 4356: 1 instruction
        if PC == 4356 then
            if not(not(127<R[159])) then PC = 4357 else PC = 586 end;
            continue
        end
        -- block @ 4357: 1 instruction
        if PC == 4357 then
            PC = 5061
            continue
        end
        -- block @ 4358: 3 instructions
        if PC == 4358 then
            R[153]=(R[149][52]);
            R[154]=(2);
            PC = 961
            continue
        end
        -- block @ 4362: 1 instruction
        if PC == 4362 then
            if not(not(R[163]<104)) then PC = 4363 else PC = 2614 end;
            continue
        end
        -- block @ 4363: 1 instruction
        if PC == 4363 then
            PC = 4934
            continue
        end
        -- block @ 4364: 1 instruction
        if PC == 4364 then
            if not(not(100<R[150])) then PC = 4365 else PC = 3269 end;
            continue
        end
        -- block @ 4365: 1 instruction
        if PC == 4365 then
            PC = 5206
            continue
        end
        -- block @ 4366: 1 instruction
        if PC == 4366 then
            PC = 3125
            continue
        end
        -- block @ 4368: 1 instruction
        if PC == 4368 then
            PC = 1831
            continue
        end
        -- block @ 4370: 3 instructions
        if PC == 4370 then
            R[151]=(R[148][7]);
            R[138][25]=R[151];
            PC = 2459
            continue
        end
        -- block @ 4374: 4 instructions
        if PC == 4374 then
            R[118]=R[94];
            R[119]=R[75];
            R[120]=(R[1][128]);
            PC = 3259
            continue
        end
        -- block @ 4379: 1 instruction
        if PC == 4379 then
            PC = 3654
            continue
        end
        -- block @ 4381: 1 instruction
        if PC == 4381 then
            if R[4]~=42 then PC = 1699 else PC = 4382 end;
            continue
        end
        -- block @ 4382: 1 instruction
        if PC == 4382 then
            PC = 456
            continue
        end
        -- block @ 4383: 3 instructions
        if PC == 4383 then
            P=157; R[P]=R[P]();
            R[158]=(2);
            PC = 971
            continue
        end
        -- block @ 4387: 6 instructions
        if PC == 4387 then
            R[168]=(R[1][4]);
            z=(166); (R[z])(R[z+1],R[z+2]); P=z-1;
            z=(166); x=R[153]; R[z+1]=(x); R[z]=x["GetTangentOnCurveArcLength"];
            R[168]=(0);
            z=166; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 3649
            continue
        end
        -- block @ 4394: 3 instructions
        if PC == 4394 then
            R[97]=(R[1][143]);
            R[95]=R[9][R[97]];
            PC = 4985
            continue
        end
        -- block @ 4398: 1 instruction
        if PC == 4398 then
            if R[154]~=291 then PC = 1497 else PC = 4399 end;
            continue
        end
        -- block @ 4399: 1 instruction
        if PC == 4399 then
            PC = 2224
            continue
        end
        -- block @ 4400: 6 instructions
        if PC == 4400 then
            R[151]=(R[1][148]);
            R[151]=R[148][R[151]];
            R[152]=(R[1][148]);
            z=(150); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[150]=R[94];
            PC = 294
            continue
        end
        -- block @ 4407: 3 instructions
        if PC == 4407 then
            R[158]=R[65];
            R[159]=(291751401);
            PC = 828
            continue
        end
        -- block @ 4411: 4 instructions
        if PC == 4411 then
            R[136]=R[131];
            R[137]=R[88];
            z=(136); (R[z])(R[z+1]); P=(z-1);
            PC = 2392
            continue
        end
        -- block @ 4416: 1 instruction
        if PC == 4416 then
            if not(not(108<R[154])) then PC = 4417 else PC = 971 end;
            continue
        end
        -- block @ 4417: 1 instruction
        if PC == 4417 then
            PC = 2658
            continue
        end
        -- block @ 4418: 2 instructions
        if PC == 4418 then
            R[138][51]=R[151];
            PC = 5204
            continue
        end
        -- block @ 4421: 3 instructions
        if PC == 4421 then
            R[154]=R[148]/4;
            R[155]=(R[1][48]);
            PC = 855
            continue
        end
        -- block @ 4425: 4 instructions
        if PC == 4425 then
            R[151]=(R[1][48]);
            z=R; x=152;
            J=108; z[x]=J;
            PC = 3514
            continue
        end
        -- block @ 4430: 2 instructions
        if PC == 4430 then
            R[169]=(R[161][1]);
            PC = 4756
            continue
        end
        -- block @ 4433: 1 instruction
        if PC == 4433 then
            if not(103<=R[4]) then PC = 975 else PC = 4434 end;
            continue
        end
        -- block @ 4434: 1 instruction
        if PC == 4434 then
            PC = 3287
            continue
        end
        -- block @ 4435: 1 instruction
        if PC == 4435 then
            if not(not(R[150]<87)) then PC = 4436 else PC = 73 end;
            continue
        end
        -- block @ 4436: 1 instruction
        if PC == 4436 then
            PC = 4803
            continue
        end
        -- block @ 4437: 4 instructions
        if PC == 4437 then
            R[158]=R[94];
            R[159]=(R[1][15]);
            R[159]=R[152][R[159]];
            PC = 4178
            continue
        end
        -- block @ 4442: 1 instruction
        if PC == 4442 then
            PC = 4756
            continue
        end
        -- block @ 4444: 1 instruction
        if PC == 4444 then
            if R[4]~=103 then PC = 4241 else PC = 4445 end;
            continue
        end
        -- block @ 4445: 1 instruction
        if PC == 4445 then
            PC = 1977
            continue
        end
        -- block @ 4446: 3 instructions
        if PC == 4446 then
            R[151]=R[98];
            R[152]=R[11];
            PC = 3472
            continue
        end
        -- block @ 4450: 1 instruction
        if PC == 4450 then
            if not(not(R[154]<74)) then PC = 4451 else PC = 4621 end;
            continue
        end
        -- block @ 4451: 1 instruction
        if PC == 4451 then
            PC = 4903
            continue
        end
        -- block @ 4452: 7 instructions
        if PC == 4452 then
            R[156]=R[11];
            z=(156); P=z;
            z=k;
            x=P; J=k; F=P;
            J=(J[F]); J=J(); (z)[x]=(J);
            PC = 2279
            continue
        end
        -- block @ 4460: 5 instructions
        if PC == 4460 then
            R[163]=(1009);
            z=160; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[161]=(R[1][4]);
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 5334
            continue
        end
        -- block @ 4466: 1 instruction
        if PC == 4466 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4467 else R[151+3]=y; PC = 2377 end;
            continue
        end
        -- block @ 4467: 1 instruction
        if PC == 4467 then
            PC = 4303
            continue
        end
        -- block @ 4468: 1 instruction
        if PC == 4468 then
            if not(not(126<R[154])) then PC = 4469 else PC = 1773 end;
            continue
        end
        -- block @ 4469: 1 instruction
        if PC == 4469 then
            PC = 4006
            continue
        end
        -- block @ 4470: 4 instructions
        if PC == 4470 then
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 4528
            continue
        end
        -- block @ 4475: 12 instructions
        if PC == 4475 then
            R[165]=R[123];
            R[166]=(0);
            R[167]=(-4);
            R[168]=(0);
            R[169]=(1);
            z=165; x=5; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=162; R[z]=R[z](d[28](k,z+1,P)); P=z;
            R[163]=R[114];
            R[164]=R[123];
            R[165]=(0);
            R[166]=(-4);
            PC = 5503
            continue
        end
        -- block @ 4488: 3 instructions
        if PC == 4488 then
            R[54]=(R[1][48]);
            R[55]=(R[1][48]);
            PC = 3808
            continue
        end
        -- block @ 4492: 1 instruction
        if PC == 4492 then
            PC = 2805
            continue
        end
        -- block @ 4493: 1 instruction
        if PC == 4493 then
            if not(58<=R[4]) then PC = 1637 else PC = 4494 end;
            continue
        end
        -- block @ 4494: 1 instruction
        if PC == 4494 then
            PC = 4927
            continue
        end
        -- block @ 4495: 1 instruction
        if PC == 4495 then
            PC = 1662
            continue
        end
        -- block @ 4496: 1 instruction
        if PC == 4496 then
            if not(not(R[154]<75)) then PC = 4497 else PC = 5150 end;
            continue
        end
        -- block @ 4497: 1 instruction
        if PC == 4497 then
            PC = 4291
            continue
        end
        -- block @ 4498: 1 instruction
        if PC == 4498 then
            PC = 3037
            continue
        end
        -- block @ 4499: 3 instructions
        if PC == 4499 then
            R[150]=R[94];
            R[151]=(R[1][120]);
            PC = 5399
            continue
        end
        -- block @ 4503: 1 instruction
        if PC == 4503 then
            PC = 36
            continue
        end
        -- block @ 4504: 3 instructions
        if PC == 4504 then
            R[148]=R[106];
            R[149]=(R[1][159]);
            PC = 5631
            continue
        end
        -- block @ 4508: 3 instructions
        if PC == 4508 then
            R[141]=(R[1][48]);
            R[142]=nil;
            PC = 5491
            continue
        end
        -- block @ 4512: 4 instructions
        if PC == 4512 then
            R[151]=R[98];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 1950
            continue
        end
        -- block @ 4517: 1 instruction
        if PC == 4517 then
            PC = 4521
            continue
        end
        -- block @ 4518: 3 instructions
        if PC == 4518 then
            R[152]=(102);
            R[163]=R[149];
            PC = 1045
            continue
        end
        -- block @ 4522: 6 instructions
        if PC == 4522 then
            R[151]=(R[149][14]);
            R[138][35]=R[151];
            R[151]=R[98];
            R[152]=(R[149][14]);
            R[153]=R[11];
            PC = 1374
            continue
        end
        -- block @ 4529: 3 instructions
        if PC == 4529 then
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 2316
            continue
        end
        -- block @ 4533: 9 instructions
        if PC == 4533 then
            R[162]=(346);
            R[163]=(521);
            z=160; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[161]=(R[1][4]);
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[158]=R[97];
            z=(159); x=R[154]; R[z+1]=(x); R[z]=x["NextInteger"];
            R[161]=(673);
            PC = 1850
            continue
        end
        -- block @ 4543: 2 instructions
        if PC == 4543 then
            R[152]=(336);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 7
            continue
        end
        -- block @ 4546: 1 instruction
        if PC == 4546 then
            PC = 402
            continue
        end
        -- block @ 4548: 1 instruction
        if PC == 4548 then
            PC = 3869
            continue
        end
        -- block @ 4550: 1 instruction
        if PC == 4550 then
            PC = 4228
            continue
        end
        -- block @ 4552: 5 instructions
        if PC == 4552 then
            R[144]=R[131];
            R[145]=R[135];
            R[146]=(R[1][48]);
            z=(144); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 1558
            continue
        end
        -- block @ 4558: 4 instructions
        if PC == 4558 then
            R[162]=R[149];
            R[163]=(R[1][155]);
            R[163]=R[157][R[163]];
            PC = 2200
            continue
        end
        -- block @ 4563: 3 instructions
        if PC == 4563 then
            R[140]=R[131];
            R[141]=R[6];
            PC = 123
            continue
        end
        -- block @ 4567: 4 instructions
        if PC == 4567 then
            z=156; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[157]=(R[1][4]);
            z=154; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 361
            continue
        end
        -- block @ 4572: 1 instruction
        if PC == 4572 then
            if not(not(67<R[157])) then PC = 4573 else PC = 2494 end;
            continue
        end
        -- block @ 4573: 1 instruction
        if PC == 4573 then
            PC = 2300
            continue
        end
        -- block @ 4574: 8 instructions
        if PC == 4574 then
            R[138][105]=R[162];
            R[162]=R[149];
            R[163]=(R[1][50]);
            R[163]=R[157][R[163]];
            R[164]=(R[1][104]);
            R[163]=R[163][R[164]];
            R[164]=(R[1][4]);
            PC = 4856
            continue
        end
        -- block @ 4583: 2 instructions
        if PC == 4583 then
            R[4]=(72);
            PC = 4610
            continue
        end
        -- block @ 4586: 1 instruction
        if PC == 4586 then
            PC = 4228
            continue
        end
        -- block @ 4587: 4 instructions
        if PC == 4587 then
            R[152]=R[11];
            P=152; R[P]=R[P]();
            R[153]=(R[149][35]);
            PC = 850
            continue
        end
        -- block @ 4592: 11 instructions
        if PC == 4592 then
            R[27]=(1066245003);
            R[16]=R[16]-945;
            R[42]=(R[42]+274);
            R[23]=R[23]-1241;
            R[5]=(391963667);
            R[473]=(R[311]*l[H]);
            R[329]=(#R[498]);
            z=R; x=(65);
            F=F[U]; J%=F; z[x]=J;
            PC = 1233
            continue
        end
        -- block @ 4604: 6 instructions
        if PC == 4604 then
            R[155]=R[97];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[149][47]);
            R[158]=(2);
            PC = 5395
            continue
        end
        -- block @ 4611: 1 instruction
        if PC == 4611 then
            if R[4]~=72 then PC = 776 else PC = 4612 end;
            continue
        end
        -- block @ 4612: 1 instruction
        if PC == 4612 then
            PC = 1802
            continue
        end
        -- block @ 4613: 4 instructions
        if PC == 4613 then
            R[151]=R[148][R[151]];
            R[152]=R[38];
            R[153]=(R[1][4]);
            PC = 2640
            continue
        end
        -- block @ 4618: 2 instructions
        if PC == 4618 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[93]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 26
            continue
        end
        -- block @ 4621: 1 instruction
        if PC == 4621 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 669
            continue
        end
        -- block @ 4622: 1 instruction
        if PC == 4622 then
            if not(not(74<R[154])) then PC = 4623 else PC = 2667 end;
            continue
        end
        -- block @ 4623: 1 instruction
        if PC == 4623 then
            PC = 5272
            continue
        end
        -- block @ 4624: 11 instructions
        if PC == 4624 then
            R[153]=R[98];
            R[154]=(R[1][101]);
            R[155]=R[88];
            R[156]=R[148];
            z=155; R[z]=R[z](R[z+1]); P=z;
            R[156]=(D[H]);
            z=153; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[153]=R[98];
            R[154]=R[25];
            R[155]=R[148];
            PC = 2473
            continue
        end
        -- block @ 4636: 3 instructions
        if PC == 4636 then
            R[152]=(R[1][48]);
            z=(150); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3936
            continue
        end
        -- block @ 4640: 1 instruction
        if PC == 4640 then
            PC = 4680
            continue
        end
        -- block @ 4641: 7 instructions
        if PC == 4641 then
            R[160]=(R[1][104]);
            R[159]=R[159][R[160]];
            R[159]=(R[159]*100);
            R[65]=(d[30](R[159],Y[H]));
            R[138][107]=R[159];
            R[159]=R[149];
            PC = 2980
            continue
        end
        -- block @ 4649: 3 instructions
        if PC == 4649 then
            R[151]=(107);
            R[152]=(110);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 971
            continue
        end
        -- block @ 4653: 1 instruction
        if PC == 4653 then
            PC = 1538
            continue
        end
        -- block @ 4654: 1 instruction
        if PC == 4654 then
            PC = 254
            continue
        end
        -- block @ 4656: 1 instruction
        if PC == 4656 then
            if not(not(72<R[152])) then PC = 4657 else PC = 4782 end;
            continue
        end
        -- block @ 4657: 1 instruction
        if PC == 4657 then
            PC = 3697
            continue
        end
        -- block @ 4658: 5 instructions
        if PC == 4658 then
            R[118]=R[94];
            R[119]=R[10];
            R[120]=(R[1][2]);
            z=(118); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 4053
            continue
        end
        -- block @ 4664: 12 instructions
        if PC == 4664 then
            R[163]=R[123];
            R[164]=(0);
            R[165]=(8);
            R[166]=(0);
            R[167]=(7);
            z=163; P=z+5-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[164]=R[123];
            R[165]=(0);
            R[166]=(-6);
            R[167]=(-1);
            R[168]=(0);
            PC = 4474
            continue
        end
        -- block @ 4677: 1 instruction
        if PC == 4677 then
            if not(not(R[4]<=112)) then PC = 4678 else PC = 5020 end;
            continue
        end
        -- block @ 4678: 1 instruction
        if PC == 4678 then
            PC = 3670
            continue
        end
        -- block @ 4679: 1 instruction
        if PC == 4679 then
            PC = 2894
            continue
        end
        -- block @ 4681: 3 instructions
        if PC == 4681 then
            R[157]=(70);
            R[158]=R[98];
            PC = 898
            continue
        end
        -- block @ 4685: 1 instruction
        if PC == 4685 then
            if not(not(R[152]<=156)) then PC = 4686 else PC = 67 end;
            continue
        end
        -- block @ 4686: 1 instruction
        if PC == 4686 then
            PC = 2107
            continue
        end
        -- block @ 4687: 2 instructions
        if PC == 4687 then
            R[24]=(R[1][147]);
            PC = 2531
            continue
        end
        -- block @ 4690: 1 instruction
        if PC == 4690 then
            PC = 3516
            continue
        end
        -- block @ 4691: 3 instructions
        if PC == 4691 then
            R[81]=({});
            R[77]=R[81];
            PC = 598
            continue
        end
        -- block @ 4695: 4 instructions
        if PC == 4695 then
            R[153]=R[131];
            R[154]=R[148];
            R[155]=({});
            PC = 4749
            continue
        end
        -- block @ 4700: 4 instructions
        if PC == 4700 then
            R[121]=R[94];
            R[122]=R[17];
            R[123]=("delay");
            PC = 3904
            continue
        end
        -- block @ 4705: 10 instructions
        if PC == 4705 then
            P=157; R[P]=R[P]();
            z=R; x=158;
            J=1; z[x]=J;
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[155]=(R[149][23]);
            R[138][98]=R[155];
            R[155]=R[97];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            PC = 217
            continue
        end
        -- block @ 4716: 3 instructions
        if PC == 4716 then
            P=156; R[P]=R[P]();
            R[157]=(R[149][65]);
            PC = 774
            continue
        end
        -- block @ 4720: 3 instructions
        if PC == 4720 then
            R[157]=(R[1][165]);
            z=(155); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 683
            continue
        end
        -- block @ 4724: 1 instruction
        if PC == 4724 then
            if not(114<=R[154]) then PC = 1576 else PC = 4725 end;
            continue
        end
        -- block @ 4725: 1 instruction
        if PC == 4725 then
            PC = 3796
            continue
        end
        -- block @ 4726: 1 instruction
        if PC == 4726 then
            if not(not(R[154]<134)) then PC = 4727 else PC = 5104 end;
            continue
        end
        -- block @ 4727: 1 instruction
        if PC == 4727 then
            PC = 2084
            continue
        end
        -- block @ 4728: 4 instructions
        if PC == 4728 then
            R[160]=R[60];
            R[161]=R[118];
            z=160; x=2; J=3; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            PC = 783
            continue
        end
        -- block @ 4733: 3 instructions
        if PC == 4733 then
            R[158]=R[98];
            z=(159); x=R[152]; R[z+1]=(x); R[z]=x["FromName"];
            PC = 2020
            continue
        end
        -- block @ 4737: 1 instruction
        if PC == 4737 then
            if R[154]~=8 then PC = 2579 else PC = 4738 end;
            continue
        end
        -- block @ 4738: 1 instruction
        if PC == 4738 then
            PC = 1513
            continue
        end
        -- block @ 4739: 1 instruction
        if PC == 4739 then
            if not(not(R[150]<115)) then PC = 4740 else PC = 576 end;
            continue
        end
        -- block @ 4740: 1 instruction
        if PC == 4740 then
            PC = 433
            continue
        end
        -- block @ 4741: 5 instructions
        if PC == 4741 then
            R[151]=R[98];
            R[152]=(R[149][21]);
            R[153]=R[11];
            P=153; R[P]=R[P]();
            PC = 3920
            continue
        end
        -- block @ 4747: 2 instructions
        if PC == 4747 then
            R[156]=R[66];
            PC = 4919
            continue
        end
        -- block @ 4750: 1 instruction
        if PC == 4750 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4751 else R[149+3]=y; PC = 4684 end;
            continue
        end
        -- block @ 4751: 1 instruction
        if PC == 4751 then
            PC = 3526
            continue
        end
        -- block @ 4752: 1 instruction
        if PC == 4752 then
            if not(not(21<R[4])) then PC = 4753 else PC = 581 end;
            continue
        end
        -- block @ 4753: 1 instruction
        if PC == 4753 then
            PC = 2607
            continue
        end
        -- block @ 4754: 2 instructions
        if PC == 4754 then
            R[81]=j;
            PC = 1010
            continue
        end
        -- block @ 4757: 1 instruction
        if PC == 4757 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4758 else R[165+3]=y; PC = 1273 end;
            continue
        end
        -- block @ 4758: 1 instruction
        if PC == 4758 then
            PC = 531
            continue
        end
        -- block @ 4759: 1 instruction
        if PC == 4759 then
            PC = 5267
            continue
        end
        -- block @ 4760: 1 instruction
        if PC == 4760 then
            if not(not(63<R[4])) then PC = 4761 else PC = 3704 end;
            continue
        end
        -- block @ 4761: 1 instruction
        if PC == 4761 then
            PC = 3666
            continue
        end
        -- block @ 4762: 3 instructions
        if PC == 4762 then
            R[148]=(R[1][48]);
            R[149]=(R[1][48]);
            PC = 5599
            continue
        end
        -- block @ 4766: 1 instruction
        if PC == 4766 then
            if not(not(7<R[4])) then PC = 4767 else PC = 2095 end;
            continue
        end
        -- block @ 4767: 1 instruction
        if PC == 4767 then
            PC = 3695
            continue
        end
        -- block @ 4768: 6 instructions
        if PC == 4768 then
            F=l[H]; J=(J[F]);
            z=(z[x]);
            z=272; R[z]=R[z](d[28](k,z+1,P)); P=z;
            R[152]=(62);
            R[162]=(R[1][50]);
            PC = 4090
            continue
        end
        -- block @ 4776: 3 instructions
        if PC == 4776 then
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 3282
            continue
        end
        -- block @ 4780: 2 instructions
        if PC == 4780 then
            R[151]=(R[148][5]);
            PC = 696
            continue
        end
        -- block @ 4783: 1 instruction
        if PC == 4783 then
            if not(not(R[152]<72)) then PC = 4784 else PC = 2469 end;
            continue
        end
        -- block @ 4784: 1 instruction
        if PC == 4784 then
            PC = 3892
            continue
        end
        -- block @ 4785: 2 instructions
        if PC == 4785 then
            R[151]=(R[149][56]);
            PC = 104
            continue
        end
        -- block @ 4788: 6 instructions
        if PC == 4788 then
            z=156; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            z=R; x=157;
            J=413; z[x]=J;
            R[158]=(R[1][4]);
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 602
            continue
        end
        -- block @ 4795: 4 instructions
        if PC == 4795 then
            R[166]=R[69];
            R[167]=R[164];
            R[168]=R[158];
            PC = 2929
            continue
        end
        -- block @ 4800: 3 instructions
        if PC == 4800 then
            R[151]=(R[148][2]);
            R[138][17]=R[151];
            PC = 2698
            continue
        end
        -- block @ 4804: 4 instructions
        if PC == 4804 then
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 1961
            continue
        end
        -- block @ 4809: 1 instruction
        if PC == 4809 then
            if not(not(R[4]<63)) then PC = 4810 else PC = 3447 end;
            continue
        end
        -- block @ 4810: 1 instruction
        if PC == 4810 then
            PC = 1148
            continue
        end
        -- block @ 4811: 1 instruction
        if PC == 4811 then
            if not(not(R[152]<=79)) then PC = 4812 else PC = 4214 end;
            continue
        end
        -- block @ 4812: 1 instruction
        if PC == 4812 then
            PC = 5455
            continue
        end
        -- block @ 4813: 3 instructions
        if PC == 4813 then
            R[157]=(0);
            R[158]=R[152]-1;
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(157); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2590
            continue
        end
        -- block @ 4817: 1 instruction
        if PC == 4817 then
            if R[4]~=45 then PC = 4893 else PC = 4818 end;
            continue
        end
        -- block @ 4818: 1 instruction
        if PC == 4818 then
            PC = 4689
            continue
        end
        -- block @ 4819: 1 instruction
        if PC == 4819 then
            if R[168]~=100 then PC = 4820 else PC = 1602 end;
            continue
        end
        -- block @ 4820: 1 instruction
        if PC == 4820 then
            PC = 2766
            continue
        end
        -- block @ 4821: 5 instructions
        if PC == 4821 then
            R[151]=(R[149][52]);
            R[138][78]=R[151];
            R[151]=R[98];
            R[152]=R[11];
            PC = 4357
            continue
        end
        -- block @ 4827: 1 instruction
        if PC == 4827 then
            PC = 2289
            continue
        end
        -- block @ 4828: 3 instructions
        if PC == 4828 then
            z=154; R[z]=R[z](R[z+1]); P=z;
            R[155]=(R[144][9]);
            PC = 2966
            continue
        end
        -- block @ 4832: 1 instruction
        if PC == 4832 then
            if R[4]~=26 then PC = 395 else PC = 4833 end;
            continue
        end
        -- block @ 4833: 1 instruction
        if PC == 4833 then
            PC = 209
            continue
        end
        -- block @ 4834: 1 instruction
        if PC == 4834 then
            if R[4]~=44 then PC = 4835 else PC = 3939 end;
            continue
        end
        -- block @ 4835: 7 instructions
        if PC == 4835 then
            R[151]=(R[1][164]);
            R[152]=R[25];
            R[153]=R[149];
            z=152; R[z]=R[z](R[z+1]); P=z;
            R[153]=(R[1][4]);
            z=150; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 4424
            continue
        end
        -- block @ 4843: 6 instructions
        if PC == 4843 then
            R[14]=(R[1][109]);
            R[13]=R[3][R[14]];
            R[14]=(R[1][127]);
            R[14]=R[3][R[14]];
            R[15]=(R[1][48]);
            PC = 5311
            continue
        end
        -- block @ 4850: 4 instructions
        if PC == 4850 then
            z=149; x=4; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=(148); x=0; J=(R[z]); (d[2])(k,z+1,P,x+1,J);
            R[149]=(R[1][48]);
            PC = 4065
            continue
        end
        -- block @ 4855: 1 instruction
        if PC == 4855 then
            if R[4]~=122 then PC = 2518 else PC = 4856 end;
            continue
        end
        -- block @ 4856: 1 instruction
        if PC == 4856 then
            PC = 849
            continue
        end
        -- block @ 4857: 4 instructions
        if PC == 4857 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=(158); x=R[153]; R[z+1]=(x); R[z]=x["GetPositionOnCurve"];
            R[160]=(0);
            PC = 665
            continue
        end
        -- block @ 4862: 2 instructions
        if PC == 4862 then
            z=(166); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 1627
            continue
        end
        -- block @ 4865: 1 instruction
        if PC == 4865 then
            PC = 907
            continue
        end
        -- block @ 4866: 1 instruction
        if PC == 4866 then
            PC = 3575
            continue
        end
        -- block @ 4868: 1 instruction
        if PC == 4868 then
            if R[150]~=106 then PC = 4884 else PC = 4869 end;
            continue
        end
        -- block @ 4869: 1 instruction
        if PC == 4869 then
            PC = 4758
            continue
        end
        -- block @ 4870: 3 instructions
        if PC == 4870 then
            R[157]=("NextInteger");
            z=(155); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 683
            continue
        end
        -- block @ 4874: 1 instruction
        if PC == 4874 then
            PC = 937
            continue
        end
        -- block @ 4875: 1 instruction
        if PC == 4875 then
            if R[154]~=162 then PC = 1985 else PC = 4876 end;
            continue
        end
        -- block @ 4876: 1 instruction
        if PC == 4876 then
            PC = 1392
            continue
        end
        -- block @ 4877: 1 instruction
        if PC == 4877 then
            if R[152]~=111 then PC = 5709 else PC = 4878 end;
            continue
        end
        -- block @ 4878: 1 instruction
        if PC == 4878 then
            PC = 1545
            continue
        end
        -- block @ 4879: 1 instruction
        if PC == 4879 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4880 else R[155+3]=y; PC = 345 end;
            continue
        end
        -- block @ 4880: 1 instruction
        if PC == 4880 then
            PC = 2218
            continue
        end
        -- block @ 4881: 3 instructions
        if PC == 4881 then
            R[95]=(R[1][48]);
            R[96]=(R[1][48]);
            PC = 26
            continue
        end
        -- block @ 4885: 3 instructions
        if PC == 4885 then
            R[151]=(R[149][35]);
            R[138][75]=R[151];
            PC = 4586
            continue
        end
        -- block @ 4889: 1 instruction
        if PC == 4889 then
            if not(not(180<R[160])) then PC = 4890 else PC = 2740 end;
            continue
        end
        -- block @ 4890: 1 instruction
        if PC == 4890 then
            PC = 1305
            continue
        end
        -- block @ 4891: 1 instruction
        if PC == 4891 then
            PC = 5547
            continue
        end
        -- block @ 4892: 1 instruction
        if PC == 4892 then
            if not(not(R[152]<117)) then PC = 4893 else PC = 905 end;
            continue
        end
        -- block @ 4893: 1 instruction
        if PC == 4893 then
            PC = 927
            continue
        end
        -- block @ 4894: 1 instruction
        if PC == 4894 then
            if R[4]~=105 then PC = 2764 else PC = 4895 end;
            continue
        end
        -- block @ 4895: 1 instruction
        if PC == 4895 then
            PC = 2414
            continue
        end
        -- block @ 4896: 1 instruction
        if PC == 4896 then
            PC = 1735
            continue
        end
        -- block @ 4897: 3 instructions
        if PC == 4897 then
            R[144]=(d[17][6]);
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[145]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 2080
            continue
        end
        -- block @ 4901: 2 instructions
        if PC == 4901 then
            z=(166); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 4891
            continue
        end
        -- block @ 4904: 3 instructions
        if PC == 4904 then
            R[155]=R[97];
            R[156]=R[11];
            PC = 1695
            continue
        end
        -- block @ 4908: 1 instruction
        if PC == 4908 then
            PC = 1994
            continue
        end
        -- block @ 4910: 1 instruction
        if PC == 4910 then
            z=(156); x,J,F=y();
            if not(x) then PC = 4911 else R[z+1]=(J); R[z+2]=(F); PC = 3297 end;
            continue
        end
        -- block @ 4911: 1 instruction
        if PC == 4911 then
            PC = 2253
            continue
        end
        -- block @ 4912: 1 instruction
        if PC == 4912 then
            if R[154]~=3 then PC = 23 else PC = 4913 end;
            continue
        end
        -- block @ 4913: 1 instruction
        if PC == 4913 then
            PC = 5308
            continue
        end
        -- block @ 4914: 1 instruction
        if PC == 4914 then
            PC = 4180
            continue
        end
        -- block @ 4916: 3 instructions
        if PC == 4916 then
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[155]=(R[148][25]);
            PC = 3899
            continue
        end
        -- block @ 4920: 1 instruction
        if PC == 4920 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4921 else R[152+3]=y; PC = 3806 end;
            continue
        end
        -- block @ 4921: 1 instruction
        if PC == 4921 then
            PC = 4678
            continue
        end
        -- block @ 4922: 1 instruction
        if PC == 4922 then
            if not(not(R[4]<49)) then PC = 4923 else PC = 3380 end;
            continue
        end
        -- block @ 4923: 1 instruction
        if PC == 4923 then
            PC = 2074
            continue
        end
        -- block @ 4924: 3 instructions
        if PC == 4924 then
            R[157]=(R[149][54]);
            R[158]=(2);
            PC = 5395
            continue
        end
        -- block @ 4928: 4 instructions
        if PC == 4928 then
            R[81]=(R[1][36]);
            R[79]=R[37][R[81]];
            R[4]=(81);
            PC = 598
            continue
        end
        -- block @ 4932: 2 instructions
        if PC == 4932 then
            z=(Protos[193]); R[196]=(z[1][z[3]][l[H]]);
            PC = 4678
            continue
        end
        -- block @ 4935: 1 instruction
        if PC == 4935 then
            PC = 2373
            continue
        end
        -- block @ 4937: 1 instruction
        if PC == 4937 then
            if R[4]~=46 then PC = 3491 else PC = 4938 end;
            continue
        end
        -- block @ 4938: 1 instruction
        if PC == 4938 then
            PC = 413
            continue
        end
        -- block @ 4939: 1 instruction
        if PC == 4939 then
            PC = 3583
            continue
        end
        -- block @ 4940: 1 instruction
        if PC == 4940 then
            PC = 1807
            continue
        end
        -- block @ 4942: 2 instructions
        if PC == 4942 then
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 2129
            continue
        end
        -- block @ 4944: 8 instructions
        if PC == 4944 then
            F=d[2]; U=R; _=(z); t=(1); _+=t; t=P; O=x; Z=(1); O+=Z; Z=(J); F(U,_,t,O,Z);
            R[155]=R[97];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[148][21]);
            R[158]=(1);
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4952 else R[157+3]=y; PC = 3048 end;
            continue
        end
        -- block @ 4952: 1 instruction
        if PC == 4952 then
            PC = 1422
            continue
        end
        -- block @ 4953: 1 instruction
        if PC == 4953 then
            if not(not(R[4]<103)) then PC = 4954 else PC = 2734 end;
            continue
        end
        -- block @ 4954: 1 instruction
        if PC == 4954 then
            PC = 2663
            continue
        end
        -- block @ 4955: 2 instructions
        if PC == 4955 then
            z=(114); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3349
            continue
        end
        -- block @ 4958: 1 instruction
        if PC == 4958 then
            if R[154]~=115 then PC = 484 else PC = 4959 end;
            continue
        end
        -- block @ 4959: 1 instruction
        if PC == 4959 then
            PC = 1863
            continue
        end
        -- block @ 4960: 4 instructions
        if PC == 4960 then
            R[150][2917245952]=(1933952669);
            R[150][481178645]=(669755048);
            z=(148); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 243
            continue
        end
        -- block @ 4965: 1 instruction
        if PC == 4965 then
            if not(not(43<R[4])) then PC = 4966 else PC = 5448 end;
            continue
        end
        -- block @ 4966: 1 instruction
        if PC == 4966 then
            PC = 3925
            continue
        end
        -- block @ 4967: 2 instructions
        if PC == 4967 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 5410
            continue
        end
        -- block @ 4970: 1 instruction
        if PC == 4970 then
            if not(not(R[154]<16)) then PC = 4971 else PC = 4023 end;
            continue
        end
        -- block @ 4971: 1 instruction
        if PC == 4971 then
            PC = 2575
            continue
        end
        -- block @ 4972: 1 instruction
        if PC == 4972 then
            if not(not(70<R[4])) then PC = 4973 else PC = 5719 end;
            continue
        end
        -- block @ 4973: 1 instruction
        if PC == 4973 then
            PC = 4732
            continue
        end
        -- block @ 4974: 2 instructions
        if PC == 4974 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[106]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 1462
            continue
        end
        -- block @ 4977: 1 instruction
        if PC == 4977 then
            PC = 2080
            continue
        end
        -- block @ 4978: 1 instruction
        if PC == 4978 then
            if R[4]~=9 then PC = 3069 else PC = 4979 end;
            continue
        end
        -- block @ 4979: 1 instruction
        if PC == 4979 then
            PC = 1622
            continue
        end
        -- block @ 4980: 1 instruction
        if PC == 4980 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 4981 else R[155+3]=y; PC = 5493 end;
            continue
        end
        -- block @ 4981: 1 instruction
        if PC == 4981 then
            PC = 592
            continue
        end
        -- block @ 4982: 1 instruction
        if PC == 4982 then
            if not(not(7<R[154])) then PC = 4983 else PC = 4969 end;
            continue
        end
        -- block @ 4983: 1 instruction
        if PC == 4983 then
            PC = 5032
            continue
        end
        -- block @ 4984: 1 instruction
        if PC == 4984 then
            if not(not(R[4]<95)) then PC = 4985 else PC = 5472 end;
            continue
        end
        -- block @ 4985: 1 instruction
        if PC == 4985 then
            PC = 5096
            continue
        end
        -- block @ 4986: 3 instructions
        if PC == 4986 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[97]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            R[98]=(R[1][48]);
            PC = 1333
            continue
        end
        -- block @ 4990: 1 instruction
        if PC == 4990 then
            PC = 4749
            continue
        end
        -- block @ 4991: 4 instructions
        if PC == 4991 then
            R[155]=(R[149][65]);
            R[138][84]=R[155];
            R[155]=R[97];
            PC = 4715
            continue
        end
        -- block @ 4996: 6 instructions
        if PC == 4996 then
            R[48]=R[28][R[49]];
            R[49]=({});
            z=R; x=(50); J=k;
            F=(1);
            J=J[F]; F=53; J=(J[F]);
            PC = 3399
            continue
        end
        -- block @ 5003: 4 instructions
        if PC == 5003 then
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(R[149][27]);
            PC = 5534
            continue
        end
        -- block @ 5008: 6 instructions
        if PC == 5008 then
            R[113]=(R[1][144]);
            R[114]=(R[1][163]);
            R[112][R[113]]=R[114];
            R[113]=(R[1][154]);
            R[114]=(R[1][37]);
            PC = 3571
            continue
        end
        -- block @ 5015: 5 instructions
        if PC == 5015 then
            R[160]=R[60];
            R[161]=R[76];
            z=160; x=2; J=3; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            R[154]=R[160];
            PC = 1648
            continue
        end
        -- block @ 5021: 3 instructions
        if PC == 5021 then
            R[137]=R[131];
            R[138]=R[43];
            PC = 5191
            continue
        end
        -- block @ 5025: 5 instructions
        if PC == 5025 then
            R[164]=R[97];
            R[165]=R[157];
            R[166]=R[158];
            R[167]=(R[1][4]);
            PC = 1073
            continue
        end
        -- block @ 5031: 1 instruction
        if PC == 5031 then
            if not(not(98<R[154])) then PC = 5032 else PC = 5196 end;
            continue
        end
        -- block @ 5032: 1 instruction
        if PC == 5032 then
            PC = 3288
            continue
        end
        -- block @ 5033: 2 instructions
        if PC == 5033 then
            R[155]=(R[149][71]);
            PC = 669
            continue
        end
        -- block @ 5036: 3 instructions
        if PC == 5036 then
            R[141]=R[131];
            R[142]=R[8];
            PC = 1567
            continue
        end
        -- block @ 5040: 1 instruction
        if PC == 5040 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 5041 else R[152+3]=y; PC = 60 end;
            continue
        end
        -- block @ 5041: 1 instruction
        if PC == 5041 then
            PC = 634
            continue
        end
        -- block @ 5042: 3 instructions
        if PC == 5042 then
            R[108]=(R[1][48]);
            R[4]=(35);
            PC = 1462
            continue
        end
        -- block @ 5046: 1 instruction
        if PC == 5046 then
            PC = 4443
            continue
        end
        -- block @ 5048: 1 instruction
        if PC == 5048 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 5049 else R[159+3]=y; PC = 5532 end;
            continue
        end
        -- block @ 5049: 1 instruction
        if PC == 5049 then
            PC = 3470
            continue
        end
        -- block @ 5050: 1 instruction
        if PC == 5050 then
            if not R[152] then PC = 2047 else PC = 5051 end;
            continue
        end
        -- block @ 5051: 1 instruction
        if PC == 5051 then
            PC = 1223
            continue
        end
        -- block @ 5052: 5 instructions
        if PC == 5052 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(R[149][29]);
            R[138][90]=R[151];
            R[151]=R[97];
            PC = 2172
            continue
        end
        -- block @ 5058: 3 instructions
        if PC == 5058 then
            z=(135); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[135]=({});
            PC = 2066
            continue
        end
        -- block @ 5062: 1 instruction
        if PC == 5062 then
            if not(197<=R[159]) then PC = 5014 else PC = 5063 end;
            continue
        end
        -- block @ 5063: 1 instruction
        if PC == 5063 then
            PC = 1584
            continue
        end
        -- block @ 5064: 4 instructions
        if PC == 5064 then
            z=(163); x=R[153]; R[z+1]=(x); R[z]=x["GetPositionOnCurveArcLength"];
            R[165]=(0);
            z=163; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 2465
            continue
        end
        -- block @ 5068: 3 instructions
        if PC == 5068 then
            R[26]=(X);
            z=(186); (R[z])(R[z+1],R[z+2]); P=z-1;
            if not(not(7<R[4])) then PC = 5072 else PC = 482 end;
            continue
        end
        -- block @ 5072: 1 instruction
        if PC == 5072 then
            PC = 873
            continue
        end
        -- block @ 5073: 3 instructions
        if PC == 5073 then
            R[156]=R[104];
            R[157]=R[151];
            PC = 781
            continue
        end
        -- block @ 5077: 8 instructions
        if PC == 5077 then
            z=155; R[z]=R[z](R[z+1]); P=z;
            z=(155); x=R[155]; R[z+1]=(x); R[z]=x["byte"];
            z=R; x=157;
            J=1; z[x]=J;
            R[158]=(-1);
            z=155; x=4; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=(154); x=0; J=(R[z]); (d[2])(k,z+1,P,x+1,J);
            PC = 1233
            continue
        end
        -- block @ 5086: 3 instructions
        if PC == 5086 then
            R[162]=R[156];
            z=160; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 5713
            continue
        end
        -- block @ 5090: 1 instruction
        if PC == 5090 then
            if R[155]~=120 then PC = 781 else PC = 5091 end;
            continue
        end
        -- block @ 5091: 1 instruction
        if PC == 5091 then
            PC = 1351
            continue
        end
        -- block @ 5092: 1 instruction
        if PC == 5092 then
            if R[154]~=376 then PC = 5134 else PC = 5093 end;
            continue
        end
        -- block @ 5093: 1 instruction
        if PC == 5093 then
            PC = 2928
            continue
        end
        -- block @ 5094: 2 instructions
        if PC == 5094 then
            R[155]=(R[149][18]);
            PC = 3918
            continue
        end
        -- block @ 5097: 7 instructions
        if PC == 5097 then
            R[135]=R[131];
            R[136]=R[65];
            z=(135); (R[z])(R[z+1]); P=(z-1);
            R[135]=R[131];
            R[136]=R[24];
            z=(135); (R[z])(R[z+1]); P=(z-1);
            PC = 5472
            continue
        end
        -- block @ 5105: 1 instruction
        if PC == 5105 then
            if not(not(170<R[154])) then PC = 5106 else PC = 4030 end;
            continue
        end
        -- block @ 5106: 1 instruction
        if PC == 5106 then
            PC = 3054
            continue
        end
        -- block @ 5107: 3 instructions
        if PC == 5107 then
            R[120]=R[94];
            R[121]=R[6];
            PC = 2597
            continue
        end
        -- block @ 5111: 3 instructions
        if PC == 5111 then
            z=(131); (R[z])(R[z+1]); P=(z-1);
            R[131]=R[83];
            PC = 2942
            continue
        end
        -- block @ 5115: 2 instructions
        if PC == 5115 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 4434
            continue
        end
        -- block @ 5118: 3 instructions
        if PC == 5118 then
            R[136]=R[131];
            R[137]=R[22];
            PC = 1964
            continue
        end
        -- block @ 5122: 2 instructions
        if PC == 5122 then
            R[152]=(R[1][49]);
            if R[151]==R[152] then PC = 5414 else PC = 5124 end;
            continue
        end
        -- block @ 5124: 1 instruction
        if PC == 5124 then
            PC = 3731
            continue
        end
        -- block @ 5125: 5 instructions
        if PC == 5125 then
            R[151]=R[98];
            R[152]=(R[148][2]);
            R[153]=R[11];
            P=153; R[P]=R[P]();
            PC = 5702
            continue
        end
        -- block @ 5131: 3 instructions
        if PC == 5131 then
            R[155]=R[97];
            R[156]=R[11];
            PC = 5424
            continue
        end
        -- block @ 5135: 1 instruction
        if PC == 5135 then
            if R[154]~=55 then PC = 3709 else PC = 5136 end;
            continue
        end
        -- block @ 5136: 1 instruction
        if PC == 5136 then
            PC = 3994
            continue
        end
        -- block @ 5137: 1 instruction
        if PC == 5137 then
            if not(not(5<R[4])) then PC = 5138 else PC = 361 end;
            continue
        end
        -- block @ 5138: 1 instruction
        if PC == 5138 then
            PC = 1720
            continue
        end
        -- block @ 5139: 1 instruction
        if PC == 5139 then
            PC = 5063
            continue
        end
        -- block @ 5140: 3 instructions
        if PC == 5140 then
            R[159]=(456);
            z=(160); x=R[156]; R[z+1]=(x); R[z]=x["NextInteger"];
            PC = 4459
            continue
        end
        -- block @ 5144: 1 instruction
        if PC == 5144 then
            if R[168]~=179 then PC = 4311 else PC = 5145 end;
            continue
        end
        -- block @ 5145: 1 instruction
        if PC == 5145 then
            PC = 4441
            continue
        end
        -- block @ 5146: 1 instruction
        if PC == 5146 then
            if not(not(R[150]<=44)) then PC = 5147 else PC = 4867 end;
            continue
        end
        -- block @ 5147: 1 instruction
        if PC == 5147 then
            PC = 2180
            continue
        end
        -- block @ 5148: 2 instructions
        if PC == 5148 then
            R[36]=(R[1][99]);
            PC = 71
            continue
        end
        -- block @ 5151: 1 instruction
        if PC == 5151 then
            if not(not(23<R[154])) then PC = 5152 else PC = 2375 end;
            continue
        end
        -- block @ 5152: 1 instruction
        if PC == 5152 then
            PC = 3307
            continue
        end
        -- block @ 5153: 1 instruction
        if PC == 5153 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; P=(156); z=d[3](function(...)(d[42])(); for w,u in...do(d[42])(true,w,u); end; end); (z)(R[P],R[P+1],R[P+2]); y=z;
            PC = 3598
            continue
        end
        -- block @ 5154: 3 instructions
        if PC == 5154 then
            R[130]=(R[1][48]);
            R[131]=R[7];
            PC = 5110
            continue
        end
        -- block @ 5158: 1 instruction
        if PC == 5158 then
            PC = 1788
            continue
        end
        -- block @ 5160: 4 instructions
        if PC == 5160 then
            P=152; R[P]=R[P]();
            R[153]=(R[148][4]);
            R[154]=(1);
            PC = 958
            continue
        end
        -- block @ 5165: 1 instruction
        if PC == 5165 then
            if not(not(4<R[154])) then PC = 5166 else PC = 4621 end;
            continue
        end
        -- block @ 5166: 1 instruction
        if PC == 5166 then
            PC = 4449
            continue
        end
        -- block @ 5167: 4 instructions
        if PC == 5167 then
            R[148]=R[106];
            R[149]=R[9];
            R[150]=({});
            PC = 1340
            continue
        end
        -- block @ 5172: 3 instructions
        if PC == 5172 then
            R[152]=(1);
            R[153]=(R[1][94]);
            PC = 3529
            continue
        end
        -- block @ 5176: 1 instruction
        if PC == 5176 then
            if R[154]~=199 then PC = 2404 else PC = 5177 end;
            continue
        end
        -- block @ 5177: 1 instruction
        if PC == 5177 then
            PC = 3327
            continue
        end
        -- block @ 5178: 5 instructions
        if PC == 5178 then
            R[113]=(R[1][98]);
            R[114]=(R[1][77]);
            R[112][R[113]]=R[114];
            R[113]=(R[1][60]);
            PC = 2184
            continue
        end
        -- block @ 5184: 1 instruction
        if PC == 5184 then
            PC = 3999
            continue
        end
        -- block @ 5185: 1 instruction
        if PC == 5185 then
            PC = 402
            continue
        end
        -- block @ 5187: 1 instruction
        if PC == 5187 then
            if R[154]~=60 then PC = 2244 else PC = 5188 end;
            continue
        end
        -- block @ 5188: 3 instructions
        if PC == 5188 then
            R[159]=(D[H]);
            z=(157); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 5619
            continue
        end
        -- block @ 5192: 4 instructions
        if PC == 5192 then
            R[137]=(R[1][96]);
            R[136]=R[56][R[137]];
            R[137]=R[131];
            PC = 1770
            continue
        end
        -- block @ 5197: 1 instruction
        if PC == 5197 then
            if not(not(R[154]<136)) then PC = 5198 else PC = 4283 end;
            continue
        end
        -- block @ 5198: 1 instruction
        if PC == 5198 then
            PC = 5093
            continue
        end
        -- block @ 5199: 1 instruction
        if PC == 5199 then
            if not(not(R[4]<58)) then PC = 5200 else PC = 1275 end;
            continue
        end
        -- block @ 5200: 1 instruction
        if PC == 5200 then
            PC = 4812
            continue
        end
        -- block @ 5201: 3 instructions
        if PC == 5201 then
            R[131]=(1);
            z=(129); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 2109
            continue
        end
        -- block @ 5205: 1 instruction
        if PC == 5205 then
            if R[150]~=122 then PC = 5206 else PC = 4025 end;
            continue
        end
        -- block @ 5206: 1 instruction
        if PC == 5206 then
            PC = 3016
            continue
        end
        -- block @ 5207: 2 instructions
        if PC == 5207 then
            R[151]=(R[149][4]);
            PC = 5515
            continue
        end
        -- block @ 5210: 3 instructions
        if PC == 5210 then
            R[166]=R[149];
            R[167]=(R[1][50]);
            PC = 1478
            continue
        end
        -- block @ 5214: 1 instruction
        if PC == 5214 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 5215 else R[151+3]=y; PC = 536 end;
            continue
        end
        -- block @ 5215: 1 instruction
        if PC == 5215 then
            PC = 5688
            continue
        end
        -- block @ 5216: 4 instructions
        if PC == 5216 then
            R[166]=R[149];
            R[167]=(R[1][155]);
            R[167]=R[165][R[167]];
            PC = 2786
            continue
        end
        -- block @ 5221: 4 instructions
        if PC == 5221 then
            R[129]=R[85];
            R[130]=R[120];
            z=(129); (R[z])(R[z+1]); P=(z-1);
            PC = 3161
            continue
        end
        -- block @ 5226: 6 instructions
        if PC == 5226 then
            R[152]=R[11];
            P=152; R[P]=R[P]();
            R[153]=(R[149][7]);
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 4417
            continue
        end
        -- block @ 5233: 2 instructions
        if PC == 5233 then
            R[123]=(R[1][100]);
            PC = 3846
            continue
        end
        -- block @ 5236: 6 instructions
        if PC == 5236 then
            R[155]=R[152];
            z=154; R[z]=R[z](R[z+1]); P=z;
            z=R; x=(155); J=k;
            F=(1);
            J=J[F]; F=101; J=(J[F]);
            PC = 3778
            continue
        end
        -- block @ 5243: 3 instructions
        if PC == 5243 then
            R[141]=R[131];
            R[142]=R[17];
            PC = 4507
            continue
        end
        -- block @ 5247: 11 instructions
        if PC == 5247 then
            z=(161); x=R[153]; R[z+1]=(x); R[z]=x["GetPositionOnCurve"];
            R[163]=(0);
            z=161; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[155]=R[161];
            R[161]=(R[1][155]);
            R[161]=R[155][R[161]];
            R[162]=(R[1][104]);
            R[161]=R[161][R[162]];
            R[161]=(R[161]*100);
            R[65]=(d[30](R[161],Y[H]));
            PC = 135
            continue
        end
        -- block @ 5259: 3 instructions
        if PC == 5259 then
            R[114]=R[94];
            R[115]=R[80];
            PC = 2162
            continue
        end
        -- block @ 5263: 1 instruction
        if PC == 5263 then
            PC = 2234
            continue
        end
        -- block @ 5264: 3 instructions
        if PC == 5264 then
            R[153]=(R[149][37]);
            R[154]=(1);
            PC = 4653
            continue
        end
        -- block @ 5268: 4 instructions
        if PC == 5268 then
            R[150]=(65);
            R[151]=R[97];
            R[152]=R[11];
            PC = 363
            continue
        end
        -- block @ 5273: 1 instruction
        if PC == 5273 then
            PC = 205
            continue
        end
        -- block @ 5274: 8 instructions
        if PC == 5274 then
            R[155]=R[98];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[149][30]);
            R[158]=(1);
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[155]=(R[149][34]);
            PC = 23
            continue
        end
        -- block @ 5283: 3 instructions
        if PC == 5283 then
            R[156][2151148605]=R[150];
            R[156][688802313]=R[150];
            PC = 221
            continue
        end
        -- block @ 5287: 1 instruction
        if PC == 5287 then
            if R[4]~=99 then PC = 808 else PC = 5288 end;
            continue
        end
        -- block @ 5288: 1 instruction
        if PC == 5288 then
            PC = 5391
            continue
        end
        -- block @ 5289: 1 instruction
        if PC == 5289 then
            if not(not(R[154]<126)) then PC = 5290 else PC = 4467 end;
            continue
        end
        -- block @ 5290: 1 instruction
        if PC == 5290 then
            PC = 3706
            continue
        end
        -- block @ 5291: 1 instruction
        if PC == 5291 then
            PC = 4818
            continue
        end
        -- block @ 5293: 4 instructions
        if PC == 5293 then
            R[156]=(124);
            R[157]=(0);
            R[158]=(155);
            PC = 896
            continue
        end
        -- block @ 5298: 1 instruction
        if PC == 5298 then
            if R[4]~=13 then PC = 4226 else PC = 5299 end;
            continue
        end
        -- block @ 5299: 1 instruction
        if PC == 5299 then
            PC = 220
            continue
        end
        -- block @ 5300: 2 instructions
        if PC == 5300 then
            R[167]=R[11];
            PC = 3729
            continue
        end
        -- block @ 5303: 1 instruction
        if PC == 5303 then
            if R[154]~=203 then PC = 260 else PC = 5304 end;
            continue
        end
        -- block @ 5304: 1 instruction
        if PC == 5304 then
            PC = 1418
            continue
        end
        -- block @ 5305: 3 instructions
        if PC == 5305 then
            z=162; P=z+5-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[163]=R[123];
            PC = 947
            continue
        end
        -- block @ 5309: 2 instructions
        if PC == 5309 then
            R[155]=(R[149][55]);
            PC = 23
            continue
        end
        -- block @ 5312: 3 instructions
        if PC == 5312 then
            R[17]=(R[1][48]);
            R[18]=(R[1][48]);
            PC = 4831
            continue
        end
        -- block @ 5316: 2 instructions
        if PC == 5316 then
            R[152]=(220);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 2129
            continue
        end
        -- block @ 5319: 3 instructions
        if PC == 5319 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[151]=(R[149][21]);
            PC = 4365
            continue
        end
        -- block @ 5323: 1 instruction
        if PC == 5323 then
            if R[4]~=71 then PC = 956 else PC = 5324 end;
            continue
        end
        -- block @ 5324: 1 instruction
        if PC == 5324 then
            PC = 1150
            continue
        end
        -- block @ 5325: 1 instruction
        if PC == 5325 then
            PC = 822
            continue
        end
        -- block @ 5326: 1 instruction
        if PC == 5326 then
            PC = 3431
            continue
        end
        -- block @ 5327: 4 instructions
        if PC == 5327 then
            R[163]=(R[161]["Y"]);
            R[164]=(R[1][104]);
            R[163]=R[163][R[164]];
            PC = 4243
            continue
        end
        -- block @ 5332: 1 instruction
        if PC == 5332 then
            if not(not(R[155]<108)) then PC = 5333 else PC = 3271 end;
            continue
        end
        -- block @ 5333: 1 instruction
        if PC == 5333 then
            PC = 409
            continue
        end
        -- block @ 5334: 1 instruction
        if PC == 5334 then
            PC = 4346
            continue
        end
        -- block @ 5335: 1 instruction
        if PC == 5335 then
            if R[157]~=8 then PC = 2963 else PC = 5336 end;
            continue
        end
        -- block @ 5336: 1 instruction
        if PC == 5336 then
            PC = 80
            continue
        end
        -- block @ 5337: 1 instruction
        if PC == 5337 then
            if R[157]~=102 then PC = 5334 else PC = 5338 end;
            continue
        end
        -- block @ 5338: 1 instruction
        if PC == 5338 then
            PC = 3395
            continue
        end
        -- block @ 5339: 7 instructions
        if PC == 5339 then
            R[158]=R[97];
            z=(159); x=R[154]; R[z+1]=(x); R[z]=x["NextInteger"];
            R[161]=(979);
            R[162]=(1349);
            z=159; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[160]=(1059);
            PC = 3950
            continue
        end
        -- block @ 5347: 1 instruction
        if PC == 5347 then
            PC = 842
            continue
        end
        -- block @ 5349: 10 instructions
        if PC == 5349 then
            R[152]=(111);
            R[161]=R[149];
            R[162]=(R[1][50]);
            R[162]=R[159][R[162]];
            R[163]=(D[H]);
            z=(161); (R[z])(R[z+1],R[z+2]); P=z-1;
            z=(161); x=R[153]; R[z+1]=(x); R[z]=x["GetTangentOnCurve"];
            R[163]=(0);
            z=161; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 4876
            continue
        end
        -- block @ 5360: 1 instruction
        if PC == 5360 then
            if not(not(R[4]<62)) then PC = 5361 else PC = 2514 end;
            continue
        end
        -- block @ 5361: 1 instruction
        if PC == 5361 then
            PC = 1871
            continue
        end
        -- block @ 5362: 1 instruction
        if PC == 5362 then
            PC = 2565
            continue
        end
        -- block @ 5364: 1 instruction
        if PC == 5364 then
            PC = 2358
            continue
        end
        -- block @ 5365: 5 instructions
        if PC == 5365 then
            R[151]=(R[149][22]);
            R[138][73]=R[151];
            R[151]=R[97];
            R[152]=R[11];
            PC = 4116
            continue
        end
        -- block @ 5371: 1 instruction
        if PC == 5371 then
            if R[163]~=108 then PC = 2302 else PC = 5372 end;
            continue
        end
        -- block @ 5372: 1 instruction
        if PC == 5372 then
            PC = 390
            continue
        end
        -- block @ 5373: 2 instructions
        if PC == 5373 then
            R[138][74]=R[151];
            PC = 5145
            continue
        end
        -- block @ 5376: 1 instruction
        if PC == 5376 then
            PC = 2531
            continue
        end
        -- block @ 5378: 1 instruction
        if PC == 5378 then
            if R[154]~=77 then PC = 33 else PC = 5379 end;
            continue
        end
        -- block @ 5379: 1 instruction
        if PC == 5379 then
            PC = 991
            continue
        end
        -- block @ 5380: 4 instructions
        if PC == 5380 then
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=(4);
            R[152]=(109);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(151); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 5388
            continue
        end
        -- block @ 5385: 1 instruction
        if PC == 5385 then
            if not(not(109<R[154])) then PC = 5386 else PC = 446 end;
            continue
        end
        -- block @ 5386: 1 instruction
        if PC == 5386 then
            PC = 383
            continue
        end
        -- block @ 5387: 1 instruction
        if PC == 5387 then
            if not(not(R[152]<94)) then PC = 5388 else PC = 2903 end;
            continue
        end
        -- block @ 5388: 1 instruction
        if PC == 5388 then
            PC = 286
            continue
        end
        -- block @ 5389: 1 instruction
        if PC == 5389 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 5390 else R[151+3]=y; PC = 5164 end;
            continue
        end
        -- block @ 5390: 1 instruction
        if PC == 5390 then
            PC = 4187
            continue
        end
        -- block @ 5391: 1 instruction
        if PC == 5391 then
            PC = 3204
            continue
        end
        -- block @ 5392: 3 instructions
        if PC == 5392 then
            R[31]=(R[1][79]);
            R[19]=R[3][R[31]];
            PC = 2531
            continue
        end
        -- block @ 5396: 1 instruction
        if PC == 5396 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 5397 else R[151+3]=y; PC = 4957 end;
            continue
        end
        -- block @ 5397: 1 instruction
        if PC == 5397 then
            PC = 802
            continue
        end
        -- block @ 5398: 1 instruction
        if PC == 5398 then
            if not(not(R[154]<206)) then PC = 5399 else PC = 4725 end;
            continue
        end
        -- block @ 5399: 1 instruction
        if PC == 5399 then
            PC = 1245
            continue
        end
        -- block @ 5400: 2 instructions
        if PC == 5400 then
            R[152]=(R[1][120]);
            PC = 2779
            continue
        end
        -- block @ 5403: 1 instruction
        if PC == 5403 then
            if R[167]~=77 then PC = 2512 else PC = 5404 end;
            continue
        end
        -- block @ 5404: 1 instruction
        if PC == 5404 then
            PC = 1609
            continue
        end
        -- block @ 5405: 2 instructions
        if PC == 5405 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 3569
            continue
        end
        -- block @ 5408: 2 instructions
        if PC == 5408 then
            R[74]=(R[1][28]);
            PC = 2800
            continue
        end
        -- block @ 5411: 1 instruction
        if PC == 5411 then
            if R[151]~=51 then PC = 5412 else PC = 5171 end;
            continue
        end
        -- block @ 5412: 1 instruction
        if PC == 5412 then
            PC = 3728
            continue
        end
        -- block @ 5413: 1 instruction
        if PC == 5413 then
            PC = 4070
            continue
        end
        -- block @ 5415: 4 instructions
        if PC == 5415 then
            for w=148,150 do R[w]=nil; end;
            R[151]=(R[1][48]);
            R[152]=(R[1][48]);
            PC = 3678
            continue
        end
        -- block @ 5420: 1 instruction
        if PC == 5420 then
            PC = 4699
            continue
        end
        -- block @ 5421: 1 instruction
        if PC == 5421 then
            if not(not(R[158]<218)) then PC = 5422 else PC = 826 end;
            continue
        end
        -- block @ 5422: 1 instruction
        if PC == 5422 then
            PC = 1921
            continue
        end
        -- block @ 5423: 1 instruction
        if PC == 5423 then
            if R[4]~=90 then PC = 5424 else PC = 3589 end;
            continue
        end
        -- block @ 5424: 1 instruction
        if PC == 5424 then
            PC = 864
            continue
        end
        -- block @ 5425: 4 instructions
        if PC == 5425 then
            R[157]=(R[149][62]);
            R[158]=(1);
            z=155; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 4122
            continue
        end
        -- block @ 5429: 2 instructions
        if PC == 5429 then
            z=R; x=247;
            if not(not(R[154]<=151)) then PC = 5431 else PC = 3449 end;
            continue
        end
        -- block @ 5431: 1 instruction
        if PC == 5431 then
            PC = 4497
            continue
        end
        -- block @ 5432: 6 instructions
        if PC == 5432 then
            R[157]=(67);
            R[158]=R[98];
            z=(159); x=R[153]; R[z+1]=(x); R[z]=x["NextInteger"];
            R[161]=(973);
            R[162]=(1027);
            PC = 5575
            continue
        end
        -- block @ 5439: 3 instructions
        if PC == 5439 then
            R[152]=(R[148][19]);
            R[153]=R[11];
            PC = 1908
            continue
        end
        -- block @ 5443: 3 instructions
        if PC == 5443 then
            R[150]=R[94];
            R[151]=(R[1][107]);
            PC = 1641
            continue
        end
        -- block @ 5447: 1 instruction
        if PC == 5447 then
            if not(not(12<R[162])) then PC = 5448 else PC = 1313 end;
            continue
        end
        -- block @ 5448: 1 instruction
        if PC == 5448 then
            PC = 3748
            continue
        end
        -- block @ 5449: 1 instruction
        if PC == 5449 then
            if not(not(R[4]<43)) then PC = 5450 else PC = 3738 end;
            continue
        end
        -- block @ 5450: 1 instruction
        if PC == 5450 then
            PC = 5649
            continue
        end
        -- block @ 5451: 4 instructions
        if PC == 5451 then
            R[65]=(d[30](R[168],Y[H]));
            R[138][116]=R[168];
            R[168]=R[149];
            PC = 3188
            continue
        end
        -- block @ 5456: 2 instructions
        if PC == 5456 then
            z=(153); x=R[148]; R[z+1]=(x); R[z]=x["Destroy"];
            PC = 3923
            continue
        end
        -- block @ 5459: 3 instructions
        if PC == 5459 then
            R[155]=R[98];
            R[156]=(R[148][24]);
            PC = 3650
            continue
        end
        -- block @ 5463: 7 instructions
        if PC == 5463 then
            R[160]=(0);
            R[161]=(R[1][4]);
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 5002
            continue
        end
        -- block @ 5471: 1 instruction
        if PC == 5471 then
            PC = 1153
            continue
        end
        -- block @ 5473: 1 instruction
        if PC == 5473 then
            if not(not(95<R[4])) then PC = 5474 else PC = 444 end;
            continue
        end
        -- block @ 5474: 1 instruction
        if PC == 5474 then
            PC = 1922
            continue
        end
        -- block @ 5475: 1 instruction
        if PC == 5475 then
            PC = 4465
            continue
        end
        -- block @ 5476: 6 instructions
        if PC == 5476 then
            R[411]=(#R[264]);
            R[158]=(R[1][104]);
            R[157]=R[157][R[158]];
            R[157]=(R[157]*100);
            R[65]=(d[30](R[157],Y[H]));
            PC = 3199
            continue
        end
        -- block @ 5483: 1 instruction
        if PC == 5483 then
            if not(not(98<R[154])) then PC = 5484 else PC = 5397 end;
            continue
        end
        -- block @ 5484: 1 instruction
        if PC == 5484 then
            PC = 1240
            continue
        end
        -- block @ 5485: 1 instruction
        if PC == 5485 then
            PC = 1672
            continue
        end
        -- block @ 5487: 2 instructions
        if PC == 5487 then
            R[158]=(2);
            PC = 23
            continue
        end
        -- block @ 5490: 1 instruction
        if PC == 5490 then
            if R[133]~=86 then PC = 1320 else PC = 5491 end;
            continue
        end
        -- block @ 5491: 1 instruction
        if PC == 5491 then
            PC = 2666
            continue
        end
        -- block @ 5492: 1 instruction
        if PC == 5492 then
            if not(not(60<R[4])) then PC = 5493 else PC = 853 end;
            continue
        end
        -- block @ 5493: 1 instruction
        if PC == 5493 then
            PC = 2169
            continue
        end
        -- block @ 5494: 3 instructions
        if PC == 5494 then
            R[159]=R[97];
            R[160]=(R[1][82]);
            PC = 818
            continue
        end
        -- block @ 5498: 1 instruction
        if PC == 5498 then
            if R[4]~=26 then PC = 5499 else PC = 4319 end;
            continue
        end
        -- block @ 5499: 1 instruction
        if PC == 5499 then
            PC = 3896
            continue
        end
        -- block @ 5500: 3 instructions
        if PC == 5500 then
            R[155]=R[97];
            R[156]=R[11];
            PC = 1623
            continue
        end
        -- block @ 5504: 4 instructions
        if PC == 5504 then
            R[168]=(9);
            z=164; P=z+5-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[165]=R[123];
            PC = 3386
            continue
        end
        -- block @ 5509: 3 instructions
        if PC == 5509 then
            R[151]=(40);
            R[152]=(305);
            PC = 2770
            continue
        end
        -- block @ 5513: 2 instructions
        if PC == 5513 then
            R[161]=(R[1][48]);
            PC = 1427
            continue
        end
        -- block @ 5516: 1 instruction
        if PC == 5516 then
            PC = 2827
            continue
        end
        -- block @ 5518: 1 instruction
        if PC == 5518 then
            if R[4]~=102 then PC = 2531 else PC = 5519 end;
            continue
        end
        -- block @ 5519: 1 instruction
        if PC == 5519 then
            PC = 3720
            continue
        end
        -- block @ 5520: 1 instruction
        if PC == 5520 then
            if not(not(R[4]<=58)) then PC = 5521 else PC = 2483 end;
            continue
        end
        -- block @ 5521: 1 instruction
        if PC == 5521 then
            PC = 4236
            continue
        end
        -- block @ 5522: 1 instruction
        if PC == 5522 then
            if R[158]~=227 then PC = 4878 else PC = 5523 end;
            continue
        end
        -- block @ 5523: 1 instruction
        if PC == 5523 then
            PC = 661
            continue
        end
        -- block @ 5524: 1 instruction
        if PC == 5524 then
            if R[4]~=89 then PC = 4285 else PC = 5525 end;
            continue
        end
        -- block @ 5525: 1 instruction
        if PC == 5525 then
            PC = 3167
            continue
        end
        -- block @ 5526: 1 instruction
        if PC == 5526 then
            if not(102<=R[152]) then PC = 4517 else PC = 5527 end;
            continue
        end
        -- block @ 5527: 1 instruction
        if PC == 5527 then
            PC = 5138
            continue
        end
        -- block @ 5528: 4 instructions
        if PC == 5528 then
            R[120]=R[94];
            R[121]=R[7];
            R[122]=(R[1][171]);
            PC = 3885
            continue
        end
        -- block @ 5533: 1 instruction
        if PC == 5533 then
            if not(not(R[162]<113)) then PC = 5534 else PC = 2650 end;
            continue
        end
        -- block @ 5534: 1 instruction
        if PC == 5534 then
            PC = 4048
            continue
        end
        -- block @ 5535: 5 instructions
        if PC == 5535 then
            R[151]=R[97];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            R[153]=(R[149][27]);
            PC = 1405
            continue
        end
        -- block @ 5541: 1 instruction
        if PC == 5541 then
            if R[4]~=121 then PC = 2461 else PC = 5542 end;
            continue
        end
        -- block @ 5542: 1 instruction
        if PC == 5542 then
            PC = 5258
            continue
        end
        -- block @ 5543: 2 instructions
        if PC == 5543 then
            R[162]=(R[161][5]);
            PC = 4756
            continue
        end
        -- block @ 5546: 1 instruction
        if PC == 5546 then
            PC = 153
            continue
        end
        -- block @ 5548: 5 instructions
        if PC == 5548 then
            R[155]=R[97];
            R[156]=R[11];
            P=156; R[P]=R[P]();
            R[157]=(R[148][23]);
            PC = 4915
            continue
        end
        -- block @ 5554: 6 instructions
        if PC == 5554 then
            R[150]=R[131];
            z=R; x=(151); J=k;
            F=(1);
            J=J[F]; F=45; J=(J[F]);
            z[x]=J;
            PC = 1905
            continue
        end
        -- block @ 5561: 2 instructions
        if PC == 5561 then
            R[154]=(1);
            PC = 5612
            continue
        end
        -- block @ 5564: 1 instruction
        if PC == 5564 then
            if not(not(4<R[153])) then PC = 5565 else PC = 3227 end;
            continue
        end
        -- block @ 5565: 1 instruction
        if PC == 5565 then
            PC = 4865
            continue
        end
        -- block @ 5566: 2 instructions
        if PC == 5566 then
            R[121]=(R[1][48]);
            PC = 3069
            continue
        end
        -- block @ 5569: 1 instruction
        if PC == 5569 then
            if R[154]~=76 then PC = 5570 else PC = 2528 end;
            continue
        end
        -- block @ 5570: 1 instruction
        if PC == 5570 then
            PC = 224
            continue
        end
        -- block @ 5571: 1 instruction
        if PC == 5571 then
            if R[153]~=12 then PC = 1793 else PC = 5572 end;
            continue
        end
        -- block @ 5572: 1 instruction
        if PC == 5572 then
            PC = 291
            continue
        end
        -- block @ 5573: 2 instructions
        if PC == 5573 then
            R[65]=(d[30](R[161],Y[H]));
            PC = 4876
            continue
        end
        -- block @ 5576: 3 instructions
        if PC == 5576 then
            R[160]=(988);
            R[161]=(D[H]);
            PC = 5324
            continue
        end
        -- block @ 5580: 3 instructions
        if PC == 5580 then
            R[49]=(R[1][96]);
            R[47]=R[30][R[49]];
            PC = 4995
            continue
        end
        -- block @ 5584: 3 instructions
        if PC == 5584 then
            R[151]=(R[149][7]);
            R[138][50]=R[151];
            PC = 5225
            continue
        end
        -- block @ 5588: 1 instruction
        if PC == 5588 then
            PC = 2643
            continue
        end
        -- block @ 5589: 5 instructions
        if PC == 5589 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[152]=R[69];
            R[153]=R[151];
            R[154]=(R[1][48]);
            PC = 1715
            continue
        end
        -- block @ 5595: 4 instructions
        if PC == 5595 then
            R[119]=(R[1][75]);
            z=(117); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[117]=(R[1][48]);
            PC = 5723
            continue
        end
        -- block @ 5600: 1 instruction
        if PC == 5600 then
            if not(not(0<R[150])) then PC = 5601 else PC = 1271 end;
            continue
        end
        -- block @ 5601: 1 instruction
        if PC == 5601 then
            PC = 144
            continue
        end
        -- block @ 5602: 1 instruction
        if PC == 5602 then
            PC = 4939
            continue
        end
        -- block @ 5603: 1 instruction
        if PC == 5603 then
            if not(not(364<R[160])) then PC = 5604 else PC = 4102 end;
            continue
        end
        -- block @ 5604: 1 instruction
        if PC == 5604 then
            PC = 748
            continue
        end
        -- block @ 5605: 1 instruction
        if PC == 5605 then
            if R[150]~=125 then PC = 1691 else PC = 5606 end;
            continue
        end
        -- block @ 5606: 1 instruction
        if PC == 5606 then
            PC = 5363
            continue
        end
        -- block @ 5607: 5 instructions
        if PC == 5607 then
            R[152]=(58);
            R[153]=R[135];
            R[154]=(R[1][132]);
            z=153; R[z]=R[z](R[z+1]); P=z;
            PC = 2901
            continue
        end
        -- block @ 5613: 1 instruction
        if PC == 5613 then
            if not(not(12<R[150])) then PC = 5614 else PC = 5364 end;
            continue
        end
        -- block @ 5614: 1 instruction
        if PC == 5614 then
            PC = 2796
            continue
        end
        -- block @ 5615: 4 instructions
        if PC == 5615 then
            P=153; R[P]=R[P]();
            R[154]=(1);
            z=151; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 14
            continue
        end
        -- block @ 5620: 3 instructions
        if PC == 5620 then
            R[159]=(0);
            z=157; R[z]=R[z](R[z+1],R[z+2]); P=z;
            PC = 920
            continue
        end
        -- block @ 5624: 1 instruction
        if PC == 5624 then
            PC = 725
            continue
        end
        -- block @ 5626: 3 instructions
        if PC == 5626 then
            R[150][33899075]=(494534267);
            z=(148); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 4976
            continue
        end
        -- block @ 5630: 1 instruction
        if PC == 5630 then
            if not(not(29<R[152])) then PC = 5631 else PC = 400 end;
            continue
        end
        -- block @ 5631: 1 instruction
        if PC == 5631 then
            PC = 309
            continue
        end
        -- block @ 5632: 4 instructions
        if PC == 5632 then
            R[150][3768639233]=(1329615100);
            R[150][2331474118]=(760309919);
            R[150][2147026229]=(2020820831);
            PC = 690
            continue
        end
        -- block @ 5637: 10 instructions
        if PC == 5637 then
            z=(144); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[144]=R[94];
            R[145]=R[140];
            R[146]=("new");
            z=(144); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[144]=nil;
            R[145]=(R[1][48]);
            R[162]=(1204);
            z=159; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            PC = 2485
            continue
        end
        -- block @ 5648: 1 instruction
        if PC == 5648 then
            if R[154]~=242 then PC = 2327 else PC = 5649 end;
            continue
        end
        -- block @ 5649: 1 instruction
        if PC == 5649 then
            PC = 2043
            continue
        end
        -- block @ 5650: 1 instruction
        if PC == 5650 then
            PC = 5654
            continue
        end
        -- block @ 5651: 3 instructions
        if PC == 5651 then
            R[116]=(d[17][8]);
            R[117]=R[94];
            PC = 5594
            continue
        end
        -- block @ 5655: 13 instructions
        if PC == 5655 then
            R[115]=R[94];
            R[116]=R[58];
            R[117]=(R[1][81]);
            z=(115); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[115]=R[94];
            R[116]=R[36];
            R[117]=(R[1][56]);
            z=(115); (R[z])(R[z+1],R[z+2]); P=z-1;
            R[115]=R[94];
            R[116]=R[112];
            R[117]=(R[1][43]);
            z=(115); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 3811
            continue
        end
        -- block @ 5669: 1 instruction
        if PC == 5669 then
            if R[4]~=63 then PC = 5147 else PC = 5670 end;
            continue
        end
        -- block @ 5670: 1 instruction
        if PC == 5670 then
            PC = 2044
            continue
        end
        -- block @ 5671: 3 instructions
        if PC == 5671 then
            R[157]=(R[149][12]);
            R[158]=(2);
            PC = 1476
            continue
        end
        -- block @ 5675: 1 instruction
        if PC == 5675 then
            if not(not(188<R[157])) then PC = 5676 else PC = 3504 end;
            continue
        end
        -- block @ 5676: 1 instruction
        if PC == 5676 then
            PC = 3152
            continue
        end
        -- block @ 5677: 2 instructions
        if PC == 5677 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            if not R[154] then PC = 174 else PC = 5679 end;
            continue
        end
        -- block @ 5679: 1 instruction
        if PC == 5679 then
            PC = 3933
            continue
        end
        -- block @ 5680: 1 instruction
        if PC == 5680 then
            PC = 2531
            continue
        end
        -- block @ 5681: 7 instructions
        if PC == 5681 then
            R[65]=(d[30](R[163],Y[H]));
            z=R; x=138;
            z=(z[x]);
            x=(114);
            J=k; F=(163); J=J[F];
            z[x]=J;
            PC = 1743
            continue
        end
        -- block @ 5689: 2 instructions
        if PC == 5689 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            PC = 2698
            continue
        end
        -- block @ 5692: 4 instructions
        if PC == 5692 then
            R[134]=R[98];
            R[135]=(816002721);
            R[136]=R[132];
            PC = 836
            continue
        end
        -- block @ 5697: 4 instructions
        if PC == 5697 then
            R[151]=R[98];
            R[152]=R[11];
            P=152; R[P]=R[P]();
            PC = 310
            continue
        end
        -- block @ 5702: 1 instruction
        if PC == 5702 then
            PC = 4281
            continue
        end
        -- block @ 5703: 1 instruction
        if PC == 5703 then
            PC = 2736
            continue
        end
        -- block @ 5705: 4 instructions
        if PC == 5705 then
            R[166]=R[149];
            R[167]=(R[1][155]);
            R[167]=R[164][R[167]];
            PC = 4900
            continue
        end
        -- block @ 5710: 1 instruction
        if PC == 5710 then
            if R[152]~=117 then PC = 3612 else PC = 5711 end;
            continue
        end
        -- block @ 5711: 1 instruction
        if PC == 5711 then
            PC = 2592
            continue
        end
        -- block @ 5712: 1 instruction
        if PC == 5712 then
            if R[152]~=5 then PC = 3654 else PC = 5713 end;
            continue
        end
        -- block @ 5713: 1 instruction
        if PC == 5713 then
            PC = 2505
            continue
        end
        -- block @ 5714: 5 instructions
        if PC == 5714 then
            z=158; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            z=(158); x=R[153]; R[z+1]=(x); R[z]=x["Destroy"];
            z=(158); (R[z])(R[z+1]); P=(z-1);
            z=(158); x=R[154]; R[z+1]=(x); R[z]=x["Destroy"];
            PC = 373
            continue
        end
        -- block @ 5720: 1 instruction
        if PC == 5720 then
            if not(not(R[4]<67)) then PC = 5721 else PC = 203 end;
            continue
        end
        -- block @ 5721: 1 instruction
        if PC == 5721 then
            PC = 686
            continue
        end
        -- block @ 5722: 1 instruction
        if PC == 5722 then
            if not(not(R[154]<=114)) then PC = 5723 else PC = 5429 end;
            continue
        end
        -- block @ 5723: 1 instruction
        if PC == 5723 then
            PC = 2136
            continue
        end
        -- block @ 5724: 1 instruction
        if PC == 5724 then
            if R[4]~=45 then PC = 3050 else PC = 5725 end;
            continue
        end
        -- block @ 5725: 1 instruction
        if PC == 5725 then
            PC = 1030
            continue
        end
        -- block @ 5726: 2 instructions
        if PC == 5726 then
            R[158]=(R[1][4]);
            PC = 2471
            continue
        end
        -- block @ 5729: 3 instructions
        if PC == 5729 then
            R[148]=R[145];
            R[149]=R[38];
            PC = 2616
            continue
        end
        -- block @ 5733: 7 instructions
        if PC == 5733 then
            R[138][108]=R[160];
            R[160]=R[149];
            R[161]=(R[1][155]);
            R[161]=R[159][R[161]];
            R[162]=(R[1][4]);
            z=(160); (R[z])(R[z+1],R[z+2]); P=z-1;
            PC = 2863
            continue
        end
        break
    end
end

-- proto P2: 331 instructions, 87 blocks, 326 executed in the captured run
local function p2(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 5 instructions
        if PC == 1 then
            R[227]=(R[235]..l[H]);
            R[2][15]=("FromValue");
            R[2][48]=R[0];
            R[3]=(B["string"]);
            PC = 1
            continue
        end
        -- block @ 29: 15 instructions
        if PC == 29 then
            R[2][112]=("The debug library is required on Luau platforms. Please open a support ticket.");
            R[2][167]=("IsA");
            R[3]=(B["setmetatable"]);
            R[2][173]=R[3];
            R[2][92]=("wrap");
            R[2][80]=R[3];
            R[3]=(B["string"]);
            R[3]=(R[3]["char"]);
            R[2][117]=R[3];
            R[2][124]=("DataModel");
            R[2][118]=R[3];
            z=k; x=3;
            J=B;
            F="buffer"; J=(J[F]); z[x]=(J);
            PC = 282
            continue
        end
        -- block @ 45: 5 instructions
        if PC == 45 then
            R[2][176]=("next");
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[3]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            R[2][0]=R[3];
            R[2][134]=("Enums");
            PC = 222
            continue
        end
        -- block @ 51: 1 instruction
        if PC == 51 then
            if i then for a,l in i do if not(a>=1) then else l[1]=(l); (l)[2]=R[a]; (l)[3]=2; i[a]=(nil); end; end; end; z=(2);
            return
        end
        -- block @ 53: 4 instructions
        if PC == 53 then
            R[2][33]=("The metatable is locked");
            z=R; x=2; z=(z[x]);
            x=105; J="Luraph"; (z)[x]=(J);
            PC = 79
            continue
        end
        -- block @ 58: 3 instructions
        if PC == 58 then
            R[3]=(B["type"]);
            R[2][8]=R[3];
            PC = 314
            continue
        end
        -- block @ 62: 3 instructions
        if PC == 62 then
            R[2][42]=("rawget");
            R[2][120]=("IsServer");
            PC = 289
            continue
        end
        -- block @ 66: 13 instructions
        if PC == 66 then
            R[2][143]=("abs");
            R[3]=(B["tostring"]);
            R[2][133]=R[3];
            R[2][39]=("writeu32");
            R[2][56]=("find");
            R[3]=(B["iscclosure"]);
            R[2][21]=R[3];
            R[2][26]=("NextNumber");
            R[2][34]=("gsub");
            R[2][4]=(D[H]);
            R[2][121]=("RunService");
            z=(2); x=R[2]; R[z+1]=(x); R[z]=x[0];
            PC = 50
            continue
        end
        -- block @ 80: 20 instructions
        if PC == 80 then
            R[2][136]=("Value");
            R[2][32]=("__index");
            R[2][61]=("Parent");
            R[2][157]=R[3];
            z=k; x=3;
            J=B;
            F="bit32"; J=(J[F]); z[x]=(J);
            R[3]=(R[3]["rrotate"]);
            R[2][17]=R[3];
            R[2][18]=("Instance");
            R[2][71]=("SHePnvK");
            R[2][54]=R[3];
            R[2][76]=("error");
            R[3]=(B["assert"]);
            R[2][46]=R[3];
            R[2][104]=("Scale");
            R[3]=(B["game"]);
            R[2][62]=("RequestAsync");
            R[2][75]=("sub");
            PC = 61
            continue
        end
        -- block @ 101: 3 instructions
        if PC == 101 then
            R[2][153]=("lastlinedefined");
            R[3]=(B["identifyexecutor"]);
            PC = 239
            continue
        end
        -- block @ 105: 10 instructions
        if PC == 105 then
            R[2][40]=("assert");
            R[3]=(B["unpack"]);
            R[2][20]=R[3];
            R[2][67]=("gmatch");
            R[2][60]=("what");
            z=3; U=(U[z]); F=F[U];
            R[3]=(B["bit32"]);
            R[3]=(R[3]["bxor"]);
            R[2][29]=R[3];
            PC = 144
            continue
        end
        -- block @ 117: 12 instructions
        if PC == 117 then
            R[2][19]=("pack");
            R[2][49]=("string");
            R[2][119]=(":(%d+)[:\r\n]");
            R[3]=(B["getfenv"]);
            R[3]=(B["Path2DControlPoint"]);
            z=R; x=(3); J=k;
            F=(3);
            J=J[F]; F="new"; J=(J[F]);
            z[x]=J;
            R[2][145]=R[3];
            R[2][160]=("tonumber");
            PC = 319
            continue
        end
        -- block @ 130: 14 instructions
        if PC == 130 then
            R[2][41]=("ScreenGui");
            z=R; x=2; z=(z[x]);
            x=43; J="char"; (z)[x]=(J);
            R[2][79]=("status");
            R[3]=(B["Instance"]);
            R[2][150]=R[3];
            R[2][70]=("unpack");
            R[2][122]=("traceback");
            R[2][113]=("NextInteger");
            R[2][66]=("readu8");
            R[3]=(B["Random"]);
            R[2][27]=R[3];
            R[2][156]=("StarterPlayer");
            PC = 173
            continue
        end
        -- block @ 145: 4 instructions
        if PC == 145 then
            R[2][69]=("cancel");
            z=R; x=2; z=(z[x]);
            x=6; J="getinfo"; (z)[x]=(J);
            PC = 167
            continue
        end
        -- block @ 150: 3 instructions
        if PC == 150 then
            R[2][37]=("=[C]");
            R[2][127]=("create");
            PC = 116
            continue
        end
        -- block @ 154: 6 instructions
        if PC == 154 then
            R[3]=(R[3]["new"]);
            R[2][142]=R[3];
            R[2][108]=("Name");
            R[2][132]=("Frame");
            R[2][164]=("EnumItem");
            PC = 258
            continue
        end
        -- block @ 161: 6 instructions
        if PC == 161 then
            R[2][74]=("copy");
            R[2][30]=("Connect");
            R[2][128]=("rep");
            R[2][91]=("type");
            R[2][82]=("number");
            PC = 57
            continue
        end
        -- block @ 168: 5 instructions
        if PC == 168 then
            R[2][57]=("typeof");
            R[2][110]=("xpcall");
            R[3]=(B["string"]);
            R[3]=(R[3]["format"]);
            PC = 44
            continue
        end
        -- block @ 174: 20 instructions
        if PC == 174 then
            R[2][31]=R[3];
            R[3]=(B["error"]);
            R[2][10]=R[3];
            R[3]=(B["table"]);
            R[2][86]=R[3];
            R[3]=(B["bit32"]);
            R[3]=(R[3]["countlz"]);
            R[2][152]=R[3];
            R[3]=(B["CFrame"]);
            R[2][103]=R[3];
            R[2][114]=("Your Lua environment does not support load or loadstring, therefore you are unable to use Luraph's 'LPH_NO_UPVALUES' macro.");
            R[2][170]=(" --[[%s]] return setfenv(function(...) return %s(...) end, setmetatable({ [\"%s\"] = ... }, { __index = getfenv((...)) })) ");
            R[2][169]=R[3];
            R[2][88]=("DescendantAdded");
            R[2][95]=("C");
            R[3]=(B["getmetatable"]);
            R[3]=(R[3]["unpack"]);
            R[2][149]=R[3];
            R[2][77]=("[C]");
            PC = 324
            continue
        end
        -- block @ 195: 18 instructions
        if PC == 195 then
            R[3]=(R[3]["countrz"]);
            z=R; x=2;
            z=(z[x]);
            x=(175);
            J=k; F=(3); J=J[F];
            z[x]=J;
            R[3]=(B["utf8"]);
            R[2][159]=R[3];
            R[2][171]=("spawn");
            R[2][155]=("X");
            R[3]=(B["Vector3"]);
            R[2][93]=R[3];
            R[2][123]=("close");
            R[2][81]=("match");
            R[3]=(B["select"]);
            R[2][78]=R[3];
            R[2][53]=(D[H]);
            PC = 104
            continue
        end
        -- block @ 214: 8 instructions
        if PC == 214 then
            R[2][85]=("MouseBehavior");
            R[3]=(B["bit32"]);
            R[3]=(R[3]["band"]);
            R[2][94]=R[3];
            R[3]=(B["Enum"]);
            R[2][36]=("tostring");
            R[2][96]=("new");
            PC = 160
            continue
        end
        -- block @ 223: 7 instructions
        if PC == 223 then
            R[3]=(B["utf8"]);
            R[3]=(R[3]["nfdnormalize"]);
            R[2][129]=R[3];
            R[2][172]=("FromName");
            R[2][177]=("yield");
            R[2][161]=("wait");
            PC = 230
            continue
        end
        -- block @ 231: 8 instructions
        if PC == 231 then
            v,I=d[54](...);
            R[2]=({});
            R[2][5]=("GetAsync");
            R[2][107]=("IsStudio");
            R[2][116]=("ClassName");
            R[2][24]=("isvararg");
            R[2][7]=("Size");
            PC = 270
            continue
        end
        -- block @ 240: 8 instructions
        if PC == 240 then
            R[2][126]=("defer");
            R[3]=(B["tonumber"]);
            R[2][44]=R[3];
            R[2][16]=("NextUnitVector");
            R[2][12]=R[3];
            R[2][174]=("Position");
            R[2][131]=("HttpService");
            PC = 52
            continue
        end
        -- block @ 248: 10 instructions
        if PC == 248 then
            R[3]=(B["typeof"]);
            R[2][9]=R[3];
            R[3]=(B["string"]);
            R[3]=(R[3]["byte"]);
            R[2][83]=R[3];
            R[2][111]=("WaitForChild");
            R[2][28]=("writeu16");
            R[3]=(B["string"]);
            R[3]=(R[3]["find"]);
            PC = 129
            continue
        end
        -- block @ 259: 11 instructions
        if PC == 259 then
            R[2][35]=("Clone");
            R[3]=(B["rawset"]);
            R[2][147]=R[3];
            R[2][64]=("delay");
            R[3]=(B["string"]);
            R[2][84]=("getfenv");
            R[2][162]=("Connected");
            R[2][87]=("writeu8");
            R[3]=(B["islclosure"]);
            R[2][166]=R[3];
            PC = 306
            continue
        end
        -- block @ 271: 11 instructions
        if PC == 271 then
            R[3]=(R[3]["lrotate"]);
            z=R; x=2;
            z=(z[x]);
            x=(25);
            J=k; F=(3); J=J[F];
            z[x]=J;
            R[2][38]=("linedefined");
            R[3]=(B["task"]);
            R[2][58]=R[3];
            R[3]=(B["workspace"]);
            PC = 65
            continue
        end
        -- block @ 283: 6 instructions
        if PC == 283 then
            R[2][52]=("nparams");
            R[2][144]=("namewhat");
            R[2][50]=("Y");
            R[3]=(B["UDim2"]);
            R[3]=(R[3]["new"]);
            PC = 149
            continue
        end
        -- block @ 290: 16 instructions
        if PC == 290 then
            R[2][138]=("LockCurrentPosition");
            R[3]=(B["string"]);
            R[2][158]=R[3];
            R[3]=(B["bit32"]);
            R[2][98]=("short_src");
            R[3]=(B["math"]);
            R[2][23]=R[3];
            R[2][140]=("Folder");
            R[2][51]=("insert");
            R[2][65]=("getmetatable");
            R[2][102]=("띹푆벑칚Ï둣췏둅뙉");
            R[3]=(B["xpcall"]);
            R[2][101]=("userdata");
            R[2][68]=("select");
            R[2][163]=("");
            PC = 100
            continue
        end
        -- block @ 307: 7 instructions
        if PC == 307 then
            R[2][14]=R[3];
            R[3]=(B["Vector2"]);
            R[2][146]=R[3];
            R[2][97]=("resume");
            R[2][13]=R[3];
            R[2][141]=("Disconnect");
            PC = 194
            continue
        end
        -- block @ 315: 4 instructions
        if PC == 315 then
            R[2][90]=R[3];
            R[2][139]=("currentline");
            R[2][109]=("running");
            PC = 153
            continue
        end
        -- block @ 320: 4 instructions
        if PC == 320 then
            R[2][168]=("function");
            R[2][125]=("Enum");
            R[2][55]=("Changed");
            PC = 26
            continue
        end
        -- block @ 325: 7 instructions
        if PC == 325 then
            R[2][135]=R[3];
            z=k; x=3;
            J=B;
            F="bit32"; J=(J[F]); z[x]=(J);
            R[3]=(R[3]["bor"]);
            R[2][11]=R[3];
            PC = 213
            continue
        end
        break
    end
end

-- proto P3: 217 instructions, 137 blocks, 144 executed in the captured run
local function p3(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 2 instructions
        if PC == 1 then
            F=(295); J=(J[F]);
            if not(not(R[8]<=43)) then PC = 11 else PC = 17 end;
            continue
        end
        -- block @ 11: 1 instruction
        if PC == 11 then
            PC = 11
            continue
        end
        -- block @ 17: 1 instruction
        if PC == 17 then
            PC = 21
            continue
        end
        -- block @ 26: 1 instruction
        if PC == 26 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 27: 1 instruction
        if PC == 27 then
            if R[10]~=47 then PC = 21 else PC = 28 end;
            continue
        end
        -- block @ 28: 2 instructions
        if PC == 28 then
            R[5]=R[1];
            if not(not(R[10]<51)) then PC = 30 else PC = 58 end;
            continue
        end
        -- block @ 30: 1 instruction
        if PC == 30 then
            PC = 78
            continue
        end
        -- block @ 31: 6 instructions
        if PC == 31 then
            R[16]=R[5];
            R[17]=R[9];
            R[18]=R[10];
            R[19]=R[11];
            z=16; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 37 else R[12+3]=y; PC = 188 end;
            continue
        end
        -- block @ 37: 1 instruction
        if PC == 37 then
            PC = 98
            continue
        end
        -- block @ 38: 1 instruction
        if PC == 38 then
            if not(not(23<R[13])) then PC = 39 else PC = 165 end;
            continue
        end
        -- block @ 39: 1 instruction
        if PC == 39 then
            PC = 96
            continue
        end
        -- block @ 40: 2 instructions
        if PC == 40 then
            R[9]=(1);
            PC = 207
            continue
        end
        -- block @ 43: 1 instruction
        if PC == 43 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(10); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 24
            continue
        end
        -- block @ 44: 2 instructions
        if PC == 44 then
            R[8]=(54);
            PC = 94
            continue
        end
        -- block @ 47: 1 instruction
        if PC == 47 then
            PC = 6
            continue
        end
        -- block @ 49: 5 instructions
        if PC == 49 then
            z=({...}); for a=1,3 do R[a]=z[a]; end;
            R[4]=Protos[0][48];
            R[5]=Protos[0][48];
            R[6]=(1028445304);
            PC = 61
            continue
        end
        -- block @ 55: 1 instruction
        if PC == 55 then
            if R[15]~=308 then PC = 182 else PC = 56 end;
            continue
        end
        -- block @ 56: 1 instruction
        if PC == 56 then
            PC = 30
            continue
        end
        -- block @ 57: 1 instruction
        if PC == 57 then
            if not R[4] then PC = 16 else PC = 58 end;
            continue
        end
        -- block @ 58: 1 instruction
        if PC == 58 then
            PC = 142
            continue
        end
        -- block @ 59: 1 instruction
        if PC == 59 then
            if not(not(36<R[10])) then PC = 60 else PC = 18 end;
            continue
        end
        -- block @ 60: 1 instruction
        if PC == 60 then
            PC = 94
            continue
        end
        -- block @ 62: 2 instructions
        if PC == 62 then
            R[8]=(124);
            PC = 207
            continue
        end
        -- block @ 65: 2 instructions
        if PC == 65 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 67 else R[10+3]=y; PC = 171 end;
            continue
        end
        -- block @ 67: 1 instruction
        if PC == 67 then
            PC = 64
            continue
        end
        -- block @ 68: 3 instructions
        if PC == 68 then
            R[11]=(95);
            R[12]=(204);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(11); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 207
            continue
        end
        -- block @ 72: 1 instruction
        if PC == 72 then
            PC = 3
            continue
        end
        -- block @ 74: 4 instructions
        if PC == 74 then
            R[13]=(421);
            z=R; x=14;
            J=74; z[x]=J;
            PC = 24
            continue
        end
        -- block @ 79: 5 instructions
        if PC == 79 then
            z=R; x=10;
            J=51; z[x]=J;
            R[5]=R[3];
            z=Protos[2]; R[11]=z[1][z[3]];
            if R[11]~=220309794 then PC = 84 else PC = 119 end;
            continue
        end
        -- block @ 84: 1 instruction
        if PC == 84 then
            PC = 197
            continue
        end
        -- block @ 85: 1 instruction
        if PC == 85 then
            PC = 3
            continue
        end
        -- block @ 87: 3 instructions
        if PC == 87 then
            z=R; x=4;
            J=1; z[x]=J;
            PC = 24
            continue
        end
        -- block @ 91: 1 instruction
        if PC == 91 then
            if not R[4] then PC = 190 else PC = 92 end;
            continue
        end
        -- block @ 92: 1 instruction
        if PC == 92 then
            PC = 150
            continue
        end
        -- block @ 93: 1 instruction
        if PC == 93 then
            PC = 48
            continue
        end
        -- block @ 95: 1 instruction
        if PC == 95 then
            if not(not(R[8]<=89)) then PC = 96 else PC = 209 end;
            continue
        end
        -- block @ 96: 1 instruction
        if PC == 96 then
            PC = 156
            continue
        end
        -- block @ 97: 1 instruction
        if PC == 97 then
            if not(not(R[13]<209)) then PC = 98 else PC = 165 end;
            continue
        end
        -- block @ 98: 1 instruction
        if PC == 98 then
            PC = 39
            continue
        end
        -- block @ 99: 9 instructions
        if PC == 99 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[5]=R[5]+R[9];
            z=s; x=8;
            z=(z[x]);
            x=(z); J=1; x=(x[J]);
            J=z; z=3;
            J=J[z];
            z=k; F=(5);
            PC = 190
            continue
        end
        -- block @ 109: 2 instructions
        if PC == 109 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            if not R[5] then PC = 184 else PC = 111 end;
            continue
        end
        -- block @ 111: 1 instruction
        if PC == 111 then
            PC = 173
            continue
        end
        -- block @ 112: 1 instruction
        if PC == 112 then
            if not(not(86<R[15])) then PC = 113 else PC = 148 end;
            continue
        end
        -- block @ 113: 1 instruction
        if PC == 113 then
            PC = 215
            continue
        end
        -- block @ 114: 1 instruction
        if PC == 114 then
            PC = 6
            continue
        end
        -- block @ 116: 1 instruction
        if PC == 116 then
            PC = 6
            continue
        end
        -- block @ 118: 1 instruction
        if PC == 118 then
            PC = 22
            continue
        end
        -- block @ 120: 11 instructions
        if PC == 120 then
            z=(Protos[3]); z[1][z[3]]=(725616406);
            z=Protos[4]; R[11]=z[1][z[3]];
            R[11]=R[11]-1459;
            z=Protos[4]; z[1][z[3]]=R[11];
            R[7]=R[7]-314;
            R[10]=(66);
            R[5]=R[1];
            R[8]=(100);
            R[10]=R[4];
            R[11]=R[5];
            PC = 138
            continue
        end
        -- block @ 132: 3 instructions
        if PC == 132 then
            R[14]=R[4];
            P=(14); (R[P])(); P-=1;
            PC = 15
            continue
        end
        -- block @ 135: 3 instructions
        if PC == 135 then
            R[9]=(2);
            R[5]=(R[5]==R[9]);
            if not R[5] then PC = 22 else PC = 138 end;
            continue
        end
        -- block @ 138: 1 instruction
        if PC == 138 then
            PC = 67
            continue
        end
        -- block @ 139: 3 instructions
        if PC == 139 then
            z=10; R[z]=R[z](R[z+1],R[z+2]); P=z;
            z=R; x=4; J=R;
            PC = 94
            continue
        end
        -- block @ 143: 3 instructions
        if PC == 143 then
            R[10]=(61);
            R[11]=(108);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(10); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 15
            continue
        end
        -- block @ 147: 1 instruction
        if PC == 147 then
            if not(not(R[13]<116)) then PC = 148 else PC = 24 end;
            continue
        end
        -- block @ 148: 1 instruction
        if PC == 148 then
            PC = 86
            continue
        end
        -- block @ 149: 1 instruction
        if PC == 149 then
            if not(not(12<R[15])) then PC = 150 else PC = 115 end;
            continue
        end
        -- block @ 150: 1 instruction
        if PC == 150 then
            PC = 113
            continue
        end
        -- block @ 151: 1 instruction
        if PC == 151 then
            PC = 211
            continue
        end
        -- block @ 152: 1 instruction
        if PC == 152 then
            if R[14]~=204 then PC = 207 else PC = 153 end;
            continue
        end
        -- block @ 153: 2 instructions
        if PC == 153 then
            R[4]=R[5];
            if R[10]~=66 then PC = 26 else PC = 155 end;
            continue
        end
        -- block @ 155: 1 instruction
        if PC == 155 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 156 else R[12+3]=y; PC = 111 end;
            continue
        end
        -- block @ 156: 1 instruction
        if PC == 156 then
            PC = 198
            continue
        end
        -- block @ 157: 1 instruction
        if PC == 157 then
            if not(not(54<R[8])) then PC = 158 else PC = 90 end;
            continue
        end
        -- block @ 158: 1 instruction
        if PC == 158 then
            PC = 199
            continue
        end
        -- block @ 159: 6 instructions
        if PC == 159 then
            R[11]=(R[11]+1443);
            z=Protos[2]; z[1][z[3]]=R[11];
            z=R;
            P=z;
            v,I=d[54](...);
            PC = 18
            continue
        end
        -- block @ 166: 1 instruction
        if PC == 166 then
            if not(not(116<R[13])) then PC = 167 else PC = 146 end;
            continue
        end
        -- block @ 167: 4 instructions
        if PC == 167 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=R; x=12;
            J=50; z[x]=J;
            PC = 92
            continue
        end
        -- block @ 172: 1 instruction
        if PC == 172 then
            if not(108<=R[13]) then PC = 191 else PC = 173 end;
            continue
        end
        -- block @ 173: 1 instruction
        if PC == 173 then
            PC = 131
            continue
        end
        -- block @ 174: 8 instructions
        if PC == 174 then
            R[10]=(47);
            z=Protos[6]; R[11]=z[1][z[3]];
            z=R; x=(11);
            J=k; F=11; J=J[F];
            F=(84); J+=F; (z)[x]=(J);
            z=Protos[6]; z[1][z[3]]=R[11];
            R[6]=(328276637);
            PC = 158
            continue
        end
        -- block @ 183: 1 instruction
        if PC == 183 then
            PC = 6
            continue
        end
        -- block @ 185: 3 instructions
        if PC == 185 then
            R[10]=(36);
            R[8]=(43);
            PC = 9
            continue
        end
        -- block @ 189: 1 instruction
        if PC == 189 then
            if not(161<=R[15]) then PC = 84 else PC = 190 end;
            continue
        end
        -- block @ 190: 1 instruction
        if PC == 190 then
            PC = 71
            continue
        end
        -- block @ 191: 1 instruction
        if PC == 191 then
            PC = 1
            continue
        end
        -- block @ 192: 5 instructions
        if PC == 192 then
            z=Protos[10]; R[4]=z[1][z[3]];
            z=Protos[5]; R[11]=z[1][z[3]];
            R[11]=(R[11]+1367);
            z=Protos[5]; z[1][z[3]]=R[11];
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 197 else R[10+3]=y; PC = 37 end;
            continue
        end
        -- block @ 197: 1 instruction
        if PC == 197 then
            PC = 108
            continue
        end
        -- block @ 198: 1 instruction
        if PC == 198 then
            PC = 18
            continue
        end
        -- block @ 199: 1 instruction
        if PC == 199 then
            PC = 4
            continue
        end
        -- block @ 200: 2 instructions
        if PC == 200 then
            R[9]=R[2];
            PC = 94
            continue
        end
        -- block @ 203: 1 instruction
        if PC == 203 then
            if R[14]~=95 then PC = 151 else PC = 204 end;
            continue
        end
        -- block @ 204: 3 instructions
        if PC == 204 then
            R[10]=Protos[0][48];
            R[11]=Protos[0][48];
            PC = 73
            continue
        end
        -- block @ 208: 1 instruction
        if PC == 208 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 209 else R[11+3]=y; PC = 202 end;
            continue
        end
        -- block @ 209: 1 instruction
        if PC == 209 then
            PC = 117
            continue
        end
        -- block @ 210: 1 instruction
        if PC == 210 then
            if not(not(100<R[8])) then PC = 211 else PC = 56 end;
            continue
        end
        -- block @ 211: 1 instruction
        if PC == 211 then
            PC = 43
            continue
        end
        -- block @ 212: 3 instructions
        if PC == 212 then
            R[10]=(23);
            R[11]=(209);
            PC = 42
            continue
        end
        -- block @ 216: 1 instruction
        if PC == 216 then
            if not(not(R[15]<=160)) then PC = 217 else PC = 54 end;
            continue
        end
        -- block @ 217: 1 instruction
        if PC == 217 then
            PC = 46
            continue
        end
        break
    end
end

-- proto P4: 195 instructions, 125 blocks, 135 executed in the captured run
local function p4(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 5
            continue
        end
        -- block @ 17: 17 instructions
        if PC == 17 then
            R[8]=(14560866);
            z=(Protos[7]); z[1][z[3]]=(320660002);
            z=(Protos[8]); z[1][z[3]]=(918230503);
            z=(Protos[5]); z[1][z[3]]=(785837398);
            z=Protos[9]; R[19]=z[1][z[3]];
            z=R; x=(19);
            J=k; F=19; J=J[F];
            F=(1043); J+=F; (z)[x]=(J);
            z=Protos[9]; z[1][z[3]]=R[19];
            R[216]=(R[292]<=Y[H]);
            J=k; F=312;
            R[338]=R[362][R[465]];
            R[298]=l[H]..R[50];
            z=R; x=194; z=(z[x]);
            R[242]=({});
            R[465]=(d[17][510]);
            PC = 5
            continue
        end
        -- block @ 35: 1 instruction
        if PC == 35 then
            if R[19]~=30 then PC = 36 else PC = 119 end;
            continue
        end
        -- block @ 36: 1 instruction
        if PC == 36 then
            PC = 191
            continue
        end
        -- block @ 37: 1 instruction
        if PC == 37 then
            if R[15]~=85 then PC = 38 else PC = 70 end;
            continue
        end
        -- block @ 38: 1 instruction
        if PC == 38 then
            PC = 139
            continue
        end
        -- block @ 39: 1 instruction
        if PC == 39 then
            if R[14]~=41 then PC = 16 else PC = 40 end;
            continue
        end
        -- block @ 40: 1 instruction
        if PC == 40 then
            PC = 85
            continue
        end
        -- block @ 41: 1 instruction
        if PC == 41 then
            if R[14]~=31 then PC = 38 else PC = 42 end;
            continue
        end
        -- block @ 42: 1 instruction
        if PC == 42 then
            if not(not(R[19]<118)) then PC = 43 else PC = 101 end;
            continue
        end
        -- block @ 43: 1 instruction
        if PC == 43 then
            PC = 45
            continue
        end
        -- block @ 44: 1 instruction
        if PC == 44 then
            PC = 128
            continue
        end
        -- block @ 46: 1 instruction
        if PC == 46 then
            PC = 128
            continue
        end
        -- block @ 48: 1 instruction
        if PC == 48 then
            if not R[4] then PC = 11 else PC = 49 end;
            continue
        end
        -- block @ 49: 1 instruction
        if PC == 49 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 50 else R[15+3]=y; PC = 124 end;
            continue
        end
        -- block @ 50: 3 instructions
        if PC == 50 then
            R[13]=Protos[2][48];
            R[14]=(75);
            PC = 5
            continue
        end
        -- block @ 54: 1 instruction
        if PC == 54 then
            PC = 11
            continue
        end
        -- block @ 56: 3 instructions
        if PC == 56 then
            R[14]=(46);
            R[4]=(0);
            PC = 14
            continue
        end
        -- block @ 60: 1 instruction
        if PC == 60 then
            PC = 128
            continue
        end
        -- block @ 62: 1 instruction
        if PC == 62 then
            if not(not(106<R[15])) then PC = 63 else PC = 170 end;
            continue
        end
        -- block @ 63: 1 instruction
        if PC == 63 then
            PC = 96
            continue
        end
        -- block @ 64: 3 instructions
        if PC == 64 then
            R[5]=(98177990);
            z=(Protos[6]); z[1][z[3]]=(106251067);
            PC = 1
            continue
        end
        -- block @ 68: 2 instructions
        if PC == 68 then
            R[7]=(R[7]==R[6]);
            if R[14]~=114 then PC = 40 else PC = 70 end;
            continue
        end
        -- block @ 70: 1 instruction
        if PC == 70 then
            PC = 185
            continue
        end
        -- block @ 71: 1 instruction
        if PC == 71 then
            PC = 12
            continue
        end
        -- block @ 73: 2 instructions
        if PC == 73 then
            z=Protos[5]; R[19]=z[1][z[3]];
            if R[19]~=899094286 then PC = 75 else PC = 63 end;
            continue
        end
        -- block @ 75: 5 instructions
        if PC == 75 then
            R[14]=(41);
            R[9]=(60);
            z=R; x=10;
            J=98; z[x]=J;
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(9); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 11
            continue
        end
        -- block @ 81: 2 instructions
        if PC == 81 then
            R[9]=(27);
            PC = 107
            continue
        end
        -- block @ 84: 1 instruction
        if PC == 84 then
            if not(not(44<R[12])) then PC = 85 else PC = 130 end;
            continue
        end
        -- block @ 85: 1 instruction
        if PC == 85 then
            PC = 149
            continue
        end
        -- block @ 86: 6 instructions
        if PC == 86 then
            z=Protos[10]; R[7]=z[1][z[3]];
            R[6]=Protos[11];
            R[15]=Protos[2][48];
            R[16]=(8);
            R[17]=(198);
            PC = 135
            continue
        end
        -- block @ 93: 3 instructions
        if PC == 93 then
            z=Protos[4]; R[13]=z[1][z[3]];
            R[14]=(31);
            PC = 16
            continue
        end
        -- block @ 96: 3 instructions
        if PC == 96 then
            J=J[F];
            R[15]=(106);
            PC = 61
            continue
        end
        -- block @ 100: 1 instruction
        if PC == 100 then
            if R[12]~=98 then PC = 11 else PC = 101 end;
            continue
        end
        -- block @ 101: 1 instruction
        if PC == 101 then
            PC = 47
            continue
        end
        -- block @ 102: 1 instruction
        if PC == 102 then
            PC = 53
            continue
        end
        -- block @ 104: 3 instructions
        if PC == 104 then
            R[15]=(22);
            R[16]=(150);
            PC = 114
            continue
        end
        -- block @ 108: 1 instruction
        if PC == 108 then
            if not(not(R[9]<44)) then PC = 109 else PC = 175 end;
            continue
        end
        -- block @ 109: 1 instruction
        if PC == 109 then
            PC = 166
            continue
        end
        -- block @ 110: 1 instruction
        if PC == 110 then
            if not(not(R[19]<=52)) then PC = 111 else PC = 157 end;
            continue
        end
        -- block @ 111: 1 instruction
        if PC == 111 then
            PC = 144
            continue
        end
        -- block @ 112: 2 instructions
        if PC == 112 then
            z=R; x=15;
            PC = 36
            continue
        end
        -- block @ 115: 4 instructions
        if PC == 115 then
            R[14]=(114);
            z=R; x=6;
            J=1; z[x]=J;
            PC = 16
            continue
        end
        -- block @ 120: 4 instructions
        if PC == 120 then
            R[20]=R[7];
            z=R; x=21; J=R;
            F=(6); J=(J[F]); (z)[x]=J;
            PC = 132
            continue
        end
        -- block @ 125: 1 instruction
        if PC == 125 then
            if not(not(22<R[18])) then PC = 126 else PC = 162 end;
            continue
        end
        -- block @ 126: 1 instruction
        if PC == 126 then
            PC = 193
            continue
        end
        -- block @ 127: 1 instruction
        if PC == 127 then
            PC = 107
            continue
        end
        -- block @ 129: 1 instruction
        if PC == 129 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 130 else R[16+3]=y; PC = 109 end;
            continue
        end
        -- block @ 130: 1 instruction
        if PC == 130 then
            PC = 53
            continue
        end
        -- block @ 131: 1 instruction
        if PC == 131 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 132 else R[9+3]=y; PC = 142 end;
            continue
        end
        -- block @ 132: 1 instruction
        if PC == 132 then
            PC = 10
            continue
        end
        -- block @ 133: 2 instructions
        if PC == 133 then
            R[23]=R[15];
            PC = 128
            continue
        end
        -- block @ 136: 1 instruction
        if PC == 136 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(16); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 128
            continue
        end
        -- block @ 137: 1 instruction
        if PC == 137 then
            if R[12]~=60 then PC = 99 else PC = 138 end;
            continue
        end
        -- block @ 138: 1 instruction
        if PC == 138 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 140: 2 instructions
        if PC == 140 then
            R[7]=R[1];
            PC = 36
            continue
        end
        -- block @ 143: 1 instruction
        if PC == 143 then
            if not(not(R[12]<57)) then PC = 144 else PC = 83 end;
            continue
        end
        -- block @ 144: 1 instruction
        if PC == 144 then
            PC = 164
            continue
        end
        -- block @ 145: 1 instruction
        if PC == 145 then
            if not(not(R[19]<=8)) then PC = 146 else PC = 34 end;
            continue
        end
        -- block @ 146: 1 instruction
        if PC == 146 then
            PC = 43
            continue
        end
        -- block @ 147: 2 instructions
        if PC == 147 then
            z=R; x=15;
            PC = 61
            continue
        end
        -- block @ 150: 7 instructions
        if PC == 150 then
            z=R; x=13; J=R;
            F=(4); J=(J[F]); (z)[x]=J;
            R[14]=R[7];
            R[15]=R[6];
            z=13; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[4]=R[13];
            PC = 187
            continue
        end
        -- block @ 158: 1 instruction
        if PC == 158 then
            if not(not(74<R[19])) then PC = 159 else PC = 59 end;
            continue
        end
        -- block @ 159: 3 instructions
        if PC == 159 then
            z=({...}); for a=1,3 do R[a]=z[a]; end;
            z=(Protos[0]); z[1][z[3]]=(567945344);
            PC = 177
            continue
        end
        -- block @ 163: 1 instruction
        if PC == 163 then
            PC = 5
            continue
        end
        -- block @ 165: 1 instruction
        if PC == 165 then
            PC = 130
            continue
        end
        -- block @ 167: 3 instructions
        if PC == 167 then
            R[10]=R[4];
            P=(10); (R[P])(); P-=1;
            if R[14]~=46 then PC = 170 else PC = 92 end;
            continue
        end
        -- block @ 170: 1 instruction
        if PC == 170 then
            PC = 55
            continue
        end
        -- block @ 171: 2 instructions
        if PC == 171 then
            R[4]=R[7];
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 173 else R[9+3]=y; PC = 136 end;
            continue
        end
        -- block @ 173: 2 instructions
        if PC == 173 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            if not R[7] then PC = 12 else PC = 175 end;
            continue
        end
        -- block @ 175: 1 instruction
        if PC == 175 then
            PC = 146
            continue
        end
        -- block @ 176: 1 instruction
        if PC == 176 then
            if not(not(27<R[9])) then PC = 177 else PC = 107 end;
            continue
        end
        -- block @ 177: 1 instruction
        if PC == 177 then
            PC = 80
            continue
        end
        -- block @ 178: 7 instructions
        if PC == 178 then
            R[5]=(163529781);
            R[6]=R[2];
            R[7]=Protos[2][48];
            R[8]=(517184430);
            R[9]=(44);
            R[10]=(61);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(9); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 130
            continue
        end
        -- block @ 186: 1 instruction
        if PC == 186 then
            if not R[7] then PC = 103 else PC = 187 end;
            continue
        end
        -- block @ 187: 1 instruction
        if PC == 187 then
            PC = 111
            continue
        end
        -- block @ 188: 3 instructions
        if PC == 188 then
            R[4]=R[3];
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            if not R[4] then PC = 15 else PC = 191 end;
            continue
        end
        -- block @ 191: 1 instruction
        if PC == 191 then
            PC = 126
            continue
        end
        -- block @ 192: 1 instruction
        if PC == 192 then
            PC = 128
            continue
        end
        -- block @ 194: 1 instruction
        if PC == 194 then
            if R[18]~=150 then PC = 195 else PC = 67 end;
            continue
        end
        -- block @ 195: 1 instruction
        if PC == 195 then
            PC = 72
            continue
        end
        break
    end
end

-- proto P5: 185 instructions, 131 blocks, 90 executed in the captured run
local function p5(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 9: 1 instruction
        if PC == 9 then
            PC = 72
            continue
        end
        -- block @ 11: 1 instruction
        if PC == 11 then
            PC = 89
            continue
        end
        -- block @ 12: 2 instructions
        if PC == 12 then
            R[8]=R[3];
            PC = 44
            continue
        end
        -- block @ 15: 1 instruction
        if PC == 15 then
            if not(96<=R[5]) then PC = 137 else PC = 16 end;
            continue
        end
        -- block @ 16: 1 instruction
        if PC == 16 then
            PC = 69
            continue
        end
        -- block @ 17: 1 instruction
        if PC == 17 then
            if not(not(R[5]<=20)) then PC = 18 else PC = 118 end;
            continue
        end
        -- block @ 18: 1 instruction
        if PC == 18 then
            PC = 50
            continue
        end
        -- block @ 19: 1 instruction
        if PC == 19 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 20 else R[10+3]=y; PC = 82 end;
            continue
        end
        -- block @ 20: 1 instruction
        if PC == 20 then
            PC = 128
            continue
        end
        -- block @ 21: 1 instruction
        if PC == 21 then
            if not(not(R[13]<19)) then PC = 22 else PC = 18 end;
            continue
        end
        -- block @ 22: 1 instruction
        if PC == 22 then
            PC = 133
            continue
        end
        -- block @ 23: 1 instruction
        if PC == 23 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(9); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 72
            continue
        end
        -- block @ 25: 1 instruction
        if PC == 25 then
            if not R[3] then PC = 5 else PC = 26 end;
            continue
        end
        -- block @ 26: 1 instruction
        if PC == 26 then
            PC = 116
            continue
        end
        -- block @ 28: 3 instructions
        if PC == 28 then
            R[4]=R[2];
            R[10]=Protos[0][48];
            PC = 114
            continue
        end
        -- block @ 32: 1 instruction
        if PC == 32 then
            PC = 18
            continue
        end
        -- block @ 34: 2 instructions
        if PC == 34 then
            R[10]=(72);
            PC = 52
            continue
        end
        -- block @ 37: 7 instructions
        if PC == 37 then
            z=(Protos[4]); z[1][z[3]]=(253448387);
            R[9]=R[9]-1671;
            z=k; x=334;
            z=s; x=298; z=(z[x]);
            R[295]=(R[302]%Y[H]);
            z=R; x=(408); J=B;
            PC = 8
            continue
        end
        -- block @ 45: 3 instructions
        if PC == 45 then
            R[10]=(8);
            R[11]=(41);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(10); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 18
            continue
        end
        -- block @ 49: 1 instruction
        if PC == 49 then
            if not(not(30<R[13])) then PC = 50 else PC = 20 end;
            continue
        end
        -- block @ 50: 1 instruction
        if PC == 50 then
            PC = 60
            continue
        end
        -- block @ 51: 1 instruction
        if PC == 51 then
            if R[5]~=20 then PC = 52 else PC = 11 end;
            continue
        end
        -- block @ 52: 1 instruction
        if PC == 52 then
            PC = 86
            continue
        end
        -- block @ 53: 1 instruction
        if PC == 53 then
            if not(not(R[10]<=72)) then PC = 54 else PC = 33 end;
            continue
        end
        -- block @ 54: 1 instruction
        if PC == 54 then
            PC = 120
            continue
        end
        -- block @ 55: 1 instruction
        if PC == 55 then
            PC = 18
            continue
        end
        -- block @ 57: 1 instruction
        if PC == 57 then
            if R[9]~=27 then PC = 80 else PC = 58 end;
            continue
        end
        -- block @ 58: 1 instruction
        if PC == 58 then
            PC = 74
            continue
        end
        -- block @ 59: 1 instruction
        if PC == 59 then
            if not(not(R[5]<120)) then PC = 60 else PC = 178 end;
            continue
        end
        -- block @ 60: 1 instruction
        if PC == 60 then
            PC = 112
            continue
        end
        -- block @ 61: 2 instructions
        if PC == 61 then
            z=R; x=3; J=R;
            PC = 18
            continue
        end
        -- block @ 64: 1 instruction
        if PC == 64 then
            if not(not(R[12]<208)) then PC = 65 else PC = 140 end;
            continue
        end
        -- block @ 65: 1 instruction
        if PC == 65 then
            PC = 84
            continue
        end
        -- block @ 66: 1 instruction
        if PC == 66 then
            if not(not(8<R[13])) then PC = 67 else PC = 48 end;
            continue
        end
        -- block @ 67: 1 instruction
        if PC == 67 then
            PC = 31
            continue
        end
        -- block @ 68: 1 instruction
        if PC == 68 then
            PC = 58
            continue
        end
        -- block @ 70: 2 instructions
        if PC == 70 then
            R[5]=(63);
            PC = 8
            continue
        end
        -- block @ 73: 1 instruction
        if PC == 73 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 74 else R[9+3]=y; PC = 63 end;
            continue
        end
        -- block @ 74: 1 instruction
        if PC == 74 then
            PC = 116
            continue
        end
        -- block @ 75: 2 instructions
        if PC == 75 then
            R[9]=(62);
            PC = 95
            continue
        end
        -- block @ 78: 2 instructions
        if PC == 78 then
            R[11]=(49);
            PC = 114
            continue
        end
        -- block @ 81: 1 instruction
        if PC == 81 then
            if R[9]~=62 then PC = 95 else PC = 82 end;
            continue
        end
        -- block @ 82: 1 instruction
        if PC == 82 then
            PC = 10
            continue
        end
        -- block @ 83: 1 instruction
        if PC == 83 then
            if not(not(R[13]<41)) then PC = 84 else PC = 183 end;
            continue
        end
        -- block @ 84: 1 instruction
        if PC == 84 then
            PC = 97
            continue
        end
        -- block @ 85: 1 instruction
        if PC == 85 then
            if not(not(56<R[12])) then PC = 86 else PC = 140 end;
            continue
        end
        -- block @ 86: 1 instruction
        if PC == 86 then
            PC = 131
            continue
        end
        -- block @ 87: 2 instructions
        if PC == 87 then
            R[4]=R[2];
            PC = 8
            continue
        end
        -- block @ 90: 5 instructions
        if PC == 90 then
            R[10]=R[3];
            z=R; x=11; J=R;
            F=(4); J=(J[F]); (z)[x]=J;
            z=10; R[z]=R[z](R[z+1]); P=z;
            PC = 24
            continue
        end
        -- block @ 96: 1 instruction
        if PC == 96 then
            if R[9]~=44 then PC = 56 else PC = 97 end;
            continue
        end
        -- block @ 97: 1 instruction
        if PC == 97 then
            PC = 180
            continue
        end
        -- block @ 98: 1 instruction
        if PC == 98 then
            if not(not(19<R[13])) then PC = 99 else PC = 183 end;
            continue
        end
        -- block @ 99: 1 instruction
        if PC == 99 then
            PC = 54
            continue
        end
        -- block @ 100: 3 instructions
        if PC == 100 then
            R[8]=Protos[0][48];
            R[9]=(56);
            PC = 22
            continue
        end
        -- block @ 104: 3 instructions
        if PC == 104 then
            z=Protos[2]; R[3]=z[1][z[3]];
            R[5]=(96);
            PC = 27
            continue
        end
        -- block @ 108: 4 instructions
        if PC == 108 then
            R[3][R[4]]=R[6];
            z=Protos[2]; R[3]=z[1][z[3]];
            z=R; x=5;
            PC = 8
            continue
        end
        -- block @ 113: 1 instruction
        if PC == 113 then
            PC = 147
            continue
        end
        -- block @ 115: 1 instruction
        if PC == 115 then
            if not(49<=R[11]) then PC = 77 else PC = 116 end;
            continue
        end
        -- block @ 116: 1 instruction
        if PC == 116 then
            PC = 156
            continue
        end
        -- block @ 117: 1 instruction
        if PC == 117 then
            PC = 173
            continue
        end
        -- block @ 119: 1 instruction
        if PC == 119 then
            if not(not(R[5]<=63)) then PC = 120 else PC = 163 end;
            continue
        end
        -- block @ 120: 1 instruction
        if PC == 120 then
            PC = 107
            continue
        end
        -- block @ 121: 3 instructions
        if PC == 121 then
            z=({...}); for a=1,2 do R[a]=z[a]; end;
            R[3]=Protos[0][48];
            PC = 67
            continue
        end
        -- block @ 125: 3 instructions
        if PC == 125 then
            z=Protos[3]; R[10]=z[1][z[3]];
            R[10]=R[10]-1724;
            PC = 36
            continue
        end
        -- block @ 129: 2 instructions
        if PC == 129 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 132: 1 instruction
        if PC == 132 then
            PC = 72
            continue
        end
        -- block @ 134: 1 instruction
        if PC == 134 then
            PC = 18
            continue
        end
        -- block @ 136: 1 instruction
        if PC == 136 then
            PC = 52
            continue
        end
        -- block @ 138: 2 instructions
        if PC == 138 then
            R[5]=(20);
            PC = 8
            continue
        end
        -- block @ 141: 1 instruction
        if PC == 141 then
            PC = 1
            continue
        end
        -- block @ 143: 1 instruction
        if PC == 143 then
            if not(not(132<R[12])) then PC = 144 else PC = 72 end;
            continue
        end
        -- block @ 144: 1 instruction
        if PC == 144 then
            if not R[3] then PC = 135 else PC = 145 end;
            continue
        end
        -- block @ 145: 2 instructions
        if PC == 145 then
            R[3]=Protos[0][4];
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 148: 8 instructions
        if PC == 148 then
            R[6]=Protos[0][4];
            z=R; x=7;
            J=759002332; z[x]=J;
            R[8]=R[3];
            R[9]=R[4];
            z=8; R[z]=R[z](R[z+1]); P=z;
            R[3]=R[8];
            if not R[3] then PC = 173 else PC = 156 end;
            continue
        end
        -- block @ 156: 1 instruction
        if PC == 156 then
            PC = 99
            continue
        end
        -- block @ 157: 3 instructions
        if PC == 157 then
            R[3]=(R[4]==R[10]);
            z=R; x=9;
            PC = 95
            continue
        end
        -- block @ 161: 2 instructions
        if PC == 161 then
            z=Protos[1]; R[3]=z[1][z[3]];
            PC = 58
            continue
        end
        -- block @ 164: 3 instructions
        if PC == 164 then
            z=Protos[3]; R[10]=z[1][z[3]];
            z=Protos[4]; R[11]=z[1][z[3]];
            PC = 14
            continue
        end
        -- block @ 168: 5 instructions
        if PC == 168 then
            z=(Protos[5]); z[1][z[3]]=(767406590);
            z=R; x=7;
            J=180201395; z[x]=J;
            z=(Protos[6]); z[1][z[3]]=(167314692);
            PC = 124
            continue
        end
        -- block @ 174: 2 instructions
        if PC == 174 then
            R[8]=Protos[0][53];
            if not R[3] then PC = 103 else PC = 176 end;
            continue
        end
        -- block @ 176: 2 instructions
        if PC == 176 then
            z=R; x=11; J=R;
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 179: 1 instruction
        if PC == 179 then
            if not(not(119<R[5])) then PC = 180 else PC = 58 end;
            continue
        end
        -- block @ 180: 1 instruction
        if PC == 180 then
            PC = 160
            continue
        end
        -- block @ 181: 2 instructions
        if PC == 181 then
            R[9]=(27);
            PC = 95
            continue
        end
        -- block @ 184: 1 instruction
        if PC == 184 then
            if not(not(R[13]<30)) then PC = 185 else PC = 48 end;
            continue
        end
        -- block @ 185: 1 instruction
        if PC == 185 then
            PC = 65
            continue
        end
        break
    end
end

-- proto P6: 153 instructions, 52 blocks, 135 executed in the captured run
local function p6(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 4
            continue
        end
        -- block @ 17: 1 instruction
        if PC == 17 then
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(6); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 7
            continue
        end
        -- block @ 18: 3 instructions
        if PC == 18 then
            R[10]=Protos[1];
            R[11]=Protos[0];
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(1); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 99
            continue
        end
        -- block @ 22: 1 instruction
        if PC == 22 then
            PC = 74
            continue
        end
        -- block @ 23: 5 instructions
        if PC == 23 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[16]=Protos[2];
            P=16; R[P]=R[P]();
            R[17]=Protos[0];
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 28 else R[6+3]=y; PC = 17 end;
            continue
        end
        -- block @ 28: 1 instruction
        if PC == 28 then
            PC = 132
            continue
        end
        -- block @ 29: 3 instructions
        if PC == 29 then
            R[14]=Protos[2];
            P=14; R[P]=R[P]();
            if not R[14] then PC = 3 else PC = 32 end;
            continue
        end
        -- block @ 32: 1 instruction
        if PC == 32 then
            PC = 54
            continue
        end
        -- block @ 33: 19 instructions
        if PC == 33 then
            z=13; x=1; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=11; R[z]=R[z](d[28](k,z+1,P)); P=z;
            R[5][R[10]]=R[11];
            R[12]=Protos[0];
            z=12; x=1; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=10; R[z]=R[z](d[28](k,z+1,P)); P=z;
            R[11]=Protos[1];
            R[12]=Protos[0];
            z=(12); P=z;
            z=k;
            x=P; J=k; F=P;
            J=(J[F]); J=J(); (z)[x]=(J);
            R[13]=Protos[0];
            z=13; x=1; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=11; R[z]=R[z](d[28](k,z+1,P)); P=z;
            R[5][R[10]]=R[11];
            R[10]=Protos[1];
            PC = 91
            continue
        end
        -- block @ 52: 2 instructions
        if PC == 52 then
            R[294]=d[22](314);
            if R[15] then PC = 107 else PC = 54 end;
            continue
        end
        -- block @ 54: 1 instruction
        if PC == 54 then
            PC = 21
            continue
        end
        -- block @ 55: 19 instructions
        if PC == 55 then
            R[14]=Protos[0];
            P=14; R[P]=R[P]();
            R[1]=(1);
            R[2]=Protos[0];
            P=2; R[P]=R[P]();
            R[3]=(1);
            R[5][R[14]]=R[15];
            R[14]=Protos[3];
            R[15]=Protos[2];
            z=(15); P=z;
            z=k;
            x=P; J=k; F=P;
            J=(J[F]); J=J(); (z)[x]=(J);
            R[16]=Protos[0];
            z=16; x=1; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=14; R[z]=R[z](d[28](k,z+1,P)); P=z;
            R[15]=d[22](1);
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 74 else R[6+3]=y; PC = 95 end;
            continue
        end
        -- block @ 74: 1 instruction
        if PC == 74 then
            PC = 86
            continue
        end
        -- block @ 75: 11 instructions
        if PC == 75 then
            R[15]=Protos[1];
            R[16]=Protos[2];
            z=(16); P=z;
            z=k;
            x=P; J=k; F=P;
            J=(J[F]); J=J(); (z)[x]=(J);
            R[8]=(1);
            R[15]=Protos[2];
            P=15; R[P]=R[P]();
            PC = 52
            continue
        end
        -- block @ 87: 4 instructions
        if PC == 87 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[17]=Protos[2];
            z=17; x=1; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            PC = 107
            continue
        end
        -- block @ 92: 3 instructions
        if PC == 92 then
            R[11]=Protos[0];
            P=11; R[P]=R[P]();
            PC = 142
            continue
        end
        -- block @ 96: 3 instructions
        if PC == 96 then
            R[10]=(0);
            R[11]=(255);
            PC = 104
            continue
        end
        -- block @ 100: 1 instruction
        if PC == 100 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 101 else R[1+3]=y; PC = 13 end;
            continue
        end
        -- block @ 101: 3 instructions
        if PC == 101 then
            z=17; x=1; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=(15); x=0; J=(R[z]); (d[2])(k,z+1,P,x+1,J);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(10); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 105
            continue
        end
        -- block @ 106: 1 instruction
        if PC == 106 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 107 else R[10+3]=y; PC = 28 end;
            continue
        end
        -- block @ 107: 1 instruction
        if PC == 107 then
            PC = 22
            continue
        end
        -- block @ 108: 11 instructions
        if PC == 108 then
            R[5][R[14]]=R[15];
            R[14]=Protos[0];
            P=14; R[P]=R[P]();
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[1]=Protos[1];
            R[2]=Protos[2];
            z=(2); P=z;
            z=k;
            x=P; J=k; F=P;
            J=(J[F]); J=J(); (z)[x]=(J);
            PC = 139
            continue
        end
        -- block @ 120: 12 instructions
        if PC == 120 then
            R[15]=Protos[2];
            z=(15); P=z;
            z=k;
            x=P; J=k; F=P;
            J=(J[F]); J=J(); (z)[x]=(J);
            R[5]=({});
            R[6]=(0);
            R[7]=(255);
            R[15]=Protos[2];
            P=15; R[P]=R[P]();
            if not R[15] then PC = 14 else PC = 132 end;
            continue
        end
        -- block @ 132: 1 instruction
        if PC == 132 then
            PC = 119
            continue
        end
        -- block @ 133: 6 instructions
        if PC == 133 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=R; x=6;
            J=1; z[x]=J;
            R[7]=Protos[0];
            P=7; R[P]=R[P]();
            PC = 1
            continue
        end
        -- block @ 140: 2 instructions
        if PC == 140 then
            R[3]=Protos[0];
            if i then for a,l in i do if not(a>=1) then else l[1]=(l); (l)[2]=R[a]; (l)[3]=2; i[a]=(nil); end; end; end; z=(1);
            return
        end
        -- block @ 143: 11 instructions
        if PC == 143 then
            z=12; x=1; J=0; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            z=10; R[z]=R[z](d[28](k,z+1,P)); P=z;
            R[11]=Protos[1];
            R[12]=Protos[0];
            z=(12); P=z;
            z=k;
            x=P; J=k; F=P;
            J=(J[F]); J=J(); (z)[x]=(J);
            R[13]=Protos[0];
            PC = 32
            continue
        end
        break
    end
end

-- proto P7: 129 instructions, 49 blocks, 9 executed in the captured run
local function p7(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 7: 1 instruction
        if PC == 7 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 8: 10 instructions
        if PC == 8 then
            R[2]=(R[2]%16777216);
            z=Protos[2]; z[1][z[3]]=R[2];
            z=Protos[2]; R[2]=z[1][z[3]];
            R[2]=(506613*R[2]);
            R[2]=(R[2]+8941452);
            R[2]=(R[2]%16777216);
            z=Protos[2]; z[1][z[3]]=R[2];
            z=({...}); for a=1,1 do R[a]=z[a]; end;
            z=Protos[0]; R[2]=z[1][z[3]];
            if R[1]==R[2] then PC = 18 else PC = 95 end;
            continue
        end
        -- block @ 18: 1 instruction
        if PC == 18 then
            PC = 47
            continue
        end
        -- block @ 19: 5 instructions
        if PC == 19 then
            z=Protos[4]; R[2]=z[1][z[3]];
            z=Protos[1]; R[3]=z[1][z[3]];
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[4]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=2; R[z]=R[z](R[z+1],R[z+2]); P=z;
            if R[2] then PC = 48 else PC = 24 end;
            continue
        end
        -- block @ 24: 1 instruction
        if PC == 24 then
            PC = 63
            continue
        end
        -- block @ 25: 4 instructions
        if PC == 25 then
            R[7]=(885989*R[7]);
            R[7]=(R[7]+12425754);
            R[7]=(R[7]%16777216);
            PC = 111
            continue
        end
        -- block @ 30: 5 instructions
        if PC == 30 then
            z=Protos[2]; z[1][z[3]]=R[2];
            z=Protos[2]; R[2]=z[1][z[3]];
            R[2]=(295525*R[2]);
            R[2]=(R[2]+3082026);
            PC = 125
            continue
        end
        -- block @ 35: 1 instruction
        if PC == 35 then
            z=136; x=(239); P=(z+x-1); if i then for w,u in i do if not(w>=1) then else(u)[1]=u; (u)[2]=(R[w]); u[3]=(2); (i)[w]=nil; end; end; end;
            return
        end
        -- block @ 36: 6 instructions
        if PC == 36 then
            R[3]=(R[3]%16777216);
            z=Protos[2]; z[1][z[3]]=R[3];
            z=Protos[2]; R[2]=z[1][z[3]];
            R[2]=(139057*R[2]);
            R[2]=(R[2]+15425564);
            PC = 70
            continue
        end
        -- block @ 43: 3 instructions
        if PC == 43 then
            R[8]=R[5];
            z=6; R[z]=R[z](R[z+1],R[z+2]); P=z;
            if not R[6] then PC = 111 else PC = 46 end;
            continue
        end
        -- block @ 46: 1 instruction
        if PC == 46 then
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 48: 1 instruction
        if PC == 48 then
            PC = 79
            continue
        end
        -- block @ 49: 4 instructions
        if PC == 49 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[3]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            R[4]=R[3];
            P=(4); (R[P])(); P-=1;
            PC = 59
            continue
        end
        -- block @ 54: 5 instructions
        if PC == 54 then
            R[2]=(82215*R[2]);
            z=R; x=(2);
            J=k; F=2; J=J[F];
            F=(15724394); J+=F; (z)[x]=(J);
            PC = 29
            continue
        end
        -- block @ 60: 3 instructions
        if PC == 60 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[5]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=Protos[4]; R[6]=z[1][z[3]];
            PC = 42
            continue
        end
        -- block @ 64: 1 instruction
        if PC == 64 then
            PC = 64
            continue
        end
        -- block @ 65: 5 instructions
        if PC == 65 then
            z=Protos[2]; R[3]=z[1][z[3]];
            R[3]=(496133*R[3]);
            z=R; x=(3);
            J=k; F=3; J=J[F];
            PC = 35
            continue
        end
        -- block @ 71: 4 instructions
        if PC == 71 then
            z=Protos[2]; z[1][z[3]]=R[2];
            z=Protos[2]; R[2]=z[1][z[3]];
            R[2]=(825827*R[2]);
            PC = 89
            continue
        end
        -- block @ 76: 3 instructions
        if PC == 76 then
            R[7]=(R[7]%16777216);
            z=Protos[2]; z[1][z[3]]=R[7];
            PC = 24
            continue
        end
        -- block @ 80: 9 instructions
        if PC == 80 then
            z=Protos[1]; R[2]=z[1][z[3]];
            z=2;
            P=(z); z=R;
            x=(P); z=z[x]; (z)();
            z=(P);
            x=(1); z-=x;
            P=z;
            PC = 53
            continue
        end
        -- block @ 90: 5 instructions
        if PC == 90 then
            z=Protos[2]; R[7]=z[1][z[3]];
            R[7]=(962355*R[7]);
            z=R; x=(7);
            J=k; F=7; J=J[F];
            PC = 75
            continue
        end
        -- block @ 96: 7 instructions
        if PC == 96 then
            R[2]=Protos[3];
            z=R; x=(3);
            J=k; F=1; J=J[F];
            F=(1); J+=F; (z)[x]=(J);
            z=(2); (R[z])(R[z+1]); P=(z-1);
            z=Protos[0]; R[2]=z[1][z[3]];
            PC = 109
            continue
        end
        -- block @ 104: 5 instructions
        if PC == 104 then
            z=Protos[2]; R[2]=z[1][z[3]];
            R[2]=(615311*R[2]);
            z=R; x=(2);
            J=k; F=2; J=J[F];
            PC = 7
            continue
        end
        -- block @ 110: 1 instruction
        if PC == 110 then
            if R[1]==R[2] then PC = 111 else PC = 103 end;
            continue
        end
        -- block @ 111: 1 instruction
        if PC == 111 then
            PC = 18
            continue
        end
        -- block @ 112: 1 instruction
        if PC == 112 then
            PC = 103
            continue
        end
        -- block @ 114: 11 instructions
        if PC == 114 then
            R[2]=(947367*R[2]);
            R[2]=(R[2]+13072495);
            R[2]=(R[2]%16777216);
            z=Protos[2]; z[1][z[3]]=R[2];
            R[2]=(R[2]%16777216);
            z=Protos[2]; z[1][z[3]]=R[2];
            z=Protos[2]; R[2]=z[1][z[3]];
            R[2]=(174101*R[2]);
            R[2]=(R[2]+6111885);
            R[2]=(R[2]%16777216);
            PC = 1
            continue
        end
        -- block @ 126: 4 instructions
        if PC == 126 then
            R[2]=(R[2]%16777216);
            z=Protos[2]; z[1][z[3]]=R[2];
            z=Protos[2]; R[2]=z[1][z[3]];
            PC = 113
            continue
        end
        break
    end
end

-- proto P8: 68 instructions, 27 blocks, 43 executed in the captured run
local function p8(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 3
            continue
        end
        -- block @ 6: 3 instructions
        if PC == 6 then
            R[9]=(825740331);
            z=Protos[2]; R[10]=z[1][z[3]];
            if R[10]~=43881844 then PC = 9 else PC = 41 end;
            continue
        end
        -- block @ 9: 1 instruction
        if PC == 9 then
            PC = 54
            continue
        end
        -- block @ 10: 8 instructions
        if PC == 10 then
            R[5]=Protos[0][48];
            R[6]=(594933950);
            R[7]=Protos[0][48];
            R[8]=(821500905);
            R[9]=(80);
            R[10]=(121);
            R[11]=(41);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(9); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 64
            continue
        end
        -- block @ 18: 1 instruction
        if PC == 18 then
            z=324; x=(74); P=(z+x-1); if i then for w,u in i do if not(w>=1) then else(u)[1]=u; (u)[2]=(R[w]); u[3]=(2); (i)[w]=nil; end; end; end;
            return
        end
        -- block @ 19: 1 instruction
        if PC == 19 then
            if R[12]~=80 then PC = 64 else PC = 20 end;
            continue
        end
        -- block @ 20: 19 instructions
        if PC == 20 then
            z=Protos[4]; z[1][z[3]]=R[10];
            z=(Protos[2]); z[1][z[3]]=(285978470);
            z=R; x=(6);
            J=k; F=6; J=J[F];
            F=(1938); J+=F; (z)[x]=(J);
            z=R; x=9;
            J=291100351; z[x]=J;
            z=(Protos[5]); z[1][z[3]]=(690410268);
            R[3]=(R[3]+1745);
            z=Protos[6]; R[10]=z[1][z[3]];
            R[10]=(R[10]+476);
            z=Protos[6]; z[1][z[3]]=R[10];
            R[8]=(373031606);
            J=J[z];
            R[177][R[224]]=R[96];
            R[129][R[279]]=R[257];
            R[21]=(d[4]);
            PC = 46
            continue
        end
        -- block @ 40: 1 instruction
        if PC == 40 then
            if R[12]~=121 then PC = 18 else PC = 41 end;
            continue
        end
        -- block @ 41: 1 instruction
        if PC == 41 then
            PC = 66
            continue
        end
        -- block @ 42: 4 instructions
        if PC == 42 then
            z=(Protos[3]); z[1][z[3]]=(597564891);
            z=Protos[4]; R[10]=z[1][z[3]];
            R[10]=(R[10]+183);
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 47: 3 instructions
        if PC == 47 then
            R[4]=R[1];
            z=R; x=5; J=R;
            PC = 64
            continue
        end
        -- block @ 51: 3 instructions
        if PC == 51 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[9]=R[7];
            PC = 59
            continue
        end
        -- block @ 55: 4 instructions
        if PC == 55 then
            R[7]=(not R[7]);
            z=({...}); for a=1,2 do R[a]=z[a]; end;
            R[3]=(406477128);
            PC = 9
            continue
        end
        -- block @ 60: 4 instructions
        if PC == 60 then
            R[11]=R[5];
            z=9; R[z]=R[z](R[z+1],R[z+2]); P=z;
            z=R; x=7; J=R;
            PC = 1
            continue
        end
        -- block @ 65: 1 instruction
        if PC == 65 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 66 else R[9+3]=y; PC = 39 end;
            continue
        end
        -- block @ 66: 1 instruction
        if PC == 66 then
            PC = 50
            continue
        end
        -- block @ 67: 2 instructions
        if PC == 67 then
            z=Protos[1]; R[7]=z[1][z[3]];
            PC = 64
            continue
        end
        break
    end
end

-- proto P9: 65 instructions, 36 blocks, 42 executed in the captured run
local function p9(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 3: 1 instruction
        if PC == 3 then
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 5: 2 instructions
        if PC == 5 then
            R[7]=(R[6]*1);
            PC = 46
            continue
        end
        -- block @ 8: 1 instruction
        if PC == 8 then
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 10: 7 instructions
        if PC == 10 then
            R[5]=R[2];
            z=R; x=6;
            J=1; z[x]=J;
            R[7]=(20);
            z=4; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[4]=(R[4]*4294967296);
            PC = 29
            continue
        end
        -- block @ 18: 1 instruction
        if PC == 18 then
            PC = 44
            continue
        end
        -- block @ 19: 4 instructions
        if PC == 19 then
            R[8]=(32);
            z=6; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[6]=(1^R[6]);
            PC = 63
            continue
        end
        -- block @ 24: 5 instructions
        if PC == 24 then
            R[7]=R[5]-1023;
            R[7]=(2^R[7]);
            R[7]=R[6]*R[7];
            R[8]=R[4]/4503599627370496;
            PC = 1
            continue
        end
        -- block @ 30: 4 instructions
        if PC == 30 then
            R[5]=Protos[1];
            z=R; x=6; J=R;
            F=(2); J=(J[F]); (z)[x]=J;
            PC = 50
            continue
        end
        -- block @ 35: 1 instruction
        if PC == 35 then
            PC = 60
            continue
        end
        -- block @ 36: 7 instructions
        if PC == 36 then
            R[1]=Protos[0];
            P=1; R[P]=R[P]();
            R[2]=Protos[0];
            P=2; R[P]=R[P]();
            R[3]=(1);
            R[4]=Protos[1];
            PC = 9
            continue
        end
        -- block @ 43: 1 instruction
        if PC == 43 then
            PC = 35
            continue
        end
        -- block @ 45: 1 instruction
        if PC == 45 then
            if R[4]~=0 then PC = 57 else PC = 46 end;
            continue
        end
        -- block @ 46: 1 instruction
        if PC == 46 then
            PC = 7
            continue
        end
        -- block @ 47: 1 instruction
        if PC == 47 then
            if R[7] then PC = 43 else PC = 48 end;
            continue
        end
        -- block @ 48: 2 instructions
        if PC == 48 then
            R[7]=(R[6]*0);
            PC = 43
            continue
        end
        -- block @ 51: 4 instructions
        if PC == 51 then
            R[8]=(31);
            z=5; P=z+4-1; R[z]=R[z](d[28](k,z+1,P)); P=(z);
            R[6]=Protos[1];
            PC = 18
            continue
        end
        -- block @ 56: 1 instruction
        if PC == 56 then
            if R[5]~=2047 then PC = 23 else PC = 57 end;
            continue
        end
        -- block @ 57: 1 instruction
        if PC == 57 then
            PC = 34
            continue
        end
        -- block @ 58: 2 instructions
        if PC == 58 then
            R[5]=(1);
            PC = 23
            continue
        end
        -- block @ 61: 2 instructions
        if PC == 61 then
            R[7]=(R[4]==0);
            if not R[7] then PC = 46 else PC = 63 end;
            continue
        end
        -- block @ 63: 1 instruction
        if PC == 63 then
            PC = 4
            continue
        end
        -- block @ 64: 1 instruction
        if PC == 64 then
            if R[5]~=0 then PC = 55 else PC = 65 end;
            continue
        end
        -- block @ 65: 1 instruction
        if PC == 65 then
            PC = 17
            continue
        end
        break
    end
end

-- proto P10: 63 instructions, 24 blocks, 38 executed in the captured run
local function p10(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 5 instructions
        if PC == 1 then
            R[165]=R[359]-R[319];
            z=({...}); for a=1,1 do R[a]=z[a]; end;
            R[2]=(15);
            R[3]=(28);
            PC = 1
            continue
        end
        -- block @ 14: 3 instructions
        if PC == 14 then
            z=Protos[0]; R[6]=z[1][z[3]];
            R[6]=(R[6]+1);
            PC = 8
            continue
        end
        -- block @ 18: 3 instructions
        if PC == 18 then
            z=(Protos[3]); z[1][z[3]]=(546029809);
            z=(Protos[6]); z[1][z[3]]=(990097038);
            PC = 26
            continue
        end
        -- block @ 22: 4 instructions
        if PC == 22 then
            R[2]=(576890216);
            z=(Protos[4]); z[1][z[3]]=(12540478);
            z=(Protos[5]); z[1][z[3]]=(178307653);
            PC = 17
            continue
        end
        -- block @ 26: 1 instruction
        if PC == 26 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 27: 1 instruction
        if PC == 27 then
            PC = 7
            continue
        end
        -- block @ 28: 19 instructions
        if PC == 28 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=R; x=2;
            J=24276421; z[x]=J;
            R[3]=(846425820);
            z=Protos[7]; R[4]=z[1][z[3]];
            R[4]=R[4]-1718;
            z=s; x=7;
            z=(z[x]);
            x=(z); J=1; x=(x[J]);
            J=z; z=3;
            J=J[z];
            z=k; F=(4);
            z=z[F]; (x)[J]=z;
            x=(Y[H]); J=(D[H]); (z)[x]=(J);
            z=(s); x=(162);
            J=k; F=208; J=J[F];
            R[339]=(R[426]//R[174]);
            z=52; R[z]=R[z](R[z+1]); P=z;
            PC = 7
            continue
        end
        -- block @ 48: 1 instruction
        if PC == 48 then
            PC = 27
            continue
        end
        -- block @ 50: 1 instruction
        if PC == 50 then
            if not(not(R[5]<28)) then PC = 51 else PC = 8 end;
            continue
        end
        -- block @ 51: 2 instructions
        if PC == 51 then
            z=Protos[3]; R[4]=z[1][z[3]];
            if R[4]~=43881387 then PC = 53 else PC = 21 end;
            continue
        end
        -- block @ 53: 1 instruction
        if PC == 53 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 54 else R[2+3]=y; PC = 47 end;
            continue
        end
        -- block @ 54: 10 instructions
        if PC == 54 then
            z=Protos[1]; R[6]=z[1][z[3]];
            R[7]=Protos[2];
            z=Protos[0]; R[8]=z[1][z[3]];
            z=R; x=(9);
            J=R; F=1;
            J=J[F]; F=256;
            J%=F;
            z[x]=J;
            z=6; P=z+4-1; R[z](d[28](k,z+1,P)); P=z-1;
            PC = 8
            continue
        end
        break
    end
end

-- proto P11: 56 instructions, 25 blocks, 32 executed in the captured run
local function p11(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 3
            continue
        end
        -- block @ 8: 2 instructions
        if PC == 8 then
            z=Protos[5]; z[1][z[3]]=R[4];
            PC = 49
            continue
        end
        -- block @ 11: 10 instructions
        if PC == 11 then
            z=Protos[1]; z[1][z[3]]=R[4];
            z=s; x=2;
            z=(z[x]);
            x=(z); J=1; x=(x[J]);
            J=z; z=3;
            J=J[z];
            z=k; F=(4);
            z=z[F]; (x)[J]=z;
            z=Protos[3]; z[1][z[3]]=R[4];
            PC = 1
            continue
        end
        -- block @ 22: 17 instructions
        if PC == 22 then
            R[1]=(6);
            R[0]=R[0][R[1]];
            R[1]=({});
            R[2]=(1);
            R[3]=(#R[0]);
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[2]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=2;
            P=(z); z=R;
            x=(P); z=z[x]; (z)();
            z=(P);
            x=(1); z-=x;
            P=z;
            for w=0,3 do R[w]=nil; end;
            for w=3,6 do R[w]=nil; end;
            for w=6,9 do R[w]=nil; end;
            PC = 21
            continue
        end
        -- block @ 40: 1 instruction
        if PC == 40 then
            if R[1]~=89 then PC = 49 else PC = 41 end;
            continue
        end
        -- block @ 41: 1 instruction
        if PC == 41 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 42 else R[2+3]=y; PC = 51 end;
            continue
        end
        -- block @ 42: 1 instruction
        if PC == 42 then
            PC = 54
            continue
        end
        -- block @ 43: 1 instruction
        if PC == 43 then
            PC = 44
            continue
        end
        -- block @ 45: 4 instructions
        if PC == 45 then
            R[2]=Protos[6][48];
            z=k;
            x=(4); J=nil; (z)[x]=(J);
            PC = 10
            continue
        end
        -- block @ 50: 1 instruction
        if PC == 50 then
            if R[1]~=100 then PC = 39 else PC = 51 end;
            continue
        end
        -- block @ 51: 1 instruction
        if PC == 51 then
            PC = 43
            continue
        end
        -- block @ 52: 2 instructions
        if PC == 52 then
            R[0][R[5]]=R[1];
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(2); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 7
            continue
        end
        -- block @ 55: 2 instructions
        if PC == 55 then
            R[1]=(89);
            PC = 49
            continue
        end
        break
    end
end

-- proto P12: 53 instructions, 17 blocks, 13 executed in the captured run
local function p12(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 1
            continue
        end
        -- block @ 5: 1 instruction
        if PC == 5 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 6: 5 instructions
        if PC == 6 then
            R[4]=(2002649144);
            z=(3); (R[z])(R[z+1]); P=(z-1);
            R[3]=(696081263);
            R[4]=(37629799);
            if R[2]~=291148401 then PC = 36 else PC = 11 end;
            continue
        end
        -- block @ 11: 1 instruction
        if PC == 11 then
            PC = 26
            continue
        end
        -- block @ 12: 4 instructions
        if PC == 12 then
            z=(Protos[4]); z[1][z[3]]=(285860242);
            R[2]=(81505844);
            R[3]=(238471549);
            PC = 43
            continue
        end
        -- block @ 17: 9 instructions
        if PC == 17 then
            R[5]=R[5]-1751;
            z=s; x=2;
            z=(z[x]);
            x=(z); J=1; x=(x[J]);
            J=z; z=3;
            J=J[z];
            z=k; F=(5);
            z=z[F]; (x)[J]=z;
            PC = 11
            continue
        end
        -- block @ 27: 4 instructions
        if PC == 27 then
            R[1]=(262155559);
            z=Protos[0]; R[2]=z[1][z[3]];
            z=R; x=3;
            PC = 31
            continue
        end
        -- block @ 32: 4 instructions
        if PC == 32 then
            z=(2); (R[z])(R[z+1]); P=(z-1);
            R[2]=(291148401);
            z=Protos[0]; R[3]=z[1][z[3]];
            PC = 5
            continue
        end
        -- block @ 36: 7 instructions
        if PC == 36 then
            z=(z[x]);
            z=Protos[1]; R[5]=z[1][z[3]];
            z=R; x=(5);
            J=k; F=5; J=J[F];
            F=(219); J+=F; (z)[x]=(J);
            z=Protos[1]; z[1][z[3]]=R[5];
            PC = 16
            continue
        end
        -- block @ 44: 10 instructions
        if PC == 44 then
            R[1]=(433862368);
            z=Protos[5]; R[5]=z[1][z[3]];
            R[5]=(R[5]+787);
            z=Protos[5]; z[1][z[3]]=R[5];
            z=R; x=341; z=(z[x]);
            R[475]=R[260]-D[H];
            R[288]=R[282]-R[179];
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[388]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=(295); x=(190); J=R;
            PC = 3
            continue
        end
        break
    end
end

-- proto P13: 49 instructions, 26 blocks, 48 executed in the captured run
local function p13(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 7: 2 instructions
        if PC == 7 then
            R[4]=R[4]+R[3];
            if not(not(0<R[1])) then PC = 9 else PC = 16 end;
            continue
        end
        -- block @ 9: 1 instruction
        if PC == 9 then
            PC = 25
            continue
        end
        -- block @ 10: 4 instructions
        if PC == 10 then
            R[5]=R[4];
            z=({...}); for a=1,2 do R[a]=z[a]; end;
            R[3]=(1);
            PC = 44
            continue
        end
        -- block @ 15: 1 instruction
        if PC == 15 then
            PC = 39
            continue
        end
        -- block @ 17: 1 instruction
        if PC == 17 then
            if not(not(R[1]<R[2])) then PC = 18 else PC = 39 end;
            continue
        end
        -- block @ 18: 1 instruction
        if PC == 18 then
            PC = 14
            continue
        end
        -- block @ 19: 6 instructions
        if PC == 19 then
            z=R; x=(5);
            J=R; F=1;
            J=J[F]; F=2;
            J%=F;
            z[x]=J;
            if not(not(0<R[5])) then PC = 25 else PC = 5 end;
            continue
        end
        -- block @ 25: 1 instruction
        if PC == 25 then
            PC = 1
            continue
        end
        -- block @ 26: 1 instruction
        if PC == 26 then
            if not(not(0<R[2])) then PC = 27 else PC = 16 end;
            continue
        end
        -- block @ 27: 8 instructions
        if PC == 27 then
            z=16; (R[z])(d[28](k,z+1,P)); P=z-1;
            z=R; x=(5);
            J=R; F=1;
            J=J[F]; F=2;
            J%=F;
            z[x]=J;
            R[6]=(R[2]%2);
            if R[5]==R[6] then PC = 45 else PC = 36 end;
            continue
        end
        -- block @ 36: 3 instructions
        if PC == 36 then
            R[6]=R[1]-R[5];
            R[1]=R[6]/2;
            PC = 39
            continue
        end
        -- block @ 40: 1 instruction
        if PC == 40 then
            if not(not(0<R[1])) then PC = 41 else PC = 9 end;
            continue
        end
        -- block @ 41: 1 instruction
        if PC == 41 then
            PC = 18
            continue
        end
        -- block @ 42: 2 instructions
        if PC == 42 then
            R[2]=R[7]/2;
            PC = 4
            continue
        end
        -- block @ 45: 5 instructions
        if PC == 45 then
            R[4]=R[4]+R[3];
            R[7]=R[1]-R[5];
            R[1]=R[7]/2;
            R[7]=R[2]-R[6];
            PC = 41
            continue
        end
        break
    end
end

-- proto P14: 45 instructions, 23 blocks, 29 executed in the captured run
local function p14(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 3: 3 instructions
        if PC == 3 then
            z=(Protos[5]); z[1][z[3]]=(362582213);
            z=Protos[6]; R[5]=z[1][z[3]];
            PC = 8
            continue
        end
        -- block @ 7: 1 instruction
        if PC == 7 then
            PC = 18
            continue
        end
        -- block @ 9: 4 instructions
        if PC == 9 then
            z=Protos[6]; z[1][z[3]]=R[5];
            z=(Protos[0]); z[1][z[3]]=(663868946);
            z=(Protos[7]); z[1][z[3]]=(931117068);
            if i then for a,S in i do if a>=1 then(S)[1]=S; (S)[2]=R[a]; S[3]=2; i[a]=(nil); end; end; end;
            return
        end
        -- block @ 13: 5 instructions
        if PC == 13 then
            z=Protos[213]; R[368]=z[1][z[3]];
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=({...}); for a=1,1 do R[a]=z[a]; end;
            z=(Protos[0]); z[1][z[3]]=(398375868);
            PC = 27
            continue
        end
        -- block @ 19: 1 instruction
        if PC == 19 then
            z=(false); y+=Q;
            if not(Q<=0) then z=y<=E; else z=y>=E; end; if not(z) then PC = 20 else R[4+3]=y; PC = 39 end;
            continue
        end
        -- block @ 20: 5 instructions
        if PC == 20 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[2]=R[2][R[3]];
            R[2]=(not R[2]);
            z=R; x=4;
            PC = 34
            continue
        end
        -- block @ 26: 1 instruction
        if PC == 26 then
            PC = 6
            continue
        end
        -- block @ 27: 5 instructions
        if PC == 27 then
            R[179]=(B[l[H]]);
            R[3]=Protos[2][48];
            R[4]=(52);
            R[5]=(126);
            S={[3]=y,[1]=S,[2]=E,[5]=Q}; z=(4); Q=(R[z+2]+0); E=(R[z+1]+0); y=R[z]-Q;
            PC = 18
            continue
        end
        -- block @ 33: 1 instruction
        if PC == 33 then
            PC = 18
            continue
        end
        -- block @ 35: 2 instructions
        if PC == 35 then
            z=Protos[3]; R[5]=z[1][z[3]];
            if R[5]~=889475809 then PC = 41 else PC = 37 end;
            continue
        end
        -- block @ 37: 2 instructions
        if PC == 37 then
            z=R; x=5; J=R;
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 40: 1 instruction
        if PC == 40 then
            if not(not(R[7]<=52)) then PC = 41 else PC = 32 end;
            continue
        end
        -- block @ 41: 1 instruction
        if PC == 41 then
            PC = 25
            continue
        end
        -- block @ 42: 4 instructions
        if PC == 42 then
            z=(Protos[4]); z[1][z[3]]=(780346613);
            R[4]=(R[4]+86);
            z=(Protos[3]); z[1][z[3]]=(184034958);
            PC = 1
            continue
        end
        break
    end
end

-- proto P15: 45 instructions, 15 blocks, 10 executed in the captured run
local function p15(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 5: 6 instructions
        if PC == 5 then
            R[2]=(R[2]+760);
            z=Protos[6]; z[1][z[3]]=R[2];
            z=(Protos[7]); z[1][z[3]]=(778826120);
            J=J[F];
            if i then for a,S in i do if a>=1 then(S)[1]=S; (S)[2]=R[a]; S[3]=2; i[a]=(nil); end; end; end;
            return
        end
        -- block @ 11: 2 instructions
        if PC == 11 then
            R[438]=(d[30](R[51],Y[H]));
            z=175; x=(432); P=(z+x-1); if i then for w,u in i do if not(w>=1) then else(u)[1]=u; (u)[2]=(R[w]); u[3]=(2); (i)[w]=nil; end; end; end;
            return
        end
        -- block @ 13: 2 instructions
        if PC == 13 then
            v,I=d[54](...);
            PC = 27
            continue
        end
        -- block @ 15: 6 instructions
        if PC == 15 then
            J%=F;
            z=Protos[4]; R[2]=z[1][z[3]];
            z=R; x=(2);
            J=k; F=2; J=J[F];
            F=(1895); J+=F; (z)[x]=(J);
            PC = 31
            continue
        end
        -- block @ 22: 1 instruction
        if PC == 22 then
            if R[2]~=43883199 then PC = 23 else PC = 15 end;
            continue
        end
        -- block @ 23: 4 instructions
        if PC == 23 then
            z=(Protos[0]); z[1][z[3]]=(235024817);
            R[1]=(484038720);
            z=(Protos[1]); z[1][z[3]]=(977543371);
            PC = 21
            continue
        end
        -- block @ 28: 3 instructions
        if PC == 28 then
            z=(Protos[2]); z[1][z[3]]=(712159996);
            R[1]=R[1]-1421;
            PC = 1
            continue
        end
        -- block @ 32: 14 instructions
        if PC == 32 then
            z=Protos[0]; R[2]=z[1][z[3]];
            R[2]=R[2]-1886;
            z=s; x=0;
            z=(z[x]);
            x=(z); J=1; x=(x[J]);
            J=z; z=3;
            J=J[z];
            z=k; F=(2);
            z=z[F]; (x)[J]=z;
            z=(Protos[1]); z[1][z[3]]=(625118506);
            z=(Protos[5]); z[1][z[3]]=(810429009);
            z=Protos[3]; R[2]=z[1][z[3]];
            P=(2); (R[P])(); P-=1;
            PC = 27
            continue
        end
        break
    end
end

-- proto P16: 43 instructions, 9 blocks, 10 executed in the captured run
local function p16(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 4
            continue
        end
        -- block @ 5: 9 instructions
        if PC == 5 then
            F=R; U=(397);
            R[1]=(837422083);
            z=(Protos[4]); z[1][z[3]]=(667269466);
            z=(Protos[5]); z[1][z[3]]=(495545518);
            z=Protos[6]; R[2]=z[1][z[3]];
            z=(Protos[0]); z[1][z[3]]=(425477406);
            R[1]=(662796620);
            z=Protos[0]; R[2]=z[1][z[3]];
            if R[2]~=425477406 then PC = 32 else PC = 14 end;
            continue
        end
        -- block @ 14: 16 instructions
        if PC == 14 then
            z=Protos[2]; R[2]=z[1][z[3]];
            P=2; R[P]=R[P]();
            z=Protos[1]; z[1][z[3]]=R[2];
            R[2]=(R[2]+941);
            z=s; x=6;
            z=(z[x]);
            x=(z); J=1; x=(x[J]);
            J=z; z=3;
            J=J[z];
            z=k; F=(2);
            z=z[F]; (x)[J]=z;
            z=Protos[7]; R[2]=z[1][z[3]];
            R[2]=R[2]-1125;
            z=Protos[7]; z[1][z[3]]=R[2];
            z=207; (R[z])(d[28](k,z+1,P)); P=z-1;
            if i then for a,S in i do if a>=1 then(S)[1]=S; (S)[2]=R[a]; S[3]=2; i[a]=(nil); end; end; end;
            return
        end
        -- block @ 30: 2 instructions
        if PC == 30 then
            z=R; x=172;
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 33: 11 instructions
        if PC == 33 then
            z=Protos[3]; R[2]=z[1][z[3]];
            R[2]=R[2]-1825;
            z=s; x=3;
            z=(z[x]);
            x=(z); J=1; x=(x[J]);
            J=z; z=3;
            J=J[z];
            z=k; F=(2);
            z=z[F]; (x)[J]=z;
            z=(Protos[0]); z[1][z[3]]=(534873032);
            PC = 5
            continue
        end
        break
    end
end

-- proto P17: 41 instructions, 18 blocks, 37 executed in the captured run
local function p17(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 5 instructions
        if PC == 1 then
            R[204]=({});
            R[5]=R[3]-1;
            R[6]=R[2]-1;
            R[5]=R[5]-R[6];
            PC = 13
            continue
        end
        -- block @ 14: 6 instructions
        if PC == 14 then
            R[5]=(2^R[5]);
            z=R; x=4;
            J=k; F=(4); J=J[F];
            F=R; U=(5);
            F=F[U]; J%=F; z[x]=J;
            PC = 20
            continue
        end
        -- block @ 21: 1 instruction
        if PC == 21 then
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 23: 9 instructions
        if PC == 23 then
            R[4]=R[2]-1;
            R[4]=(2^R[4]);
            R[5]=R[4]+R[4];
            z=R; x=5;
            J=k; F=(1); J=J[F];
            F=R; U=(5);
            F=F[U]; J%=F; z[x]=J;
            R[5]=(R[5]>=R[4]);
            if not R[5] then PC = 5 else PC = 32 end;
            continue
        end
        -- block @ 32: 1 instruction
        if PC == 32 then
            PC = 32
            continue
        end
        -- block @ 33: 2 instructions
        if PC == 33 then
            z=({...}); for a=1,3 do R[a]=z[a]; end;
            if not R[3] then PC = 22 else PC = 35 end;
            continue
        end
        -- block @ 35: 1 instruction
        if PC == 35 then
            if R[5] then PC = 4 else PC = 36 end;
            continue
        end
        -- block @ 36: 6 instructions
        if PC == 36 then
            R[4]=R[2]-1;
            R[4]=(2^R[4]);
            R[4]=(R[1]/R[4]);
            R[5]=(0);
            R[5]=(1);
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        break
    end
end

-- proto P18: 39 instructions, 10 blocks, 8 executed in the captured run
local function p18(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 1
            continue
        end
        -- block @ 3: 1 instruction
        if PC == 3 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 4: 3 instructions
        if PC == 4 then
            z=Protos[1]; R[6]=z[1][z[3]];
            R[6]=(R[6]+1551);
            PC = 7
            continue
        end
        -- block @ 8: 18 instructions
        if PC == 8 then
            z=Protos[2]; R[6]=z[1][z[3]];
            z=R; x=(6);
            J=k; F=6; J=J[F];
            F=(1924); J+=F; (z)[x]=(J);
            z=Protos[2]; z[1][z[3]]=R[6];
            z=(Protos[3]); z[1][z[3]]=(533655646);
            R[5]=(R[5]+446);
            z=(Protos[4]); z[1][z[3]]=(147992877);
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            z=(s); x=(93);
            z=k; x=134;
            z=R; x=484;
            d[17][451]=R[267];
            R[454]=R[335]-R[169];
            z=({...}); for a=1,3 do R[a]=z[a]; end;
            R[4]=(1030609678);
            R[5]=(548948576);
            if R[4]~=1030609821 then PC = 26 else PC = 28 end;
            continue
        end
        -- block @ 26: 1 instruction
        if PC == 26 then
            PC = 1
            continue
        end
        -- block @ 29: 11 instructions
        if PC == 29 then
            z=Protos[0]; R[6]=z[1][z[3]];
            R[6]=R[6]-245;
            z=s; x=0;
            z=(z[x]);
            x=(z); J=1; x=(x[J]);
            J=z; z=3;
            J=J[z];
            z=k; F=(6);
            z=z[F]; (x)[J]=z;
            R[4]=(57797536);
            PC = 3
            continue
        end
        break
    end
end

-- proto P19: 38 instructions, 11 blocks, 37 executed in the captured run
local function p19(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 1
            continue
        end
        -- block @ 6: 3 instructions
        if PC == 6 then
            z=6; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[6]=(R[6]*65536);
            PC = 13
            continue
        end
        -- block @ 10: 3 instructions
        if PC == 10 then
            R[8]=(8);
            z=6; R[z]=R[z](R[z+1],R[z+2]); P=z;
            if i then for a,f in i do if a>=1 then(f)[1]=f; (f)[2]=R[a]; f[3]=2; (i)[a]=(nil); end; end; end;
            return
        end
        -- block @ 14: 24 instructions
        if PC == 14 then
            R[6]=Protos[2];
            z=R; x=7; J=R;
            F=(2); J=(J[F]); (z)[x]=J;
            R[8]=(16);
            z=6; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[1]=Protos[0];
            R[2]=Protos[1];
            z=R; x=3;
            J=1; z[x]=J;
            R[4]=(4);
            z=1; x=4; J=5; if x==0 then else P=z+x-1; end; F,U=nil; if x==1 then F,U=d[54](R[z]()); else F,U=d[54](R[z](d[28](k,z+1,P))); end; if J~=1 then if J~=0 then F=(z+J-2); P=F+1; else F=F+z-1; P=F; end; x=(0); for w=z,F do x+=1; R[w]=U[x]; end; else P=(z-1); end;
            R[5]=Protos[2];
            R[6]=R[4];
            R[7]=(64);
            z=5; R[z]=R[z](R[z+1],R[z+2]); P=z;
            R[5]=(R[5]*16777216);
            R[6]=Protos[2];
            R[7]=R[3];
            R[8]=(32);
            R[6]=(R[6]*256);
            R[5]=R[5]+R[6];
            R[6]=Protos[2];
            R[7]=R[1];
            PC = 9
            continue
        end
        -- block @ 38: 1 instruction
        if PC == 38 then
            F=(Y[H]); J+=F; (z)[x]=(J);
            PC = 39
            continue
        end
        break
    end
end

-- proto P20: 37 instructions, 13 blocks, 23 executed in the captured run
local function p20(...)
    local R = {}
    local PC = 1
    while true do
        -- block @ 1: 1 instruction
        if PC == 1 then
            PC = 3
            continue
        end
        -- block @ 6: 1 instruction
        if PC == 6 then
            PC = 25
            continue
        end
        -- block @ 7: 6 instructions
        if PC == 7 then
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[7]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[8]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[9]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            z=4; R[z]=R[z](R[z+1],R[z+2]); P=z;
            z=(D[H]); x=(z[8]); J=#x; F=(J>0 and{}); U=d[55](z,F); d[29](U,B); R[5]=U; if F then for f=1,J do z=(x[f]); U=z[1]; _=z[3]; if U==2 then F[f-1]=(R[_]); elseif U==3 then if not i then i=({}); end; t=i[_]; if not(not t) then else t=({[3]=_,[1]=k}); i[_]=t; end; F[f-1]=t; else if U~=1 then else F[f-1]=(Protos[_]); end; end; end; end;
            PC = 6
            continue
        end
        -- block @ 14: 1 instruction
        if PC == 14 then
            if not(i) then else for w,u in i do if w>=1 then u[1]=(u); u[2]=R[w]; u[3]=(2); i[w]=(nil); end; end; end;
            return
        end
        -- block @ 15: 10 instructions
        if PC == 15 then
            y=S[3]; E=(S[2]); Q=S[5]; S=(S[1]);
            R[2]=(R[2]["rep"]);
            z=R; x=4; J=R;
            F=(2); J=(J[F]); (z)[x]=J;
            R[5]=(" ");
            R[6]=(8);
            v,I=d[54](...);
            R[1]=(B["string"]);
            R[1]=(R[1]["byte"]);
            PC = 15
            continue
        end
        -- block @ 26: 11 instructions
        if PC == 26 then
            R[10]=R[9];
            z=10;
            P=(z); z=R;
            x=(P); z=z[x]; (z)();
            z=(P);
            x=(1); z-=x;
            P=z;
            R[10]=R[9];
            P=10; R[P]=R[P]();
            if not R[10] then PC = 13 else PC = 37 end;
            continue
        end
        -- block @ 37: 1 instruction
        if PC == 37 then
            PC = 1
            continue
        end
        break
    end
end

