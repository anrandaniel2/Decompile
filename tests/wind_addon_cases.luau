local UiLibrary = createCheesyUIState(WindUI)
local WindWindow = UiLibrary:GetNativeWindow()
local rT, Groupboxes, CheesyState = {}, {}, {}
local Toggles, Options = UiLibrary.Toggles, UiLibrary.Options
local floor = "Lobby"
local function detectFloor() return floor end
local function CheesyApplyTranslationsReport() end
local function getgenv() return {} end
writefile("cheesy/addons/native.lua", [[
    cheesy.AddonInfo = { Title = "Native test", Description = "Using WindUI", Floor = "Mines" }
    cheesy:Connect({ Disconnect = function() cheesy.Globals.disconnected = true end })
    cheesy.Groupbox:Toggle({ Title = "Addon toggle", Value = false, Callback = function(value) end })
    local tab = cheesy:Tab("Native tab", "house")
    local section = cheesy:Section("Extra", tab)
    section:Button({ Title = "Native button", Callback = function()
        cheesy:Section("Later", tab):Paragraph({ Title = "Deferred" })
    end })
]])
-- ADDON_LOADER: populated from the standalone script by the test runner.
assert(#LoadedAddonGroupboxes == 2)
assert(LoadedAddonGroupboxes[1].config.Title == "Native test")
assert(LoadedAddonGroupboxes[1].config.Desc == "Using WindUI")
assert(LoadedAddonGroupboxes[1].elements[1].config.Title == "Addon toggle")
assert(LoadedAddonGroupboxes[2].elements[1].config.Title == "Native button")
LoadedAddonGroupboxes[2].elements[1].config.Callback()
assert(#LoadedAddonGroupboxes == 3 and not LoadedAddonGroupboxes[3].ElementFrame.Visible)
assert(not LoadedAddonGroupboxes[1].ElementFrame.Visible)
local addonTab = rawWindow.tabs[2]
assert(not addonTab.UIElements.Main.Visible)
floor = "Mines"; CheesyState.RefreshAddonFloors()
assert(LoadedAddonGroupboxes[1].ElementFrame.Visible and addonTab.UIElements.Main.Visible)
local oldSection = LoadedAddonGroupboxes[1]
RefreshAddons()
assert(oldSection.Destroyed and #LoadedAddonGroupboxes == 2 and CheesyState.disconnected)
assert(#rawWindow.tabs == 2 and addonTab.UIElements.Main.Visible)
CheesyState.ClearAddonGroupboxes()
assert(#LoadedAddonGroupboxes == 0 and not addonTab.UIElements.Main.Visible)
print("Native addon loader tests passed")
