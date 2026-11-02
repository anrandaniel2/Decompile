# Cross-check: off-the-shelf Luraph deobfuscator

- tool: `https://github.com/caomod2077/Deobfuscator-Luraph-V15.git` @ `892b48ac200e`
- purpose: independent second opinion on obfuscator/version and, where the tool's v14.x path cooperates, a devirtualised body to compare with this repo's own recovery
- this step is advisory (CI marks it `continue-on-error`)

> **Reading this report.** The detector and this repository agree on the family
> (Luraph v14.x). The behaviour trace, however, stops immediately: the tool's
> offline engine resolves the obfuscator's numeric stdlib table differently, so the
> base-85 pool decoder is handed a wrong buffer size and the stage dies in
> `buffer.create`. That table is built from global identities at run time - see the
> *Obfuscator library table* section of `BEHAVIOR.md` for the live resolution this
> repository's harness obtains instead.

## `/home/user/Decompile/out/stages/stageA.luau`

### Detection

```
stageA.luau	luraph_v14	0.80	Luraph v14.x
```

### Behaviour trace (`--no-devirt`)

```

```

### stderr

```
[*] processing /home/user/Decompile/out/stages/stageA.luau
[*] obfuscator: Luraph v14.x (detected, 0.80)
[*] tracing /home/user/Decompile/out/stages/stageA.luau (run 1)...
[*] 11 Path2D answers computed by the offline engine model
[*] run status: script error: Script:1: invalid argument #1 to 'create' (size out of range)
[+] result: .build/dvl/stageA.trace.luau

[*] done: 1 succeeded, 0 failed out of 1
```

## `/home/user/Decompile/out/stages/stageB.luau`

### Detection

```
stageB.luau	luraph_v14	0.80	Luraph v14.x
```

### Behaviour trace (`--no-devirt`)

```

```

### stderr

```
[*] processing /home/user/Decompile/out/stages/stageB.luau
[*] obfuscator: Luraph v14.x (detected, 0.80)
[*] tracing /home/user/Decompile/out/stages/stageB.luau (run 1)...
[*] 12 Path2D answers computed by the offline engine model
[*] run status: script error: Script:1: invalid argument #1 to 'create' (size out of range)
[+] result: .build/dvl/stageB.trace.luau

[*] done: 1 succeeded, 0 failed out of 1
```
