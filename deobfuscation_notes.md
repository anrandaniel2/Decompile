# Reconstruction verification and limitations

The full script is not safe to execute. It fetches and `loadstring`s remote UI code,
installs executor hooks and can POST to `127.0.0.1:43594/rpc`. Only its isolated
decoder, guard/bootstrap, and selected pure functions were executed offline;
no Roblox body or downloaded library was executed during this reconstruction.

11,771 encrypted references were statically decoded. 0 decoded strings are invalid UTF-8; 0 contain NUL bytes.
The previous reconstruction had 100 broken strings because its key-stream
implementation skipped PRNG state 0 instead of 1. The bootstrap explicitly
repeats while `P == 1`. Correcting that state recovers `string.split`,
`HumanoidRootPart`, `LatestRoom`, and the complete injected UI source.

Top-level and nested local-function names, plus service/state aliases in
`tools/function_names.py`, were inferred from behavior and resolved through
lexical scopes; they are not recovered original source-level symbols.

Offline Luau VM checks compare every decoded reference and literal byte-for-byte,
every folded numeric expression, and three vetted pure helpers. The isolated
original and readable guards and all RNG calls agree at three tested seeds;
the removed table shuffle still consumes its 256 random draws. The generated
and formatted versions also compile to identical instruction listings.
Intentional runtime repairs are applied to this one output: default material
physics, Noclip/Phase collision restoration, Twerk animation cleanup, and
godmode Crouch guard/rate limiting. These diverge from the attachment and
were tested only in isolated Luau mocks, not in Roblox or its server.
This does not test the full Roblox/executor runtime or its external libraries.
Many anonymous callback parameters retain short local identifiers.

