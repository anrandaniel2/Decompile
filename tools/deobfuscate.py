"""Static unpacker for the attached Prometheus-obfuscated Luau source. No Luau code is executed."""
import ast
import re
from pathlib import Path

SOURCE = Path(__file__).resolve().parents[1] / 'cheesy.obfuscated.luau.txt'
OUT = Path(__file__).resolve().parents[1] / 'cheesy.deobfuscated.luau'
source = SOURCE.read_text()
end = source.index('}local function uu(')
table_source = source[source.index('local Bu={')+len('local Bu={'):end]
raw = [ast.literal_eval(m.group()) for m in re.finditer(r'"(?:\\.|[^"\\])*"', table_source)]

def number(expr):
    """Evaluate constant arithmetic (never execute source code)."""
    expr = expr.strip().replace('^', '**')
    node = ast.parse(expr, mode='eval')
    def calc(n):
        if isinstance(n, ast.Constant) and type(n.value) in (int, float): return n.value
        if isinstance(n, ast.UnaryOp) and isinstance(n.op, (ast.UAdd, ast.USub)):
            v=calc(n.operand);return v if isinstance(n.op, ast.UAdd) else -v
        if isinstance(n, ast.BinOp) and isinstance(n.op,(ast.Add,ast.Sub,ast.Mult,ast.Div,ast.Mod,ast.Pow)):
            a,b=calc(n.left),calc(n.right)
            if isinstance(n.op,ast.Add):return a+b
            if isinstance(n.op,ast.Sub):return a-b
            if isinstance(n.op,ast.Mult):return a*b
            if isinstance(n.op,ast.Div):return a/b
            if isinstance(n.op,ast.Mod):return a%b
            return a**b
        raise ValueError(expr)
    return calc(node.body)

def lookup_map(name, stop):
    text = source[source.index('local '+name+'={')+len('local '+name+'={'):source.index(stop)]
    entries = re.findall(r'(?:\["((?:\\.|[^"\\])*)"\]|\b([a-zA-Z_])\b)\s*=\s*([^,;}]+)',text)
    return {ast.literal_eval('"'+quoted+'"') if quoted else ident:int(number(value)) for quoted,ident,value in entries}

C=lookup_map('C','}local f=')
f=lookup_map('f','}for m=')
assert len(C)==64 and len(f)==85, (len(C),len(f))

