"""Safely validate the static decoder against the isolated ORIGINAL Luau decoder.

Executes ONLY the extracted decoder, anti-tamper/bootstrap initialization,
and vetted pure helpers. NEVER executes the main Roblox body, remote libraries,
executor hooks, file/network APIs, or Roblox-dependent features. The known
attachment's SHA-256 is required before any original Luau code is run.
"""
import argparse
import hashlib
import math
import re
import runpy
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
INPUT = ROOT / 'cheesy.obfuscated.luau.txt'
OUTPUT = ROOT / 'cheesy.deobfuscated.luau'
NOTES = ROOT / 'deobfuscation_notes.md'
EXPECTED_SHA256 = '68a03208b3364fcebd9c8017360d213f18a6fd757298d8d8be55cb4c3d1c22f0'


def isolated_decoder(source: str, extra_original: str = '',
                     result: str = 'function(index, key) return bu[xu(uu(index), key)] end') -> str:
    """Cut away the anti-tamper and body; retain the real decoder verbatim."""
    header = 'return(function(...)'
    assert source.startswith(header)
    anti_tamper = source.index('do local o=uu(564465+-512174)')
    cipher = source.index('local xu,bu do', anti_tamper)
    body = source.index('if not game:IsLoaded()', cipher)
    decoder = ('local decode = (function(...)'
               + source[len(header):anti_tamper]
               + source[cipher:body]
               + extra_original + '\nreturn ' + result + ' end)()\n')
    # These would indicate that a runtime dependency leaked into the isolated
    # executable section. Strings in the table cannot be executed as code.
    assert 'game:' not in decoder and 'loadstring(' not in decoder
    assert 'require(' not in decoder and 'getfenv(' not in decoder
    return decoder


def cases_and_expected(source: str):
    # The generator currently has top-level side effects. Preserve the readable
    # deliverable and its notes byte-for-byte while importing its crypto helpers.
    saved = {path: path.read_bytes() if path.exists() else None
             for path in (OUTPUT, NOTES)}
    generated = None
    try:
        env = runpy.run_path(str(ROOT / 'tools/deobfuscate.py'))
        generated = OUTPUT.read_bytes()
    finally:
        for path, data in saved.items():
            if data is None:
                path.unlink(missing_ok=True)
            else:
                path.write_bytes(data)
    text = source[source.index('if not game:IsLoaded()'):]
    pairs = [(int(env['number'](m[1])), int(env['number'](m[2])))
             for m in env['ref_pattern'].finditer(text)]
    assert len(pairs) == 11771 and len({key for _, key in pairs}) == 11771
    expected = [env['decrypt'](env['uu'](index), key) for index, key in pairs]
    return pairs, expected, env['fold_records'], generated, env['luau_quote']


def validate_numeric(luau: str, records, folder: str):
    script = ('local cases={' + ','.join('(' + expr + ')' for expr, _ in records)
              + '}\nfor i, value in ipairs(cases) do '
              + 'print(i .. ":" .. string.format("%.17g", value)) end\n')
    path = Path(folder) / 'pure-numbers.luau'
    path.write_text(script)
    process = subprocess.run([luau, str(path)], cwd=folder,
                             capture_output=True, text=True, timeout=60, check=True)
    lines = process.stdout.splitlines()
    if len(lines) != len(records):
        raise AssertionError(f'Expected {len(records)} numeric outputs, got {len(lines)}')
    for i, ((expr, expected), line) in enumerate(zip(records, lines), 1):
        ordinal, value = line.split(':', 1)
        got = float(value)
        want = float(expected)
        if (ordinal != str(i) or got != want
                or (got == 0 and math.copysign(1, got) != math.copysign(1, want))):
            raise AssertionError(f'Numeric fold {i} differs: {expr} => '
                                 f'Luau {value}, static {expected}')
    print(f'PASS: Luau VM confirms all {len(records):,} folded numeric expressions')


def verify_formatting(compiler: Path, generated: bytes, checked_in: bytes, folder: str):
    if not compiler.is_file():
        raise FileNotFoundError(f'Luau compiler required for instruction comparison: {compiler}')
    generated_file = Path(folder) / 'generated.luau'
    checked_file = Path(folder) / 'formatted.luau'
    generated_file.write_bytes(generated)
    checked_file.write_bytes(checked_in)
    # -g0 removes source identifiers from compiler output; text disassembly
    # also excludes line-number tables. This compares *all* function instructions
    # and constants, whereas bytecode files differ in their line metadata.
    def disassemble(path):
        return subprocess.run([str(compiler), '--text', '-O0', '-g0', str(path)],
                              cwd=folder, capture_output=True, timeout=60,
                              check=True).stdout
    unformatted = disassemble(generated_file)
    formatted = disassemble(checked_file)
    if unformatted != formatted:
        a = hashlib.sha256(unformatted).hexdigest()[:12]
        b = hashlib.sha256(formatted).hexdigest()[:12]
        raise AssertionError(f'Readable file changes Luau instructions: {a} != {b}')
    print(f'PASS: generated and formatted sources compile to identical Luau '
          f'instruction listings ({len(formatted.splitlines()):,} lines)')


