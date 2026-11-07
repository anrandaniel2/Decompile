local UiLibrary = createCheesyUIState(WindUI)
local saved = false
local function loadUserData() return false end
local function saveUserData() saved = true end
local CHEESE_KEY = "sample-key"
local DISCORD_INVITE = "example"
local Executions = 0
local task = {}
function task.wait()
    local section = rawWindow.tabs[#rawWindow.tabs].sections[1]
    section.elements[2].config.Callback(CHEESE_KEY)
    section.elements[4].config.Callback()
end
-- KEY_PROMPT: populated from the standalone script by the test runner.
assert(saved and Executions == 1 and not rawWindow.tabs[1].UIElements.Main.Visible)

local k = true
local CheesyLanguageList = { { Name = "English", Code = "english" }, { Name = "Francais", Code = "french" } }
local CheesyLanguage = "english"
function task.wait()
    local section = rawWindow.tabs[#rawWindow.tabs].sections[1]
    section.elements[1].config.Callback("Francais")
    section.elements[3].config.Callback()
end
-- LANGUAGE_PROMPT: populated from the standalone script by the test runner.
assert(CheesyLanguage == "french" and not rawWindow.tabs[2].UIElements.Main.Visible)
print("Native onboarding prompt tests passed")
