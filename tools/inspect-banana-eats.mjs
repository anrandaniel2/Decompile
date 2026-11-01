import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { LuauState } from 'luau-web';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const input = path.resolve(root, process.argv[2] ?? 'inputs/banana_eats.obfuscated.luau.txt');
const source = fs.readFileSync(input, 'utf8');
const tableStart = source.indexOf('local r={');
const vmStart = source.indexOf(
  'return(function(u,h,W,z,r,A,s,a,O,w,X,i,B,j,q,G,e,D,I,f,y,t,Z,J,n,V)',
  tableStart,
);
if (tableStart < 0 || vmStart < 0) {
  throw new Error('Unrecognized wrapper layout; refusing to execute the payload.');
}

// The prefix ends before the VM is constructed. It initializes and decodes only
// the first-stage constant table; the payload interpreter is deliberately not run.
const firstStage = `${source.slice(tableStart, vmStart)}return r`;
const state = await LuauState.createAsync();
try {
  state.loadstring(source, 'banana_eats_compile_check', true);
  const decompiledPath = path.resolve(root, 'banana_eats.deobfuscated.luau');
  const decompiled = fs.readFileSync(decompiledPath, 'utf8');
  state.loadstring(decompiled, 'banana_eats_decompiled_compile_check', true);
  if (/\\bf\\d+\\b/.test(decompiled)) {
    throw new Error('Decompiled source still contains generic f1-f59 helper names.');
  }
  const decoder = state.loadstring(firstStage, 'banana_eats_string_table', true);
  const [pool] = await decoder();
  const values = [...pool.keys()]
    .map((index) => [index, pool.get(index)])
    .filter(([, value]) => typeof value === 'string');
  const decoded = new Map(values.map(([, value]) => [value, true]));
  const expected = [
    'CreateWindow',
    'CreateTab',
    'CreatePath',
    'solvePicture',
    'getCombinationPuzzleSolution',
    'GetPlayers',
    'GetWaypoints',
    'Raycast',
    'InvokeServer',
    'gethui',
    'firetouchinterest',
    'fireclickdetector',
    'HttpGet',
    'loadstring',
  ];
  const missing = expected.filter((value) => !decoded.has(value));
  if (missing.length) {
    throw new Error(`Expected decoded constants missing: ${missing.join(', ')}`);
  }

  console.log(`Input Luau compile check: passed (${Buffer.byteLength(source)} bytes)`);
  console.log(`Recovered Luau compile check: passed (${Buffer.byteLength(decompiled)} bytes)`);
  console.log('Recovered helper naming check: passed (no generic f1-f59 identifiers).');
  console.log(`First-stage string-table decode: ${values.length} entries`);
  console.log('Relevant constants:');
  for (const value of expected) console.log(`  ${value}`);
  console.log('The checked-in recovered source is a static VM lift; runtime equivalence is not established.');
} finally {
  state.destroy();
}
