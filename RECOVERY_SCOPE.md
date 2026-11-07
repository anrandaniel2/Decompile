# What “full recovery” can and cannot mean here

The attached bytes have been **statically unpacked**: the string table and stream cipher are removed, all 11,771 encrypted references are decoded, constant arithmetic is simplified where safely recognized, and the resulting 15K-line Luau file compiles with the upstream Luau compiler. All 176 `local function` declarations in the reconstructed file have descriptive names (some were already meaningful). The 62 nested short-named declarations were renamed using lexical binding rather than a global text substitution. See `tools/function_names.py` for the inferred names.

This is **not** a claim to have recovered the author's exact original source or to have proved runtime equivalence:

| Boundary | Reason |
|---|---|
| Original local and parameter spellings | Obfuscation replaces them; the input contains no reverse mapping. The new names are semantic inferences, not original debug symbols. Hundreds of originally anonymous callbacks remain anonymous; many short callback parameters remain. |
| Remote library source | The script calls `game:HttpGet` and `loadstring` on libraries from `deividcomsono/Obsidian`, `doram44/linorialib`, and `bocaj111004/ESPLibrary`, and fetches translations from `doram44/cheesylanguages`. Those moving repository refs do not embed their contents in the attachment. Other paths fetch a death-farm script and notification sounds from `doram44/cheesy`. |
| Roblox/executor behavior | The script depends on a specific DOORS game state and executor-specific hooks, file APIs, prompt simulation, teleport queueing, and network ownership. Static compilation does not exercise those paths. |
| Anti-tamper wrapper | The deobfuscated deliverable removes the obfuscator's anti-tamper/decoder bootstrap on purpose. This is a readable reconstruction, not a byte-for-byte equivalent loader. |

The public `doram44/cheesy` repository's `cheesy.lua` (last changed in commit `5b643e3f84a789102f7a4d72b42f1a5a19a2c8c5`) contains **the same obfuscated payload** as the attachment, not an unobfuscated source copy. Fetching today's remote libraries would freeze *today's* revisions, not reconstruct the exact versions that a past execution fetched.

Verification does **not run** the script: regression tests assert known plaintexts (including the PRNG-state-1 cases), check that decoded references are valid UTF-8 with no NUL bytes, and parse the output. CI also compiles it with `luau-compile --null`. To establish functional equivalence, one would need a controlled Roblox test environment and the actual library revisions/executor/game version of interest.
