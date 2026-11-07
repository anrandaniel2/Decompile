"""Names inferred from each top-level routine's behavior and its call sites.

Only unique, two-or-more-character top-level locals are renamed automatically.
One-letter locals and callback parameters are intentionally left alone: blindly
renaming them would capture unrelated names in nested lexical scopes.
"""
FUNCTION_NAMES = {
    'AT': 'getMainGameModules', 'fT': 'findMenuFrame', 'mT': 'setMenuVisibility',
    'VT': 'postBloxstrapRpc', 'qT': 'getPresenceRoom', 'MT': 'updateDiscordPresence',
    'iT': 'startOrbitItems', 'jT': 'clearBringItemsForces', 'DT': 'stopBringItems',
    'aT': 'getItemBasePart', 'JT': 'configureProximityPrompt',
    'bT': 'trackProximityPrompt', 'BT': 'processEntity',
    'uT': 'processVineDoor', 'eT': 'installNamecallHook',
    'tT': 'processRoom', 'QT': 'getPromptDistance', 'cT': 'forceTriggerPrompt',
    'WT': 'isWalkspeedEnabled', 'pT': 'stopSpeedBypass',
    'lT': 'disconnectSpeedLoop', 'ZT': 'setupSpeedBypass',
    'LT': 'startBypassWalkspeed', 'OT': 'startAttributeWalkspeed',
    'nT': 'stopFly', 'vT': 'findNearbyOfficeChair',
    'HT': 'activateChairBypass', 'UT': 'startChairFly',
    'KT': 'collectNoclipParts', 'NT': 'setNoclipPartsCollision',
    'ST': 'refreshEyesAndMonumentState', 'zT': 'trackMonumentInRoom',
    'hT': 'fireMonumentLookAngle', 'YT': 'collectThirdPersonParts',
    'sT': 'refreshThirdPersonParts', 'od': 'setThirdPersonTransparency',
    'Td': 'restoreGodmodeCharacter', 'kd': 'collectPhaseParts',
    'wd': 'processAutoInteractPrompt', 'Fd': 'enableCategoryTracers',
    'Ad': 'refreshRoomESP', 'dd': 'watchRoomForESP',
    'Gd': 'addCategoryESP', 'yd': 'removeCategoryESP',
    'Xd': 'notifyFoundItem', 'Id': 'processESPObject',
    'Vd': 'getESPLabel', 'qd': 'refreshCategoryESP',
    'Md': 'setupCategoryESP', 'jd': 'refreshPlayersESP',
    'Dd': 'watchPlayerESP', 'ad': 'isEntityPathNode',
    'Rd': 'stopLobbyFly', 'xd': 'startLobbyFly', 'Bd': 'refreshCurrentFloor',
    'Qd': 'clearElectricPuddleMarkers', 'cd': 'processElectricPuddle',
    'Zd': 'lowerNoiseTVStand', 'nd': 'getCurrentRoom',
    'vd': 'getRoomDoorPart', 'Hd': 'findRoomKeyPrompt',
    'Ud': 'isThreatNearby', 'Kd': 'setHotelCrouchHeld',
    'Nd': 'clearHotelPathNodes', 'Sd': 'isRaycastBlocked',
    'zd': 'faceTravelDirection', 'hd': 'fireNearbyPrompts',
    'Ed': 'getObjectPosition', 'Yd': 'findNextDoor',
    'sd': 'findNearbySeekTrigger', 'ou': 'getInteractablePrompt',
    'Tu': 'getCurrentDoorTarget', 'ku': 'findNamedDescendant',
    'Pu': 'waitForNamedDescendant', 'wu': 'watchFloorChanges',
    'Fu': 'setupAutoSolveAnchors', 'Au': 'setupAutoMinecart',
    'du': 'applyFullbright', 'Cu': 'restoreLighting',
    'fu': 'stopFreecam', 'Gu': 'requestMinesGenerator',
    'yu': 'refreshHidingSpotVisibility', 'Xu': 'updateJumpscareSettings',
    'Iu': 'getEntityNotificationText', 'Vu': 'repositionAchievementNotices',
    'qu': 'queueWorldObject', 'Mu': 'processWorldObjectQueue',
    'iu': 'watchOxygen', 'au': 'unloadCheesy', 'Ju': 'showCreditSplash',
}

# These one-character top-level functions are renamed through lexical binding.
# Their identifiers are shadowed extensively by unrelated inner locals.
SHORT_FUNCTION_NAMES = {
    'w': 'loadObsidianUiLibrary', 'F': 'loadLinoriaUiLibrary',
    'd': 'getTabButton', 'C': 'getTabLabel', 'f': 'isActiveTab',
    'm': 'patchUiLibrary', 'r': 'saveUserData', 'G': 'loadUserData',
    'y': 'makeCheesyTheme', 'X': 'registerCheesyTheme',
    'I': 'ensureDataFolders', 'c': 'updateCurrentRoom',
    'g': 'watchLatestRoom', 'n': 'getGodmodeMethod',
    'v': 'hasActiveThreats', 'H': 'shouldUseGodmode',
    'U': 'trackThreat', 'K': 'applyGodmode',
    'N': 'restoreGodmode', 'S': 'saveCharacterPhysics',
    'z': 'detectFloor', 'h': 'watchMovementAttributes',
    'E': 'refreshCharacter',
}