def decode_string(s):
    if s.startswith('K'):
        s=s[1:]; result=bytearray()
        for pos in range(0,len(s),5):
            chunk=s[pos:pos+5]
            if any(c not in f for c in chunk): continue
            value=0
            for c in chunk.ljust(5,'~'):
                value=value*85+(f[c] if c!='~' else 84)
            bytes4=value.to_bytes(4,'big')
            result.extend(bytes4[:len(chunk)-1])
        return bytes(result)
    if s.startswith('Q'):
        s=s[1:];result=bytearray();value=0; bits=0
        for ch in s:
            if ch=='=': break
            if ch not in C: continue
            value+=C[ch] * 64**(3-bits//6)
            bits+=6
            if bits==24:
                result.extend(value.to_bytes(3,'big'));value=0;bits=0
        if bits: result.extend(value.to_bytes(3,'big')[:(bits//8)])
        return bytes(result)
    return s.encode()

strings=[decode_string(s) for s in raw]
# Three reversal ranges from the bootstrap: 1..11663, 1..9133, and
# 9134..11663 (Lua 1-based indices).
for start,stop in [(1,11663),(1,9133),(9134,11663)]:
    strings[start-1:stop] = strings[start-1:stop][::-1]

def uu(index):
    return strings[index - 43259 - 1]

def decrypt(encoded, key):
    # The shuffled k table is an identity char table; only the order in which
    # its entries were assigned was random. All other steps are deterministic.
    w = key % 35184372088832
    p = key % 255 + 2
    stream = []
    m = 19
    result = bytearray()
    for byte in encoded:
        if not stream:
            w = (w + 22804825341862 - 535729) % 35184372088832
            while True:
                p = p*47 % 257
                if p != 1: break  # The Luau bootstrap retries state ONE, not zero.
            exponent = 13 - (p // 32)
            offset = p % 32
            value = (w // (2 ** exponent)) % (2**32) / 2**offset
            integer = int((value % 1) * 2**32) + int(value)
            stream = list(integer.to_bytes(4, 'little'))
        m = (byte + stream.pop() + m) % 256
        result.append(m)
    return bytes(result)

def luau_quote(raw):
    # Quote bytes without double-escaping binary decimal escapes.
    try:
        raw.decode('utf-8')
        parts = list(raw.decode('utf-8'))
    except UnicodeDecodeError:
        parts = [chr(byte) if 32 <= byte < 127 else ('\\%03d' % byte) for byte in raw]
    result = []
    for char in parts:
        if char == '\\': result.append('\\\\')
        elif char == '"': result.append('\\"')
        elif char == '\n': result.append('\\n')
        elif char == '\r': result.append('\\r')
        elif char == '\t': result.append('\\t')
        else: result.append(char)
    return '"' + ''.join(result) + '"'

# Drop the table decoder, anti-tamper scaffolding, and the decryption runtime.
body = source[source.index('if not game:IsLoaded()'):]
assert body.endswith('end)(...)\n')
body = body[:-len('end)(...)\n')]
ref_pattern = re.compile(r'bu\[xu\(uu\(((?:[^()]|\([^()]*\))*)\),((?:[^()]|\([^()]*\))*)\)\]')
failures = []
unresolved = []
def replace_ref(match):
    index = int(number(match[1])); key = int(number(match[2]))
    clear = decrypt(uu(index),key)
    if b'\0' in clear:
        failures.append((index,key,'NUL byte'))
    try:
        clear.decode('utf-8')
    except UnicodeDecodeError:
        unresolved.append((index,key,len(clear),repr(clear[:80])))
    return "(" + luau_quote(clear) + ")"
body, replaced = ref_pattern.subn(replace_ref,body)
print('Replaced references:',replaced,'left:',len(ref_pattern.findall(body)))
assert replaced == 11771 and not unresolved and not failures, 'Unexpected undecoded or binary reference'

# Fold only AST-confirmed constant expressions, never text in Lua literals.
import tree_sitter, tree_sitter_luau
import sys
sys.path.insert(0, str(Path(__file__).resolve().parent))
parser = tree_sitter.Parser(tree_sitter.Language(tree_sitter_luau.language()))
raw_body=body.encode('utf-8')
tree=parser.parse(raw_body)
print('parse error before folding:',tree.root_node.has_error)

folds=[]
def visit(node):
    if node.type in ('binary_expression','unary_expression','parenthesized_expression'):
        text=raw_body[node.start_byte:node.end_byte].decode('utf-8')
        try:
            value=number(text)
            if isinstance(value,float):
                if abs(value)>2**53 or not __import__('math').isfinite(value): raise ValueError()
                if value.is_integer(): value=int(value)
            if not folds or node.start_byte>=folds[-1][1]:
                folds.append((node.start_byte,node.end_byte,'('+str(value)+')'))
                return
        except (ValueError, SyntaxError, OverflowError, ZeroDivisionError): pass
    for child in node.children: visit(child)
visit(tree.root_node)
for a,b,v in reversed(folds): raw_body=raw_body[:a]+v.encode()+raw_body[b:]
body=raw_body.decode('utf-8')
print('Folded constant expressions:',len(folds),'parse error after folding:',parser.parse(raw_body).root_node.has_error)
# Resolve one-letter top-level function names through lexical scopes. They
# are often shadowed by parameters and inner locals, so a global regex is unsafe.
from function_names import SHORT_FUNCTION_NAMES, VARIABLE_NAMES
from rename_scoped import rename_top_level_bindings
raw_body,count = rename_top_level_bindings(body.encode('utf-8'), parser,
                                           SHORT_FUNCTION_NAMES, VARIABLE_NAMES)
body=raw_body.decode('utf-8')
print('Renamed scoped top-level identifiers:',count)

# Rename remaining unambiguous multi-character top-level routines by AST
# identifiers, not raw text, so injected source strings remain unmodified.
from function_names import FUNCTION_NAMES
raw_body=body.encode('utf-8')
renames=[]
def collect_names(node):
    if node.type=='identifier':
        name=raw_body[node.start_byte:node.end_byte].decode()
        if name in FUNCTION_NAMES:
            renames.append((node.start_byte,node.end_byte,FUNCTION_NAMES[name]))
    for child in node.children: collect_names(child)
collect_names(parser.parse(raw_body).root_node)
for a,b,v in reversed(renames): raw_body=raw_body[:a]+v.encode()+raw_body[b:]
body=raw_body.decode('utf-8')
print('Renamed identifiers:',len(renames), 'parse error:',parser.parse(raw_body).root_node.has_error)
# Normalise plain identifier keys (obj[("Parent")] -> obj.Parent). Restrict
# changes to parsed bracket-index nodes; never touch embedded source strings.
keywords=set('and break continue do else elseif end false for function if in local nil not or repeat return then true until while export type typeof'.split())
indexes=[]
def collect_indexes(node):
    if node.type=='bracket_index_expression':
        table_node=node.child_by_field_name('table')
        field=node.child_by_field_name('field')
        if table_node and field:
            text=raw_body[field.start_byte:field.end_byte].decode('utf8')
            match=re.fullmatch(r'\(?"([A-Za-z_][A-Za-z0-9_]*)"\)?',text)
            if match and match[1] not in keywords:
                indexes.append((table_node.end_byte,node.end_byte,' .'+match[1]+' '))
    for child in node.children: collect_indexes(child)
collect_indexes(parser.parse(raw_body).root_node)
for a,b,v in sorted(indexes,reverse=True): raw_body=raw_body[:a]+v.encode()+raw_body[b:]
body=raw_body.decode('utf-8')
print('Normalised property accesses:',len(indexes),'parse error:',parser.parse(raw_body).root_node.has_error)

OUT.write_text('-- Reconstructed from cheesy.obfuscated.luau.txt by tools/deobfuscate.py.\n-- Static analysis only; NOT executed or verified in Roblox.\n'+body+'\n')
print('Output:',OUT,'bytes:',OUT.stat().st_size, 'NUL-bearing literals:',len(failures))

notes = [
    '# Reconstruction verification and limitations', '',
    'The supplied script is not safe to execute. It fetches and `loadstring`s remote UI code,',
    'installs executor hooks and can POST to `127.0.0.1:43594/rpc`. No code from the',
    'attachment was executed during this reconstruction.', '',
    f'{replaced:,} encrypted references were statically decoded. '
    f'{len(unresolved)} decoded strings are invalid UTF-8; {len(failures)} contain NUL bytes.',
    'The previous reconstruction had 100 broken strings because its key-stream',
    'implementation skipped PRNG state 0 instead of 1. The bootstrap explicitly',
    'repeats while `P == 1`. Correcting that state recovers `string.split`,',
    '`HumanoidRootPart`, `LatestRoom`, and the complete injected UI source.', '',
    'Top-level function names and service/state aliases in `tools/function_names.py`',
    'were inferred from behavior and resolved through lexical scopes, not recovered',
    'from original source-level symbol names.', '',
    'The result is syntax-checked but not runtime-verified. It still loads external',
    'libraries at runtime, and its nested callbacks and many parameters retain',
    'short local identifiers. These are remaining readability/runtime-verification',
    'limits, not proof of corrupt string decoding.', '',
]
(Path(__file__).resolve().parents[1] / 'deobfuscation_notes.md').write_text('\n'.join(notes)+'\n')
print('Non-UTF-8 references:',len(unresolved))
