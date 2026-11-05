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

# These are documented at their declarations, not globally renamed. Their
# one-character identifiers are shadowed extensively by unrelated local vars.
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