# Resolve these root-level locals by lexical binding (not by text replacement).
# Callback parameters and block locals with the same spellings are not changed.
VARIABLE_NAMES = {
    'o': 'selectedUiLibrary',
    'T': 'UiLibrary', 'k': 'SaveManager', 'P': 'ThemeManager',
    'A': 'HttpService', 'V': 'espLibrarySource', 'q': 'ESPLibrary',
    'M': 'Players', 'i': 'RunService', 'j': 'ReplicatedStorage',
    'D': 'UserInputService', 'a': 'LocalPlayer', 'J': 'PlayerGui',
    'R': 'CurrentCamera', 'x': 'CurrentRooms',
    'b': 'Character', 'B': 'Humanoid', 'u': 'HumanoidRootPart',
    'e': 'CharacterCollision', 't': 'CharacterCollisionPart',
    'Q': 'LatestRoomValue', 'W': 'GameData',
    'p': 'Toggles', 'l': 'Options', 'Z': 'GameRemotes',
    'L': 'CheesyState', 'O': 'GodmodeState',
    'Y': 'updateWalkspeed', 's': 'updateFly',
    'oT': 'updateInfiniteJump', 'TT': 'updateNoclip',
    'kT': 'updateThirdPerson', 'PT': 'updatePhase',
}

# Nested *local function* declarations in source order. The original spelling
# is asserted before renaming to prevent a source edit from silently retargeting
# a name. These labels are descriptive inferences, not recovered debug symbols.
NESTED_FUNCTION_NAMES = [
    ('A', 'adaptLinoriaSource'),                 # 01
    ('T', 'readHexPair'),                        # 02
    ('o', 'makeVisibilitySetter'),               # 03
    ('T', 'addTranslationIndexEntry'),           # 04
    ('P', 'setTranslatedText'),                   # 05
    ('w', 'translateWidgetInfo'),                 # 06
    ('F', 'translateWidgetCollection'),           # 07
    ('A', 'translateTextGuiObject'),              # 08
    ('P', 'watchHumanoidDeath'),                  # 09
    ('T', 'trackSeekObstaclePart'),              # 10
    ('T', 'isMinecartNodeFacingForward'),         # 11
    ('k', 'getMinecartNodeTurnDirection'),        # 12
    ('P', 'findNextMinecartNode'),               # 13
    ('w', 'highlightSeekGuidingLight'),          # 14
    ('k', 'handleBreakerBoxAutoSolve'),           # 15
    ('k', 'updateNetworkPingEstimate'),          # 16
    ('f', 'getThreatBasePart'),                  # 17
    ('m', 'getCharacterCollisionPart'),          # 18
    ('G', 'findCrucifixThreat'),                 # 19
    ('y', 'findThreatInCrucifixRange'),           # 20
    ('X', 'findDroppedCrucifix'),                # 21
    ('k', 'getFigureModelRoot'),                 # 22
    ('P', 'getGroundskeeperModelRoot'),           # 23
    ('w', 'trackFigureOrGroundskeeper'),          # 24
    ('F', 'untrackFigureOrGroundskeeper'),        # 25
    ('d', 'refreshFigureCameraReference'),       # 26
    ('C', 'captureFigureCamera'),                # 27
    ('f', 'clearFigureGodmodeState'),            # 28
    ('m', 'getFigureCameraOffset'),              # 29
    ('r', 'offsetCameraNearFigure'),             # 30
    ('G', 'startFigureGodmodeWatcher'),          # 31
    ('y', 'stopFigureGodmodeWatcher'),           # 32
    ('P', 'considerNearbyOfficeChair'),          # 33
    ('o', 'disableAlmaAggression'),              # 34
    ('T', 'processAlmaModel'),                   # 35
    ('k', 'getCharacterForSkip'),                # 36
    ('P', 'waitForFutureRoom'),                  # 37
    ('w', 'fireRoomLookAtRemotes'),              # 38
    ('F', 'processVineSkipRoom'),                # 39
    ('A', 'scanVineSkipRooms'),                  # 40
    ('k', 'getHorizontalUnitVector'),            # 41
    ('k', 'createSeekPathNode'),                 # 42
    ('F', 'installMinecartDecodeHook'),          # 43
    ('w', 'waitUntilCutscene'),                  # 44
    ('F', 'teleportCharacterToNode'),            # 45
    ('T', 'cacheNotificationSound'),            # 46
    ('X', 'createAchievementTextLabel'),         # 47
    ('C', 'playNotificationSound'),              # 48
    ('A', 'normalizeFloorName'),                 # 49
    ('d', 'matchesAddonFloorFilter'),           # 50
    ('C', 'setAddonGroupboxVisible'),            # 51
    ('f', 'setAddonTabVisible'),                 # 52
    ('m', 'refreshAddonFloorVisibility'),        # 53
    ('r', 'showAddonWarning'),                  # 54
    ('G', 'normalizeAddonSide'),                 # 55
    ('y', 'trackAddonGroupbox'),                # 56
    ('X', 'trackOwnedAddonGroupbox'),            # 57
    ('I', 'createAddonGroupbox'),               # 58
    ('V', 'displayAddonError'),                  # 59
    ('q', 'createAddonContext'),                # 60
    ('M', 'disconnectAddonConnections'),         # 61
    ('i', 'loadUserAddons'),                     # 62
]
