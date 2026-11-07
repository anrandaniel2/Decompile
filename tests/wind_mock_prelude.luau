-- Small Roblox/WindUI test double; exercises UI behavior without running the game.
local function signal()
    local handlers = {}
    return {
        Connect = function(_, fn)
            local entry = { fn = fn, live = true }; table.insert(handlers, entry)
            return { Disconnect = function() entry.live = false end }
        end,
        Fire = function(_, ...)
            for _, entry in ipairs(handlers) do if entry.live then entry.fn(...) end end
        end,
    }
end
local function instance()
    local properties, changed = {}, {}
    local obj = setmetatable({}, {
        __index = function(_, key) return properties[key] end,
        __newindex = function(_, key, value)
            properties[key] = value
            if changed[key] then changed[key]:Fire() end
        end,
    })
    obj.GetPropertyChangedSignal = function(_, key) changed[key] = changed[key] or signal(); return changed[key] end
    obj.FindFirstChildWhichIsA = function() return instance() end
    obj.Destroy = function() obj.Destroyed = true end
    obj.MouseButton1Click = signal()
    return obj
end
local Instance = { new = function() return instance() end }
local keys = setmetatable({}, { __index = function(t, name) local key = { Name = name }; rawset(t, name, key); return key end })
local Enum = { KeyCode = keys, AutomaticSize = { Y = "Y", X = "X" },
    UserInputType = { MouseButton1 = "Mouse1", MouseButton2 = "Mouse2" } }
local UDim2 = { new = function(...) return {...} end, fromOffset = function(...) return {...} end }
local function color(hex)
    return { hex = hex, ToHex = function(self) return self.hex end }
end
local Color3 = { new = function() return color("ffffff") end, fromRGB = function() return color("ffffff") end,
    fromHex = function(hex) return color(hex) end }
local inputs = { InputBegan = signal(), InputEnded = signal(), down = {} }
function inputs:GetFocusedTextBox() return nil end
function inputs:IsKeyDown(key) return self.down[key.Name] == true end
function inputs:IsMouseButtonPressed(button) return self.down[button] == true end
local players = { LocalPlayer = {Name = "Local"}, PlayerAdded = signal(), PlayerRemoving = signal() }
players.list = { players.LocalPlayer, {Name = "Alice"} }
function players:GetPlayers() return self.list end
local files, encoded, serial = {}, {}, 0
local http = {}
function http:JSONEncode(data) serial = serial + 1; local token = "json" .. serial; encoded[token] = data; return token end
function http:JSONDecode(token) assert(encoded[token], "invalid JSON"); return encoded[token] end
local game = { GetService = function(_, name) if name == "UserInputService" then return inputs elseif name == "HttpService" then return http elseif name == "Players" then return players end end }
local function writefile(path, value) files[path] = value end
local function readfile(path) assert(files[path], "file missing: " .. path); return files[path] end
local function isfile(path) return files[path] ~= nil end
local function isfolder() return true end
local function makefolder() end
local function delfile(path) files[path] = nil end
local function listfiles(folder)
    local result = {}
    for path in pairs(files) do if path:sub(1, #folder + 1) == folder .. "/" then table.insert(result, path) end end
    return result
end
local warnings = {}
local function warn(value) table.insert(warnings, value) end
local deferred = {}
local function defer(fn) table.insert(deferred, fn) end
local function flush()
    while #deferred > 0 do local fn = table.remove(deferred, 1); fn() end
end
local function element(config, kind)
    local obj = { ElementFrame = instance(), config = config, Value = config.Value }
    function obj:SetTitle(title) self.Title = title end
    function obj:SetImage(image) self.Image = image end
    function obj:Destroy() self.Destroyed = true end
    function obj:Lock() self.Locked = true end
    function obj:Unlock() self.Locked = false end
    function obj:Set(value, callbacks)
        if self.Locked then return end
        local old = self.Value; self.Value = value
        if kind == "Input" or (kind == "Slider" and value ~= old) or (kind == "Toggle" and callbacks) then
            if config.Callback then config.Callback(value) end
        end
    end
    function obj:SetMin(value) self.Min = value end
    function obj:SetMax(value) self.Max = value end
    function obj:Refresh(values)
        self.Values = values
        defer(function() if config.Callback then config.Callback(self.Value) end end)
    end
    function obj:Select(value) self.Value = value; self:Refresh(self.Values) end
    if kind == "Keybind" then
        local label = instance(); label.Text = config.Value
        obj.UIElements = { Keybind = { Frame = { Frame = { TextLabel = label } } } }
    elseif kind == "Dropdown" then obj:Refresh(config.Values)
    elseif kind == "Input" then config.Callback(config.Value) end
    return obj
end
local WindUI = { Themes = { Dark = {}, Light = {} }, ScreenGui = instance(), Creator = {} }
function WindUI.Creator.Drag() end
local rawWindow
function WindUI:CreateWindow(config)
    rawWindow = { config = config, UIElements = { Main = instance() }, tabs = {} }
    function rawWindow:OnDestroy(fn) self.onDestroy = fn end
    function rawWindow:SetToggleKey(key) self.toggleKey = key end
    function rawWindow:SetUIScale(scale) self.scale = scale end
    function rawWindow:SetIconSize(size) self.iconSize = size end
    function rawWindow:Open() self.open = true end
    function rawWindow:Close() self.open = false end
    function rawWindow:Destroy() self.Destroyed = true; if self.onDestroy then self.onDestroy() end end
    function rawWindow:Tab(info)
        local button = instance(); button.Frame = { TextLabel = instance() }
        local tab = { config = info, UIElements = { Main = button }, sections = {} }
        function tab:Select() rawWindow.selected = self end
        function tab:Section(sectionInfo)
            local section = { config = sectionInfo, ElementFrame = instance(), elements = {} }
            function section:Destroy() self.Destroyed = true end
            function section:SetTitle(title) self.config.Title = title end
            function section:SetDesc(desc) self.config.Desc = desc end
            for _, kind in ipairs({"Paragraph", "Button", "Toggle", "Slider", "Dropdown", "Input", "Colorpicker", "Keybind", "Divider"}) do
                section[kind] = function(self, config)
                    config = config or {}
                    local item = element(config, kind); table.insert(self.elements, item); return item
                end
            end
            table.insert(self.sections, section); return section
        end
        table.insert(self.tabs, tab); return tab
    end
    return rawWindow
end
function WindUI:Notify(info) self.lastNotification = info; return info end
function WindUI:SetTheme(name) self.theme = name end