def validate_bootstrap(luau: str, original: str, readable: bytes, folder: str):
    """Compare the original and formatted guard, including EVERY random call.

    The original payload is one line: its two deliberate errors report the
    same source line. The readable guard keeps those probes on one line too.
    Neither isolated prefix includes the Roblox body or any remote execution.
    """
    body = 'if not game:IsLoaded()'
    assert original.startswith('return(function(...)')
    original_prefix = original[len('return(function(...)'):original.index(body)]
    readable_text = readable.decode('utf-8')
    wrapper = 'return (function(...)'
    assert readable_text.count(wrapper) == 1
    readable_prefix = readable_text[readable_text.index(wrapper) + len(wrapper):
                                    readable_text.index(body)]
    for prefix in (original_prefix, readable_prefix):
        assert 'game:' not in prefix and 'loadstring(' not in prefix
        assert 'require(' not in prefix and 'HttpGet' not in prefix
    for seed in (1, 2, 12345):
        setup = (f'math.randomseed({seed})\n'
                 'local random = math.random\n'
                 'local trace = {}\n'
                 # The Luau CLI math library is readonly; copy only the table
                 # to instrument RNG without changing its draws/arguments.
                 'local tracedMath = table.clone(math)\n'
                 'tracedMath.random = function(a,b)\n'
                 '    local value = random(a,b)\n'
                 '    trace[#trace+1] = a .. "," .. b .. "=" .. value\n'
                 '    return value\n'
                 'end\n'
                 'getfenv().math = tracedMath\n'
                 'local guardPassed = (function(...)\n')
        finish = ('\nreturn true end)()\n'
                  'print("guard:" .. tostring(guardPassed))\n'
                  'for i=1,5 do print("next:" .. math.random(0,100000)) end\n'
                  'print(table.concat(trace,";"))\n')
        results = []
        for name, prefix in (('original', original_prefix),
                             ('readable', readable_prefix)):
            path = Path(folder) / f'{name}-bootstrap-{seed}.luau'
            path.write_text(setup + prefix + finish)
            process = subprocess.run([luau, str(path)], cwd=folder,
                                     capture_output=True, text=True, timeout=10,
                                     check=True)
            if process.stderr or not process.stdout.startswith('guard:true\n'):
                raise AssertionError(f'{name} guard failed at seed {seed}: '
                                     f'{process.stdout[:300]} {process.stderr[:300]}')
            results.append(process.stdout)
        if results[0] != results[1]:
            raise AssertionError(f'Bootstrap guard or RNG call trace differs at seed {seed}')
    print('PASS: original and readable isolated guards and RNG traces agree '
          'at seeds 1, 2, 12345 (including the 256-draw shuffle)')


def validate_pure_functions(luau: str, original: str, readable: bytes, folder: str):
    # Extract ONLY three vetted, side-effect-free function bodies from both
    # programs. Nothing else from either Roblox script is ever executed.
    import tree_sitter
    import tree_sitter_luau
    parser = tree_sitter.Parser(tree_sitter.Language(tree_sitter_luau.language()))
    original_bytes = original.encode()
    original_tree = parser.parse(original_bytes)
    readable_tree = parser.parse(readable)
    if original_tree.root_node.has_error or readable_tree.root_node.has_error:
        raise AssertionError('Cannot extract pure functions from unparsable source')

    def nodes(tree, kind):
        found = []
        def walk(node):
            if node.type == kind:
                found.append(node)
            for child in node.named_children:
                walk(child)
        walk(tree.root_node)
        return found

    body_start = original_bytes.index(b'if not game:IsLoaded()')
    original_defs = [node for node in nodes(original_tree, 'function_definition')
                     if node.start_byte > body_start]
    readable_body_start = readable.index(b'if not game:IsLoaded()')
    readable_defs = [node for node in nodes(readable_tree, 'function_definition')
                     if node.start_byte > readable_body_start]
    original_split, original_find = [node.text.decode() for node in original_defs[:2]]
    readable_split, readable_find = [node.text.decode() for node in readable_defs[:2]]
    original_entity = next(node.text.decode() for node in nodes(original_tree, 'function_declaration')
                           if node.text.startswith(b'local function Iu(o)'))
    readable_entity = next(node.text.decode() for node in nodes(readable_tree, 'function_declaration')
                           if node.text.startswith(b'local function getEntityNotificationText(o)'))
    for snippet in (original_split, original_find, original_entity,
                    readable_split, readable_find, readable_entity):
        if any(blocked in snippet for blocked in ('game:', 'HttpGet', 'loadstring', 'require(', 'Executor')):
            raise ValueError('Pure function extraction contains a forbidden operation')

    original_extra = ('local originalSplit = ' + original_split + '\n'
                      + 'local originalFind = ' + original_find + '\n'
                      + original_entity + '\n')
    runner = isolated_decoder(
        original, original_extra,
        '{split=originalSplit, find=originalFind, entity=Iu}')
    # Luau function declarations cannot be assigned with `local function`;
    # extract the actual body and wrap it as a function expression.
    def as_expression(declaration):
        return re.sub(r'^local function\s+\w+\s*(?=\()', 'function', declaration, count=1)
    runner += ('local readableSplit = ' + readable_split + '\n'
               + 'local readableFind = ' + readable_find + '\n'
               + 'local readableEntity = ' + as_expression(readable_entity) + '\n')
    runner += '''local function equalArrays(a,b)
    if #a ~= #b then return false end
    for i=1,#a do if a[i] ~= b[i] then return false end end
    return true
end
local splitInputs = {
    {"a,b,c", ","}, {"ab--cd--", "--"}, {"a.b.c", "."},
    {"", ","}, {"same", "z"}, {"é|🔧|été", "|"},
}
for _, input in ipairs(splitInputs) do
    assert(equalArrays(decode.split(input[1], input[2]),
                       readableSplit(input[1], input[2])))
end
local findInputs = {
    {{"a", "b", "a"}, "b"}, {{1,2,3}, 5}, {{true,false}, false},
}
for _, input in ipairs(findInputs) do
    assert(decode.find(input[1], input[2]) == readableFind(input[1], input[2]))
end
local entityInputs = {
    {Text="hello"}, {GodmodeText="guard"},
    {Danger=true, Alias="Rush"}, {},
}
for _, input in ipairs(entityInputs) do
    assert(decode.entity(input) == readableEntity(input))
end
print("PASS: split, find, and entity-label helpers agree on 13 offline inputs")
'''
    path = Path(folder) / 'pure-functions.luau'
    path.write_text(runner)
    process = subprocess.run([luau, str(path)], cwd=folder,
                             capture_output=True, text=True, timeout=30)
    if process.returncode or 'PASS: split, find, and entity-label helpers' not in process.stdout:
        raise AssertionError(f'Isolated function comparison failed: {process.stdout} {process.stderr}')
    print(process.stdout.strip())


