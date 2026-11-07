-- Shared state, config, and input handling for native WindUI controls.
local function createCheesyUIState(WindUI)
    local Library = { Toggles = {}, Options = {}, TabButtons = {}, TranslateTargets = {} }
    local input = game:GetService("UserInputService")
    local http = game:GetService("HttpService")
    local connections, keypickers = {}, {}
    local window, unloaded = nil, false

    local function tr(text)
        if type(text) ~= "string" then return text end
        return Library.Translate and Library.Translate(text) or text
    end
    local function connect(signal, callback)
        local connection = signal:Connect(callback)
        table.insert(connections, connection)
        return connection
    end
    local function keyMatches(event, name)
        if name == "MouseLeft" or name == "MouseLeftButton" then
            return event.UserInputType == Enum.UserInputType.MouseButton1
        elseif name == "MouseRight" or name == "MouseRightButton" then
            return event.UserInputType == Enum.UserInputType.MouseButton2
        end
        return event.KeyCode and event.KeyCode.Name == name
    end
    local function equal(a, b)
        if type(a) ~= "table" or type(b) ~= "table" then return a == b end
        for k, v in pairs(a) do if b[k] ~= v then return false end end
        for k, v in pairs(b) do if a[k] ~= v then return false end end
        return true
    end
    local function asMap(value)
        local result = {}
        if type(value) == "table" then
            for key, v in pairs(value) do
                if type(key) == "number" then result[v] = true elseif v then result[key] = true end
            end
        elseif value ~= nil then result[value] = true end
        return result
    end
    local function asArray(value)
        local result = {}
        for key, selected in pairs(asMap(value)) do if selected then table.insert(result, key) end end
        return result
    end
    local function emit(widget)
        if widget.Disabled then return end
        local function call(fn)
            local ok, err = pcall(fn, widget.Value)
            if not ok then warn("[cheesy] UI callback failed: " .. tostring(err)) end
        end
        if widget.Callback then call(widget.Callback) end
        for _, fn in ipairs(widget.Changed) do call(fn) end
    end
    local function base(kind, data, group)
        local widget = { Type = kind, Text = data.Title, Tooltip = data.Desc, Callback = data.Callback,
            Changed = {}, Group = group, Disabled = false, InitialDisabled = data.Disabled == true }
        function widget:OnChanged(fn) table.insert(self.Changed, fn); return self end
        function widget:RunChanged() emit(self) end
        function widget:SetText(text)
            self.Text = text
            if self.Element and self.Element.SetTitle then self.Element:SetTitle(text) end
        end
        function widget:SetVisible(visible)
            if self.Element and self.Element.ElementFrame then self.Element.ElementFrame.Visible = visible end
        end
        function widget:SetDisabled(disabled)
            self.Disabled = disabled == true
            if self.Element then
                if self.Disabled and self.Element.Lock then self.Element:Lock()
                elseif not self.Disabled and self.Element.Unlock then self.Element:Unlock() end
            end
        end
        function widget:Destroy()
            if self.Element and self.Element.Destroy then self.Element:Destroy() end
        end
        return widget
    end
    local function syncKeys(widget)
        if widget.Type == "Toggle" then
            for _, key in ipairs(keypickers) do
                if key.Owner == widget and key.SyncToggleState then key.Toggled = widget.Value end
            end
        end
    end
    local function changed(widget, value)
        if widget.Multi then value = asMap(value) end
        if widget.Type == "Slider" then value = tonumber(value) or widget.Value end
        if not equal(widget.Value, value) then widget.Value = value; syncKeys(widget); emit(widget) end
    end
    local function setValue(widget, value)
        if widget.Multi then value = asMap(value) end
        if widget.Type == "Slider" then value = tonumber(value) or widget.Value end
        if widget.Type == "KeyPicker" and type(value) == "table" then
            widget.Mode = value[2] or widget.Mode
            if widget.ModePicker then widget.ModePicker:Select(widget.Mode) end
            value = value[1]
        end
        widget.Value = value
        local element = widget.Element
        if element then
            if widget.Disabled and element.Unlock then element:Unlock() end
            if widget.Type == "Dropdown" then element:Select(widget.Multi and asArray(value) or value)
            elseif widget.Type == "Toggle" then element:Set(value, false)
            elseif widget.Type == "ColorPicker" then element:Set(value, widget.Transparency)
            elseif element.Set then element:Set(value) end
            if widget.Disabled and element.Lock then element:Lock() end
        end
        syncKeys(widget)
        if widget.Type == "KeyPicker" then widget:Update() else emit(widget) end
    end

    -- State objects contain gameplay values and callbacks; rendering is supplied by
    -- each call site, which constructs the appropriate native WindUI element.
    function Library:Text(text) return tr(text) end
    function Library:SelectionArray(value) return asArray(value) end
    function Library:TrackElement(section, element)
        section.CheesyElements = section.CheesyElements or {}
        local item = { Element = element, Holder = element and element.ElementFrame }
        table.insert(section.CheesyElements, item)
        return element
    end
    function Library:ReleaseSection(section)
        for _, collection in ipairs({ self.Toggles, self.Options }) do
            for id, widget in pairs(collection) do
                if widget.Section == section then
                    for _, connection in ipairs(widget.SpecialConnections or {}) do connection:Disconnect() end
                    collection[id] = nil
                end
            end
        end
        for i = #keypickers, 1, -1 do
            local key = keypickers[i]
            if key.Section == section then
                if key.KeyChangeConnection then key.KeyChangeConnection:Disconnect() end
                if key.MenuLabel then key.MenuLabel:Destroy() end
                table.remove(keypickers, i)
            end
        end
        -- WindUI dividers have no Destroy method. Destroy children individually
        -- first so one such element cannot abort the rest of section cleanup.
        local children = {}
        for _, element in pairs(section.Elements or {}) do table.insert(children, element) end
        for _, element in ipairs(children) do
            if element.Destroy then pcall(function() element:Destroy() end)
            elseif element.ElementFrame then pcall(function() element.ElementFrame:Destroy() end) end
        end
        pcall(function() section:Destroy() end)
        pcall(function() section.ElementFrame:Destroy() end)
    end
    function Library:RegisterTab(tab, title)
        tab.Name, tab.OriginalName = title, title
        local button = tab.UIElements.Main
        table.insert(self.TabButtons, { Frame = button, Label = button.Frame.TextLabel })
        connect(button.MouseButton1Click, function() self.ActiveTab = tab end)
        return tab
    end
    function Library:Mount(section, kind, id, data, render, owner)
        local widget = base(kind, data, section)
        widget.Section, widget.Owner = section, owner
        if kind == "Toggle" then
            widget.Value = data.Value == true
            self.Toggles[id] = widget
        elseif kind == "Slider" then
            widget.Min, widget.Max = data.Min or 0, data.Max or 100
            widget.Value = data.Value or widget.Min
            self.Options[id] = widget
        elseif kind == "Dropdown" then
            widget.Multi, widget.Values = data.Multi == true, data.Values or {}
            if data.SpecialType == "Player" then
                widget.PlayerService = game:GetService("Players")
                local function names(excluded)
                    local result = {}
                    for _, player in ipairs(widget.PlayerService:GetPlayers()) do
                        if player ~= excluded and (not data.ExcludeLocalPlayer or player ~= widget.PlayerService.LocalPlayer) then
                            table.insert(result, player.Name)
                        end
                    end
                    table.sort(result)
                    return result
                end
                widget.PlayerNames = names
                widget.Values = names()
            end
            local default = data.Value
            if type(default) == "number" then default = widget.Values[default] end
            widget.Value = widget.Multi and asMap(default) or default
            self.Options[id] = widget
        elseif kind == "Input" then
            widget.Value, widget.Placeholder = tostring(data.Value or ""), data.Placeholder
            self.Options[id] = widget
        elseif kind == "ColorPicker" then
            widget.Value, widget.Transparency = data.Value or Color3.new(1, 1, 1), data.Transparency
            self.Options[id] = widget
        elseif kind == "KeyPicker" then
            widget.Value, widget.Mode = data.Value or "F", data.Mode or "Toggle"
            widget.SyncToggleState, widget.Toggled, widget.NoUI = data.SyncToggleState == true,
                data.SyncToggleState == true and owner and owner.Type == "Toggle" and owner.Value or false, data.NoUI
            widget.VisibleWhen = data.VisibleWhen
            self.Options[id] = widget
            table.insert(keypickers, widget)
        elseif kind == "Button" then
            widget.Action = data.Callback or function() end
        end
        function widget:Receive(value, transparency)
            if self.Type == "ColorPicker" then self.Transparency = transparency end
            changed(self, value)
        end
        function widget:SetValue(value)
            if self.Type == "Toggle" then value = value == true end
            if self.Type == "Input" then value = tostring(value or "") end
            setValue(self, value)
        end
        if kind == "Slider" then
            function widget:SetMin(value) self.Min = value; self.Element:SetMin(value) end
            function widget:SetMax(value) self.Max = value; self.Element:SetMax(value) end
        elseif kind == "Dropdown" then
            function widget:SetValues(values)
                self.Values = values
                local allowed = {}
                for _, value in ipairs(values) do allowed[value] = true end
                local nextValue = self.Value
                if self.Multi then
                    nextValue = {}
                    for value, selected in pairs(self.Value) do
                        if selected and allowed[value] then nextValue[value] = true end
                    end
                elseif not allowed[nextValue] then nextValue = nil end
                self.Element:Refresh(values)
                if not equal(self.Value, nextValue) then self:SetValue(nextValue) end
            end
        elseif kind == "ColorPicker" then
            function widget:SetValueRGB(value, transparency) self.Transparency = transparency; setValue(self, value) end
        elseif kind == "KeyPicker" then
            function widget:GetState()
                if self.Mode == "Always" then return true end
                if self.Mode == "Hold" then
                    if input:GetFocusedTextBox() then return false end
                    if self.Value == "MouseLeft" or self.Value == "MouseLeftButton" then
                        return input:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
                    elseif self.Value == "MouseRight" or self.Value == "MouseRightButton" then
                        return input:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
                    end
                    local key = Enum.KeyCode[self.Value]
                    return key and input:IsKeyDown(key) or false
                end
                return self.Toggled
            end
            function widget:OnClick(fn) self.Clicked = fn end
            function widget:Update()
                if self == Library.ToggleKeybind and Enum.KeyCode[self.Value] then window:SetToggleKey(Enum.KeyCode[self.Value]) end
                if self.MenuLabel then
                    self.MenuLabel.Text = (self.Text or id) .. " [" .. tostring(self.Value) .. "]"
                    self.MenuLabel.Visible = not self.NoUI and (not self.VisibleWhen or self.VisibleWhen())
                end
            end
        end
        widget.Element = render(widget, data)
        widget.Holder = widget.Element and widget.Element.ElementFrame
        section.CheesyElements = section.CheesyElements or {}
        table.insert(section.CheesyElements, widget)
        if kind == "Dropdown" and widget.PlayerService then
            widget.SpecialConnections = {
                connect(widget.PlayerService.PlayerAdded, function() widget:SetValues(widget.PlayerNames()) end),
                connect(widget.PlayerService.PlayerRemoving, function(player) widget:SetValues(widget.PlayerNames(player)) end),
            }
        elseif kind == "KeyPicker" then
            local keyLabel = widget.Element.UIElements.Keybind.Frame.Frame.TextLabel
            widget.KeyChangeConnection = connect(keyLabel:GetPropertyChangedSignal("Text"), function()
                local value = keyLabel.Text
                if value ~= "..." and value ~= widget.Value then
                    widget.Value = value
                    widget:Update()
                    for _, fn in ipairs(widget.Changed) do fn(value) end
                end
            end)
            if not data.NoUI and widget.Mode ~= "Press" then
                widget.ModePicker = section:Dropdown({ Title = tr((data.Title or "Keybind") .. " mode"),
                    Values = { "Toggle", "Hold", "Always" }, Value = widget.Mode,
                    Callback = function(mode)
                        if mode ~= widget.Mode then
                            widget.Mode = mode
                            if mode == "Always" and widget.SyncToggleState and owner and owner.Type == "Toggle" and not owner.Value then
                                owner:SetValue(true)
                            end
                        end
                    end })
            end
            if Library.KeybindFrame and not data.NoUI then
                local label = Instance.new("TextLabel")
                label.BackgroundTransparency = 1; label.Size = UDim2.new(1, 0, 0, 22)
                label.TextColor3 = Color3.new(1, 1, 1); label.TextSize = 14
                label.Parent = Library.KeybindFrame; widget.MenuLabel = label; widget:Update()
            end
        end
        if widget.InitialDisabled then widget:SetDisabled(true) end
        return widget
    end
    local function ensureWindow()
        if window then return window end
        window = WindUI:CreateWindow({ Title = "cheesy", Author = "Revamped :O dsc.gg/cheesyscript",
            Icon = "rbxassetid://106990021902592", ToggleKey = Enum.KeyCode.RightShift,
            Folder = "cheesy", NewElements = true, OpenButton = { Title = "Open cheesy", Enabled = true } })
        Library.ScreenGui = WindUI.ScreenGui
        Library.Window = { MainFrame = window.UIElements.Main }
        window:OnDestroy(function() Library:Unload() end)
        Library.KeybindFrame = Instance.new("Frame")
        Library.KeybindFrame.Name = "CheesyKeybinds"
        Library.KeybindFrame.Position = UDim2.new(1, -210, 0.25, 0)
        Library.KeybindFrame.Size = UDim2.fromOffset(200, 0)
        Library.KeybindFrame.AutomaticSize = Enum.AutomaticSize.Y
        Library.KeybindFrame.BackgroundTransparency = 0.25
        Library.KeybindFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 25)
        Library.KeybindFrame.Visible = false
        Library.KeybindFrame.Parent = WindUI.ScreenGui
        local layout = Instance.new("UIListLayout"); layout.Parent = Library.KeybindFrame
        connect(input.InputBegan, function(event, processed)
            if processed or input:GetFocusedTextBox() then return end
            for _, key in ipairs(keypickers) do
                local owner = key.Owner
                if not key.Disabled and not key.Element.Picking and keyMatches(event, key.Value)
                    and (not key.VisibleWhen or key.VisibleWhen()) and not (owner and owner.Disabled) then
                    if key.Mode == "Hold" or key.Mode == "Always" then key.Toggled = true
                    elseif key.Mode == "Toggle" then key.Toggled = not key.Toggled
                    else key.Toggled = true end
                    if key.SyncToggleState and owner and owner.Type == "Toggle" then owner:SetValue(key.Toggled)
                    elseif owner and owner.Type == "Button" and owner.Action then
                        local ok, err = pcall(owner.Action)
                        if not ok then warn("[cheesy] Keybind callback failed: " .. tostring(err)) end
                    end
                    for _, callback in ipairs({ key.Callback or false, key.Clicked or false }) do
                        if callback then
                            local ok, err = pcall(callback, key.Toggled)
                            if not ok then warn("[cheesy] Keybind callback failed: " .. tostring(err)) end
                        end
                    end
                end
            end
        end)
        connect(input.InputEnded, function(event)
            for _, key in ipairs(keypickers) do
                if keyMatches(event, key.Value) and (key.Mode == "Hold" or key.Mode == "Press") then
                    key.Toggled = false
                    if key.Mode == "Hold" and key.SyncToggleState and key.Owner and key.Owner.Type == "Toggle" then
                        key.Owner:SetValue(false)
                    end
                end
            end
        end)
        return window
    end
    -- Startup screens use WindUI directly; the main window reuses this instance.
    function Library:GetNativeWindow() return ensureWindow() end
    function Library:Notify(info)
        if type(info) == "string" then info = { Title = info } end
        return WindUI:Notify({ Title = tr(info.Title), Content = tr(info.Description), Duration = info.Time })
    end
    function Library:SetDPIScale(scale) ensureWindow():SetUIScale(scale / 100) end
    function Library:SetWindowIconVisible(visible) ensureWindow():SetIconSize(visible and 22 or 0) end
    function Library:Toggle(show)
        if show then ensureWindow():Open() else ensureWindow():Close() end
    end
    function Library:OnUnload(fn) self.UnloadCallback = fn end
    function Library:Unload()
        if unloaded then return end
        unloaded = true
        for _, c in ipairs(connections) do c:Disconnect() end
        if self.UnloadCallback then self.UnloadCallback() end
        if window and not window.Destroyed then window:Destroy() end
    end
    function Library:AddDraggableLabel(text)
        local label = Instance.new("TextLabel")
        label.Name = "DisplayInfoLabel"; label.Text = text; label.TextColor3 = Color3.new(1, 1, 1)
        label.TextSize = 14; label.BackgroundColor3 = Color3.fromRGB(22, 22, 25)
        label.BackgroundTransparency = 0.2; label.AutomaticSize = Enum.AutomaticSize.X
        label.Size = UDim2.fromOffset(0, 28); label.Position = UDim2.fromOffset(20, 20); label.Parent = WindUI.ScreenGui
        WindUI.Creator.Drag(label)
        return { Label = label, SetText = function(_, value) label.Text = value end, Destroy = function() label:Destroy() end }
    end

    local ThemeManager = { BuiltInThemes = {}, Folder = "cheesy/Data" }
    function ThemeManager:SetFolder(path)
        self.Folder = path
        if makefolder then
            local part = ""
            for piece in path:gmatch("[^/]+") do
                part = part == "" and piece or (part .. "/" .. piece)
                if not isfolder or not isfolder(part) then pcall(makefolder, part) end
            end
        end
    end
    function ThemeManager:SetLibrary() end
    function ThemeManager:ApplyTheme(name) if WindUI.Themes[name] then WindUI:SetTheme(name) end end
    function ThemeManager:LoadDefault()
        if isfile and readfile and isfile(self.Folder .. "/wind_theme.txt") then
            local ok, name = pcall(readfile, self.Folder .. "/wind_theme.txt")
            if ok and WindUI.Themes[name] then WindUI:SetTheme(name) end
        end
    end
    function ThemeManager:ApplyToGroupbox(group)
        local names = {}
        for name in pairs(WindUI.Themes) do table.insert(names, name) end
        table.sort(names)
        group:Dropdown({ Title = tr("Theme"), Values = names,
            Value = WindUI.Theme and WindUI.Theme.Name or "Dark", AllowNone = false,
            Callback = function(value)
                if WindUI.Themes[value] then
                    WindUI:SetTheme(value)
                    if writefile then pcall(writefile, ThemeManager.Folder .. "/wind_theme.txt", value) end
                end
            end })
    end

    local SaveManager = { Folder = "cheesy/Configs", Ignore = {} }
    function SaveManager:SetFolder(path)
        self.Folder = path
        if makefolder then
            local part = ""
            for piece in path:gmatch("[^/]+") do
                part = part == "" and piece or (part .. "/" .. piece)
                if not isfolder or not isfolder(part) then pcall(makefolder, part) end
            end
        end
    end
    function SaveManager:SetLibrary() end
    function SaveManager:SetIgnoreIndexes(ids) for _, id in ipairs(ids) do self.Ignore[id] = true end end
    local function safeName(name) return type(name) == "string" and name:match("^[%w_%- ]+$") and name ~= "" end
    function SaveManager:Save(name)
        if not safeName(name) or name:lower() == "autoload" then return false, "Invalid config name" end
        if not writefile then return false, "File storage is unavailable" end
        local objects = {}
        for _, collection in ipairs({ Library.Toggles, Library.Options }) do
            for id, item in pairs(collection) do
                if not self.Ignore[id] and item.Type ~= "Label" then
                    local entry = { idx = id, type = item.Type, value = item.Value }
                    if item.Type == "Input" then entry.text = item.Value; entry.value = nil
                    elseif item.Type == "ColorPicker" then entry.value = item.Value:ToHex(); entry.transparency = item.Transparency
                    elseif item.Type == "KeyPicker" then entry.key, entry.mode, entry.toggled, entry.value = item.Value, item.Mode, item.Toggled, nil end
                    table.insert(objects, entry)
                end
            end
        end
        local ok, err = pcall(function() writefile(self.Folder .. "/" .. name .. ".json", http:JSONEncode({ objects = objects })) end)
        return ok, err
    end
    function SaveManager:Load(name)
        if not safeName(name) or not readfile then return false, "Invalid name or file storage unavailable" end
        local ok, data = pcall(function() return http:JSONDecode(readfile(self.Folder .. "/" .. name .. ".json")) end)
        if not ok or type(data) ~= "table" or type(data.objects) ~= "table" then return false, tostring(data) end
        for _, entry in ipairs(data.objects) do
            local item = Library.Toggles[entry.idx] or Library.Options[entry.idx]
            if item and not self.Ignore[entry.idx] and item.Type == entry.type then
                local success, err = pcall(function()
                    if item.Type == "ColorPicker" then item:SetValueRGB(Color3.fromHex(entry.value), entry.transparency)
                    elseif item.Type == "KeyPicker" then item:SetValue({entry.key, entry.mode}); item.Toggled = entry.toggled == true
                    elseif item.Type == "Input" then item:SetValue(entry.text)
                    elseif (entry.idx == "NotifyStyle" or entry.idx == "ItemNotifyStyle") and entry.value == "Obsidian" then
                        item:SetValue("WindUI")
                    else item:SetValue(entry.value) end
                end)
                if not success then warn("[cheesy] Could not load " .. tostring(entry.idx) .. ": " .. tostring(err)) end
            end
        end
        return true
    end
    function SaveManager:RefreshConfigList()
        local names = {}
        if listfiles then
            local ok, files = pcall(listfiles, self.Folder)
            if ok then for _, file in ipairs(files) do
                local name = file:gsub("\\", "/"):match("([^/]+)%.json$")
                if name and safeName(name) then table.insert(names, name) end
            end end
        end
        table.sort(names); return names
    end
    function SaveManager:Delete(name)
        if not safeName(name) or not delfile or not isfile then return false, "Invalid name or file storage unavailable" end
        local path = self.Folder .. "/" .. name .. ".json"
        if not isfile(path) then return false, "Config not found" end
        local ok, err = pcall(delfile, path)
        if ok and readfile and isfile(self.Folder .. "/autoload.txt") then
            local readOk, selected = pcall(readfile, self.Folder .. "/autoload.txt")
            if readOk and selected == name then pcall(delfile, self.Folder .. "/autoload.txt") end
        end
        return ok, err
    end
    function SaveManager:SaveAutoloadConfig(name)
        if not safeName(name) or not writefile or not isfile or not isfile(self.Folder .. "/" .. name .. ".json") then
            return false, "Config not found or file storage unavailable"
        end
        return pcall(writefile, self.Folder .. "/autoload.txt", name)
    end
    function SaveManager:LoadAutoloadConfig()
        if isfile and readfile and isfile(self.Folder .. "/autoload.txt") then
            local ok, name = pcall(readfile, self.Folder .. "/autoload.txt")
            if ok then local loaded, err = self:Load(name); if not loaded then Library:Notify({Title = "Config", Description = tostring(err)}) end end
        end
    end
    function SaveManager:BuildConfigSection(tab)
        -- Configuration controls are native WindUI elements, not saved options.
        local group = tab:Section({ Title = tr("Configs"), Box = true, Opened = true })
        local name = ""
        group:Input({ Title = tr("Config name"), Callback = function(value) name = value end })
        local list = group:Dropdown({ Title = tr("Saved configs"), Values = self:RefreshConfigList(), AllowNone = true,
            Callback = function(value) if value then name = value end end })
        local function report(ok, err) Library:Notify({ Title = "Configs", Description = ok and "Done" or tostring(err) }) end
        group:Button({ Title = tr("Save"), Callback = function() local ok, err = self:Save(name); report(ok, err); list:Refresh(self:RefreshConfigList()) end })
        group:Button({ Title = tr("Load"), Callback = function() report(self:Load(name)) end })
        group:Button({ Title = tr("Delete"), Callback = function() local ok, err = self:Delete(name); report(ok, err); list:Refresh(self:RefreshConfigList()) end })
        group:Button({ Title = tr("Refresh list"), Callback = function() list:Refresh(self:RefreshConfigList()) end })
        group:Button({ Title = tr("Set autoload"), Callback = function() report(self:SaveAutoloadConfig(name)) end })
        group:Button({ Title = tr("Clear autoload"), Callback = function()
            if delfile and isfile and isfile(self.Folder .. "/autoload.txt") then report(pcall(delfile, self.Folder .. "/autoload.txt"))
            else Library:Notify({ Title = "Configs", Description = "No autoload config to clear" }) end
        end })
    end
    return Library, SaveManager, ThemeManager
end
