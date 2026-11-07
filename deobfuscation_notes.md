# Reconstruction verification and limitations

The supplied script is not safe to execute. It fetches and `loadstring`s remote UI code,
installs executor hooks and can POST to `127.0.0.1:43594/rpc`. No code from the
attachment was executed during this reconstruction.

11,771 encrypted references were statically decoded. 0 decoded strings are invalid UTF-8; 0 contain NUL bytes.
The previous reconstruction had 100 broken strings because its key-stream
implementation skipped PRNG state 0 instead of 1. The bootstrap explicitly
repeats while `P == 1`. Correcting that state recovers `string.split`,
`HumanoidRootPart`, `LatestRoom`, and the complete injected UI source.

Top-level function names and service/state aliases in `tools/function_names.py`
were inferred from behavior and resolved through lexical scopes, not recovered
from original source-level symbol names.

The result is syntax-checked but not runtime-verified. It still loads external
libraries at runtime, and its nested callbacks and many parameters retain
short local identifiers. These are remaining readability/runtime-verification
limits, not proof of corrupt string decoding.