def validate(luau: str, sample: int | None):
    raw = INPUT.read_bytes()
    actual_sha = hashlib.sha256(raw).hexdigest()
    if actual_sha != EXPECTED_SHA256:
        raise ValueError(f'Refusing to execute unknown source: SHA-256={actual_sha}')
    source = raw.decode('utf-8')
    checked_in = OUTPUT.read_bytes()
    pairs, expected, records, generated, quote = cases_and_expected(source)
    total = len(pairs)
    if sample is not None:
        pairs, expected = pairs[:sample], expected[:sample]
    script = isolated_decoder(source)
    script += 'local cases = {' + ','.join(f'{{{index},{key}}}' for index, key in pairs) + '}\n'
    script += 'local literals = {' + ','.join(quote(clear) for clear in expected) + '}\n'
    script += '''local hex = {}
for b=0,255 do hex[b] = string.format("%02x", b) end
for ordinal, pair in ipairs(cases) do
    local result = decode(pair[1], pair[2])
    assert(result == literals[ordinal], "quoted literal mismatch at " .. ordinal)
    local bytes = {}
    for i=1,#result do bytes[i] = hex[string.byte(result, i)] end
    print(table.concat(bytes))
end
'''
    with tempfile.TemporaryDirectory(prefix='cheesy-isolated-') as folder:
        script_file = Path(folder) / 'decoder-only.luau'
        script_file.write_text(script)
        # Run the Luau VM from an empty cwd. The executed snippet has no file or
        # network operations; the subprocess gets a strict timeout.
        process = subprocess.run([luau, str(script_file)], cwd=folder,
                                 capture_output=True, text=True, timeout=120,
                                 check=True)
        if process.stderr.strip():
            raise RuntimeError(f'Luau VM error: {process.stderr[:500]}')
        lines = process.stdout.splitlines()
        if len(lines) != len(expected):
            raise AssertionError(f'Expected {len(expected)} decoded lines, got {len(lines)}')
        for ordinal, (line, clear, (index, key)) in enumerate(zip(lines, expected, pairs), 1):
            if line != clear.hex():
                raise AssertionError(f'First mismatch at reference {ordinal}: '
                                     f'index={index}, key={key}, '
                                     f'Luau={line[:60]}, Python={clear[:30].hex()}')
        print(f'PASS: original Luau VM decoder matches reconstructed bytes for '
              f'{len(pairs):,} of {total:,} references')
        validate_numeric(luau, records, folder)
        validate_bootstrap(luau, source, checked_in, folder)
        validate_pure_functions(luau, source, checked_in, folder)
        verify_formatting(Path(luau).with_name('luau-compile'), generated,
                          checked_in, folder)


if __name__ == '__main__':
    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument('--luau', default=shutil.which('luau'),
                     help='Path to an upstream Luau CLI binary')
    cli.add_argument('--sample', type=int, help='Limit references for a fast smoke test')
    args = cli.parse_args()
    if not args.luau:
        cli.error('Luau CLI not found; build `luau` from luau-lang/luau and pass --luau PATH')
    if args.sample is not None and not 1 <= args.sample <= 11771:
        cli.error('--sample must be between 1 and 11771')
    validate(str(Path(args.luau).resolve()), args.sample)
