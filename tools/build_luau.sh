#!/usr/bin/env bash
# Build the Luau toolchain the pipeline needs.
#
#   .tools/luau      -- the VM/CLI used to execute the payload in the harness
#   .tools/luau-ast  -- parses Luau and prints the AST as JSON (verification)
#
# Upstream only ships a CMake build for `luau-ast`, so the script drives the
# project's own Makefile for the static libraries and then links the AST CLI by
# hand. No CMake required.
#
# Env:
#   LUAU_REPO  git URL             (default https://github.com/luau-lang/luau.git)
#   LUAU_REF   tag/branch/commit   (default 0.745 - pinned for reproducibility)
#   JOBS       parallel build jobs (default: nproc)
#   DEST       output directory    (default .tools)
set -euo pipefail

LUAU_REPO="${LUAU_REPO:-https://github.com/luau-lang/luau.git}"
LUAU_REF="${LUAU_REF:-0.745}"
JOBS="${JOBS:-$( (nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4) )}"
DEST="${DEST:-.tools}"
SRC="${LUAU_SRC:-.build/luau}"

mkdir -p "$DEST" .build

if [ ! -d "$SRC/.git" ]; then
  echo "==> cloning $LUAU_REPO @ $LUAU_REF"
  git clone --depth 1 --branch "$LUAU_REF" "$LUAU_REPO" "$SRC"
else
  echo "==> reusing $SRC"
fi

cd "$SRC"

echo "==> building luau + luau-compile (make, -j$JOBS)"
make luau luau-compile config=release -j"$JOBS" >/dev/null

echo "==> building analysis library for the AST CLI"
make build/release/libluauanalysis.a config=release -j"$JOBS" >/dev/null

echo "==> linking luau-ast"
g++ -std=c++17 -O2 -DNDEBUG -w \
  -ICommon/include -IAst/include -IBytecode/include -IInliner/include \
  -ICompiler/include -IVM/include -ICodeGen/include -IRequire/include \
  -IConfig/include -IAnalysis/include -Iextern -ICLI/include \
  CLI/src/Ast.cpp CLI/src/FileUtils.cpp CLI/src/Flags.cpp \
  -o build/release/luau-ast \
  build/release/libluauanalysis.a build/release/libluaucompiler.a \
  build/release/libluaubytecode.a build/release/libluauast.a \
  build/release/libluauconfig.a build/release/libluauvm.a \
  build/release/libluaucommon.a -lpthread

cd - >/dev/null
cp "$SRC/build/release/luau" "$DEST/luau"
cp "$SRC/build/release/luau-ast" "$DEST/luau-ast"
chmod +x "$DEST/luau" "$DEST/luau-ast"

echo "==> ready: $DEST/luau ($("$DEST/luau" --help 2>&1 | head -1 || true))"
echo "==> ready: $DEST/luau-ast"
