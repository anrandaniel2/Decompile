import fs from 'node:fs';
import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const { Minify } = require('lua-format');

const [inputPath, outputPath] = process.argv.slice(2);
if (!inputPath || !outputPath) {
  throw new Error('Usage: node tools/finish-decompile.mjs <raw-lift.lua> <output.luau> [--readable]');
}

let source = fs.readFileSync(inputPath, 'utf8');

// The upstream static lifter emits Lua labels/gotos that Luau does not accept.
// One jump is the failure exit of ComputeAsync; recover its intended return.
source = source.replace(/^(\s*)goto L3858633\s*$/gm, '$1return {}, false');
// The other four jumps are loop-continue paths whose target labels are adjacent
// at the end of their conditional branch; removing both preserves fall-through.
source = source.replace(/^\s*goto L(?:7754905|9693667|2884202|304392)\s*\n/gm, '');
source = source.replace(/^\s*::L(?:3858633|7754905|9693667|2884202|304392)::\s*\n/gm, '');
// The lifter emits one syntactically invalid, empty local declaration.
source = source.replace(/^\s*local\s*\n/gm, '');

// Restore the same failure return if this input was already cleaned once.
source = source.replace(
  /(local function f27\([\s\S]*?if getWaypoints and #getWaypoints > 0 then\s*return getWaypoints, true\s*else\s*return \{\}, false\s*end\s*else)\s*end\s*end/,
  '$1\n    return {}, false\n  end\nend',
);

const names = {
  f1: 'getHumanoidRootPart',
  f2: 'touchCollectible',
  f3: 'findDescendantByName',
  f4: 'getPuzzlesFolder',
  f5: 'findSafePositionNearPart',
  f6: 'getPuzzleByName',
  f7: 'getPuzzlesByName',
  f8: 'teleportCharacterToPosition',
  f9: 'activateClickDetector',
  f10: 'setCharacterNoclip',
  f11: 'isRunner',
  f12: 'isBanana',
  f13: 'destroyEspEntry',
  f14: 'clearEspEntries',
  f15: 'getCollectibleParts',
  f16: 'getCakeTargets',
  f17: 'appendBananaActors',
  f18: 'isPicturePuzzleSolved',
  f19: 'smoothTeleportToPosition',
  f20: 'isPathClear',
  f21: 'isNearLocker',
  f22: 'getBananaActors',
  f23: 'isSlimeNearby',
  f24: 'waitForSlimeClearance',
  f25: 'getCombinationButtonLabel',
  f26: 'isCombinationPuzzleSolved',
  f27: 'computePathWaypoints',
  f28: 'shouldCullPathSegment',
  f29: 'getCachedHumanoidRootPart',
  f30: 'getCharacterGroundPosition',
  f31: 'getOrCreatePathEntry',
  f32: 'getPathDivergence',
  f33: 'updatePathEntry',
  f34: 'stopPathOverlay',
  f35: 'getOrCreatePathLine',
  f36: 'trimPassedWaypoints',
  f37: 'roundToPixel',
  f38: 'drawPathLine',
  f39: 'collectPathTargets',
  f40: 'startPathOverlay',
  f41: 'updatePathOverlay',
  f42: 'createTab',
  f43: 'addEspToggle',
  f44: 'setAntiPeels',
  f45: 'isEscapePositionClear',
  f46: 'getCakeClickDetector',
  f47: 'getCakePuzzleRoot',
  f48: 'moveToCakeTarget',
  f49: 'collectCake',
  f50: 'clearCakeAura',
  f51: 'getValveButtonTargets',
  f52: 'isValvePuzzleCompleted',
  f53: 'setCrawlwayNoclip',
  f54: 'findEscapeExitParts',
  f55: 'solveValvePuzzle',
  f56: 'cacheLightingSettings',
  f57: 'setFullbright',
  f58: 'setNoFog',
  f59: 'setNoEffects',
};
for (const [obfuscated, descriptive] of Object.entries(names)) {
  source = source.replace(new RegExp(`\\b${obfuscated}\\b`, 'g'), descriptive);
}

if (process.argv[4] === '--readable') {
  const readableHeader = `-- Recovered/devirtualized from the attached Prometheus-obfuscated Luau.\n-- Static output cleaned and helper functions renamed by behavior; original\n-- Roblox/executor runtime and WindUI's mutable remote dependency are required.\n-- Decompiled, not byte-for-byte source recovery: review before use.\n\n`;
  fs.writeFileSync(outputPath, readableHeader + source);
  process.exit(0);
}

// Parse and re-emit the source with only whitespace/comment minification enabled.
// Keep variable and global names; do not solve/rewrite math expressions.
const minifierOptions = {
  RenameVariables: false,
  RenameGlobals: false,
  SolveMath: false,
};
const stripMinifierBanner = (code) => code.replace(/^--\[\[[\s\S]*?--\]\]\s*/, '');
const minified = stripMinifierBanner(Minify(source, minifierOptions));
const secondPass = stripMinifierBanner(Minify(minified, minifierOptions));
if (secondPass !== minified) {
  throw new Error('Minifier output is not idempotent; refusing to write recovered source.');
}
const header = `-- Recovered/devirtualized from the attached Prometheus-obfuscated Luau.\n-- Whitespace-minified with lua-format; helper/global names are preserved.\n-- Roblox/executor runtime and mutable remote WindUI dependency are required.\n-- Syntax-checked, not behaviorally verified; review before use.\n`;
fs.writeFileSync(outputPath, header + minified);
