# Recovered helper function inventory

Names below describe behavior inferred from the static-lifted implementations and call sites. They are descriptive reconstructions, not original source identifiers. Confidence is generally high for direct API wrappers and moderate where the lifter flattened multi-branch control flow. All definitions appear in both [`../banana_eats.deobfuscated.readable.luau`](../banana_eats.deobfuscated.readable.luau) and [`../banana_eats.deobfuscated.luau`](../banana_eats.deobfuscated.luau).

| Recovered name | Behavior inferred from the lift |
|---|---|
| `getHumanoidRootPart` | Returns the local character's HumanoidRootPart. |
| `touchCollectible` | Uses the executor touch-interaction API on a target part. |
| `findDescendantByName` | Finds a descendant by name, optionally constrained by class. |
| `getPuzzlesFolder` | Locates `GameKeeper.Puzzles`. |
| `findSafePositionNearPart` | Searches for a nearby position using raycasts and target geometry. |
| `getPuzzleByName` | Finds a named puzzle. |
| `getPuzzlesByName` | Returns matching puzzles. |
| `teleportCharacterToPosition` | Moves the local root to a target position. |
| `activateClickDetector` | Invokes the executor click-detector interaction. |
| `setCharacterNoclip` | Applies/restores character collision state for noclip. |
| `isRunner` | Checks whether the local player is on the Runners team. |
| `isBanana` | Checks whether the local player is on the Banana team. |
| `destroyEspEntry` | Destroys a tracked ESP object/entry. |
| `clearEspEntries` | Clears tracked ESP entries for a category. |
| `getCollectibleParts` | Collects token/power-up parts used by collectible features. |
| `getCakeTargets` | Finds cake puzzle targets and their roots. |
| `appendBananaActors` | Adds banana actor models/roots to a result collection. |
| `isPicturePuzzleSolved` | Checks picture puzzle button rotations. |
| `smoothTeleportToPosition` | Moves the root toward a position using a smoothed/tweened movement. |
| `isPathClear` | Raycast-based visibility/path check, accounting for the character. |
| `isNearLocker` | Checks whether a position is near a locker. |
| `getBananaActors` | Finds/caches AI Banana targets. |
| `isSlimeNearby` | Detects nearby slime hazards. |
| `waitForSlimeClearance` | Waits briefly for nearby slime to clear before puzzle interaction. |
| `getCombinationPuzzleSolution` | Reads the combination labels and returns the combined answer and numeric values. |
| `getCombinationButtonLabel` | Nested helper that reads one combination button's label. |
| `isCombinationPuzzleSolved` | Compares the puzzle's current state with the extracted combination solution. |
| `computePathWaypoints` | Calls PathfindingService and returns waypoints plus a success flag. |
| `shouldCullPathSegment` | Decides whether a path segment should be omitted based on camera/position. |
| `getCachedHumanoidRootPart` | Retrieves/caches the local root part for path visualization. |
| `getCharacterGroundPosition` | Estimates the local character's feet/ground position. |
| `getOrCreatePathEntry` | Retrieves or initializes a cached path entry. |
| `getPathDivergence` | Compares two waypoint paths for divergence. |
| `updatePathEntry` | Updates cached path data and recomputation state. |
| `stopPathOverlay` | Disconnects and destroys the path visualization. |
| `getOrCreatePathLine` | Retrieves or creates a GUI frame for a path segment. |
| `trimPassedWaypoints` | Removes waypoints already traversed. |
| `roundToPixel` | Rounds a screen coordinate to an integer pixel. |
| `drawPathLine` | Draws a screen-space line segment in the path overlay. |
| `collectPathTargets` | Gathers cake/valve targets to include in path visualization. |
| `startPathOverlay` | Creates the path ScreenGui and RenderStepped updater. |
| `updatePathOverlay` | Starts/stops the path overlay according to feature flags. |
| `createTab` | Creates a WindUI tab with a fallback method. |
| `addEspToggle` | Adds a category ESP toggle and clears records when disabled. |
| `setAntiPeels` | Saves/restores peel-part `CanTouch` state. |
| `isEscapePositionClear` | Tests whether a candidate escape position overlaps collidable parts. |
| `getCakeClickDetector` | Retrieves a ClickDetector from a cake target root. |
| `getCakePuzzleRoot` | Finds the CakePuzzle root part. |
| `moveToCakeTarget` | Moves toward a cake target using a safe nearby position. |
| `collectCake` | Moves to and touches the cake puzzle root. |
| `clearCakeAura` | Destroys tracked cake-aura visual objects. |
| `getValveButtonTargets` | Finds valve puzzle button parts and ClickDetectors. |
| `isValvePuzzleCompleted` | Reads the valve puzzle's `Completed` value. |
| `setCrawlwayNoclip` | Saves/restores collision for upper crawlway vent parts. |
| `findEscapeExitParts` | Locates Neon parts under escape doors. |
| `solveValvePuzzle` | Moves to and clicks valve buttons until completion or timeout. |
| `cacheLightingSettings` | Saves lighting values before visual changes. |
| `setFullbright` | Applies fullbright settings or restores cached lighting. |
| `setNoFog` | Removes/restores Atmosphere and fog settings. |
| `setNoEffects` | Temporarily removes/restores post-processing effects. |

The file also retains the observed public helpers `solvePicture` and `getCombinationPuzzleSolution`, and the existing `_G.RyvoraMarkTp` marker helper (sets temporary global flags around scripted teleports). Numerous UI callbacks remain anonymous closures in the lift; their behavior is visible in context but they are not independent named helper definitions.
