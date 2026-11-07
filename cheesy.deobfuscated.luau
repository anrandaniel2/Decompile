-- Reconstructed from cheesy.obfuscated.luau.txt by tools/deobfuscate.py.
-- Decoder, bootstrap side effects and selected helpers validated offline; NOT executed in Roblox.
-- Preserve the original call frame and anti-tamper guard before the game body.
return (function(...)
	do
		-- Both intentional errors must originate on the same source line.
		-- stylua: ignore
		local firstErrorProbe, secondErrorProbe = function()local o=(11235703-(-656372))-"sM"^(956926+12810151)return "rXNrBa"/o end, function()local o=1833817516%10434880-"R3zkvA"^(-482223+16854435)return "qts8EFcpO"/o end
		local o = "gCYOfPOVxRX5KQW"
		for T = -478191 + 478191, 217171476 % 8686859, -393068 + 393069 do
			if T == -216231 - -216231 then
				if o ~= "gCYOfPOVxRX5KQW" then
					while true do
					end
				end
				o = false
			elseif T == 39585 + -39584 then
				if o == false then
				end
			end
		end
		do
			o = true
		end
		local T = string["gmatch"]
		local k = function()
			error("Tamper Detected!")
		end
		local P = false
		local w = pcall(function()
			P = true
		end) and P
		local F = math["random"]
		local A = table["concat"]
		local d = table and table["unpack"] or unpack
		local C = F(245755387 % 4388489, 1546123329 % 6234368)
		local f = 715574 + -715574
		local m = 384172 + -384172
		local r = { pcall(firstErrorProbe) }
		local G = r[777144 + -777142]
		local y = tonumber((T(tostring(G), ":(%d*):"))())
		for k = 168079511 % 1977406, C, 2809392165 % 13907882 do
			local P = math["random"](-600562 - -600563, -69090 + 69190)
			local w = F(561836808 % 10804554, -640629 - -640884)
			local A = F(1141107862 % 10280251, P)
			local r = F(309258661 % 2118210, 1010113 - 1010111) == 654068 + -654067
			local X = G:gsub(":(%d*):", ":" .. (tostring(F(547185 + -547185, 701552044 % 11135588)) .. ":"))
			local I = {
				pcall(function()
					if F(-209446 + 209447, 581492 - 581490) == 340972 - 340971 or k == C then
						local k = tonumber(
							(T(tostring(({ pcall(secondErrorProbe) })[-884859 + 884861]), ":(%d*):"))()
						)
						o = o and y == k
					end
					if r then
						error(X, -884347 - -884347)
					end
					local f = {}
					for o = -954942 + 954943, P, 512349636 % 5281955 do
						f[o] = F(680181 + -680181, 988106907 % 12668034)
					end
					f[A] = w
					return d(f)
				end),
			}
			if r then
				o = o and (I[2431936233 % 11364188] == false and I[-722548 - -722550] == X)
			else
				o = o and I[21217 + -21216]
				f = (f + I[A + (-818297 + 818298)]) % (-10528 + 10784)
				m = (m + w) % (-113508 + 113764)
			end
		end
		o = o and f == m
		if o then
		else
			repeat
				return (function()
					while true do
						l1, l2 = l2, l1
						k()
					end
				end)()
			until true
			while true do
				l2 = F(37346 - 37345, -626483 + 626489)
				if l2 > 434285 + -434283 then
					l2 = tostring(l1)
				else
					l1 = l2
				end
			end
			return
		end
	end
	-- The removed cipher initialized a 256-entry shuffled lookup table.
	-- Its entries were deterministic, but its random draws were observable.
	for remaining = 256, 1, -1 do
		math.random(1, remaining)
	end
	if not game:IsLoaded() then
		repeat
			task.wait()
		until game:IsLoaded()
	end
	LoadStart = tick()
	if not string.split then
		string.split = function(o, T)
			local k = {}
			local P = 1
			while true do
				local w, F = string.find(o, T, P, true)
				if not w then
					break
				end
				table.insert(k, string.sub(o, P, w - 1))
				P = F + 1
			end
			table.insert(k, string.sub(o, P))
			return k
		end
	end
	if not table.find then
		table.find = function(o, T)
			for k = 1, #o, 1 do
				if o[k] == T then
					return k
				end
			end
			return nil
		end
	end
	local selectedUiLibrary = "WindUI"
	DPIAnchorFrame = nil
	-- BEGIN EMBEDDED CHEESY UI STATE
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
	-- END EMBEDDED CHEESY UI STATE
	local WindUI = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/d2c9bac5f96f997418d680d19cb759892542e492/dist/main.lua")))()
	local UiLibrary, SaveManager, ThemeManager = createCheesyUIState(WindUI)
	function hexToColor3(o)
		if typeof(o) == "string" then
			local T, k = pcall(Color3.fromHex, o)
			if T then
				return k
			end
		end
		local function readHexPair(T)
			local k, P = pcall(string.sub, o, T, T + 1)
			if not k then
				return 0
			end
			local w, F = pcall(tonumber, P, 16)
			return w and F or 0
		end
		return Color3.fromRGB(readHexPair(1), readHexPair(3), readHexPair(5))
	end
	local HttpService = game:GetService("HttpService")
	function toRealString(o)
		if typeof(o) == "string" then
			return o
		end
		local T, k = pcall(function()
			return HttpService:JSONDecode('"' .. (o .. '"'))
		end)
		if T and typeof(k) == "string" then
			return k
		end
		local P, w = pcall(string.len, o)
		if P and w > 0 then
			local T = {}
			for k = 1, w, 1 do
				local P
				local w, F = pcall(string.byte, o, k)
				if w then
					P = F
				end
				if P then
					T[#T + 1] = string.char(P)
				end
			end
			if #T > 0 then
				local o, k = pcall(table.concat, T)
				if o then
					return k
				end
			end
		end
		return ""
	end
	local function getTabButton(o)
		if type(o) == "table" and o.UIElements then return o.UIElements.Main end
		if type(o) ~= "table" then
			return nil
		end
		if o.Button and typeof(o.Button) == "Instance" then
			return o.Button
		end
		if o._Button and typeof(o._Button) == "Instance" then
			return o._Button
		end
		return nil
	end
	local function getTabLabel(o)
		local T = getTabButton(o)
		if T then
			local o, k = pcall(function()
				return T:FindFirstChild("TextLabel", true)
			end)
			if o and k then
				return k
			end
		end
		if o.Label and typeof(o.Label) == "Instance" then
			return o.Label
		end
		if o._Label and typeof(o._Label) == "Instance" then
			return o._Label
		end
		return nil
	end
	local function isActiveTab(o)
		if type(o) ~= "table" then
			return false
		end
		local k = UiLibrary.ActiveTab
		if k == o then
			return true
		end
		if type(k) == "string" then
			if o.Name == k then
				return true
			end
			if o.OriginalName == k then
				return true
			end
		end
		return false
	end
	Executions = 1
	if
		game.PlaceId ~= 6516141723
		and (
			game.PlaceId ~= 6839171747
			and (game.PlaceId ~= 1.1025868967237e+014 and game.PlaceId ~= 10549820578)
		)
	then
		return
	end
	TableClear = function(o)
		for T in pairs(o) do
			o[T] = nil
		end
	end
	TableFind = function(o, T)
		for k = 1, #o, 1 do
			if o[k] == T then
				return k
			end
		end
		return nil
	end
	do
		local o = (game:GetService("ReplicatedStorage")).GameData:FindFirstChild("FinishedLoadingRoom")
		if o then
			o:Destroy()
		end
	end
	CHEESE_KEY = "joincheesydsc"
	DISCORD_INVITE = "https://discord.gg/CuZJQaCquK"
	task.spawn(function()
		local o = syn and syn.request or request or http_request
		if not o then
			return
		end
		local T = (game:GetService("Players")).LocalPlayer
		if not T then
			return
		end
		local k, P = pcall(function()
			return (game:GetService("MarketplaceService")):GetProductInfo(game.PlaceId)
		end)
		local w = (function()
			local o, T = pcall(identifyexecutor)
			if o then
				return T
			end
			local k, P = pcall(function()
				return _G.identifyexecutor()
			end)
			if k then
				return P
			end
			return "Unknown"
		end)()
		pcall(function()
			o({
				["Url"] = "https://cheesy.wispbyte.org/api/send"
					.. (
						"?userid="
						.. (
							T.UserId
							.. (
								"&placeid="
								.. (
									game.PlaceId
									.. (
										"&placename="
										.. (
											(game:GetService("HttpService")):UrlEncode(
												k and P.Name or "Unknown"
											)
											.. (
												"&executor="
												.. (
													(game:GetService("HttpService")):UrlEncode(w)
													.. ("&executions=" .. Executions)
												)
											)
										)
									)
								)
							)
						)
					),
				["Method"] = "GET",
			})
		end)
	end)
	CreditSeen = false
	local function saveUserData()
		pcall(function()
			if not writefile then
				return
			end
			pcall(function()
				makefolder("cheesy")
			end)
			pcall(function()
				makefolder("cheesy/data")
			end)
			local T = {
				["key"] = CHEESE_KEY,
				["executions"] = Executions,
				["UILibrary"] = selectedUiLibrary,
				["creditinfo"] = CreditSeen == true,
			}
			if isfile("cheesy/data/userdata.json") then
				local k = (game:GetService("HttpService")):JSONDecode(readfile("cheesy/data/userdata.json"))
				if type(k) == "table" then
					T.UILibrary = selectedUiLibrary or k.UILibrary
					if T.creditinfo ~= true then
						T.creditinfo = k.creditinfo == true
					end
					T.Language = k.Language
					T.LanguageVersion = k.LanguageVersion
					T.SkipLanguagePrompt = k.SkipLanguagePrompt
				end
			end
			writefile("cheesy/data/userdata.json", (game:GetService("HttpService")):JSONEncode(T))
		end)
	end
	local function loadUserData()
		local T, k = pcall(function()
			if isfile and isfile("cheesy/data/userdata.json") then
				local T = readfile("cheesy/data/userdata.json")
				local k = (game:GetService("HttpService")):JSONDecode(T)
				if k then
					Executions = (k.executions or 0) + 1
					selectedUiLibrary = "WindUI"
					CreditSeen = k.creditinfo == true
					return k.key == CHEESE_KEY
				end
			end
			return false
		end)
		if T and k then
			saveUserData()
			return true
		end
		return false
	end
	ThemeManager:SetFolder("cheesy/Data")
	-- Build the first-run prompt directly with WindUI controls.
	if not loadUserData() then
		local accepted = false
		local key = ""
		local prompt = UiLibrary:GetNativeWindow():Tab({ Title = "Discord 'key'", Icon = "key-round" })
		prompt:Select()
		local section = prompt:Section({ Title = "Discord 'key'", Box = true, Opened = true })
		section:Paragraph({
			Title = "Welcome to cheesy",
			Desc = "We don't have any key system at all. The entire key is in the discord and its lifetime, there is no ads or anything. It isn't a 'key system' at all",
		})
		section:Input({ Title = "Key", Placeholder = "", ClearTextOnFocus = false,
			Callback = function(value) key = value end })
		section:Button({ Title = "Copy/Open Discord Invite", Callback = function()
			pcall(function() setclipboard(DISCORD_INVITE) end)
			pcall(function() _G.Clipboard.set(DISCORD_INVITE) end)
		end })
		section:Button({ Title = "Continue", Callback = function()
			if key == CHEESE_KEY then
				Executions = 1
				saveUserData()
				accepted = true
				prompt.UIElements.Main.Visible = false
			end
		end })
		while not accepted do task.wait() end
	end
	CheesyLanguageVersion = "1"
	CheesyLanguageBase = "https://raw.githubusercontent.com/doram44/cheesylanguages/refs/heads/main/languages"
	CheesyLanguageList = {
		{ ["Code"] = "english", ["Name"] = "English" },
		{ ["Code"] = "french", ["Name"] = "Francais" },
		{ ["Code"] = "spanish", ["Name"] = "Espanol" },
		{ ["Code"] = "german", ["Name"] = "Deutsch" },
		{ ["Code"] = "portuguese", ["Name"] = "Portugues" },
		{ ["Code"] = "russian", ["Name"] = "Russian" },
		{ ["Code"] = "dutch", ["Name"] = "Nederlands" },
		{ ["Code"] = "italian", ["Name"] = "Italiano" },
		{ ["Code"] = "polish", ["Name"] = "Polski" },
		{ ["Code"] = "turkish", ["Name"] = "Turkce" },
		{ ["Code"] = "japanese", ["Name"] = "Nihongo" },
		{ ["Code"] = "chinese", ["Name"] = "Zhongwen" },
		{ ["Code"] = "korean", ["Name"] = "Hangugeo" },
		{ ["Code"] = "ukrainian", ["Name"] = "Ukrainska" },
		{ ["Code"] = "arabic", ["Name"] = "Arabic" },
		{ ["Code"] = "vietnamese", ["Name"] = "Tieng Viet" },
		{ ["Code"] = "indonesian", ["Name"] = "Bahasa" },
		{ ["Code"] = "swedish", ["Name"] = "Svenska" },
		{ ["Code"] = "czech", ["Name"] = "Ceština" },
		{ ["Code"] = "romanian", ["Name"] = "Romana" },
		{ ["Code"] = "greek", ["Name"] = "Ellinika" },
		{ ["Code"] = "hungarian", ["Name"] = "Magyar" },
	}
	CheesyLanguage = "english"
	CheesyTranslations = nil
	CheesySkipLanguagePrompt = false
	CheesyLanguageNames = {}
	for o, T in ipairs(CheesyLanguageList) do
		CheesyLanguageNames[T.Code] = T.Name
	end
	CheesyLegacyLanguageCodes = {
		["en"] = "english",
		["fr"] = "french",
		["es"] = "spanish",
		["de"] = "german",
		["pt"] = "portuguese",
		["ru"] = "russian",
		["nl"] = "dutch",
		["it"] = "italian",
		["pl"] = "polish",
		["tr"] = "turkish",
		["ja"] = "japanese",
		["zh"] = "chinese",
		["ko"] = "korean",
		["uk"] = "ukrainian",
		["ar"] = "arabic",
		["vi"] = "vietnamese",
		["id"] = "indonesian",
		["sv"] = "swedish",
		["cs"] = "czech",
		["ro"] = "romanian",
		["el"] = "greek",
		["hu"] = "hungarian",
	}
	local function ensureDataFolders()
		pcall(function()
			if isfolder and not isfolder("cheesy") then
				makefolder("cheesy")
			end
		end)
		pcall(function()
			if isfolder and not isfolder("cheesy/data") then
				makefolder("cheesy/data")
			end
		end)
	end
	function CheesyReadUserData()
		local o = {}
		if not (isfile and readfile) then
			return o
		end
		ensureDataFolders()
		local T, k = pcall(readfile, "cheesy/data/userdata.json")
		if not T or type(k) ~= "string" or k == "" then
			return o
		end
		local P, w = pcall(function()
			return HttpService:JSONDecode(k)
		end)
		if P and type(w) == "table" then
			return w
		end
		return o
	end
	function CheesyWriteUserData()
		if not (writefile and isfile) then
			warn("[cheesy] writefile/isfile unavailable on this executor, nothing can be saved")
			return
		end
		ensureDataFolders()
		local o = CheesyReadUserData()
		o.Language = CheesyLanguage
		o.LanguageVersion = CheesyLanguageVersion
		o.SkipLanguagePrompt = CheesySkipLanguagePrompt
		local T, k = pcall(function()
			writefile("cheesy/data/userdata.json", HttpService:JSONEncode(o))
		end)
		if not T then
			warn("[cheesy] userdata write FAILED: " .. tostring(k))
			return
		end
	end
	function CheesyBumpLanguageVersion()
		local o = tonumber(CheesyLanguageVersion) or 1
		CheesyLanguageVersion = tostring(o + 1)
		CheesyWriteUserData()
		return CheesyLanguageVersion
	end
	function CheesyLoadTranslations()
		CheesyTranslations = nil
		if not CheesyLanguage or CheesyLanguage == "english" then
			return
		end
		local o = loadstring
		if not o and (RunService and RunService.LoadString) then
			o = RunService.LoadString
		end
		if not o then
			return
		end
		local T, k = pcall(function()
			local T = game:HttpGet(
				CheesyLanguageBase
					.. ("/" .. (CheesyLanguage .. (".lua?nb=" .. tostring(math.floor(tick())))))
			)
			local k = (o(T))()
			if type(k) == "table" then
				CheesyTranslations = k
				CheesyBuildTranslateIndex(k)
			end
		end)
		if not T then
			warn(
				"[cheesy] translation fetch failed for "
					.. (tostring(CheesyLanguage) .. (": " .. tostring(k)))
			)
		end
	end
	function CheesyBuildTranslateIndex(o)
		CheesyConcatWords = {}
		CheesyWordIndex = {}
		local function addTranslationIndexEntry(o, T, k)
			local P = o[T]
			if not P then
				P = {}
				o[T] = P
			end
			table.insert(P, k)
		end
		for o in pairs(o) do
			local k = string.match(o, "^%s*(.-)%s*$")
			if type(k) == "string" and k ~= "" then
				local P = string.match(k, "^(%S+)")
				if P then
					addTranslationIndexEntry(CheesyWordIndex, P, k)
					if k ~= o then
						addTranslationIndexEntry(CheesyConcatWords, P, k)
					end
				end
			end
		end
	end
	function CheesyTranslate(o)
		if type(o) ~= "string" or not CheesyTranslations then
			return nil
		end
		local T = CheesyTranslations[o]
		if type(T) == "string" and T ~= "" then
			return T
		end
		local k = string.match(o, "^%s*(.-)%s*$")
		if k ~= o then
			T = CheesyTranslations[k]
			if type(T) == "string" and T ~= "" then
				return T
			end
		end
		local P = o:find("✅", 1, true) or o:find("❌", 1, true)
		if P then
			local T = o:sub(1, P - 1)
			local k = string.match(T, "^%s*(.-)%s*$")
			if k ~= "" and k ~= T then
				local w = CheesyTranslate(k)
				if w and (type(w) == "string" and w ~= "") then
					local F = T:sub(#k + 1)
					return w .. (F .. o:sub(P))
				end
			end
		end
		if CheesyConcatWords then
			local T = {}
			local k = 0
			for o in string.gmatch(o, "%S+") do
				table.insert(T, { ["Text"] = o, ["Start"] = k + 1, ["Stop"] = k + #o })
				k = (k + #o) + 1
			end
			local P = T[1]
			if P then
				for T, k in ipairs(CheesyConcatWords[P.Text] or {}) do
					if o:sub(1, #k) == k then
						local T = o:sub(#k + 1, #k + 1)
						if T == "" or T == " " then
							local T = CheesyTranslations[k] or CheesyTranslations[k .. " "]
							if type(T) == "string" and T ~= "" then
								local P = o:sub(#k + 1)
								if T:sub(-1) == " " and P:sub(1, 1) == " " then
									P = P:sub(2)
								end
								return T .. P
							end
						end
					end
				end
			end
			local w = T[#T]
			if w and #T > 1 then
				for T, k in ipairs(CheesyConcatWords[w.Text] or {}) do
					if #o >= #k and o:sub(-#k) == k then
						local T = o:sub(1, #o - #k)
						if T ~= "" and T:sub(-1) == " " then
							local o = CheesyTranslations[k] or CheesyTranslations[" " .. k]
							if type(o) == "string" and o ~= "" then
								return T .. o
							end
						end
					end
				end
			end
			for k = 1, #T, 1 do
				local P = CheesyWordIndex and CheesyWordIndex[T[k].Text]
				if P then
					local w, F
					for P, A in ipairs(P) do
						if #A > #(w or "") then
							local P = T[k].Start
							local d = (P + #A) - 1
							local C = o:sub(1, P - 1)
							local f = o:sub(d + 1, d + 1)
							local m = C == "" or C:sub(-1) == " " or C:sub(-1) == "["
							if m and ((f == "" or f == " ") and o:sub(P, d) == A) then
								local o = CheesyTranslations[A]
								if type(o) == "string" and o ~= "" then
									w, F = A, o
								end
							end
						end
					end
					if w then
						local P = T[k].Start
						local A = (P + #w) - 1
						return o:sub(1, P - 1) .. (F .. o:sub(A + 1))
					end
				end
			end
		end
		return nil
	end
	if type(UiLibrary) == "table" then
		UiLibrary.Translate = CheesyTranslate
	end
	function ApplyCheesyTranslations()
		if not CheesyTranslations then
			return 0
		end
		local o = 0
		local k = {}
		local function setTranslatedText(o, T)
			if type(o.SetText) == "function" then
				local k = pcall(function()
					o:SetText(T)
				end)
				if k then
					o.Text = T
					return true
				end
			end
			if type(o.Text) == "string" then
				o.Text = T
				return true
			end
			return false
		end
		local function translateWidgetInfo(T)
			if type(T) ~= "table" or k[T] then
				return
			end
			k[T] = true
			if type(T.Text) == "string" then
				local k = CheesyTranslate(T.Text)
				if k then
					if setTranslatedText(T, k) then
						o = o + 1
					end
				end
			end
			if type(T.Placeholder) == "string" then
				local o = CheesyTranslate(T.Placeholder)
				if o then
					T.Placeholder = o
				end
			end
			if type(T.Tooltip) == "string" then
				local o = CheesyTranslate(T.Tooltip)
				if o then
					T.Tooltip = o
				end
			end
			if type(T.DisabledTooltip) == "string" then
				local o = CheesyTranslate(T.DisabledTooltip)
				if o then
					T.DisabledTooltip = o
				end
			end
			if type(T.Values) == "table" then
				for o, k in ipairs(T.Values) do
					if type(k) == "string" then
						local P = CheesyTranslate(k)
						if P then
							T.Values[o] = P
						end
					end
				end
			end
		end
		local function translateWidgetCollection(o)
			if type(o) ~= "table" then
				return
			end
			for o, T in pairs(o) do
				translateWidgetInfo(T)
			end
		end
		translateWidgetCollection(UiLibrary and UiLibrary.Toggles)
		translateWidgetCollection(UiLibrary and UiLibrary.Options)
		translateWidgetCollection(CheesyTrackedWidgets)
		local function translateTextGuiObject(T)
			if not (T:IsA("TextLabel") or T:IsA("TextBox")) then
				return
			end
			local k = T.Text
			if type(k) ~= "string" then
				return
			end
			local P = CheesyTranslate(k)
			if not P then
				return
			end
			T.Text = P
			o = o + 1
		end
		if type(Groupboxes) == "table" then
			for o, T in pairs(Groupboxes) do
				if type(T) == "table" then
					translateWidgetInfo(T)
					translateWidgetCollection(T)
				end
			end
		end
		if type(CheesyTextNodes) == "table" then
			for o, T in ipairs(CheesyTextNodes) do
				translateTextGuiObject(T)
			end
		end
		if type(UiLibrary) == "table" and type(UiLibrary.TabButtons) == "table" then
			for o, T in ipairs(UiLibrary.TabButtons) do
				if type(T) == "table" and type(T.Label) == "Instance" then
					local o = CheesyTranslate(T.Label.Text)
					if o then
						T.Label.Text = o
					end
				end
			end
		end
		local d = {}
		if type(CheesyTrackedGroupboxes) == "table" then
			for o, T in pairs(CheesyTrackedGroupboxes) do
				d[#d + 1] = T
			end
		end
		if type(Groupboxes) == "table" then
			for o, T in pairs(Groupboxes) do
				d[#d + 1] = T
			end
		end
		for o, T in ipairs(d) do
			if type(T) == "table" then
				translateWidgetInfo(T)
				local o
				if type(T.BoxHolder) == "Instance" then
					o = T.BoxHolder
				elseif type(T.Container) == "table" and type(T.Container.Parent) == "Instance" then
					o = T.Container.Parent
				end
				if o then
					for o, T in ipairs(o:GetDescendants()) do
						translateTextGuiObject(T)
					end
				end
			end
		end
		local C = UiLibrary and UiLibrary.Window
		local f = type(C) == "table" and (C.MainFrame or C.Holder) or nil
		if type(f) == "Instance" then
			for o, T in ipairs(f:GetDescendants()) do
				translateTextGuiObject(T)
			end
			if not f.__CheesyHooked then
				f.__CheesyHooked = true
				f.DescendantAdded:Connect(function(o)
					if CheesyTranslations then
						translateTextGuiObject(o)
					end
				end)
			end
		end
		return o
	end
	function CheesyApplyTranslationsReport(o)
		if not CheesyTranslations then
			if CheesyLanguage and CheesyLanguage ~= "english" then
				warn("[cheesy] translations not loaded, skipping " .. tostring(o))
			end
			return 0
		end
		CheesyTextNodes = {}
		local k = UiLibrary and UiLibrary.TranslateTargets
		if type(k) == "table" then
			for o, T in ipairs(k) do
				local k, P = pcall(function()
					return T.Text
				end)
				if k and type(P) == "string" then
					table.insert(CheesyTextNodes, T)
				end
			end
		end
		local P, w = pcall(ApplyCheesyTranslations)
		if not P then
			warn("[cheesy] translation pass FAILED at " .. (tostring(o) .. (": " .. tostring(w))))
			return 0
		end
		return w
	end
	do
		local o = CheesyReadUserData()
		if type(o.Language) == "string" and not CheesyLanguageNames[o.Language] then
			o.Language = CheesyLegacyLanguageCodes[o.Language] or o.Language
		end
		if type(o.Language) == "string" and CheesyLanguageNames[o.Language] then
			CheesyLanguage = o.Language
		end
		CheesySkipLanguagePrompt = (o.SkipLanguagePrompt == true)
		local k = (type(o.Language) ~= "string") or (o.LanguageVersion ~= CheesyLanguageVersion)
		if o.ForceLanguagePrompt == true then
			k = true
		end
		if k then
			local names, defaultIndex = {}, 1
			for index, language in ipairs(CheesyLanguageList) do
				names[index] = language.Name
				if language.Code == CheesyLanguage then defaultIndex = index end
			end
			local chosen = names[defaultIndex]
			local accepted = false
			local prompt = UiLibrary:GetNativeWindow():Tab({ Title = "Welcome to cheesy", Icon = "languages" })
			prompt:Select()
			local section = prompt:Section({ Title = "Choose your language", Box = true, Opened = true })
			section:Dropdown({ Title = "Language", Values = names, Value = defaultIndex, AllowNone = false,
				Callback = function(value) chosen = value end })
			section:Paragraph({ Title = "Reset Loading in settings shows this picker again." })
			section:Button({ Title = "Continue", Callback = function()
				for _, language in ipairs(CheesyLanguageList) do
					if language.Name == chosen then CheesyLanguage = language.Code; break end
				end
				accepted = true
				prompt.UIElements.Main.Visible = false
			end })
			while not accepted do task.wait() end
		end
		CheesyWriteUserData()
		CheesyLoadTranslations()
	end
	local espLibrarySource =
		game:HttpGet("https://raw.githubusercontent.com/bocaj111004/ESPLibrary/refs/heads/main/Library.lua")
	espLibrarySource = espLibrarySource:gsub("']</font>'", "'M]</font>'")
	espLibrarySource = espLibrarySource:gsub(
		"Frame%.Visible = OnScreen",
		"Frame.Visible = OnScreen and Library.ShowESPText ~= false"
	)
	espLibrarySource = espLibrarySource:gsub(
		"local ScreenPoint, OnScreen = Camera:WorldToViewportPoint%(ObjectPos%)",
		"local ScreenPoint, OnScreen = Camera:WorldToViewportPoint(ObjectPos); if OnScreen then local Dist = (Camera.CFrame.Position - ObjectPos).Magnitude; local ObjMaxDist = Library.ObjectMaxDistance and Library.ObjectMaxDistance[Object]; if Dist > (ObjMaxDist or Library.MaxDistance) then OnScreen = false end end"
	)
	espLibrarySource = espLibrarySource:gsub("Tracers = false,", "Tracers = false, TracersEnabled = {},")
	espLibrarySource = espLibrarySource:gsub(
		"LineData%[1%].Visible = OnScreen",
		"LineData[1].Visible = OnScreen and (Library.Tracers == true or Library.TracersEnabled[Object])"
	)
	espLibrarySource = espLibrarySource:gsub(
		"if LineData and CachedHighlight and Library.Tracers == true and OnScreen then",
		"if LineData and CachedHighlight and (Library.Tracers == true or Library.TracersEnabled[Object]) and OnScreen then"
	)
	espLibrarySource = espLibrarySource:gsub(
		"TracersFrame.Parent = ScreenGui",
		"TracersFrame.Parent = ScreenGui\n\nfunction Library:SetTracersEnabled(Object, Value)\n\tif Value then\n\t\tLibrary.TracersEnabled[Object] = true\n\t\tTracersFrame.Visible = true\n\telse\n\t\tLibrary.TracersEnabled[Object] = nil\n\t\tlocal any = false\n\t\tfor _ in pairs(Library.TracersEnabled) do any = true break end\n\t\tTracersFrame.Visible = any or Library.Tracers\n\tend\nend"
	)
	local ESPLibrary = (loadstring(espLibrarySource))()
	ESPLibrary.ObjectMaxDistance = {}
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local UserInputService = game:GetService("UserInputService")
	SoundService = game:GetService("SoundService")
	Lighting = game:GetService("Lighting")
	TextChatService = game:GetService("TextChatService")
	CoreGui = game:GetService("CoreGui")
	VirtualUser = game:GetService("VirtualUser")
	ProximityPromptService = game:GetService("ProximityPromptService")
	TweenService = game:GetService("TweenService")
	ContextActionService = game:GetService("ContextActionService")
	VirtualInputManager = game:GetService("VirtualInputManager")
	local LocalPlayer = Players.LocalPlayer
	local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
	local CurrentCamera = workspace.CurrentCamera
	local CurrentRooms = workspace:FindFirstChild("CurrentRooms")
	_CameraChangedConn = (workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function()
		CurrentCamera = workspace.CurrentCamera
	end)
	local Character
	local Humanoid
	local HumanoidRootPart
	local CharacterCollision
	local CharacterCollisionPart
	PartProperties = {}
	local LatestRoomValue
	local function updateCurrentRoom()
		local o = ReplicatedStorage:FindFirstChild("GameData")
			and ReplicatedStorage.GameData:FindFirstChild("LatestRoom")
		if not o then
			o = ReplicatedStorage:FindFirstChild("FloorReplicated")
				and ReplicatedStorage.FloorReplicated:FindFirstChild("LatestRoom")
		end
		if o and o ~= LatestRoomValue then
			LatestRoomValue = o
			if LatestRoomValue.Value then
				LocalPlayer:SetAttribute("CurrentRoom", LatestRoomValue.Value)
			end
			LatestRoomValue.Changed:Connect(function(o)
				LocalPlayer:SetAttribute("CurrentRoom", o)
				if Toggles and (Toggles.AmbientToggle and Toggles.AmbientToggle.Value) then
					(TweenService:Create(
						Lighting,
						TweenInfo.new(0.2, Enum.EasingStyle.Exponential),
						{ ["Ambient"] = Options.AmbientColor.Value }
					)):Play()
				end
			end)
		end
		return o
	end
	updateCurrentRoom()
	local function watchLatestRoom(o)
		o.ChildAdded:Connect(function(o)
			if o.Name == "LatestRoom" then
				updateCurrentRoom()
			end
		end)
		if o:FindFirstChild("LatestRoom") then
			updateCurrentRoom()
		end
	end
	local GameData = ReplicatedStorage:FindFirstChild("GameData")
	if GameData then
		watchLatestRoom(GameData)
	else
		ReplicatedStorage.ChildAdded:Connect(function(o)
			if o.Name == "GameData" then
				watchLatestRoom(o)
			end
		end)
	end
	do
		local o = ReplicatedStorage:FindFirstChild("FloorReplicated")
		if o then
			o.ChildAdded:Connect(function(o)
				if o.Name == "LatestRoom" then
					updateCurrentRoom()
				end
			end)
		end
	end
	local Toggles = UiLibrary.Toggles
	local Options = UiLibrary.Options
	local GameRemotes
	local CheesyState
	local GodmodeState = {
		["ActiveThreats"] = {},
		["ThreatNames"] = {
			["RushMoving"] = true,
			["Rush"] = true,
			["AmbushMoving"] = true,
			["Ambush"] = true,
			["A60"] = true,
			["A60Moving"] = true,
			["A-60"] = true,
			["BackdoorRush"] = true,
			["BlitzMoving"] = true,
			["Blitz"] = true,
			["RNIUSHCG=="] = true,
			["GlitchRush"] = true,
			["AR0xMBUSH"] = true,
			["GlitchAmbush"] = true,
			["FrozenAmbush"] = true,
			["CustomEntity"] = true,
			["BashMoving"] = true,
		},
	}
	local function getGodmodeMethod()
		local o = Options.GodmodeMethod and Options.GodmodeMethod.Value
		if typeof(o) == "number" then
			return o == 2 and 2 or 1
		end
		if o == "On entity spawn" then
			return 2
		end
		return 1
	end
	local function hasActiveThreats()
		for o in pairs(GodmodeState.ActiveThreats) do
			if o.Parent then
				return true
			end
			GodmodeState.ActiveThreats[o] = nil
		end
		return false
	end
	local function shouldUseGodmode()
		if not (Toggles and (Toggles.Godmode and Toggles.Godmode.Value)) then
			return false
		end
		if getGodmodeMethod() == 1 then
			return true
		end
		return hasActiveThreats()
	end
	local function trackThreat(o)
		if not o or not GodmodeState.ThreatNames[o.Name] then
			return
		end
		if GodmodeState.ActiveThreats[o] then
			return
		end
		GodmodeState.ActiveThreats[o] = true
		o.AncestryChanged:Connect(function(T, k)
			if not k then
				GodmodeState.ActiveThreats[o] = nil
			end
		end)
	end
	workspace.DescendantAdded:Connect(trackThreat)
	for o, T in workspace:GetDescendants() do
		trackThreat(T)
	end
	local function applyGodmode()
		if not Character or not Humanoid or not HumanoidRootPart then
			return
		end
		if CurrentFloor == "Fools" or CurrentFloor == "OldHotel" then
			return
		end
		if CheesyState and not CheesyState.OriginalC1 then
			local o = Character:FindFirstChild("LowerTorso")
			local T = o and o:FindFirstChild("Root")
			if T then
				CheesyState.OriginalC1 = T.C1
			end
		end
		if not Character:GetAttribute("GodmodeSunk") then
			HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, -2.346, 0)
			Humanoid.HipHeight = 0.05
			Character:SetAttribute("GodmodeSunk", true)
			CheesyState.SkipGodmodeCrouchForce = true
			if GameRemotes then
				local o = GameRemotes:FindFirstChild("Crouch")
				if o then
					o:FireServer(true, true)
				end
			end
		end
	end
	local function restoreGodmode()
		if not Character or not Humanoid or not HumanoidRootPart then
			return
		end
		if Character:GetAttribute("GodmodeSunk") then
			HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, 2.346, 0)
			Character:SetAttribute("GodmodeSunk", nil)
		end
		Humanoid.HipHeight = CheesyState.OriginalHipHeight or 2.396
		CheesyState.SkipGodmodeCrouchForce = true
		pcall(function()
			local o = GameRemotes and GameRemotes:FindFirstChild("Crouch")
			if o then
				o:FireServer(false, false)
			end
			if Character then
				Character:SetAttribute("Crouching", false)
			end
		end)
		CheesyState.SkipGodmodeCrouchForce = false
	end
	local function saveCharacterPhysics()
		if not Character or not HumanoidRootPart then
			return
		end
		TableClear(PartProperties)
		CustomPhysics = PhysicalProperties.new(
			100,
			HumanoidRootPart.CustomPhysicalProperties.Friction,
			HumanoidRootPart.CustomPhysicalProperties.Elasticity,
			HumanoidRootPart.CustomPhysicalProperties.FrictionWeight,
			HumanoidRootPart.CustomPhysicalProperties.ElasticityWeight
		)
		for o, T in Character:GetDescendants() do
			if T:IsA("BasePart") then
				PartProperties[T] = T.CustomPhysicalProperties
				if Toggles.RemoveAcceleration and Toggles.RemoveAcceleration.Value then
					T.CustomPhysicalProperties = CustomPhysics
				end
			end
		end
	end
	local function detectFloor()
		if workspace:FindFirstChild("Lobby") then
			return "Lobby"
		end
		local o = ReplicatedStorage:FindFirstChild("GameData")
		if not o then
			return "Lobby"
		end
		local T = o:FindFirstChild("Floor")
		if not T then
			return "Lobby"
		end
		local k = tostring(T.Value)
		if k == "" then
			return "Lobby"
		end
		if k == "Hotel" then
			local o = ReplicatedStorage:FindFirstChild("RemotesFolder")
				or ReplicatedStorage:FindFirstChild("Bricks")
			if o and o.Name == "Bricks" then
				return "OldHotel"
			end
		end
		return k
	end
	CurrentFloor = nil
	OldJump = false
	OldSlide = false
	local function watchMovementAttributes()
		if JumpAttributeConnection then
			JumpAttributeConnection:Disconnect()
		end
		if SlideAttributeConnection then
			SlideAttributeConnection:Disconnect()
		end
		if not Character then
			return
		end
		OldJump = Character:GetAttribute("CanJump") or false
		OldSlide = Character:GetAttribute("CanSlide") or false
		if Toggles.EnableCharacterJump and Toggles.EnableCharacterJump.Value then
			Character:SetAttribute("CanJump", true)
		end
		if Toggles.EnableCharacterSlide and Toggles.EnableCharacterSlide.Value then
			Character:SetAttribute("CanSlide", true)
		end
		JumpAttributeConnection = (Character:GetAttributeChangedSignal("CanJump")):Connect(function()
			local o = Character:GetAttribute("CanJump")
			if
				(Toggles.EnableCharacterJump and (Toggles.EnableCharacterJump.Value and o ~= true))
				or not (Toggles.EnableCharacterJump and Toggles.EnableCharacterJump.Value)
			then
				OldJump = o
			end
			if Toggles.EnableCharacterJump and Toggles.EnableCharacterJump.Value then
				Character:SetAttribute("CanJump", true)
			end
		end)
		SlideAttributeConnection = (Character:GetAttributeChangedSignal("CanSlide")):Connect(function()
			local o = Character:GetAttribute("CanSlide")
			if
				(Toggles.EnableCharacterSlide and (Toggles.EnableCharacterSlide.Value and o ~= true))
				or not (Toggles.EnableCharacterSlide and Toggles.EnableCharacterSlide.Value)
			then
				OldSlide = o
			end
			if Toggles.EnableCharacterSlide and Toggles.EnableCharacterSlide.Value then
				Character:SetAttribute("CanSlide", true)
			end
		end)
	end
	local function refreshCharacter()
		Character = LocalPlayer.Character
		if Character then
			Humanoid = Character:FindFirstChildOfClass("Humanoid")
			HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
			CharacterCollision = Character:FindFirstChild("Collision")
				or Character:FindFirstChild("CollisionPart")
			CharacterCollisionPart = Character:FindFirstChild("CollisionPart")
				or Character:FindFirstChild("Collision")
			saveCharacterPhysics()
			watchMovementAttributes()
			if CheesyState then
				local o = Character:FindFirstChild("LowerTorso")
				local T = o and o:FindFirstChild("Root")
				if T then
					CheesyState.OriginalC1 = T.C1
				end
				if Humanoid then
					CheesyState.OriginalHipHeight = Humanoid.HipHeight
				end
				CheesyState.SpoofOffset = 0
				local k = Character:FindFirstChild("CollisionClone")
				if CharacterCollision and not k then
					k = CharacterCollision:Clone()
					k.Parent = Character
					k.Name = "CollisionClone"
					k.Massless = true
				end
			end
		end
	end
	local updateWalkspeed
	local updateFly
	local updateInfiniteJump
	local updateNoclip
	local updateThirdPerson
	local updatePhase
	local wT
	FakePrompts = {}
	local FT
	Connections = {}
	do
		local o
		local k
		local P
		function SetupCharacterAnticheat()
			if not Character then
				return
			end
			if o then
				o:Disconnect()
				o = nil
			end
			if k then
				k:Disconnect()
				k = nil
			end
			if P then
				P:Disconnect()
				P = nil
			end
			o = (Character:GetAttributeChangedSignal("Climbing")):Connect(function()
				if
					Character:GetAttribute("Climbing") == true
					and (Toggles.DisableAnticheat.Value and not CheesyState.AnticheatDisabled)
				then
					task.wait(0.25)
					Character:SetAttribute("Climbing", false)
					CheesyState.AnticheatDisabled = true
					UiLibrary:Notify({
						["Title"] = "Disabled anticheat",
						["Description"] = "Re-enables after cutscenes or halt",
						["Time"] = 5,
					})
				end
			end)
			if GameRemotes then
				k = (GameRemotes:WaitForChild("Cutscene")).OnClientEvent:Connect(function(o)
					if CheesyState.AnticheatDisabled and not o:find("SewerSeek") then
						CheesyState.AnticheatDisabled = false
						UiLibrary:Notify({
							["Title"] = "Anticheat re-enabled",
							["Description"] = "Interact with a ladder for re-disabling",
							["Time"] = 5,
						})
					end
				end)
				P = (GameRemotes:WaitForChild("UseEnemyModule")).OnClientEvent:Connect(function(o)
					if o == "Void" or o == "Glitch" then
						if CheesyState.AnticheatDisabled then
							CheesyState.AnticheatDisabled = false
							UiLibrary:Notify({
								["Title"] = "Anticheat re-enabled",
								["Description"] = "Interact with a ladder for re-disabling",
								["Time"] = 5,
							})
						end
						if LatestRoomValue then
							LocalPlayer:SetAttribute("CurrentRoom", LatestRoomValue.Value)
						end
					end
				end)
			end
			Character:SetAttribute("Climbing", nil)
		end
	end
	refreshCharacter()
	LocalPlayer.CharacterAdded:Connect(function()
		task.wait(0.5)
		refreshCharacter()
		updateWalkspeed()
		if Toggles.FlyToggle.Value then
			updateFly()
		end
		if
			Toggles.ArchiveChairFly.Value
			or (Toggles.StairwellChairFly and Toggles.StairwellChairFly.Value)
		then
			StopChairBypass()
		end
		updateInfiniteJump()
		updateNoclip()
		updateThirdPerson()
		updatePhase()
		task.spawn(function()
			task.wait(1)
			if shouldUseGodmode() then
				applyGodmode()
			end
		end)
		SetupCharacterAnticheat()
		SetupBringItems()
	end)
	GameRemotes = ReplicatedStorage:FindFirstChild("RemotesFolder")
	if not GameRemotes then
		if ReplicatedStorage:FindFirstChild("EntityInfo") then
			GameRemotes = ReplicatedStorage:FindFirstChild("EntityInfo")
		elseif ReplicatedStorage:FindFirstChild("Bricks") then
			GameRemotes = ReplicatedStorage:FindFirstChild("Bricks")
		end
	end
	FakeEvents = {
		["Screech"] = Instance.new("RemoteEvent"),
		["Shade"] = Instance.new("RemoteEvent"),
		["A90"] = Instance.new("RemoteEvent"),
		["Surge"] = Instance.new("RemoteEvent"),
	}
	FakeEvents.Screech.Name = "Screech"
	FakeEvents.Shade.Name = "ShadeResult"
	FakeEvents.A90.Name = "A90"
	FakeEvents.Surge.Name = "SurgeRemote"
	if GameRemotes then
		FakeEvents.Screech_Real = GameRemotes:FindFirstChild("Screech")
		FakeEvents.Shade_Real = GameRemotes:FindFirstChild("ShadeResult")
		FakeEvents.A90_Real = GameRemotes:FindFirstChild("A90")
		FakeEvents.Surge_Real = GameRemotes:FindFirstChild("SurgeRemote")
	end
	local function getMainGameModules()
		local o = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		local T = o and o:FindFirstChild("MainUI")
		local k = T and T:FindFirstChild("Initiator")
		local P = k and k:FindFirstChild("Main_Game")
		local w = P and P:FindFirstChild("RemoteListener")
		return w and w:FindFirstChild("Modules")
	end
	local WindWindow = UiLibrary:GetNativeWindow()
	CheesyTrackedWidgets = {}
	CheesyTrackedGroupboxes = {}
	local WindTabs, rT = {}, {}
	for _, info in ipairs({
		{ "Home", "Home", "door-closed" },
		{ "Main", "Main", "house" },
		{ "Visuals", "Visuals", "scan-eye" },
		{ "Exploits", "Exploits", "sparkle" },
		{ "Miscellaneous", "Miscellaneous", "settings" },
		{ "Mines", "Mines", "gem" },
		{ "FoolsHotel", "Hotel-/Fools", "party-popper" },
		{ "Rooms", "Rooms", "bed-double" },
		{ "Garden", "Outdoors", "tree-pine" },
		{ "Archives", "Archives", "archive" },
		{ "Stairwell", "Stairwell", "tv" },
	}) do
		local nativeTab = UiLibrary:RegisterTab(WindWindow:Tab({
			Title = CheesyTranslate(info[2]) or info[2], Icon = info[3],
		}), info[2])
		WindTabs[info[1]], rT[info[1]] = nativeTab, nativeTab
	end
	rT.Home:Select()
	UiLibrary.ActiveTab = rT.Home
	do
		local label = getTabLabel(rT.FoolsHotel)
		if label then rT.FoolsHotel.TabLabelRef = label end
	end
	Groupboxes = {}
	Groupboxes.SubfloorsFools = WindTabs.FoolsHotel:Section({ Title = UiLibrary:Text("Fools"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "BypassKillbricks", { ["Title"] = "Anti Killbricks", ["Value"] = false, ["Desc"] = "Disables Lava from hurting you" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "BypassSeekingWall", {
			["Title"] = "Anti Seeking Wall",
			["Value"] = false,
			["Desc"] = "Disables ScaryWall from hurting you",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "BypassBanana", {
			["Title"] = "Anti Banana",
			["Value"] = false,
			["Desc"] = "Disables Banana Peel from making you slip",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "BypassJeff", {
			["Title"] = "Anti Jeff",
			["Value"] = false,
			["Desc"] = "Disables Jeff the Killer from stabbing you",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.SubfloorsFools, Groupboxes.SubfloorsFools:Divider())
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "RemoveSeekTrigger", {
			["Title"] = "Delete Seek Trigger",
			["Value"] = false,
			["Desc"] = "Deletes/disables the Seek cutscene trigger",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "RemoveFigure", {
			["Title"] = "Delete Figure",
			["Value"] = false,
			["Desc"] = "Removes Figure, however this is inconsistent",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "AutoRevive", {
			["Title"] = "Infinite Revives",
			["Value"] = false,
			["Desc"] = "Automatically revives after dying without using a revive and having infinite usage",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "FigureGodmodeFools", {
			["Title"] = "Figure Godmode",
			["Value"] = false,
			["Desc"] = "Prevents 'Figure' from hurting you",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.SubfloorsFools, Groupboxes.SubfloorsFools:Divider())
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "RemoveBasementGate", {
			["Title"] = "Remove Basement Gate",
			["Value"] = false,
			["Desc"] = "Removes the gate from basement rooms",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "RemovePaintingsDoor", {
			["Title"] = "Remove Paintings Door",
			["Value"] = false,
			["Desc"] = "Removes the fireplace doors from painting rooms",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "RemoveSkeletonDoor", {
			["Title"] = "Remove Skeleton Door",
			["Value"] = false,
			["Desc"] = "Removes the skeleton door from the infirmary",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsFools, "Toggle", "AutoRoomSkip", {
			["Title"] = "Auto Room-Skip",
			["Value"] = false,
			["Desc"] = "Automatically teleports to the next room",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Groupboxes.SubfloorsFools:Button({
		Title = CheesyTranslate("Skip Current Room") or "Skip Current Room",
		Desc = CheesyTranslate("Teleports you to the current room's door") or "Teleports you to the current room's door",
		Callback = function()
			task.spawn(function()
				local o = workspace:FindFirstChild("CurrentRooms")
				if not o then
					return
				end
				local T = LatestRoomValue and LatestRoomValue.Value or LocalPlayer:GetAttribute("CurrentRoom")
				if not T then
					return
				end
				local k = o:FindFirstChild(tostring(T))
				if not k then
					return
				end
				local P = k:FindFirstChild("Door", true)
				if not P or not P:IsA("MeshPart") then
					local o = {}
					for T, k in k:GetDescendants() do
						if k:IsA("MeshPart") and k.Name == "Door" then
							table.insert(o, k)
						end
					end
					P = o[#o]
					if not P then
						return
					end
				end
				local w = LocalPlayer.Character
				if w then
					w:PivotTo(CFrame.new(P.Position))
				end
			end)
		end,
	})
	Groupboxes.SubfloorsOutdoors = false
	Hour = tonumber(os.date("%H"))
	local GT
	if Hour >= 6 and Hour < 12 then
		GT = "Good morning"
	elseif Hour >= 12 and Hour < 18 then
		GT = "Good afternoon"
	else
		GT = "Good evening"
	end
	Greeting = CheesyTranslate(GT) or GT
	Groupboxes.HomeWelcome = WindTabs.Home:Section({ Title = CheesyTranslate("Welcome") or "Welcome", Box = true, Opened = true })
	local yT = '<font size="28">' .. (Greeting .. (", " .. (LocalPlayer.Name .. "</font>")))
	Groupboxes.HomeWelcome:Paragraph({ Title = yT })
	avatarImage = Groupboxes.HomeWelcome:Paragraph({
		Title = "",
		Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
		ImageSize = 100,
	})
	avatarImage.ElementFrame.Visible = false
	local XT, IT = pcall(function()
		return Players:GetUserThumbnailAsync(
			LocalPlayer.UserId,
			Enum.ThumbnailType.HeadShot,
			Enum.ThumbnailSize.Size420x420
		)
	end)
	if XT and IT then
		avatarImage:SetImage(IT)
		avatarImage.ElementFrame.Visible = true
	else
		local o, T = pcall(function()
			local o = game:HttpGet(
				"https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
					.. (LocalPlayer.UserId .. "&size=420x420&format=Png&isCircular=false")
			)
			local T = (game:GetService("HttpService")):JSONDecode(o)
			if T and (T.data and T.data[1]) then
				return T.data[1].imageUrl
			end
			return nil
		end)
		if o and T then
			avatarImage:SetImage(T)
			avatarImage.ElementFrame.Visible = true
		end
	end
	RootEnv = nil
	pcall(function()
		RootEnv = getfenv(0)
	end)
	if type(RootEnv) ~= "table" then
		RootEnv = _G
	end
	Executor = {
		["isnetworkowner"] = RootEnv.isnetworkowner,
		["firetouchinterest"] = RootEnv.firetouchinterest,
		["replicatesignal"] = RootEnv.replicatesignal,
		["fireproximityprompt"] = RootEnv.fireproximityprompt,
		["hookmetamethod"] = RootEnv.hookmetamethod,
		["newcclosure"] = RootEnv.newcclosure,
		["getnamecallmethod"] = RootEnv.getnamecallmethod,
		["require"] = RootEnv.require,
	}
	Groupboxes.HomeFunctions = WindTabs.Home:Section({ Title = CheesyTranslate("Functions & Features") or "Functions & Features", Box = true, Opened = true })
	function CheckMark(o)
		return o and "✅" or "❌"
	end
	hasFirePrompt = Executor.fireproximityprompt ~= nil
	hasFireTouch = Executor.firetouchinterest ~= nil
	hasReplicateSignal = Executor.replicatesignal ~= nil
	hasNetworkOwner = Executor.isnetworkowner ~= nil
	hasHookMeta = Executor.hookmetamethod ~= nil
		and (Executor.newcclosure ~= nil and Executor.getnamecallmethod ~= nil)
	hasRequire = Executor.require ~= nil
	hasHookFunction = (RootEnv.hookfunction ~= nil) or (RootEnv.hook_function ~= nil)
	_isSolaraCached = nil
	function isSolara()
		if _isSolaraCached ~= nil then
			return _isSolaraCached
		end
		local o, T = pcall(identifyexecutor)
		_isSolaraCached = (o and (type(T) == "string" and (T:lower()):find("solara") ~= nil)) or false
		return _isSolaraCached
	end
	do
		local function localizeHomeText(text) return CheesyTranslate(text) or text end
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Auto Interact " .. (CheckMark(hasFirePrompt) .. " (fireproximityprompt)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Infinite Items " .. (CheckMark(hasFirePrompt) .. " (fireproximityprompt)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Infinite Crucifix " .. (CheckMark(hasFirePrompt) .. " (fireproximityprompt)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Auto Closet " .. (CheckMark(hasFirePrompt) .. " (fireproximityprompt)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Remove Seek Trigger " .. (CheckMark(hasFireTouch) .. " (firetouchinterest)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Fake Revive " .. (CheckMark(hasReplicateSignal) .. " (replicatesignal)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Remove Figure " .. (CheckMark(hasNetworkOwner) .. " (isnetworkowner)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Delete Figure (Mines) " .. (CheckMark(hasNetworkOwner) .. " (isnetworkowner)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Win Heartbeat Minigame " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Bypass Eyes " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Bypass Lookman " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Spoof Footsteps " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Auto Minecart " .. (CheckMark(hasRequire) .. " (require)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Viewmodel Offset " .. (CheckMark(hasRequire and not isSolara()) .. " (require)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Minecart Teleport " .. (CheckMark(hasHookMeta) .. " (hookmetamethod, hookfunction)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Remove Camera Bobbing " .. (CheckMark(hasRequire and not isSolara()) .. " (require)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Remove Camera Shake " .. (CheckMark(hasRequire and not isSolara()) .. " (require)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Crouch Spoof " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Anti Drone " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)")) })
		Groupboxes.HomeFunctions:Paragraph({ Title = localizeHomeText("Anti Monument " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)")) })
		Groupboxes.HomeInfo = WindTabs.Home:Section({ Title = CheesyTranslate("Info") or "Info", Box = true, Opened = true })
		Groupboxes.HomeInfo:Paragraph({ Title = localizeHomeText("<font size=\"18\">Cheese Hub revamped :)<br/>'cheesy' is still actively getting updated, so i'm sorry for any bugs that might occur!<br/>also, cheesy/cheese hub will eventually support more games :D</font>") })
		Groupboxes.HomeInfo:Divider()
		Groupboxes.HomeInfo:Paragraph({ Title = localizeHomeText('<font size="18">Join our discord for help, updates, and for chatting!<br/>discord.gg/CuZJQaCquK</font>') })
	end
	Groupboxes.Misc = WindTabs.Miscellaneous:Section({ Title = UiLibrary:Text("Miscellaneous"), Box = true, Opened = true })
	Groupboxes.Misc:Button({
		Title = CheesyTranslate("Play Again") or "Play Again",
		Callback = function()
			pcall(function()
				local o = GameRemotes and GameRemotes:FindFirstChild("PlayAgain")
				if o then
					o:FireServer()
				end
			end)
		end,
	})
	Groupboxes.Misc:Button({
		Title = CheesyTranslate("Return to Lobby") or "Return to Lobby",
		Callback = function()
			pcall(function()
				local o = GameRemotes and GameRemotes:FindFirstChild("Lobby")
				if o then
					o:FireServer()
				end
			end)
		end,
	})
	Groupboxes.Misc:Button({
		Title = CheesyTranslate("Reset Character") or "Reset Character",
		Callback = function()
			pcall(function()
				if Humanoid then
					Humanoid.Health = 0
				end
				local o = GameRemotes and GameRemotes:FindFirstChild("Underwater")
				if o then
					o:FireServer(true)
				end
			end)
		end,
	})
	Groupboxes.Misc:Button({
		Title = CheesyTranslate("Give Star Jug") or "Give Star Jug",
		Desc = CheesyTranslate("Gives a star jug") or "Gives a star jug",
		Callback = function()
			task.spawn(function()
				local o = Character or (LocalPlayer.CharacterAdded:Wait())
				local T = Humanoid or o:WaitForChild("Humanoid")
				local k = (game:GetObjects("rbxassetid://119885581324516"))[1]
				if not k then
					return
				end
				local P = 4
				local w = false
				k:SetAttribute("Durability", P)
				local F = Instance.new("NumberValue", k)
				k.Parent = LocalPlayer.Backpack
				local A = k:WaitForChild("Animations")
				local d = {}
				for o, k in A:GetChildren() do
					d[k.Name] = T:LoadAnimation(k)
					if k.Name == "idle" then
						d[k.Name].Priority = Enum.AnimationPriority.Idle
						d[k.Name].Looped = true
					end
				end
				k.Equipped:Connect(function()
					d.equip:Play()
					task.wait(d.equip.Length)
					if k:IsDescendantOf(o) then
						d.idle:Play()
					end
				end)
				k.Unequipped:Connect(function()
					if d.idle.IsPlaying then
						d.idle:Stop()
					end
				end)
				k.Activated:Connect(function()
					if w then
						return
					end
					w = true
					d.open:Play()
					if P - 1 ~= 0 then
						P = P - 1
						k:SetAttribute("Durability", P)
					else
						k:Destroy()
					end
					local o = Character
					if not o or not o.Parent then
						w = false
						return
					end
					o:SetAttribute("Starlight", true)
					o:SetAttribute("StarlightHuge", true)
					local T = false
					local A = o:FindFirstChild("CollisionPart") or o:FindFirstChild("Collision")
					local C = GameRemotes and GameRemotes:FindFirstChild("Crouch")
					if A and not o:FindFirstChild("CollisionPartClone") then
						local k = A:Clone()
						k.CanCollide = false
						k.Massless = true
						k.RootPriority = 127
						k.Anchored = false
						k.Name = "CollisionPartClone"
						local P = k:FindFirstChild("CollisionCrouch")
						if P then
							P:Destroy()
						end
						k.Parent = o
						task.spawn(function()
							while not T do
								k.Massless = not k.Massless
								if C then
									C:FireServer(true, true)
								end
								task.wait(0.21)
							end
							k.Massless = true
							k:Destroy()
						end)
					end
					F.Value = 35
					(TweenService:Create(F, TweenInfo.new(70, Enum.EasingStyle.Linear), { ["Value"] = 0 })):Play()
					local f
					f = (F:GetPropertyChangedSignal("Value")):Connect(function()
						if o and o.Parent then
							o:SetAttribute("SpeedBoost", F.Value)
						end
					end)
					task.wait(35)
					T = true
					f:Disconnect()
					F:Destroy()
					if o and o.Parent then
						o:SetAttribute("Starlight", false)
						o:SetAttribute("StarlightHuge", false)
						o:SetAttribute("SpeedBoost", 0)
					end
					w = false
				end)
			end)
		end,
	})
	Groupboxes.Misc:Divider()
	Groupboxes.Misc:Button({
		Title = CheesyTranslate("Copy/Open Discord Invite") or "Copy/Open Discord Invite",
		Desc = CheesyTranslate("Copies the Discord invite to your clipboard and opens it in Discord") or "Copies the Discord invite to your clipboard and opens it in Discord",
		Callback = function()
			pcall(function()
				setclipboard(DISCORD_INVITE)
			end)
			pcall(function()
				_G.Clipboard.set(DISCORD_INVITE)
			end)
			task.spawn(function()
				local o = syn and syn.request or request or http_request
				if o then
					pcall(function()
						local T = game:GetService("HttpService")
						o({
							["Url"] = "http://127.0.0.1:6463/rpc?v=1",
							["Method"] = "POST",
							["Headers"] = {
								["Content-Type"] = "application/json",
								["Origin"] = "https://discord.com",
							},
							["Body"] = T:JSONEncode({
								["cmd"] = "INVITE_BROWSER",
								["nonce"] = T:GenerateGUID(false),
								["args"] = { ["code"] = "CuZJQaCquK" },
							}),
						})
					end)
				end
				pcall(function()
					local o = getgenv()
					local T = o.syn and o.syn.openurl or o.openurl or o.open_url
					if T then
						T(DISCORD_INVITE)
					end
				end)
			end)
		end,
	})
	UiLibrary:Mount(Groupboxes.Misc, "Toggle", "ShowKeybinds", { ["Title"] = "Show Keybinds", ["Value"] = false, ["Desc"] = "Shows all registered keybinds" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.ShowKeybinds:OnChanged(function(o)
		UiLibrary.KeybindFrame.Visible = o
	end)
	UiLibrary:Mount(Groupboxes.Misc, "Toggle", "DiscordRichPresence", {
			["Title"] = "Discord Rich Presence",
			["Value"] = false,
			["Desc"] = "Shows your current room in your Discord status via Bloxstrap RPC",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	BLOXSTRAP_CHEESE_ICON = 1.0699002190259e+014
	Discord = { ["PresenceConn"] = nil, ["PresenceActive"] = false, ["LastUpdate"] = 0 }
	local function postBloxstrapRpc(o, T)
		local k = (game:GetService("HttpService")):JSONEncode({ ["command"] = o, ["data"] = T })
		pcall(function()
			(game:GetService("HttpService")):PostAsync(
				"http://127.0.0.1:43594/rpc",
				k,
				Enum.HttpContentType.ApplicationJson
			)
		end)
	end
	local function getPresenceRoom()
		local o = "Unknown"
		pcall(function()
			GameData = ReplicatedStorage:FindFirstChild("GameData")
			local T = GameData and GameData:FindFirstChild("LatestRoom")
			if T then
				o = tostring(T.Value)
			elseif LocalPlayer and LocalPlayer:GetAttribute("CurrentRoom") then
				o = tostring(LocalPlayer:GetAttribute("CurrentRoom"))
			end
		end)
		return "Room " .. o
	end
	local function updateDiscordPresence()
		if _Unloading then
			return
		end
		if not (Toggles.DiscordRichPresence and Toggles.DiscordRichPresence.Value) then
			return
		end
		postBloxstrapRpc(
			"SetRichPresence",
			{
				["details"] = "Using cheesy",
				["state"] = getPresenceRoom(),
				["largeImage"] = { ["assetId"] = BLOXSTRAP_CHEESE_ICON, ["hoverText"] = "cheesy" },
				["smallImage"] = {
					["assetId"] = BLOXSTRAP_CHEESE_ICON,
					["hoverText"] = "discord.gg/CuZJQaCquK",
				},
			}
		)
	end
	Toggles.DiscordRichPresence:OnChanged(function(o)
		if Discord.PresenceConn then
			Discord.PresenceConn:Disconnect()
			Discord.PresenceConn = nil
		end
		if o then
			Discord.PresenceActive = true
			Discord.LastUpdate = 0
			updateDiscordPresence()
			task.spawn(function()
				while Discord.PresenceActive do
					task.wait(15)
					if not Discord.PresenceActive then
						break
					end
					Discord.LastUpdate = os.clock()
					updateDiscordPresence()
				end
			end)
		else
			Discord.PresenceActive = false
			if Discord.PresenceConn then
				Discord.PresenceConn:Disconnect()
				Discord.PresenceConn = nil
			end
			postBloxstrapRpc(
				"SetRichPresence",
				{
					["details"] = "<reset>",
					["state"] = "<reset>",
					["largeImage"] = { ["reset"] = true },
					["smallImage"] = { ["reset"] = true },
				}
			)
		end
	end)
	UiLibrary:Mount(Groupboxes.Misc, "Toggle", "AntiLag", {
			["Title"] = "Anti-Lag",
			["Value"] = false,
			["Desc"] = "Reduces lag by setting all parts in the current rooms to Plastic material",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	AntiLagOriginal = setmetatable({}, { ["__mode"] = "k" })
	AntiLagConn = nil
	function AntiLagApplyPart(o)
		if not o or not o:IsA("BasePart") then
			return
		end
		if AntiLagOriginal[o] == nil then
			AntiLagOriginal[o] = o.Material
		end
		if o.Material ~= Enum.Material.Plastic then
			o.Material = Enum.Material.Plastic
		end
	end
	function StopAntiLag()
		if AntiLagConn then
			AntiLagConn:Disconnect()
			AntiLagConn = nil
		end
		for o, T in pairs(AntiLagOriginal) do
			if o and o.Parent then
				pcall(function()
					o.Material = T
				end)
			end
		end
		AntiLagOriginal = setmetatable({}, { ["__mode"] = "k" })
		local o = workspace:FindFirstChild("CurrentRooms")
		if o then
			for o, T in ipairs(o:GetDescendants()) do
				if T:IsA("BasePart") and T:GetAttribute("Mat") ~= nil then
					T:SetAttribute("Mat", nil)
				end
			end
		end
	end
	Toggles.AntiLag:OnChanged(function(o)
		if not o then
			StopAntiLag()
			return
		end
		local T = workspace:FindFirstChild("CurrentRooms")
		if T then
			for o, T in ipairs(T:GetDescendants()) do
				AntiLagApplyPart(T)
			end
		end
		if not AntiLagConn then
			AntiLagConn = workspace.DescendantAdded:Connect(function(o)
				if _Unloading then
					return
				end
				if not (Toggles.AntiLag and Toggles.AntiLag.Value) then
					return
				end
				AntiLagApplyPart(o)
			end)
		end
	end)
	UiLibrary:TrackElement(Groupboxes.Misc, Groupboxes.Misc:Divider())
	UiLibrary:Mount(Groupboxes.Misc, "Toggle", "DisableIdleKick", {
			["Title"] = "Disable Idle Kick",
			["Value"] = false,
			["Desc"] = "Disables the kick from being afk for 20 minutes",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	DisableIdleKickConn = nil
	Toggles.DisableIdleKick:OnChanged(function(o)
		if DisableIdleKickConn then
			DisableIdleKickConn:Disconnect()
			DisableIdleKickConn = nil
		end
		if o then
			DisableIdleKickConn = LocalPlayer.Idled:Connect(function()
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new())
			end)
		end
	end)
	UiLibrary:TrackElement(Groupboxes.Misc, Groupboxes.Misc:Divider())
	UiLibrary:Mount(Groupboxes.Misc, "Toggle", "DisplayInfo", {
			["Title"] = "Display Info",
			["Value"] = false,
			["Desc"] = "Shows an overlay with FPS, ping, executor, and username",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	DisplayInfoFPS = 60
	DisplayInfoFC = 0
	DisplayInfoFT = tick()
	Toggles.DisplayInfo:OnChanged(function(o)
		if DisplayInfoLabel then
			DisplayInfoLabel:Destroy()
			DisplayInfoLabel = nil
		end
		if DisplayInfoConn then
			DisplayInfoConn:Disconnect()
			DisplayInfoConn = nil
		end
		if o then
			DisplayInfoFC = 0
			DisplayInfoFT = tick()
			DisplayInfoLabel = UiLibrary:AddDraggableLabel("cheesy | loading...")
			DisplayInfoConn = RunService.RenderStepped:Connect(function()
				if _Unloading then
					return
				end
				DisplayInfoFC = DisplayInfoFC + 1
				local o = tick()
				if o - DisplayInfoFT >= 1 then
					DisplayInfoFPS = DisplayInfoFC
					DisplayInfoFT = o
					DisplayInfoFC = 0
				end
				local T = pcall(function()
					return math.floor(
						(game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValue()
					)
				end) and math.floor(
					(game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValue()
				) or 0
				local k = pcall(identifyexecutor) and identifyexecutor() or "Unknown"
				DisplayInfoLabel:SetText(
					("%s | %s: %d | %s: %dms | %s: %s | %s: %s"):format(
						CheesyTranslate("cheesy") or "cheesy",
						CheesyTranslate("FPS") or "FPS",
						math.floor(DisplayInfoFPS),
						CheesyTranslate("Ping") or "Ping",
						T,
						CheesyTranslate("Executor") or "Executor",
						k,
						CheesyTranslate("User") or "User",
						LocalPlayer.Name
					)
				)
			end)
		end
	end)
	Groupboxes.MiscFun = WindTabs.Miscellaneous:Section({ Title = UiLibrary:Text("Fun"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.MiscFun, "Toggle", "Uhhhh", { ["Title"] = "uhhhh", ["Value"] = false, ["Desc"] = "content (this makes a lot of lag btw)" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UhhhhDecals = {}
	UhhhhConn = nil
	Toggles.Uhhhh:OnChanged(function(o)
		local T = "http://www.roblox.com/asset/?id=135666356081915"
		if o then
			for o, k in pairs(workspace:GetDescendants()) do
				if k:IsA("BasePart") then
					local o = k:FindFirstAncestorWhichIsA("Model")
					if not (o and o:FindFirstChild("Humanoid")) then
						for o, P in ipairs(Enum.NormalId:GetEnumItems()) do
							local w = Instance.new("Decal")
							w.Texture = T
							w.Face = P
							w.Parent = k
							table.insert(UhhhhDecals, w)
						end
					end
				end
			end
			UhhhhConn = workspace.DescendantAdded:Connect(function(o)
				if o:IsA("BasePart") then
					local k = o:FindFirstAncestorWhichIsA("Model")
					if not (k and k:WaitForChild("Humanoid")) then
						for k, P in ipairs(Enum.NormalId:GetEnumItems()) do
							local w = Instance.new("Decal")
							w.Texture = T
							w.Face = P
							w.Parent = o
							table.insert(UhhhhDecals, w)
						end
					end
				end
			end)
		else
			if UhhhhConn then
				UhhhhConn:Disconnect()
				UhhhhConn = nil
			end
			for o, T in ipairs(UhhhhDecals) do
				if T and T.Parent then
					T:Destroy()
				end
			end
			TableClear(UhhhhDecals)
		end
	end)
	Groupboxes.MiscFun:Button({
		Title = CheesyTranslate("uhhhh v2") or "uhhhh v2",
		Desc = CheesyTranslate("content") or "content",
		Callback = function()
			local o = Instance.new("ScreenGui")
			o.Name = "content"
			o.ResetOnSpawn = false
			o.IgnoreGuiInset = true
			o.Parent = CoreGui
			local k = Instance.new("Frame")
			k.Size = UDim2.new(1, 0, 1, 0)
			k.BackgroundColor3 = Color3.new(0, 0, 0)
			k.BackgroundTransparency = 1
			k.Parent = o
			local P = Instance.new("TextLabel")
			P.Size = UDim2.new(1, -40, 1, -40)
			P.Position = UDim2.new(0, 20, 0, 20)
			P.BackgroundTransparency = 1
			P.TextColor3 = Color3.fromRGB(255, 255, 255)
			P.TextTransparency = 1
			P.TextScaled = true
			P.Font = Enum.Font.Code
			P.TextXAlignment = Enum.TextXAlignment.Center
			P.TextYAlignment = Enum.TextYAlignment.Center
			P.Text = ".............                                            \n                                           ................                                     ..................                                     \n                                        .......................                               ......................                                   \n                                     .............................                          ..........................                                 \n                                   .................................                      .............................                                \n                                  .....................      .......                     ................................                              \n                                 ............                     ..                    :..                   ............                             \n                                ..........                                                                       ..........                            \n                               ........                                                                            .........                           \n                              .......                                                                               .........                          \n                             .......                                                                                  .......                          \n                            .......                     +%##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@                         ........                         \n                           ......                +*#%%#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@                    ......                         \n                           ....             *###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@                 .....                        \n                          ....          *##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@            :.....                       \n                         ....        ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@          -.....                      \n                        ....:     #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@        -....                      \n                        -.-    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@     =:..:                     \n                            #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@                             \n                          #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@                         \n                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@                       \n                      ###%%%%%####%%%%%%%%%%%%#####%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#%%%%@@@@@@@@@%%%#######%%%%%%@@                     \n                    %#%%####%@@@@@@@@@@@@@@@@@@@@@@@%###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#%%@@@@@@@@@@@@@@@@@@@@@@@%#####%%%@%%%                   \n                  #######%@@@@@@@@@@@@@@@@@@@@@@@@@@@@%#*#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%###%%%%%%%                 \n                 %%####%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*#%%%%%%%%%%%%%%%%%%%%%%%%%%%%#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%###%%%%%%                \n               #%%**#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*#%%%%%%%%%%%%%%%%%%%%%%%%##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%###%%%%%%              \n              %%#**%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#*#%%%%%%%%%%%%%%%%%%%%##%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@###%%%%%%             \n            ##%#*#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#*#%%%%%%%%%%%%%%%%%%##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@###%%%%%%            \n           *#%#*#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*#%%%%%%%%%%%%%%%%#%@@@@@@@@@@@@@@@%#*+=-----+*#@@@@@@@@@@@@@@@@@@@#*#%%%%%%%          \n          *#%#*#@@@@@@@@@@@@@@@@@@@@@@@@@%#+=:.....:=*%@@@@@@@@@%+#%%%%%%%%%%%%%%#%@@@@@@@@@@@@@#=...............=%@@@@@@@@@@@@@@@@@#*#%%%%%%%         \n         *###*#@@@@@@@@@@@@@@@@@@@@@@@%=...............:+@@@@@@@@%+#%%%%%%%%%%%%#%@@@@@@@@@@@%=...............:---:-%@@@@@@@@@@@@@@@@*##%%%%%%%        \n        *####*@@@@@@@@@@@@@@@@@@@@@@%=...    .........---:*@@@@@@@*+%%%%%%%%%%%##@@@@@@@@@@@+................:==-=-::*@@@@@@@@@@@@@@@%*#%%%%%%%        \n       *####*%@@@@@@@@@@@@@@@@@@@@@*...   ..........:===--:-%@@@@@@+#%%%%%%%%%%#%@@@@@@@@@%-.................-==----:.#@@@@@@@@@@@@@@@+##%%%%%%%       \n      *#####*%@@@@@@@@@@@@@@@@@@@@=.................===----:-%@@@@@**%%%%%%%%%##@@@@@@@@@%-..................-==----:.:@@@@@@@@@@@@@@@*###%%%%%%%      \n     **####*#@@@@@@@@@@@@@@@@@@@@=..................-==----:.+@@@@@#+%%%%%%%%%#%@@@@@@@@@*....................:-=-:::.:@@@@@@@@@@@@@@@#*##%%%%%%%%     \n    **#####*#@@@@@@@@@@@@@@@@@@@#....................==----:.-%@@@@%+#%%%%%%%%#%@@@@@@@@@+............................:@@@@@@@@@@@@@@@#*###%%%%%%#     \n    *######*#@@@@@@@@@@@@@@@@@@@+.....................:--::..-%@@@@%+#%%%%%%%##%@@@@@@@@@*............................-@@@@@@@@@@@@@@@#*###%%%%%%##    \n  ***######*#@@@@@@@@@@@@@@@@@@@=............................=@@@@@%+##%%%%%%#*%@@@@@@@@@#:...........................%@@@@@@@@@@@@@@@**###%%%%%##%    \n  *+#######**@@@@@@@@@@@@@@@@@@@*............................*@@@@@#+##%%%%%%#*#@@@@@@@@@@+.........................:%@@@@@@@@@@@@@@@@*###%%%%%%%%##   \n# +*#######**%@@@@@@@@@@@@@@@@@@%:..........................=%@@@@@+*##%%%%%%%##@@@@@@@@@@%+.......................+@@@@@@@@@@@@@@@@@%*####%%%%%%%%#   \n##+*#######**#@@@@@@@%%%%%@@@@@@@*.........................-%@@@@@%=###%%%%%%%#*%@@@@@@@@@@%#-..................:+%@@@@@@@@@@@@@@@@@@+*####%%%%%#####  \n#**#########*+%@@@@@%%%%%%%%@@@@@@*.......................+@@@@@@@++####%%%%%%#**@@@@@@@@@@%%%#+:............:=#@@@@@@@@@@@@@@@@@@@@*+#####%%%%######  \n***#########**+%@@@@@%%%%%%%%%@@@@@%=...................=%@@@@@@@*+####%%%%%%%##*#@@@@@@@@@%%%%@@%#*+++++*#%@@@@@@@@@@@@@@@@@@@@@@@#+#####%%%%%%#####  \n***##########*++@@@@@@%%%%%%%%%%@@@@@%+:.............-+%@@@@@@@@#+*###%%%#%%%%%##+#@@@@@@@@@%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#+*#######%%%######  \n***##########**++%@@@@@@%%%%%%%%%%%@@@@@%#=-::::-=*%@@@@@@@@@@@*+*####%#%%%%%%%###**@@@@@@@@@@%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@*+*#########%%######  \n#**##########***+=%@@@@@@@%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@*+*#######%%%#%######*+%@@@@@@@@@@%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@#+*###########%######## \n#**###########****+*@@@@@@@@@%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@#++*#####################+*@@@@@@@@@@@@@@%%%%%@@@@@@@@@@@@@@@@@@@#++*##################### \n#**###########*****++*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%++*########################*+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#++*####################### \n#**###########*******++*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#==*############################*++#@@@@@@@@@@@@@@@@@@@@@@@@@@@@%+=+**#######################  \n#**######*#************+++*%@@@@@@@@@@@@@@@@@@@@@@@@@#+=+*################################**++*#%@@@@@@@@@@@@@@@@@@@%*==+**##########################  \n#***#####*****************++++#%@@@@@@@@@@@@@@@@@#*==+**######################################**++++**#########**++++***#############################  \n##**#####*********************+++++++++++++++++==++**##############################################*******++++******##=::...::+######################  \n##**#####*****************************************##################################################################+..........=#####################  \n##**#####************************************#######################################################################+-=*+......:*###################   \n###**#####*****************************###############################################################################*-...:*#=:+###################   \n####**####******************************#############################################################################=....-*#######################    \n#####*####********************************########################################################################*=....-*#########################    \n ####**####***************************************#*############################################################+:....=*##########################     \n  ####*#####*******************************************######################################################*-....:+############################      \n  #####*#####***************************************************#########################################*+-....:+###############################      \n   ###########***************+::-+***********************************#################################*=.....-*##############################*##       \n    #####*#####****************+:...:=+***********************************#*####################**=:.....:=*###################################        \n     ####**#####******************+-....:-=*********************************#########*#####**=:......:+***##################################*#         \n      ####**#####********************+=-:.....:-=+************************************+=-:......:-+**#####################################***          \n      ######*######*********************+++=:........::--==++***************++==-::........:-=+*****######################################**           \n       ######*#######************************++==-:..................................:-=++**********#####################################**            \n         #####*#######******************************++==----:::::::::::::::---===++**********************############################***#              \n          ######*########**********************************************************************************##########################*##               \n           ###############*************************************************************************************#################*###*#*                \n            #######*########**********************************************************************************################***#***                  \n              #######*#########********************************************************************************#############**####**                   \n                ######**##########****************************************************************************###########*******#*                     \n                  ######**##########*************************************************************************##########*********                       \n                   #########*#########**********************************************************************########********##                         \n                      ########*#########*****************************************************************########***********                           \n                        ##########*#########*********************************************************#########************                             \n                          ######################*************************************************########***************                               \n                             ##########################*************************************#########****************                                  \n                               ##################################******************#############******************                                     \n                                   *######################################################*********************                                        \n                                      ***####***###*******#############*##########*************************                                            \n                                          *####*##*##*#************************************************"
			P.Parent = k;
			(TweenService:Create(
				k,
				TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ ["BackgroundTransparency"] = 0.1 }
			)):Play();
			(TweenService:Create(
				P,
				TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ ["TextTransparency"] = 0 }
			)):Play()
			UiLibrary:Toggle(false)
			task.wait(6);
			(TweenService:Create(
				k,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{ ["BackgroundTransparency"] = 1 }
			)):Play();
			(TweenService:Create(
				P,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{ ["TextTransparency"] = 1 }
			)):Play()
			task.wait(1)
			o:Destroy()
		end,
	})
	Groupboxes.MiscFun:Button({
		Title = CheesyTranslate("Death Farm") or "Death Farm",
		Desc = CheesyTranslate("Execute this in the hotel at a start of run, either use it from here or execute the actual script") or "Execute this in the hotel at a start of run, either use it from here or execute the actual script",
		Callback = function()
			(loadstring(
				game:HttpGet(
					"https://raw.githubusercontent.com/doram44/cheesy/refs/heads/main/stuff/deathfarm.lua"
				)
			))()
		end,
	})
	UiLibrary:Mount(Groupboxes.MiscFun, "Toggle", "OrbitItems", {
			["Title"] = "Orbit Items",
			["Value"] = false,
			["Desc"] = "Items that you have dropped will spin around you on the floor",
			["DisabledTooltip"] = "This feature doesn't work in this floor",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.MiscFun, "Slider", "OrbitYOffset", {
			["Title"] = "Orbit Y Offset",
			["Min"] = 0,
			["Max"] = 2,
			["Value"] = 2,
			["Precision"] = 1,
			["Desc"] = "The Y position of the item orbit",
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.MiscFun, "Slider", "OrbitSpeed", {
			["Title"] = "Orbit Speed",
			["Min"] = 2,
			["Max"] = 5,
			["Value"] = 2,
			["Precision"] = 1,
			["Desc"] = "The speed of the item orbit",
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	OrbitConn = nil
	local function startOrbitItems()
		if OrbitConn then
			OrbitConn:Disconnect()
			OrbitConn = nil
		end
		if not Toggles.OrbitItems.Value then
			return
		end
		if not Character or not HumanoidRootPart then
			return
		end
		OrbitConn = RunService.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if not Toggles.OrbitItems.Value or not Character or not HumanoidRootPart then
				return
			end
			if CurrentFloor == "Fools" then
				return
			end
			if tick() < (ScrapDroppedItemsHoldUntil or 0) then
				return
			end
			local o = workspace:FindFirstChild("Drops")
			if not o then
				return
			end
			local T = o:GetChildren()
			local k = #T
			if k == 0 then
				return
			end
			local P = tick()
			local w = 4
			for o, T in ipairs(T) do
				if T:IsA("Model") then
					local F = P * Options.OrbitSpeed.Value + ((o / k) * math.pi) * 2
					local A = Vector3.new(math.cos(F) * w, -Options.OrbitYOffset.Value, math.sin(F) * w)
					T:PivotTo(CFrame.new(HumanoidRootPart.Position + A))
				end
			end
		end)
	end
	Toggles.OrbitItems:OnChanged(startOrbitItems)
	BringItemsConn = nil
	BringItemsBVs = {}
	local function clearBringItemsForces()
		for o, T in ipairs(BringItemsBVs) do
			if T.Parent then
				pcall(T.Destroy, T)
			end
		end
		TableClear(BringItemsBVs)
	end
	local function stopBringItems()
		if BringItemsConn then
			BringItemsConn:Disconnect()
			BringItemsConn = nil
		end
		clearBringItemsForces()
	end
	local function getItemBasePart(o)
		if o:IsA("BasePart") then
			return o
		end
		if o:IsA("Model") then
			return o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart")
		end
		return nil
	end
	function SetupBringItems()
		stopBringItems()
		if _Unloading then
			return
		end
		if not Toggles.BringItems.Value then
			return
		end
		local o = 0
		BringItemsConn = RunService.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if not Toggles.BringItems.Value then
				return
			end
			if CurrentFloor == "Fools" then
				return
			end
			if tick() < (ScrapDroppedItemsHoldUntil or 0) then
				clearBringItemsForces()
				return
			end
			local T = Character or LocalPlayer.Character
			local k = T and T:FindFirstChildOfClass("Humanoid")
			local P = workspace.CurrentCamera
			if not k or not P or k.Health <= 0 or k:GetState() == Enum.HumanoidStateType.Dead then
				clearBringItemsForces()
				return
			end
			local w = (P.CFrame.Position + P.CFrame.LookVector * 2) + Vector3.new(0, -0.4, 0)
			local F = workspace:FindFirstChild("Drops")
			if not F then
				return
			end
			local A = 0
			for o, T in ipairs(F:GetChildren()) do
				local k = getItemBasePart(T)
				if not k then
					continue
				end
				A += 1
				if k.Anchored then
					pcall(function()
						k.Anchored = false
					end)
				end
				local P = k:FindFirstChildOfClass("BodyVelocity")
				if not P then
					P = Instance.new("BodyVelocity")
					P.Name = "BringItemsVelocity"
					P.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
					P.Parent = k
					table.insert(BringItemsBVs, P)
				end
				local F = w - k.Position
				if F.Magnitude > 2 then
					k.CFrame = k.CFrame:Lerp(CFrame.new(w), 0.4)
				end
				P.Velocity = F * 40
			end
			local d = os.clock()
			if d - o >= 2 then
				o = d
			end
		end)
	end
	UiLibrary:Mount(Groupboxes.MiscFun, "Toggle", "BringItems", {
			["Title"] = "Bring Items",
			["Value"] = false,
			["Desc"] = "Floats all dropped items in front of your mouse",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.BringItems:OnChanged(SetupBringItems)
	UiLibrary:Mount(Groupboxes.MiscFun, "Toggle", "TwerkDance", {
			["Title"] = "Twerk",
			["Value"] = false,
			["Desc"] = "Plays the mspaint twerking animation (i think)",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.TwerkDance:OnChanged(function(o)
		local T = LocalPlayer.Character
		if not T then
			return
		end
		if o then
			local o = Instance.new("Animation")
			o.AnimationId = "rbxassetid://12874447851"
			local k = T:FindFirstChildOfClass("Humanoid")
			if not k then
				return
			end
			local P = k:LoadAnimation(o)
			P.Looped = true
			P:Play()
		else
			if TwerkTrack then
				TwerkTrack:Stop()
			end
		end
	end)
	Functions = {
		["FirePrompt"] = nil,
		["GetLibraryCode"] = nil,
		["HasItem"] = nil,
		["HandleHidingTransparency"] = nil,
	}
	Connections = {}
	if Options.HotelAutoWalkMethod then
		Options.HotelAutoWalkMethod:OnChanged(function()
			if not Toggles.HotelAutoWalk or not Toggles.HotelAutoWalk.Value then
				return
			end
			CheesyState.HotelAutoWalkActive = false
			if Functions.HotelAutoWalk and Functions.HotelAutoWalk.StopTeleport then
				Functions.HotelAutoWalk.StopTeleport()
			end
			if
				HotelMethodName() == "Teleport"
				and (Functions.HotelAutoWalk and Functions.HotelAutoWalk.RunTeleport)
			then
				Functions.HotelAutoWalk.RunTeleport()
			end
		end)
	end
	if
		LocalPlayer.Character
		and (
			LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			and LocalPlayer.Character:FindFirstChild("Collision")
		)
	then
	end
	Groupboxes.Character = WindTabs.Main:Section({ Title = UiLibrary:Text("Character"), Box = true, Opened = true })
	Groupboxes.Other = WindTabs.Main:Section({ Title = UiLibrary:Text("Other"), Box = true, Opened = true })
	Groupboxes.SpamBuy = WindTabs.Exploits:Section({ Title = UiLibrary:Text("Pre-Run"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.SpamBuy, "Button", nil, {
		["Title"] = "Buy Items",
		["DisabledTooltip"] = "This feature doesn't work in this floor",
		["Callback"] = function()
			task.spawn(function()
				local o = (game:GetService("ReplicatedStorage")).RemotesFolder:FindFirstChild("PreRunShop")
				if not o then
					return
				end
				local T = Options.SpamBuyItems.Value
				local k = {}
				if T then
					for o, T in pairs(T) do
						table.insert(k, o)
					end
				end
				if #k > 0 then
					local T = Options.SpamBuyCount.Value
					local P = {}
					for o = 1, T, 1 do
						for o, T in ipairs(k) do
							table.insert(P, T)
						end
					end
					o:FireServer(P, false)
				end
			end)
		end,
	}, function(state, spec)
		return state.Section:Button({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Callback = state.Action,
		})
	end)
	UiLibrary:Mount(Groupboxes.SpamBuy, "Slider", "SpamBuyCount", {
			["Title"] = "Purchase Count",
			["Min"] = 1,
			["Max"] = 6,
			["Value"] = 3,
			["Precision"] = 0,
			["Compact"] = true,
			["DisabledTooltip"] = "This feature doesn't work in this floor",
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SpamBuy, "Dropdown", "SpamBuyItems", {
			["Title"] = "Items to Buy",
			["Values"] = {
				"Lockpick",
				"Lighter",
				"Flashlight",
				"Vitamins",
				"Crucifix",
				"Skeleton Key",
			},
			["Multi"] = true,
			["AllowNone"] = true,
			["DisabledTooltip"] = "This feature doesn't work in this floor",
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SpamBuy, "Toggle", "ShowCrucifix", {
			["Title"] = "Show Crucifix",
			["Value"] = false,
			["Desc"] = "Shows/hides the crucifix in the item shop",
			["DisabledTooltip"] = "This feature doesn't work in this floor",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.ShowCrucifix:OnChanged(function(o)
		local T = detectFloor()
		if T ~= "OldHotel" then
			return
		end
		local k = LocalPlayer
			and (
				LocalPlayer.PlayerGui
				and (
					LocalPlayer.PlayerGui:FindFirstChild("MainUI")
					and (
						LocalPlayer.PlayerGui.MainUI:FindFirstChild("ItemShop")
						and (
							LocalPlayer.PlayerGui.MainUI.ItemShop:FindFirstChild("Items")
							and LocalPlayer.PlayerGui.MainUI.ItemShop.Items:FindFirstChild(
								"ItemShop_Crucifix"
							)
						)
					)
				)
			)
		if k then
			k.Visible = o
		end
	end)
	UiLibrary:Mount(Groupboxes.SpamBuy, "Toggle", "ShowSkeletonKey", {
			["Title"] = "Show Skeleton Key",
			["Value"] = false,
			["Desc"] = "Shows/hides the skeleton key in the item shop",
			["DisabledTooltip"] = "This feature doesn't work in this floor",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.ShowSkeletonKey:OnChanged(function(o)
		local T = detectFloor()
		if T ~= "OldHotel" then
			return
		end
		local k = LocalPlayer
			and (
				LocalPlayer.PlayerGui
				and (
					LocalPlayer.PlayerGui:FindFirstChild("MainUI")
					and (
						LocalPlayer.PlayerGui.MainUI:FindFirstChild("ItemShop")
						and (
							LocalPlayer.PlayerGui.MainUI.ItemShop:FindFirstChild("Items")
							and LocalPlayer.PlayerGui.MainUI.ItemShop.Items:FindFirstChild(
								"ItemShop_Skeleton Key"
							)
						)
					)
				)
			)
		if k then
			k.Visible = o
		end
	end)
	Groupboxes.Prompts = WindTabs.Exploits:Section({ Title = UiLibrary:Text("Prompts"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.Prompts, "Toggle", "InstantInteract", {
			["Title"] = "Instant Interact",
			["Value"] = false,
			["Desc"] = "Removes the wait time for interactions e.g. locks",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Prompts, "Toggle", "PromptClip", {
			["Title"] = "Prompt Clip",
			["Value"] = false,
			["Desc"] = "Allows you to interact through walls",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Prompts, "Toggle", "PromptReach", {
			["Title"] = "Prompt Reach",
			["Value"] = false,
			["Desc"] = "Increases the range of all proximity prompts",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Prompts, "Slider", "PromptRange", {
			["Title"] = "Prompt Range",
			["Min"] = 1,
			["Max"] = 2,
			["Value"] = 1,
			["Precision"] = 1,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	_TrackedPrompts = {}
	Options.PromptRange:OnChanged(function(o)
		if Toggles.PromptReach.Value then
			for T, k in ipairs(_TrackedPrompts) do
				k.MaxActivationDistance = k:GetAttribute("MaxActivationDistance_Old") * o
			end
		end
	end)
	Groupboxes.Exploits = WindTabs.Exploits:Section({ Title = UiLibrary:Text("Exploits"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.Exploits, "Toggle", "InfiniteItemsToggle", {
			["Title"] = "Infinite Items",
			["Value"] = false,
			["Desc"] = "Allows you to use lockpicks, shears, skeleton keys, and multitools without draining the usage",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Connections.InfiniteItemsHandler = ProximityPromptService.PromptTriggered:Connect(function(o)
		if not o:GetAttribute("FakePrompt") then
			return
		end
		local T = {
			"Lockpick",
			"Shears",
			"SkeletonKey",
			"Key",
			"GeneratorFuse",
			"KeyElectrical",
			"KeyBackdoor",
			"KeyIron",
			"Multitool",
		}
		local k = {
			"Lockpick",
			"Shears",
			"SkeletonKey",
			"Key",
			"KeyElectrical",
			"KeyBackdoor",
			"KeyIron",
			"Multitool",
		}
		local P
		for o, T in ipairs(T) do
			P = Character:FindFirstChild(T)
			if P then
				break
			end
		end
		local w = o
		local F = {
			["UnlockPrompt"] = true,
			["SkullPrompt"] = true,
			["LockPrompt"] = true,
			["ThingToEnable"] = true,
			["FusesPrompt"] = true,
		}
		local A = F[o.Name]
			or (o.Parent and o.Parent:GetAttribute("Locked") == true)
			or (
				o.Parent
				and (
					o.Parent.Parent
					and (o.Parent.Parent.Name == "Locker_Small_Locked" and o.Name == "ActivateEventPrompt")
				)
			)
		if A then
			if Options.AutoInteractIgnoreList.Value.Locks then
				return
			end
			local o = {
				"Key",
				"GeneratorFuse",
				"KeyBackdoor",
				"KeyElectrical",
				"KeyIron",
				"Lockpick",
				"SkeletonKey",
				"Shears",
				"Multitool",
			}
			local T = { "Key", "GeneratorFuse", "KeyElectrical", "KeyIron" }
			local k = false
			for o, T in ipairs(o) do
				if Functions.HasItem(T, true) then
					k = true
					break
				end
			end
			for o, T in ipairs(T) do
				if Functions.HasItem(T) then
					k = true
					break
				end
			end
			if not k then
				return
			end
		end
		if
			w.Parent.Name == "CuttableVines"
				and (not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true))
			or w.Parent.Name == "Chest_Vine" and (not Functions.HasItem("Shears", true) and not Functions.HasItem(
				"Multitool",
				true
			))
			or w.Parent.Name == "Cellar"
				and (not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true))
		then
			return
		end
		if w.Parent.Name == "SkullLock" and not Functions.HasItem("SkeletonKey", true) then
			return
		end
		if
			w.Parent.Name == "Lock1"
				and (not Functions.HasItem("Lockpick", true) and not Functions.HasItem("Multitool", true))
			or w.Parent.Name == "Lock2"
				and (not Functions.HasItem("Lockpick", true) and not Functions.HasItem("Multitool", true))
		then
			return
		end
		if
			Functions.HasItem("Shears", true)
			and (
				A
				and (
					w.Parent.Name ~= "CuttableVines"
					and (w.Parent.Name ~= "Chest_Vine" and w.Parent.Name ~= "Cellar")
				)
			)
		then
			return
		end
		if P and (TableFind(k, P.Name) and (CheesyState.UseAnimation and CheesyState.UseAnimationBreak)) then
			CheesyState.UseAnimation:Stop()
			CheesyState.UseAnimationBreak:Stop()
			CheesyState.UseAnimationBreak:Play()
			if P.Name == "Shears" then
				((P:WaitForChild("Handle")):WaitForChild("sound_prompt")):Play()
			end
		end
		local d = Character:FindFirstChildOfClass("Tool")
		local C = d and FT[d.Name]
		if
			d
			and (
				C
				and (
					Toggles.InfiniteItemsToggle.Value
					and ({
						["Lockpicks"] = true,
						["Skeleton Key"] = true,
						["Shears"] = true,
						["Multitool"] = true,
					})[C]
				)
			)
		then
			((workspace:FindFirstChild("Drops"))).ChildAdded:Once(function(T)
				local k = T:FindFirstChild("ModulePrompt")
				local P = FakePrompts[o]
				Functions.FirePrompt(k)
				Functions.FirePrompt(P)
			end)
			Character.ChildAdded:Once(function(o)
				if o.Name == "Shears" then
					((o:WaitForChild("Handle")):WaitForChild("sound_promptend")):Play()
				end
			end)
			GameRemotes.DropItem:FireServer(d)
		else
			local T = FakePrompts[o]
			Functions.FirePrompt(T)
		end
	end)
	UiLibrary:Mount(Groupboxes.Exploits, "Toggle", "InfiniteCrucifix", {
			["Title"] = "Infinite Crucifix",
			["Value"] = false,
			["Desc"] = "Performs a glitch that doesn't use up your crucifix when used on a rushlike entity (rush, ambush, a60, a120, blitz), however, this is inconsistent",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits, "Toggle", "AutoHeartbeatMinigame", {
			["Title"] = "Win Heartbeat Minigame",
			["Value"] = false,
			["Desc"] = "Automatically passes the heartbeat minigame when it starts",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits, "Toggle", "CrouchSpoof", {
			["Title"] = "Crouch Spoof",
			["Value"] = false,
			["Desc"] = "Always makes the game think you are crouching",
			["Disabled"] = not hasHookMeta,
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits, "Button", nil, {
		["Title"] = "Fake Revive",
		["Desc"] = "This doesnt always work, and interacting with a bandage will disable it, and will not be able to enable it back. Sometimes you will not be able to fully finish the run, but you can still go through doors/finish",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		["Callback"] = function()
			task.spawn(function()
				local o = workspace.Gravity
				local k
				local function watchHumanoidDeath()
					local T = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
						or LocalPlayer.Character:WaitForChild("Humanoid")
					if k then
						k:Disconnect()
					end
					k = T.Died:Connect(function()
						task.delay(0.5, function()
							workspace.Gravity = 0
							local T = LocalPlayer.Character
							if not T then
								return
							end
							local P = T:FindFirstChild("Humanoid")
							local w = T:FindFirstChild("HumanoidRootPart")
							if not P or not w then
								return
							end
							local F = LocalPlayer:FindFirstChild("PlayerGui")
							if F then
								local o = F:FindFirstChild("MainUI")
								if o then
									local T = o:FindFirstChild("DeathPanel")
									if T then
										T:Destroy()
									end
									local k = o:FindFirstChild("Death")
									if k then
										k:Destroy()
									end
								end
							end
							P.Health = P.MaxHealth
							P.AutomaticScalingEnabled = true
							if T:GetAttribute("Stunned") then
								T:SetAttribute("Stunned", false)
							end
							task.delay(1, function()
								if k then
									workspace.Gravity = o
								end
							end)
						end)
					end)
				end
				local w = LocalPlayer:GetAttribute("CurrentRoom")
					or (
						ReplicatedStorage:FindFirstChild("GameData")
						and (
							ReplicatedStorage.GameData:FindFirstChild("LatestRoom")
							and ReplicatedStorage.GameData.LatestRoom.Value
						)
					)
				if w and w >= 1 then
					watchHumanoidDeath()
					LocalPlayer.CharacterAdded:Connect(function()
						watchHumanoidDeath()
					end)
					task.wait(1)
					if Executor.replicatesignal then
						Executor.replicatesignal(LocalPlayer.kill)
					elseif GameRemotes and GameRemotes:FindFirstChild("Underwater") then
						GameRemotes.Underwater:FireServer(true)
					else
						LocalPlayer.Character.Humanoid.Health = 0
					end
					task.wait(1);
					((game:GetService("CoreGui")):FindFirstChild("RobloxGui")).Backpack.Visible = true
					LocalPlayer:SetAttribute("Alive", true)
					LocalPlayer:SetAttribute("FakeDeath", true)
					UiLibrary:Notify({
						["Title"] = "Pick up a bandage to restore all interactions",
						["Time"] = 5,
					})
				end
			end)
		end,
	}, function(state, spec)
		return state.Section:Button({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Callback = state.Action,
		})
	end)
	local function configureProximityPrompt(o)
		if not o:GetAttribute("HoldDuration_Old") then
			o:SetAttribute("HoldDuration_Old", o.HoldDuration)
			o:SetAttribute("RequiresLineOfSight_Old", o.RequiresLineOfSight)
			o:SetAttribute("MaxActivationDistance_Old", o.MaxActivationDistance)
		end
		if Toggles.InstantInteract and Toggles.InstantInteract.Value then
			o.HoldDuration = 0
		end
		if Toggles.PromptClip and Toggles.PromptClip.Value then
			o.RequiresLineOfSight = false
		end
		if Toggles.PromptReach and (Toggles.PromptReach.Value and Options.PromptRange) then
			o.MaxActivationDistance = o:GetAttribute("MaxActivationDistance_Old") * Options.PromptRange.Value
		end
	end
	FakePrompts = {}
	local RT = Instance.new("Folder")
	RT.Name = "PromptContainer"
	RT.Parent = CoreGui
	local xT = {
		["UnlockPrompt"] = true,
		["SkullPrompt"] = true,
		["LockPrompt"] = true,
		["ThingToEnable"] = true,
		["FusesPrompt"] = true,
	}
	local function trackProximityPrompt(o)
		if o.ClassName ~= "ProximityPrompt" or o:GetAttribute("FakePrompt") then
			return
		end
		table.insert(_TrackedPrompts, o)
		configureProximityPrompt(o)
		if
			Executor.fireproximityprompt
			and (Toggles.InfiniteItemsToggle and Toggles.InfiniteItemsToggle.Value)
		then
			local T = LocalPlayer:GetAttribute("CurrentFloor") or ""
			if T ~= "OldHotel" and T ~= "Fools" then
				local T = xT[o.Name]
					or (o.Parent and o.Parent:GetAttribute("Locked") == true)
					or (
						o.Parent
						and (
							o.Parent.Parent
							and (
								o.Parent.Parent.Name == "Locker_Small_Locked"
								and o.Name == "ActivateEventPrompt"
							)
						)
					)
				if T then
					local T = o:Clone()
					T:SetAttribute("FakePrompt", true)
					T.Parent = o.Parent
					T:SetAttribute("HoldDuration_Old", o:GetAttribute("HoldDuration_Old"))
					T:SetAttribute("RequiresLineOfSight_Old", o:GetAttribute("RequiresLineOfSight_Old"))
					T:SetAttribute("MaxActivationDistance_Old", o:GetAttribute("MaxActivationDistance_Old"))
					T.HoldDuration = o.HoldDuration
					T.RequiresLineOfSight = o.RequiresLineOfSight
					T.MaxActivationDistance = o.MaxActivationDistance
					if Toggles.InstantInteract.Value then
						T.HoldDuration = 0
					end
					if Toggles.PromptClip.Value then
						T.RequiresLineOfSight = false
					end
					T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old")
						* Options.PromptRange.Value
					FakePrompts[T] = o
					table.insert(_TrackedPrompts, T)
					T.Destroying:Once(function()
						local o = TableFind(_TrackedPrompts, T)
						if o then
							table.remove(_TrackedPrompts, o)
						end
					end)
					pcall(function()
						o.Parent = RT
					end)
					local k = (o:GetPropertyChangedSignal("Enabled")):Connect(function()
						T.Enabled = o.Enabled
					end);
					(o:GetPropertyChangedSignal("ActionText")):Once(function()
						o.Parent = T.Parent
						T:Destroy()
						k:Disconnect()
					end)
					o.Destroying:Once(function()
						T:Destroy()
						k:Disconnect()
					end)
					T.Enabled = false
					task.wait()
					T.Enabled = o.Enabled
				end
			end
		end
		o.Destroying:Once(function()
			local T = TableFind(_TrackedPrompts, o)
			if T then
				table.remove(_TrackedPrompts, T)
			end
		end)
	end
	Toggles.InstantInteract:OnChanged(function()
		for o, T in ipairs(_TrackedPrompts) do
			T.HoldDuration = Toggles.InstantInteract.Value and 0 or T:GetAttribute("HoldDuration_Old")
		end
	end)
	Toggles.PromptClip:OnChanged(function()
		for o, T in ipairs(_TrackedPrompts) do
			if Toggles.PromptClip.Value then
				T.RequiresLineOfSight = false
			else
				T.RequiresLineOfSight = T:GetAttribute("RequiresLineOfSight_Old")
			end
		end
	end)
	Toggles.PromptReach:OnChanged(function()
		for o, T in ipairs(_TrackedPrompts) do
			if Toggles.PromptReach.Value then
				T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old")
					* Options.PromptRange.Value
			else
				T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old")
			end
		end
	end)
	Options.PromptRange:OnChanged(function()
		if Toggles.PromptReach.Value then
			for o, T in ipairs(_TrackedPrompts) do
				T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old")
					* Options.PromptRange.Value
			end
		end
	end)
	Groupboxes.Exploits_Bypasses = WindTabs.Exploits:Section({ Title = UiLibrary:Text("Bypasses / Bypasses"), Box = true, Opened = true })
	Groupboxes.Exploits_Removals = WindTabs.Exploits:Section({ Title = UiLibrary:Text("Bypasses / Removals"), Box = true, Opened = true })
	Groupboxes.Exploits_Damage = WindTabs.Exploits:Section({ Title = UiLibrary:Text("Bypasses / Damage"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.Exploits_Bypasses, "Toggle", "BypassGiggle", { ["Title"] = "Anti Giggle", ["Value"] = false, ["Desc"] = "Prevents Giggle from attacking you" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Bypasses, "Toggle", "BypassDupe", { ["Title"] = "Anti Dupe", ["Value"] = false, ["Desc"] = "Prevents you from opening Dupe doors" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Bypasses, "Toggle", "BypassEyes", {
			["Title"] = "Anti Eyes",
			["Value"] = false,
			["Desc"] = "Prevents Eyes from hurting you",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Bypasses, "Toggle", "BypassLookman", {
			["Title"] = "Anti Lookman",
			["Value"] = false,
			["Desc"] = "Prevents Lookman from hurting you",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Bypasses, "Toggle", "BypassGloombatEggs", {
			["Title"] = "Anti Gloombat Eggs",
			["Value"] = false,
			["Desc"] = "Prevents taking damage from stepping on Gloombat eggs",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Bypasses, "Toggle", "BypassSeekObstructions", {
			["Title"] = "Anti Seek Obstructions",
			["Value"] = false,
			["Desc"] = "Prevents obstacles in the Seek chase from harming you",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Bypasses, "Toggle", "BypassVacuum", {
			["Title"] = "Anti Vacuum",
			["Value"] = false,
			["Desc"] = "Prevents you from falling into Vacuum fake doors",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Bypasses, "Toggle", "BypassSnare", { ["Title"] = "Anti Snare", ["Value"] = false, ["Desc"] = "Prevents Snare from trapping you" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	wT = {
		["Entities"] = {},
		["EventTriggers"] = {},
		["Obstructions"] = {},
		["HidingSpots"] = {},
		["SeekObstructions"] = {},
		["SeekBridges"] = {},
		["SeekNodes"] = {},
		["SeekDuckBoards"] = {},
		["SeekHighlights"] = {},
		["EyestalkHighlights"] = {},
		["PathLights"] = {},
	}
	EntityNames = {
		["GiggleCeiling"] = true,
		["GloombatEgg"] = true,
		["GloombatEggs"] = true,
		["Snare"] = true,
		["Figure"] = true,
		["FigureRig"] = true,
		["FigureRagdoll"] = true,
		["GloomPile"] = true,
		["TriggerEventCollision"] = true,
		["Seek_Arm"] = true,
		["ChandelierObstruction"] = true,
		["SeekFloodline"] = true,
		["Bridge"] = true,
		["MinecartRig"] = true,
		["RunnerNodes"] = true,
		["DuckBoard"] = true,
		["PathLights"] = true,
		["SeekMovingNewClone"] = true,
		["MandrakeLive"] = true,
		["DoorFake"] = true,
		["FakeDoor"] = true,
		["SideroomSpace"] = true,
	}
	local function processEntity(o)
		if not o or not o.Parent then
			return
		end
		local T = o.Name
		if not EntityNames[T] then
			return
		end
		if T == "GiggleCeiling" then
			table.insert(wT.Entities, o)
			if Toggles.BypassGiggle.Value then
				local T = o:WaitForChild("Hitbox")
				T.CanTouch = false
			end
		elseif T == "DoorFake" or T == "FakeDoor" then
			if o.Parent and o:FindFirstChild("Hidden") then
				if Toggles.BypassDupe.Value then
					(o:WaitForChild("Hidden")).CanTouch = false
					local T = o:FindFirstChild("Lock")
					if T and T:FindFirstChild("UnlockPrompt") then
						T.UnlockPrompt.Enabled = false
					end
				end
				if Toggles.EntitiesESP.Value then
					local T = Options.EntitiesESPAllowed and Options.EntitiesESPAllowed.Value
					if not T or next(T) == nil or T.Dupe then
						Functions.AddESP(
							{ ["Object"] = o, ["Text"] = "Dupe", ["Color"] = Options.EntitiesESPColor.Value },
							true
						)
					end
				end
				table.insert(wT.Entities, o)
			end
		elseif T == "SideroomSpace" then
			if Toggles.BypassVacuum.Value then
				(o:WaitForChild("Collision")).CanCollide = true
				(o:WaitForChild("Collision")).CanTouch = false
			end
			table.insert(wT.Entities, o)
		elseif T == "GloombatEgg" or T == "GloombatEggs" or T == "GloomPile" then
			if Toggles.BypassGloombatEggs.Value then
				for o, T in o:GetDescendants() do
					if T:IsA("BasePart") then
						T.CanTouch = false
					end
				end
			end
			local T = o.DescendantAdded:Connect(function(o)
				if o:IsA("BasePart") then
					o.CanTouch = false
				end
			end)
			table.insert(Connections, T)
			table.insert(wT.Entities, o)
		elseif T == "Snare" then
			if Toggles.EntitiesESP.Value then
				local T = Options.EntitiesESPAllowed and Options.EntitiesESPAllowed.Value
				if not T or next(T) == nil or T.Snare then
					Functions.AddESP(
						{ ["Object"] = o, ["Text"] = "Snare", ["Color"] = Options.EntitiesESPColor.Value },
						false
					)
				end
			end
			for o, T in o:GetDescendants() do
				if T:IsA("BasePart") then
					T.CanTouch = not Toggles.BypassSnare.Value
				end
			end
			local T = o.DescendantAdded:Connect(function(o)
				if o:IsA("BasePart") then
					o.CanTouch = not Toggles.BypassSnare.Value
				end
			end)
			table.insert(Connections, T)
			table.insert(wT.Entities, o)
			if o:FindFirstChild("Snare") then
				((o:WaitForChild("Snare")):WaitForChild("Roots")).Transparency = 1
				((o:WaitForChild("Snare")):WaitForChild("SnareBase")).Transparency = 1
			end
			if o:FindFirstChild("Void") then
				o.Void.Transparency = 0
				o.Void.Color = Color3.fromRGB(76, 67, 55)
			end
		elseif T == "Figure" or T == "FigureRig" or T == "FigureRagdoll" then
			for o, T in o:GetDescendants() do
				if T:IsA("BasePart") then
					T.CanTouch = false
				end
			end
			table.insert(wT.Entities, o)
			if
				(
					(Toggles.RemoveFigure and Toggles.RemoveFigure.Value)
					or (Toggles.RemoveFigureMines and Toggles.RemoveFigureMines.Value)
				) and Executor.isnetworkowner
			then
				local T = detectFloor()
				if T == "Mines" then
					for o, T in o:GetDescendants() do
						local k = T
						if T:IsA("BasePart") then
							task.spawn(function()
								if
									pcall(function()
										return Executor.isnetworkowner(k)
									end)
								then
									k.Position = Vector3.new(-49999, -49999, -49999)
								end
							end)
						end
					end
				elseif T == "OldHotel" or T == "Fools" then
					local T = workspace:FindFirstChild("CurrentRooms")
					if T then
						T.ChildAdded:Wait()
					end
					for o, T in o:GetDescendants() do
						local k = T
						if T:IsA("BasePart") then
							T.CanCollide = false
							task.spawn(function()
								while
									pcall(function()
										return Executor.isnetworkowner(k)
									end)
								do
									k.Position = Vector3.new(
										math.random(-29999, 29999),
										math.random(-29999, 29999),
										math.random(-29999, 29999)
									)
									task.wait()
								end
							end)
						end
					end
				end
			end
		elseif T == "TriggerEventCollision" then
			table.insert(wT.EventTriggers, o)
			table.insert(wT.Entities, o)
		elseif T == "Seek_Arm" or T == "ChandelierObstruction" then
			local function trackSeekObstaclePart(o)
				if o:IsA("BasePart") then
					o.CanTouch = not Toggles.BypassSeekObstructions.Value
					table.insert(wT.SeekObstructions, o)
				end
			end
			for o, k in o:GetDescendants() do
				trackSeekObstaclePart(k)
			end
			Connections[o] = o.DescendantAdded:Connect(trackSeekObstaclePart)
			o.Destroying:Connect(function()
				local T = Connections[o]
				if T then
					pcall(T.Disconnect, T)
					Connections[o] = nil
				end
			end)
		elseif T == "SeekFloodline" then
			o.CanCollide = Toggles.BypassSeekObstructions.Value
			local T = (o:GetPropertyChangedSignal("CanCollide")):Connect(function()
				if o.CanCollide ~= Toggles.BypassSeekObstructions.Value then
					o.CanCollide = Toggles.BypassSeekObstructions.Value
				end
			end)
			o.Destroying:Once(function()
				T:Disconnect()
			end)
			table.insert(wT.SeekObstructions, o)
		elseif T == "Bridge" then
			for T, k in o:GetChildren() do
				if
					k.Name == "PlayerBarrier"
					and (k.Size.Y == 2.75 and (k.Rotation.X == 0 or k.Rotation.X == 180))
				then
					local T = k:Clone()
					T.CFrame = T.CFrame * CFrame.new(0, 0, -5)
					T.Name = tostring(math.random(100000000, 999999999))
					T.Size = Vector3.new(T.Size.X, T.Size.Y, 11)
					T.Parent = o
					T.CanCollide = Toggles.BypassSeekObstructions.Value
					T.Color = Color3.fromRGB(0, 255, 255)
					T.Transparency = Toggles.BypassSeekObstructions.Value and 0 or 1
					T.Material = Enum.Material.ForceField
					table.insert(wT.SeekBridges, T)
				end
				task.wait()
			end
		elseif T == "MinecartRig" then
			CheesyState.Minecart = o
		elseif T == "RunnerNodes" then
			local function isMinecartNodeFacingForward(o, T)
				local k = ((o.CFrame + o.CFrame.LookVector)).Position
				local P = ((o.CFrame + o.CFrame.LookVector * -1)).Position
				return ((k - T.Position)).Magnitude > ((P - T.Position)).Magnitude
			end
			local function getMinecartNodeTurnDirection(o, k)
				local P = o.CFrame.RightVector:Dot(o.Position - k.Position)
				if P > 0.5 then
					return isMinecartNodeFacingForward(o, k) and "Right" or "Left"
				end
				if P < -0.5 then
					return isMinecartNodeFacingForward(o, k) and "Left" or "Right"
				end
				return "Straight"
			end
			local function findNextMinecartNode(T)
				local k, P = nil, math.huge
				local w = tonumber((T.Name:split("MinecartNode"))[2])
				for o, F in o:GetChildren() do
					local A = tonumber((F.Name:split("MinecartNode"))[2])
					if F ~= T and (A and (w and A > w)) then
						local o = ((T.Position - F.Position)).Magnitude
						if o < P and F:GetAttribute("DistanceBlacklist") ~= true then
							P = o
							k = F
						end
					end
				end
				return k
			end
			for T, k in o:GetChildren() do
				local P = tonumber((k.Name:split("MinecartNode"))[2])
				if k:GetAttribute("DeathType") then
					k:SetAttribute("DistanceBlacklist", true)
				end
				for T = 1, 20, 1 do
					local w = P and o:FindFirstChild("MinecartNode" .. P + T)
					if w and w:GetAttribute("DeathType") ~= nil then
						k:SetAttribute("DistanceBlacklist", true)
					end
				end
				local w = P and o:FindFirstChild("MinecartNode" .. P - 1)
				if w and w:GetAttribute("ForceConnect") then
					k:SetAttribute("DistanceBlacklist", nil)
				end
				task.wait()
			end
			for o, T in o:GetChildren() do
				if T:GetAttribute("ForceConnect") then
					local o = findNextMinecartNode(T)
					if o then
						T:SetAttribute("Turn", getMinecartNodeTurnDirection(T, o))
						table.insert(wT.SeekNodes, T)
					end
				end
				task.wait()
			end
		elseif T == "DuckBoard" then
			table.insert(wT.SeekDuckBoards, o)
		elseif T == "PathLights" then
			local T = {}
			local k = o.ChildAdded:Connect(function(o)
				table.insert(T, o)
			end)
			for o, k in o:GetChildren() do
				table.insert(T, k)
			end
			local P
			local function highlightSeekGuidingLight(o)
				if o.Name ~= "SeekGuidingLight" or o:GetAttribute("Highlighted") then
					return
				end
				o:SetAttribute("Highlighted", true)
				local T = Instance.new("Part")
				T.Size = Vector3.one
				T.Transparency = 1
				T.Parent = CheesyState.SeekNodesFolder
				T.Anchored = true
				T.CFrame = o.CFrame
				T.CanCollide = false
				T.Name = "SeekLightNode"
				local k = P or T
				P = T
				local w = Instance.new("Beam")
				local F = rawget(Toggles, "ShowSeekPathColor") and Options.ShowSeekPathColor.Value
					or Color3.fromRGB(0, 255, 0)
				w.Color =
					ColorSequence.new({ ColorSequenceKeypoint.new(0, F), ColorSequenceKeypoint.new(1, F) })
				w.FaceCamera = true
				w.Width0 = 0.2
				w.Width1 = 0.2
				w.Brightness = 10
				w.LightInfluence = 0
				w.LightEmission = 0
				w.Enabled = true
				local A = rawget(Toggles, "ShowSeekPathToggle")
						and (Toggles.ShowSeekPathToggle.Value and 0)
					or 1
				w.Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, A),
					NumberSequenceKeypoint.new(1, A),
				})
				w.Parent = CheesyState.SeekNodesFolder
				local d = Instance.new("Attachment", T)
				local C = Instance.new("Attachment", k)
				w.Attachment0 = d
				w.Attachment1 = C
				table.insert(wT.SeekHighlights, w)
			end
			task.spawn(function()
				while task.wait() do
					local o = table.remove(T, 1)
					if o then
						highlightSeekGuidingLight(o)
					end
				end
			end)
			table.insert(Connections, k)
			table.insert(wT.PathLights, o)
			o.Destroying:Once(function()
				k:Disconnect()
			end)
		elseif T == "SeekMovingNewClone" then
			local T = o.Destroying:Connect(function()
				for o, T in pairs(wT.PathLights) do
					T:ClearAllChildren()
				end
				if CheesyState.SeekNodesFolder then
					CheesyState.SeekNodesFolder:ClearAllChildren()
				end
			end)
			table.insert(Connections, T)
		elseif T == "MandrakeLive" then
			local T = o:FindFirstChild("Mandrake")
			if T then
				local k = T:FindFirstChild("Root")
				if k then
					table.insert(wT.Entities, o.Hole)
					table.insert(wT.Entities, k)
					if Toggles.RemoveMandrake and Toggles.RemoveMandrake.Value then
						local o = k:FindFirstChild("AntiMandrakeForce")
						if not o then
							o = Instance.new("BodyForce")
							o.Name = "AntiMandrakeForce"
							o.Parent = k
						end
						o.Force = Vector3.new(100000, -99999999, 100000)
					end
				end
			end
		end
	end
	for o, T in workspace:GetDescendants() do
		task.spawn(processEntity, T)
	end
	Connections.HandleEntityObject = workspace.DescendantAdded:Connect(processEntity)
	local function processVineDoor(o)
		if o.Name ~= "ForgetMeNotVineDoors" then
			return
		end
		if not (o.Parent and (LocalPlayer and o.Parent.Name == LocalPlayer.Name)) then
			return
		end
		task.spawn(function()
			local T = o:WaitForChild("Base", 10)
			if not T then
				return
			end
			local k = tick() + 15
			while T.Parent and (o.Parent and (not T:GetAttribute("BaseDirection") and tick() < k)) do
				task.wait(0.2)
			end
			if T.Parent and (o.Parent and T:GetAttribute("BaseDirection")) then
				if Toggles.EntitiesESP and Toggles.EntitiesESP.Value then
					Functions.AddESP({
						["Object"] = T,
						["Text"] = "Wrong Door",
						["Color"] = Options.EntitiesESPColor and Options.EntitiesESPColor.Value
							or Color3.fromRGB(255, 0, 0),
					})
				end
			end
		end)
	end
	for o, T in workspace:GetDescendants() do
		task.spawn(processVineDoor, T)
	end
	workspace.DescendantAdded:Connect(processVineDoor)
	Toggles.BypassGiggle:OnChanged(function(o)
		for T, k in ipairs(wT.Entities) do
			if k.Name == "GiggleCeiling" then
				local T = k:FindFirstChild("Hitbox")
				if T then
					T.CanTouch = not o
				end
			end
		end
	end)
	Toggles.BypassDupe:OnChanged(function(o)
		for T, k in wT.Entities do
			if k.Name == "DoorFake" or k.Name == "FakeDoor" then
				(k:WaitForChild("Hidden")).CanTouch = not o
				if k:FindFirstChild("Lock") then
					k.Lock.UnlockPrompt.Enabled = not o
				end
			end
		end
	end)
	Toggles.BypassEyes:OnChanged(function(o)
		if o and CheesyState.IsEyes then
			local o = detectFloor()
			if o == "Fools" or o == "OldHotel" then
				GameRemotes.MotorReplication:FireServer(
					0,
					(CheesyState.SpoofOffset == 200 and 65 or -65),
					0,
					false
				)
			else
				GameRemotes.MotorReplication:FireServer(-650)
			end
		end
	end)
	Toggles.BypassLookman:OnChanged(function(o)
		if o and CheesyState.IsLookman then
			local o = detectFloor()
			if o == "Fools" or o == "OldHotel" then
				GameRemotes.MotorReplication:FireServer(
					0,
					(CheesyState.SpoofOffset == 200 and 65 or -65),
					0,
					false
				)
			else
				GameRemotes.MotorReplication:FireServer(-650)
			end
		end
	end)
	Toggles.BypassGloombatEggs:OnChanged(function(o)
		for T, k in ipairs(wT.Entities) do
			if k.Name == "GloombatEgg" or k.Name == "GloombatEggs" or k.Name == "GloomPile" then
				for T, k in k:GetDescendants() do
					if k:IsA("BasePart") then
						k.CanTouch = not o
					end
				end
			end
		end
	end)
	Toggles.BypassSeekObstructions:OnChanged(function(o)
		for T, k in ipairs(wT.SeekObstructions) do
			k.CanTouch = not o
			if k.Name == "SeekFloodline" then
				k.CanCollide = o
			end
		end
		for T, k in ipairs(wT.SeekBridges) do
			k.CanCollide = o
			k.Transparency = o and 0 or 1
		end
	end)
	Toggles.BypassVacuum:OnChanged(function(o)
		for T, k in wT.Entities do
			if k.Name == "SideroomSpace" then
				(k:WaitForChild("Collision")).CanCollide = o;
				(k:WaitForChild("Collision")).CanTouch = not o
			end
		end
	end)
	Toggles.BypassSnare:OnChanged(function(o)
		for T, k in ipairs(wT.Entities) do
			if k.Name == "Snare" then
				for T, k in k:GetDescendants() do
					if k:IsA("BasePart") then
						k.CanTouch = not o
					end
				end
			end
		end
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Removals, "Toggle", "RemoveA90", { ["Title"] = "Remove A-90", ["Value"] = false, ["Desc"] = "Prevents A-90 from spawning" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Removals, "Toggle", "RemoveDread", { ["Title"] = "Remove Dread", ["Value"] = false, ["Desc"] = "Prevents Dread from spawning" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Exploits_Removals, Groupboxes.Exploits_Removals:Divider())
	UiLibrary:Mount(Groupboxes.Exploits_Removals, "Toggle", "RemoveFootstepSounds", {
			["Title"] = "Remove Footstep Sounds",
			["Value"] = false,
			["Desc"] = "Removes the sounds when walking",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Removals, "Toggle", "RemoveJamminMusic", {
			["Title"] = "Remove Jammin Music",
			["Value"] = false,
			["Desc"] = "Removes the music and muffle effect from the Jammin modifier",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Removals, "Toggle", "RemoveInteractingSounds", {
			["Title"] = "Remove Interacting Sounds",
			["Value"] = false,
			["Desc"] = "Removes the sounds when interacting with proximity prompts",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Removals, "Toggle", "RemoveHasteSound", {
			["Title"] = "Remove Haste Sound",
			["Value"] = false,
			["Desc"] = "Mutes the ambience sound when Haste is active",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Removals, "Toggle", "RemoveClosetDelay", {
			["Title"] = "Remove Closet Delay",
			["Value"] = false,
			["Desc"] = "Removes the short window where you can't exit out of a closet after the animation finishes.",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.RemoveA90:OnChanged(function(o)
		local T = getMainGameModules()
		if not T then
			return
		end
		local k = T:FindFirstChild("A90")
		if k then
			k.Name = o and "A90_Disabled" or "A90"
		end
	end)
	Toggles.RemoveDread:OnChanged(function(o)
		local T = getMainGameModules()
		if not T then
			return
		end
		local k = T:FindFirstChild("Dread")
		if k then
			k.Name = o and "Dread_Disabled" or "Dread"
		end
	end)
	Toggles.RemoveFootstepSounds:OnChanged(function(o)
		local T = LocalPlayer.Character
		if not T then
			return
		end
		for T, k in T:GetDescendants() do
			if k:IsA("Sound") and k.Name == "Sound" then
				k.Volume = o and 0 or 1
			end
		end
	end)
	Toggles.RemoveJamminMusic:OnChanged(function(o)
		local T = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		local k = T and T:FindFirstChild("MainUI")
		local P = k and k:FindFirstChild("Initiator")
		local w = P and P:FindFirstChild("Main_Game")
		if not w then
			return
		end
		local F = w:FindFirstChild("Health")
		if not F then
			return
		end
		local A = F:FindFirstChild("Jam")
		if A then
			A.Volume = o and 0 or 0.45
		end
	end)
	Toggles.RemoveInteractingSounds:OnChanged(function(o)
		local T = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		local k = T and T:FindFirstChild("MainUI")
		local P = k and k:FindFirstChild("Initiator")
		local w = P and P:FindFirstChild("Main_Game")
		if not w then
			return
		end
		local F = w:FindFirstChild("PromptService")
		if F then
			local T = F:FindFirstChild("Triggered")
			if T then
				T.Volume = o and 0 or 0.04
			end
			local k = F:FindFirstChild("Holding")
			if k then
				k.Volume = o and 0 or 0.1
			end
			local P = F:FindFirstChild("Notification")
			if P then
				P.Volume = o and 0 or 0.03
			end
		end
		local A = w:FindFirstChild("Reminder")
		if A then
			local T = A:FindFirstChild("Caption")
			if T then
				T.Volume = o and 0 or 0.1
			end
		end
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Damage, "Toggle", "NoScreechDamage", {
			["Title"] = "No Screech Damage",
			["Value"] = false,
			["Desc"] = "Prevents Screech from hurting you",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Damage, "Toggle", "NoA90Damage", { ["Title"] = "No A-90 Damage", ["Value"] = false, ["Desc"] = "Prevents A-90 from hurting you" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.NoScreechDamage:OnChanged(function(o)
		if not GameRemotes then
			return
		end
		if o then
			if FakeEvents.Screech_Real and FakeEvents.Screech_Real.Parent then
				FakeEvents.Screech.Parent = GameRemotes
				FakeEvents.Screech_Real.Parent = nil
			end
		else
			if FakeEvents.Screech_Real then
				FakeEvents.Screech_Real.Parent = GameRemotes
				FakeEvents.Screech.Parent = nil
			end
		end
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Damage, "Toggle", "NoHaltDamage", { ["Title"] = "No Halt Damage", ["Value"] = false, ["Desc"] = "Prevents Halt from hurting you" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.NoHaltDamage:OnChanged(function(o)
		if not GameRemotes then
			return
		end
		if o then
			if FakeEvents.Shade_Real and FakeEvents.Shade_Real.Parent then
				FakeEvents.Shade.Parent = GameRemotes
				FakeEvents.Shade_Real.Parent = nil
			end
		else
			if FakeEvents.Shade_Real then
				FakeEvents.Shade_Real.Parent = GameRemotes
				FakeEvents.Shade.Parent = nil
			end
		end
	end)
	Toggles.NoA90Damage:OnChanged(function(o)
		if not GameRemotes then
			return
		end
		if o then
			if FakeEvents.A90_Real and FakeEvents.A90_Real.Parent then
				FakeEvents.A90.Parent = GameRemotes
				FakeEvents.A90_Real.Parent = nil
			end
		else
			if FakeEvents.A90_Real then
				FakeEvents.A90_Real.Parent = GameRemotes
				FakeEvents.A90.Parent = nil
			end
		end
	end)
	Groupboxes.Exploits_Automation = WindTabs.Exploits:Section({ Title = UiLibrary:Text("Automation"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.Exploits_Automation, "Toggle", "AutoUnlockPadlockToggle", {
			["Title"] = "Auto Unlock Padlock",
			["Value"] = false,
			["Desc"] = "Instantly unlocks the room 50 padlock when you get close, but you need the books required",
			["DisabledTooltip"] = "This feature doesn't work in this floor",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Automation, "Button", nil, {
		["Title"] = "Show Library Code",
		["Desc"] = "Displays the current library code in a notification",
		["DisabledTooltip"] = "This feature doesn't work in this floor",
		["Callback"] = function()
			local o = Functions.GetLibraryCode()
			if o then
				UiLibrary:Notify({ ["Title"] = "Library code: " .. o, ["Time"] = 5 })
			else
				UiLibrary:Notify({ ["Title"] = "Could not read library code", ["Time"] = 5 })
			end
		end,
	}, function(state, spec)
		return state.Section:Button({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Callback = state.Action,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Automation, "Toggle", "AutoBreakerBox", {
			["Title"] = "Auto Breaker Box",
			["Value"] = false,
			["Desc"] = "Automatically solves the breaker box.",
			["DisabledTooltip"] = "This feature doesn't work in this floor",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Automation, "Dropdown", "BreakerBoxMethod", {
			["Title"] = "Breaker Box Method",
			["Values"] = { "Instant", "Legit" },
			["Value"] = 1,
			["Multi"] = false,
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Automation, "Toggle", "AutoLibraryBruteForce", {
			["Title"] = "Auto Brute-Force Padlock",
			["Value"] = false,
			["Desc"] = "Automatically brute-forces codes in the library code when near the padlock until it finds the correct code",
			["DisabledTooltip"] = "This feature doesn't work in this floor",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Exploits_Automation, Groupboxes.Exploits_Automation:Divider())
	UiLibrary:Mount(Groupboxes.Exploits_Automation, "Toggle", "HotelAutoWalk", {
			["Title"] = "Auto Hotel",
			["Value"] = false,
			["Desc"] = "TRIES (fails a lot of the time) to beat the hotel automatically for you up to door 100",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Automation, "Dropdown", "HotelAutoWalkMethod", {
			["Title"] = "Method",
			["Values"] = { "Teleport", "Pathfind" },
			["Value"] = "Teleport",
			["Desc"] = "Teleport hops straight to the key/door each room. Pathfind walks the route with the pathfinder.",
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	HotelMethodName = function()
		local o = Options.HotelAutoWalkMethod and Options.HotelAutoWalkMethod.Value
		return o or "Teleport"
	end
	HotelAssistRunning = false
	HotelAssistDone = {}
	function HotelAssistRoot()
		local o = LocalPlayer and LocalPlayer.Character
		if not o then
			return nil
		end
		return o:FindFirstChild("HumanoidRootPart")
	end
	function HotelAssistRoom()
		return tonumber(LocalPlayer and LocalPlayer:GetAttribute("CurrentRoom"))
	end
	function HotelAssistTP(o)
		local T = HotelAssistRoot()
		if not T or not o then
			return false
		end
		local k
		if o:IsA("Model") then
			k = o:GetPivot()
		elseif o:IsA("BasePart") then
			k = o.CFrame
		else
			local T = o:FindFirstChildWhichIsA("BasePart", true)
			if not T then
				return false
			end
			k = T.CFrame
		end
		T.CFrame = k
		return true
	end
	function HotelAssistFire(o)
		if not o then
			return
		end
		if o:IsA("ProximityPrompt") then
			pcall(function()
				fireproximityprompt(o)
			end)
			return
		end
		for o, T in ipairs(o:GetDescendants()) do
			if T:IsA("ProximityPrompt") then
				pcall(function()
					fireproximityprompt(T)
				end)
			end
		end
	end
	function HotelAssistHasPaper()
		local o = LocalPlayer and LocalPlayer.Character
		local T = LocalPlayer and LocalPlayer.Backpack
		if T and T:FindFirstChild("LibraryHintPaper", true) then
			return true
		end
		if o and o:FindFirstChild("LibraryHintPaper", true) then
			return true
		end
		return false
	end
	function HotelAssistCollect(o, T, k, P)
		local w = os.clock() + (P or 20)
		while not _Unloading do
			if HotelAssistRoom() ~= T then
				return false
			end
			if k and k() then
				return true
			end
			if not o or not o.Parent then
				return true
			end
			if os.clock() > w then
				return false
			end
			if HotelAssistTP(o) then
				HotelAssistFire(o)
			end
			task.wait(0.05)
		end
		return false
	end
	function HotelLibraryReady()
		return (CheesyState.HotelBooksCollected or 0) >= 5 and HotelAssistHasPaper()
	end
	function HotelAutoLibrary()
		local o = workspace:FindFirstChild("CurrentRooms")
		if not o then
			return
		end
		local T = o:FindFirstChild("50")
		if not T then
			return
		end
		local k = 5
		local P = CheesyState.HotelBooksCollected or 0
		local w = os.clock() + 180
		while P < k and (os.clock() < w and not _Unloading) do
			if HotelAssistRoom() ~= 50 then
				return
			end
			local o
			for T, k in ipairs(T:GetDescendants()) do
				if k.Name == "LiveHintBook" then
					o = k
					break
				end
			end
			if not o then
				task.wait(0.1)
			elseif HotelAssistCollect(o, 50) then
				P += 1
				CheesyState.HotelBooksCollected = P
			else
				if HotelAssistRoom() ~= 50 or _Unloading then
					return
				end
				task.wait(0.1)
			end
		end
		if P < k then
			return false
		end
		local F = os.clock() + 60
		while os.clock() < F and not _Unloading do
			if HotelAssistRoom() ~= 50 then
				return false
			end
			if HotelAssistHasPaper() then
				return true
			end
			local o = T:FindFirstChild("LibraryHintPaper", true)
			if not o then
				task.wait(0.1)
			else
				HotelAssistCollect(o, 50, HotelAssistHasPaper, 10)
			end
		end
		return HotelAssistHasPaper()
	end
	function HotelAutoBreakerRoom()
		local o = workspace:FindFirstChild("CurrentRooms")
		if not o then
			return
		end
		local k = o:FindFirstChild("100")
		if not k then
			return
		end
		local P = false
		local w = os.clock() + 180
		while os.clock() < w and not _Unloading do
			if HotelAssistRoom() ~= 100 then
				return
			end
			local o
			for T, k in ipairs(k:GetDescendants()) do
				if k.Name == "LiveBreakerPolePickup" then
					o = k
					break
				end
			end
			if not o then
				P = true
				break
			end
			if HotelAssistCollect(o, 100) then
				continue
			end
			if HotelAssistRoom() ~= 100 or _Unloading then
				return
			end
			task.wait(0.1)
		end
		if P then
			pcall(function()
				UiLibrary:Notify({
					["Title"] = "Auto Breaker",
					["Description"] = "All breakers obtained",
					["Time"] = 4,
				})
			end)
		end
		if HotelAssistRoom() ~= 100 then
			return
		end
		local F = k:FindFirstChild("IndustrialGate")
		local A = F and F:FindFirstChild("Box")
		local d = A and A:FindFirstChild("Lever")
		local C = A and A:FindFirstChild("ActivateEventPrompt")
		if A and d then
			local o = os.clock() + 6
			while os.clock() < o and (HotelAssistRoom() == 100 and d.Parent) do
				HotelAssistTP(d)
				HotelAssistFire(d)
				task.wait(0.03)
			end
		end
		if A and C then
			local o = os.clock() + 6
			while os.clock() < o and (HotelAssistRoom() == 100 and C.Parent) do
				HotelAssistTP(C)
				HotelAssistFire(C)
				task.wait(0.03)
			end
		end
	end
	function HotelAssistStart()
		if HotelAssistRunning then
			return
		end
		HotelAssistRunning = true
		HotelAssistDone = {}
		task.spawn(function()
			while HotelAssistRunning and not _Unloading do
				if not (Toggles.HotelAutoWalk and Toggles.HotelAutoWalk.Value) then
					task.wait(0.25)
				else
					local o = HotelAssistRoom()
					if o == 50 and not HotelLibraryReady() then
						if
							not CheesyState.HotelLibNextAttempt
							or tick() >= CheesyState.HotelLibNextAttempt
						then
							CheesyState.HotelLibNextAttempt = tick() + 3
							pcall(HotelAutoLibrary)
						end
					elseif o == 100 and not HotelAssistDone[100] then
						HotelAssistDone[100] = true
						pcall(HotelAutoBreakerRoom)
					end
					task.wait(0.2)
				end
			end
		end)
	end
	task.spawn(HotelAssistStart)
	Toggles.HotelAutoWalk:OnChanged(function(o)
		for o, T in CheesyState.HotelNodesFolder:GetChildren() do
			if T.Name == "HotelPathNode" or T.Name == "HotelStuckPart" then
				T:Destroy()
			end
		end
		pcall(function()
			(game:GetService("VirtualInputManager")):SendKeyEvent(
				false,
				Enum.KeyCode.LeftControl,
				false,
				game
			)
		end)
		CheesyState.HotelCrouchHeld = false
		CheesyState.HotelActiveSince = nil
		CheesyState.HotelRepathTries = 0
		CheesyState.HotelLegRetryAt = 0
		if CheesyState.HotelSeekConn then
			pcall(function()
				CheesyState.HotelSeekConn:Disconnect()
			end)
			CheesyState.HotelSeekConn = nil
		end
		CheesyState.HotelSeekActive = false
		if Functions.HotelAutoWalk and Functions.HotelAutoWalk.StopTeleport then
			Functions.HotelAutoWalk.StopTeleport()
		end
		if o then
			CheesyState.HotelKeyRooms = {}
			CheesyState.HotelDoorRooms = {}
			CheesyState.HotelGateRooms = {}
			CheesyState.HotelGateTries = {}
			CheesyState.HotelPaperDone = false
			CheesyState.HotelBooksVisited = {}
			CheesyState.HotelSallyToys = {}
			CheesyState.HotelBreakersFired = {}
			CheesyState.HotelKeyScan = {}
			CheesyState.HotelTpScan = {}
			CheesyState.HotelDoorRooms = {}
			if Toggles.Godmode and not Toggles.Godmode.Value then
				Toggles.Godmode:SetValue(true)
				CheesyState.HotelEnabledGodmode = true
			end
			if Options.GodmodeMethod and Options.GodmodeMethod.Value ~= "On entity spawn" then
				CheesyState.HotelPrevGodmodeMethod = Options.GodmodeMethod.Value
				pcall(function()
					Options.GodmodeMethod:SetValue("On entity spawn")
				end)
			end
			if Toggles.AutoUnlockPadlockToggle and not Toggles.AutoUnlockPadlockToggle.Value then
				Toggles.AutoUnlockPadlockToggle:SetValue(true)
			end
			if Toggles.AutoLibraryBruteForce and not Toggles.AutoLibraryBruteForce.Value then
				Toggles.AutoLibraryBruteForce:SetValue(true)
			end
			if Toggles.AutoBreakerBox and not Toggles.AutoBreakerBox.Value then
				Toggles.AutoBreakerBox:SetValue(true)
			end
			if Options.BreakerBoxMethod then
				pcall(function()
					Options.BreakerBoxMethod:SetValue("Instant")
				end)
			end
			if Toggles.InstantInteract and not Toggles.InstantInteract.Value then
				Toggles.InstantInteract:SetValue(true)
				CheesyState.HotelEnabledInstantInteract = true
			end
			if Toggles.AutoInteract and not Toggles.AutoInteract.Value then
				Toggles.AutoInteract:SetValue(true)
				CheesyState.HotelEnabledAutoInteract = true
			end
			function HotelSeekVoidBurst()
				local o = LocalPlayer and LocalPlayer.Character
				if not o then
					return
				end
				local T = o:FindFirstChild("HumanoidRootPart")
				if not T then
					return
				end
				CheesyState.HotelSeekVoiding = true
				local k = o:GetPivot() + Vector3.new(0, -2500, 0)
				for T = 1, 20, 1 do
					if _Unloading or not o.Parent then
						break
					end
					o:PivotTo(k)
					task.wait()
				end
				task.wait(0.3)
				for T = 1, 15, 1 do
					if _Unloading or not o.Parent then
						break
					end
					o:PivotTo(k)
					task.wait()
				end
				task.wait(0.2)
				for T = 1, 10, 1 do
					if _Unloading or not o.Parent then
						break
					end
					o:PivotTo(k)
					task.wait()
				end
				CheesyState.HotelSeekVoiding = false
			end
			if GameRemotes and GameRemotes:FindFirstChild("Cutscene") then
				CheesyState.HotelSeekConn = GameRemotes.Cutscene.OnClientEvent:Connect(function(o)
					if typeof(o) == "string" and o:find("SeekIntroHotel") then
						CheesyState.HotelSeekActive = true
						CheesyState.HotelSeekSince = tick()
						task.spawn(HotelSeekVoidBurst)
					end
					if typeof(o) == "string" and o:find("Figure") then
						CheesyState.HotelFigureActive = true
						CheesyState.HotelFigureSince = tick()
					end
				end)
			end
			if
				HotelMethodName() == "Teleport"
				and (Functions.HotelAutoWalk and Functions.HotelAutoWalk.RunTeleport)
			then
				Functions.HotelAutoWalk.RunTeleport()
			end
		else
			CheesyState.HotelAutoWalkActive = false
			CheesyState.HotelFigureActive = false
			if CheesyState.HotelEnabledGodmode and Toggles.Godmode.Value then
				Toggles.Godmode:SetValue(false)
			end
			CheesyState.HotelEnabledGodmode = false
			if CheesyState.HotelEnabledInstantInteract and Toggles.InstantInteract.Value then
				Toggles.InstantInteract:SetValue(false)
			end
			CheesyState.HotelEnabledInstantInteract = false
			if CheesyState.HotelEnabledAutoInteract and Toggles.AutoInteract.Value then
				Toggles.AutoInteract:SetValue(false)
			end
			CheesyState.HotelEnabledAutoInteract = false
			if CheesyState.HotelPrevGodmodeMethod ~= nil and Options.GodmodeMethod then
				pcall(function()
					Options.GodmodeMethod:SetValue(CheesyState.HotelPrevGodmodeMethod)
				end)
				CheesyState.HotelPrevGodmodeMethod = nil
			end
			CheesyState.HotelFigureActive = false
		end
	end)
	UiLibrary:Mount(Groupboxes.Exploits_Automation, "Toggle", "HotelShowPath", {
			["Title"] = "Show Hotel Path",
			["Value"] = false,
			["Desc"] = "Shows the current auto hotel path",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.HotelShowPath.Section, "ColorPicker", "HotelShowPathColor", { ["Title"] = "Path", ["Value"] = Color3.fromRGB(0, 255, 0), ["Transparency"] = 0 }, function(state, spec)
		return state.Section:Colorpicker({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Default = state.Value,
			Transparency = state.Transparency,
			Callback = function(value, transparency) state:Receive(value, transparency) end,
		})
	end, Toggles.HotelShowPath)
	UiLibrary:Mount(Groupboxes.Exploits_Automation, "Slider", "HotelPathfindTimeout", { ["Title"] = "Pathfind Timeout", ["Min"] = 1, ["Max"] = 3, ["Value"] = 2, ["Precision"] = 0 }, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	-- Point this at the WindUI version, not upstream's Obsidian script.
	QueueOnTeleportURL = (getgenv()).CheesyWindScriptURL or ""
	function CheesyQueueOnTeleport()
		local o = queue_on_teleport or queueonteleport
		if type(o) ~= "function" then
			UiLibrary:Notify({
				["Title"] = "Queue On Teleport",
				["Description"] = "Your executor does not support queue_on_teleport",
				["Time"] = 5,
			})
			return false
		end
		if type(QueueOnTeleportURL) ~= "string" or QueueOnTeleportURL == "" then
			UiLibrary:Notify({
				["Title"] = "Queue On Teleport",
				["Description"] = "Set getgenv().CheesyWindScriptURL to the WindUI script URL before running",
				["Time"] = 6,
			})
			return false
		end
		local k, P = pcall(function()
			o("loadstring(game:HttpGet(" .. string.format("%q", QueueOnTeleportURL) .. "))()")
		end)
		if not k then
			UiLibrary:Notify({ ["Title"] = "Queue On Teleport", ["Description"] = tostring(P), ["Time"] = 6 })
			return false
		end
		UiLibrary:Notify({
			["Title"] = "Queue On Teleport",
			["Description"] = "Queued. It will re-run when you rejoin.",
			["Time"] = 5,
		})
		return true
	end
	NoSurgeDamageHandler = function(o)
		if not GameRemotes then
			return
		end
		if o then
			if FakeEvents.Surge_Real and FakeEvents.Surge_Real.Parent then
				FakeEvents.Surge.Parent = GameRemotes
				FakeEvents.Surge_Real.Parent = nil
			end
		else
			if FakeEvents.Surge_Real then
				FakeEvents.Surge_Real.Parent = GameRemotes
				FakeEvents.Surge.Parent = nil
			end
		end
	end
	if
		ReplicatedStorage:FindFirstChild("FloorReplicated")
		and (
			ReplicatedStorage.FloorReplicated:FindFirstChild("ClientRemote")
			and ReplicatedStorage.FloorReplicated.ClientRemote:FindFirstChild("Haste")
		)
	then
		local o = (ReplicatedStorage.FloorReplicated.ClientRemote.Haste.Ambience:GetPropertyChangedSignal(
			"Playing"
		)):Connect(function()
			if Toggles.RemoveHasteSound.Value then
				ReplicatedStorage.FloorReplicated.ClientRemote.Haste.Ambience.Playing = false
			end
		end)
		table.insert(Connections, o)
	end
	CheesyState = {
		["UseAnimation"] = nil,
		["UseAnimationBreak"] = nil,
		["BreakerBoxNotified"] = false,
		["BreakerBoxStartNotified"] = false,
		["BreakerBoxInteracted"] = false,
		["BreakerBoxFinishedNotified"] = false,
		["FogInstances"] = {},
		["OldFog"] = nil,
		["InLobby"] = false,
		["LobbyGuardConnection"] = nil,
		["RoomsAutoWalkActive"] = false,
		["HotelAutoWalkActive"] = false,
		["HotelSeekActive"] = false,
		["HotelSeekSince"] = 0,
		["HotelEnabledGodmode"] = false,
		["HotelPrevGodmodeMethod"] = nil,
		["HotelKeyRooms"] = {},
		["HotelDoorRooms"] = {},
		["HotelGateRooms"] = {},
		["HotelGateTries"] = {},
		["HotelSeekConn"] = nil,
		["HotelCrouchHeld"] = false,
		["HotelPaperDone"] = false,
		["HotelBooksVisited"] = {},
		["HotelSallyToys"] = {},
		["HotelBreakersFired"] = {},
		["HotelKeyScan"] = {},
		["HotelTpScan"] = {},
		["HotelTpRoom"] = nil,
		["HotelTpStage"] = nil,
		["HotelTeleportThread"] = nil,
		["HotelFigureActive"] = false,
		["HotelFigureSince"] = 0,
		["IsEyes"] = false,
		["IsLookman"] = false,
		["AnticheatDisabled"] = false,
		["SeekNodesFolder"] = nil,
		["AutoMinecartDucked"] = false,
		["LastDuck"] = 0,
		["NearestTurnNode"] = nil,
		["Minecart"] = nil,
		["OriginalGetMoveVector"] = nil,
		["SurgeFrame"] = nil,
		["UILibrary"] = selectedUiLibrary,
		["RedeemingCodes"] = false,
		["SpoofOffset"] = 0,
		["SkipGodmodeCrouchForce"] = false,
	}
	CheesyState.CodesList = {
		"67",
		"54",
		"41",
		"CHEDDAR BALLS",
		"XQC",
		"PENGUINZ0",
		"KREEKCRAFT",
		"ISHOWSPEED",
		"DANTDM",
		"KUBZ SCOUTS",
		"FIND THE TROLLFACES",
		"THINKNOODLES",
		"W",
		"RAGDOLL UNIVERSE",
		"RAGDOLL MAYHEM",
		"BIJUU MIKE",
		"8BITRYAN",
		"SCREECHSUCKS",
		"LORE",
		"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
		"FIND THE TROLLFACES",
		"3rd",
		"LAZYDEVS",
		"RAGDOLL COMBAT",
		"VOCAB HAVOC",
		"PATHSWAP",
		"JUMP OVER THE BRICK",
	}
	FT = nil
	if Character then
		task.spawn(SetupCharacterAnticheat)
	end
	if Executor.fireproximityprompt then
		Functions.FirePrompt = function(o)
			if not o or not o:IsA("ProximityPrompt") then
				return
			end
			if o:HasTag("DisableWhenEnabledOnClient") then
				o:RemoveTag("DisableWhenEnabledOnClient")
			end
			local T = o.Enabled
			Executor.fireproximityprompt(o)
			if T and not o.Enabled then
				o.Enabled = true
			end
		end
		Functions.ForceFirePrompt = Functions.FirePrompt
	else
		local o = {}
		local T = {}
		Functions.FirePrompt = function(k)
			if not k:IsA("ProximityPrompt") or T[k] or not CurrentCamera then
				return
			end
			table.insert(o, k)
		end
		Functions.ForceFirePrompt = Functions.FirePrompt
		task.spawn(function()
			while task.wait() do
				local k = table.remove(o, 1)
				if k and k.Parent then
					T[k] = true
					local o = k.MaxActivationDistance
					local P = k.Enabled
					local w = k.HoldDuration
					local F = k.RequiresLineOfSight
					pcall(function()
						k.MaxActivationDistance = 99999
						k.Enabled = true
						k.HoldDuration = 0
						k.RequiresLineOfSight = false
						if Executor and Executor.fireproximityprompt then
							Executor.fireproximityprompt(k)
						else
							k:InputHoldBegin()
							k:InputHoldEnd()
						end
						k.MaxActivationDistance = o
						k.Enabled = P
						k.HoldDuration = w
						k.RequiresLineOfSight = F
					end)
					T[k] = nil
				end
			end
		end)
	end
	Functions.HasItem = function(o, T)
		if not T and LocalPlayer.Backpack:FindFirstChild(o) then
			return LocalPlayer.Backpack:FindFirstChild(o)
		elseif Character:FindFirstChild(o) then
			return Character:FindFirstChild(o)
		end
		return nil
	end
	Functions.GetLibraryCode = function()
		local o = Character:FindFirstChild("LibraryHintPaper")
			or Character:FindFirstChild("LibraryHintPaperHard")
			or LocalPlayer.Backpack:FindFirstChild("LibraryHintPaper")
			or LocalPlayer.Backpack:FindFirstChild("LibraryHintPaperHard")
		if o and o:FindFirstChild("UI") then
			local T = {}
			local k = (CurrentFloor and (tostring(CurrentFloor)):find("Fools")) and 10 or 5
			for o = 1, k, 1 do
				T[o] = "_"
			end
			local P = LocalPlayer.PlayerGui:FindFirstChild("PermUI")
					and (LocalPlayer.PlayerGui.PermUI:FindFirstChild("Hints") and LocalPlayer.PlayerGui.PermUI.Hints:GetChildren())
				or {}
			local w = o.UI:GetChildren()
			for o, k in ipairs(P) do
				for o, P in ipairs(w) do
					if
						k:IsA("ImageLabel")
						and (
							P:IsA("ImageLabel")
							and (k.ImageRectOffset == P.ImageRectOffset and T[tonumber(P.Name)])
						)
					then
						T[tonumber(P.Name)] = k.TextLabel.Text
					end
				end
			end
			return table.concat(T)
		end
		return (CurrentFloor and (tostring(CurrentFloor)):find("Fools")) and "__________" or "_____"
	end
	Functions.HandleHidingTransparency = function(o)
		local T = {}
		for k, P in o:GetDescendants() do
			if P:IsA("BasePart") then
				P:SetAttribute("Transparency_Old", P.Transparency)
				table.insert(T, P)
			end
			if P.Name == "HiddenPlayer" then
				local k = P
				local w = (k:GetPropertyChangedSignal("Value")):Connect(function()
					for o, T in ipairs(T) do
						if T:GetAttribute("Transparency_Old") then
							(TweenService:Create(
								T,
								TweenInfo.new(0.25, Enum.EasingStyle.Linear),
								{
									["Transparency"] = (
										k.Value == Character and Toggles.TransparentHidingSpotsToggle.Value
									)
											and Options.TransparentHidingSpotsSlider.Value
										or T:GetAttribute("Transparency_Old"),
								}
							)):Play()
						end
					end
				end)
				table.insert(Connections, w)
				o.Destroying:Once(function()
					w:Disconnect()
					local o = TableFind(Connections, w)
					if o then
						table.remove(Connections, o)
					end
				end)
			end
		end
	end
	Functions.GetMinecart = function()
		return CurrentCamera:FindFirstChild("MinecartRig") ~= nil
	end
	Functions.GetNearestTurnNode = function()
		local o = { ["Distance"] = math.huge, ["Object"] = nil }
		for T, k in ipairs(wT.SeekNodes) do
			local P = LocalPlayer:DistanceFromCharacter(k.Position)
			if P < Options.AutoSteerMinecartTurnDistance.Value and P < o.Distance then
				o.Distance = P
				o.Object = k
			end
		end
		return o.Object
	end
	Functions.GetNearestDuckBoard = function()
		local o = { ["Distance"] = math.huge, ["Object"] = nil }
		for T, k in ipairs(wT.SeekDuckBoards) do
			if k.PrimaryPart then
				local T = LocalPlayer:DistanceFromCharacter(k.PrimaryPart.Position)
				if T < Options.AutoSteerMinecartDuckDistance.Value and T < o.Distance then
					o.Distance = T
					o.Object = k
				end
			end
		end
		return o.Object
	end
	Functions.SendChat = function(o)
		local T = ReplicatedStorage:FindFirstChild("DefaultChatSystemEvents") or Instance.new("Folder")
		local k = T:FindFirstChild("SayMessageRequest") or Instance.new("RemoteEvent")
		k:FireServer(o, "All")
		local P = (
			TextChatService:FindFirstChild("TextChannels")
			and TextChatService.TextChannels:FindFirstChild("RBXGeneral")
		) or Instance.new("TextChannel")
		P:SendAsync(o)
	end
	Functions.GetNearestHidingSpot = function()
		local o = { ["Distance"] = math.huge, ["Object"] = nil }
		for T, k in ipairs(wT.HidingSpots) do
			if k.PrimaryPart and k:FindFirstChild("HidePrompt") then
				local T = LocalPlayer:DistanceFromCharacter(k.PrimaryPart.Position)
				if
					T < o.Distance
					and (T < k.HidePrompt.MaxActivationDistance and k.PrimaryPart.Position.Y > -10)
				then
					local P = k:FindFirstChild("HiddenPlayer", true)
					if P and not P.Value then
						o.Distance = T
						o.Object = k
					end
				end
			end
		end
		return o.Object
	end
	Functions.GetNearestEntity = function(o, T)
		local k = {
			["RushMoving"] = 85,
			["AmbushMoving"] = 150,
			["A60"] = 125,
			["A120"] = 85,
			["GlitchRush"] = 90,
			["GlitchAmbush"] = 175,
			["BackdoorRush"] = 85,
			["CustomEntity"] = 85,
		}
		local P = { ["Distance"] = math.huge, ["Object"] = nil }
		for w, F in workspace:GetChildren() do
			if F and (k[F.Name] and F.PrimaryPart) then
				local w = EntityNotifyData[F.Name]
				if not (T and (w and T[w.Alias])) then
					local T = LocalPlayer:DistanceFromCharacter(F.PrimaryPart.Position)
					if T < k[F.Name] and T < P.Distance then
						if not o or F:GetAttribute("Inactive") ~= true then
							P.Distance = T
							P.Object = F
						end
					end
				end
			end
		end
		return P.Object
	end
	local function installNamecallHook()
		if not Executor.hookmetamethod or not Executor.newcclosure or not Executor.getnamecallmethod then
			return
		end
		MainHook = Executor.hookmetamethod(
			game,
			"__namecall",
			Executor.newcclosure(function(o, ...)
				local T = { ... }
				local k = Executor.getnamecallmethod()
				if o.Name == "MotorReplication" and k == "FireServer" then
					local o = Toggles.BypassMonument
						and (Toggles.BypassMonument.Value and CheesyState.IsMonument)
					local k = (Toggles.BypassEyes.Value and CheesyState.IsEyes)
						or (Toggles.BypassLookman.Value and CheesyState.IsLookman)
					if o then
						local o = GetMonumentLookAngle()
						if o ~= nil then
							T[1] = o
						end
					elseif k then
						local o = CurrentFloor
						if o == "Fools" or o == "OldHotel" then
							T[1] = 0
							T[2] = (CheesyState.SpoofOffset == 200 and 65 or -65)
							T[3] = 0
							T[4] = false
						else
							T[1] = -650
						end
					end
				end
				if o.Name == "Crouch" and k == "FireServer" then
					if Toggles.CrouchSpoof and Toggles.CrouchSpoof.Value then
						T[1] = true
					elseif not CheesyState.SkipGodmodeCrouchForce then
						if Toggles.Godmode and Toggles.Godmode.Value then
							T[1] = true
						end
					end
					T[2] = true
				end
				if
					Toggles.AutoHeartbeatMinigame
					and (Toggles.AutoHeartbeatMinigame.Value and k == "FireServer")
				then
					if o.Name == "ClutchHeartbeat" then
						return MainHook(o, true)
					end
					if o.Name == "HideMonster" then
						return MainHook(o, true)
					end
				end
				if Toggles.AntiDrone and (Toggles.AntiDrone.Value and k == "FireServer") then
					if o.Name == "ShoulderChecked" or o.Name == "WalkedInto" then
						return
					end
				end
				if Toggles.AntiRansom and (Toggles.AntiRansom.Value and k == "FireServer") then
					if o.Name == "RansomAttack" then
						T[1] = "didnt"
					end
				end
				if Toggles.AntiScribbles and (Toggles.AntiScribbles.Value and k == "FireServer") then
					if o.Name == "IfYoureExploitingDeleteThis" then
						return
					end
				end
				local P = CheesyState.MinecartTeleportState
				if P and (k == "FireServer" and o == P.MinecartPos) then
					if P.LatestRoom < 49 then
						local o = P.GetDoor()
						if o then
							local k = o:GetPivot()
							local P = workspace.CurrentCamera
								and workspace.CurrentCamera:FindFirstChild("MinecartRig")
							if P then
								P:PivotTo(k)
							end
							pcall(function()
								o.ClientOpen:FireServer()
							end)
							T[1] = k
						end
					else
						if P.DecodeHook and P.RestoreDecode then
							pcall(function()
								P.RestoreDecode(P.Decode)
							end)
						end
						if P.LatestRoomConn then
							pcall(function()
								P.LatestRoomConn:Disconnect()
							end)
						end
						CheesyState.MinecartTeleportState = nil
					end
				end
				return MainHook(o, table.unpack(T))
			end)
		)
		OtherHook = Executor.hookmetamethod(
			game,
			"__index",
			Executor.newcclosure(function(o, T)
				local k = OtherHook(o, T)
				if
					T == "MoveDirection"
					and (
						o == Humanoid
						and (
							CheesyState.RoomsAutoWalkActive
							and (
								Toggles.RoomsAutoWalkSpoofFootsteps.Value
								and (
									CurrentFloor == "Rooms"
									and not (Character and Character:GetAttribute("Hiding"))
								)
							)
						)
					)
				then
					if HumanoidRootPart then
						local o = HumanoidRootPart.Velocity
						if o.Magnitude > 0.1 then
							return o.Unit
						end
						return HumanoidRootPart.CFrame.LookVector
					end
					return k
				end
				return k
			end)
		)
	end
	installNamecallHook()
	local function processRoom(o)
		local k = workspace:FindFirstChild("CurrentRooms")
		if k and o.Parent == k then
			local T = o:GetAttribute("Firedamp")
			o:SetAttribute("Firedamp_Old", T ~= nil and T or false)
			if Toggles.DisableFiredampEffect.Value then
				o:SetAttribute("Firedamp", false)
			end
		end
		local P = o.Name
		if P == "Padlock" then
			Connections.PadlockConnection = RunService.Heartbeat:Connect(function()
				if _Unloading then
					return
				end
				if o.PrimaryPart then
					local k = LocalPlayer:DistanceFromCharacter(o.PrimaryPart.Position)
					if Toggles.AutoUnlockPadlockToggle.Value then
						local o = Functions.GetLibraryCode()
						if o and (tonumber(o) and k < 50) then
							GameRemotes.PL:FireServer(o)
						end
					end
					if Toggles.AutoLibraryBruteForce.Value and k < 50 then
						local o = Functions.GetLibraryCode()
						if o and string.find(o, "_") then
							local k = ""
							for T = 1, #o, 1 do
								local P = string.sub(o, T, T)
								k = k .. (P == "_" and math.random(0, 9) or P)
							end
							if GameRemotes and GameRemotes:FindFirstChild("PL") then
								GameRemotes.PL:FireServer(k)
							end
							CheesyState.BruteForceCount = (CheesyState.BruteForceCount or 0) + 1
							if CheesyState.BruteForceCount % 750 == 0 then
								task.spawn(function()
									UiLibrary:Notify({
										["Title"] = "Brute-force: checked "
											.. (CheesyState.BruteForceCount .. " codes"),
										["Description"] = "Not found yet",
										["Time"] = 2,
									})
								end)
							end
						end
					end
				end
			end)
			o.Destroying:Once(function()
				if CheesyState.BruteForceCount and CheesyState.BruteForceCount > 0 then
					task.spawn(function()
						UiLibrary:Notify({
							["Title"] = "Padlock code found after "
								.. (CheesyState.BruteForceCount .. " attempts!"),
							["Description"] = "yay",
							["Time"] = 5,
						})
					end)
				end
				CheesyState.BruteForceCount = nil
				if Connections.PadlockConnection then
					Connections.PadlockConnection:Disconnect()
					Connections.PadlockConnection = nil
				end
			end)
		elseif P == "ElevatorBreaker" then
			if Toggles.AutoBreakerBox.Value and not CheesyState.BreakerBoxNotified then
				CheesyState.BreakerBoxNotified = true
			end
			local T = ((o:WaitForChild("SurfaceGui")):WaitForChild("Frame")):WaitForChild("Code")
			local function handleBreakerBoxAutoSolve()
				if Toggles.AutoBreakerBox.Value then
					local k = Options.BreakerBoxMethod and Options.BreakerBoxMethod.Value or "Instant"
					if k == "Instant" then
						task.spawn(function()
							task.wait(1)
							pcall(function()
								if GameRemotes and GameRemotes:FindFirstChild("EBF") then
									GameRemotes.EBF:FireServer()
								end
							end)
						end)
					elseif k == "Legit" then
						local k = tonumber(T.Text)
						if not k then
							return
						end
						for o, P in o:GetDescendants() do
							if P.Name == "BreakerSwitch" and P:GetAttribute("ID") == k then
								local o = (T:WaitForChild("Frame")).BackgroundTransparency
								local k = P:FindFirstChild("PrismaticConstraint")
								local w = P:FindFirstChild("Light")
								local F = P:FindFirstChild("Sound")
								if o == 0 then
									if P:GetAttribute("Enabled") then
										return
									end
									P:SetAttribute("Enabled", true)
									if k then
										k.TargetPosition = -0.2
									end
									if w then
										w.Material = Enum.Material.Neon
										local o = w:FindFirstChild("Spark", true)
										if o then
											o:Emit(1)
										end
									end
									if F then
										F:Play()
									end
								elseif o == 1 then
									if not P:GetAttribute("Enabled") then
										return
									end
									P:SetAttribute("Enabled", false)
									if k then
										k.TargetPosition = 0.2
									end
									if w then
										w.Material = Enum.Material.Glass
									end
									if F then
										F:Play()
									end
								end
								break
							end
						end
					end
					if not CheesyState.BreakerBoxStartNotified then
						CheesyState.BreakerBoxStartNotified = true
					end
				end
				CheesyState.BreakerBoxInteracted = true
			end
			Connections.BreakerConnection = (T:GetPropertyChangedSignal("Text")):Connect(
				handleBreakerBoxAutoSolve
			)
			CheesyState.RunBreakerFunc = handleBreakerBoxAutoSolve
			o.Destroying:Once(function()
				CheesyState.RunBreakerFunc = nil
			end)
		elseif P == "ElevatorCar" then
			local T = o.DescendantAdded:Connect(function(o)
				if
					Toggles.AutoBreakerBox.Value
					and (o.Name == "TouchInterest" and not CheesyState.BreakerBoxFinishedNotified)
				then
					CheesyState.BreakerBoxFinishedNotified = true
				end
			end)
			o.Destroying:Once(function()
				T:Disconnect()
			end)
		end
	end
	local function getPromptDistance(o)
		if not HumanoidRootPart or not o then
			return math.huge
		end
		local T = o.Parent
		local k = nil
		if T:IsA("BasePart") then
			k = T
		elseif T:IsA("Attachment") and (T.Parent and T.Parent:IsA("BasePart")) then
			k = T.Parent
		elseif T:IsA("Model") then
			k = T.PrimaryPart or T:FindFirstChildWhichIsA("BasePart", true)
		end
		if not k then
			return math.huge
		end
		return ((k.Position - HumanoidRootPart.Position)).Magnitude
	end
	_promptTriggerLock = false
	local function forceTriggerPrompt(o, T)
		if not o or not o:IsA("ProximityPrompt") then
			return false
		end
		if _promptTriggerLock then
			return false
		end
		T = T or 20
		if not o.Enabled then
			return false
		end
		if (not Toggles.PromptClip.Value) and getPromptDistance(o) > T then
			return false
		end
		_promptTriggerLock = true
		pcall(function()
			local T = o.HoldDuration
			local k = o.RequiresLineOfSight
			local P = o.MaxActivationDistance
			o.HoldDuration = 0
			o.RequiresLineOfSight = false
			o.MaxActivationDistance = math.huge
			if Executor.fireproximityprompt then
				Executor.fireproximityprompt(o)
			else
				o:InputHoldBegin()
				o:InputHoldEnd()
			end
			o.HoldDuration = T
			pcall(function()
				o.RequiresLineOfSight = k
			end)
			pcall(function()
				o.MaxActivationDistance = P
			end)
		end)
		_promptTriggerLock = false
		return true
	end
	Toggles.InfiniteCrucifix:OnChanged(function(o)
		if not o then
			return
		end
		if CheesyState.InfCrucifixRunning then
			return
		end
		CheesyState.InfCrucifixRunning = true
		task.spawn(function()
			local o = {
				["RushMoving"] = 49,
				["AmbushMoving"] = 50,
				["A60"] = 49,
				["A120"] = 50,
				["BackdoorRush"] = 49,
			}
			local T = 0.05
			local function updateNetworkPingEstimate()
				local o, k = pcall(function()
					return LocalPlayer:GetNetworkPing()
				end)
				if o and (type(k) == "number" and k > 0) then
					T = math.clamp(k, 0.01, 0.4)
					return true
				end
				local P = GameRemotes and GameRemotes:FindFirstChild("RequestLocalAsset")
				if P then
					local o = os.clock()
					pcall(function()
						P:InvokeServer({})
					end)
					T = math.clamp(os.clock() - o, 0.01, 0.4)
					return true
				end
				return false
			end
			local P = updateNetworkPingEstimate()
			local w = {}
			local F = 0
			local A = Vector3.zero
			local d = 0
			local C = nil
			local function getThreatBasePart(o)
				if not o then
					return nil
				end
				if o:IsA("Model") then
					return o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart", true)
				end
				if o:IsA("BasePart") then
					return o
				end
				return nil
			end
			local function getCharacterCollisionPart()
				local o = LocalPlayer.Character
				if not o then
					return nil
				end
				return o:FindFirstChild("CollisionPart")
					or o:FindFirstChild("Collision")
					or o:FindFirstChild("HumanoidRootPart")
			end
			local r = RaycastParams.new()
			r.FilterType = Enum.RaycastFilterType.Include
			r.RespectCanCollide = true
			local function findCrucifixThreat()
				for o in pairs(o) do
					local T = workspace:FindFirstChild(o) or workspace:FindFirstChild(o, true)
					if T and (T:IsA("BasePart") or T:IsA("Model")) then
						return T, o
					end
				end
			end
			local function findThreatInCrucifixRange()
				local k, P = findCrucifixThreat()
				if not k then
					return nil
				end
				local y = getThreatBasePart(k)
				local X = getCharacterCollisionPart()
				if not y or not X or not y.Parent or not X.Parent then
					return nil
				end
				local I = y.Position
				if C then
					local o = I - C
					local T = o.Magnitude
					if T > 0.0001 then
						table.insert(w, T)
						F = F + 1
						if F > 60 then
							table.remove(w, 1)
							F = F - 1
						end
						local k = 0
						for o, T in ipairs(w) do
							k = k + T
						end
						d = k / F
						A = o.Unit
					end
				end
				C = I
				if ((I - X.Position)).Magnitude > o[P] then
					return nil
				end
				local V = I
				if d > 0.5 then
					V = I + (A * (d * T))
				end
				local q = X.Position - V
				if q.Magnitude < 0.0001 then
					return k, P
				end
				r.FilterDescendantsInstances = { X, workspace:FindFirstChild("CurrentRooms") }
				local M = workspace:Raycast(V, q.Unit * o[P], r)
				if M and M.Instance == X then
					return k, P
				end
				return nil
			end
			local function findDroppedCrucifix(o)
				local T = workspace:FindFirstChild("Drops")
				if T then
					for o, T in T:GetChildren() do
						if T.Name == "Crucifix" then
							return T
						end
					end
				end
				for T, k in workspace:GetDescendants() do
					if
						k:IsA("Model")
						and (k.Name == "Crucifix" and not k:IsDescendantOf(LocalPlayer.Character))
					then
						if (((k:GetPivot()).Position - o.Position)).Magnitude < 25 then
							return k
						end
					end
				end
			end
			local I = 0
			while not _Unloading and (Toggles.InfiniteCrucifix and Toggles.InfiniteCrucifix.Value) do
				task.wait(0.016666666666667)
				if P then
					local o = os.clock()
					if o - I >= 1 then
						I = o
						updateNetworkPingEstimate()
					end
				end
				local o = LocalPlayer.Character
				local T = o and o:FindFirstChildOfClass("Tool")
				if T and T.Name == "Crucifix" then
					local k, P = findThreatInCrucifixRange()
					if k then
						local k = o:FindFirstChild("HumanoidRootPart")
						local P = detectFloor()
						if k and (P ~= "Rooms" and not (o and o:GetAttribute("GodmodeSunk"))) then
							GameRemotes.DropItem:FireServer(T)
							task.wait(0.1)
							local o
							for T = 1, 40, 1 do
								o = findDroppedCrucifix(k)
								if o then
									break
								end
								task.wait(0.1)
							end
							if o then
								task.wait(0.4)
								local T = o:FindFirstChildOfClass("ProximityPrompt", true)
									or o:FindFirstChild("ModulePrompt", true)
								if T then
									pcall(function()
										Functions.FirePrompt(T)
									end)
								end
							end
							table.clear(w)
							F = 0
							C = nil
							A = Vector3.zero
							d = 0
						end
						task.wait(2)
					end
				end
			end
			CheesyState.InfCrucifixRunning = false
		end)
	end)
	Toggles.AutoBreakerBox:OnChanged(function(o)
		if not o then
			return
		end
		if CheesyState.RunBreakerFunc then
			if CheesyState.BreakerBoxInteracted then
				CheesyState.RunBreakerFunc()
			end
		elseif CurrentRooms:FindFirstChild("ElevatorBreaker", true) then
			if not CheesyState.BreakerBoxInteracted then
				if not CheesyState.BreakerBoxNotified then
					CheesyState.BreakerBoxInteracted = true
				end
			else
				task.spawn(function()
					task.wait(1)
					pcall(function()
						if GameRemotes and GameRemotes:FindFirstChild("EBF") then
							GameRemotes.EBF:FireServer()
						end
					end)
				end)
			end
		end
	end)
	UiLibrary:Mount(Groupboxes.Character, "Toggle", "WalkspeedEnabled", {
			["Title"] = "Walkspeed",
			["Value"] = false,
			["Desc"] = "Applies the walkspeed value from the slider below",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Character, "Slider", "Walkspeed", {
			["Title"] = "Walkspeed",
			["Min"] = 16,
			["Max"] = 150,
			["Value"] = 16,
			["Precision"] = 0,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Character, "Dropdown", "SpeedBypassMode", { ["Title"] = "Speed Bypass", ["Values"] = { "Default", "Boost" }, ["Value"] = 1, ["Multi"] = false }, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Character, "Toggle", "FlyToggle", { ["Title"] = "Fly", ["Value"] = false }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.FlyToggle.Section, "KeyPicker", "FlyKeybind", { ["Title"] = "Fly", ["Value"] = "F", ["Mode"] = "Toggle", ["SyncToggleState"] = true }, function(state, spec)
		return state.Section:Keybind({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Value = state.Value,
			Callback = function() end,
		})
	end, Toggles.FlyToggle)
	UiLibrary:Mount(Groupboxes.Character, "Slider", "FlySpeed", {
			["Title"] = "Fly Speed",
			["Min"] = 25,
			["Max"] = 150,
			["Value"] = 60,
			["Precision"] = 0,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Character, Groupboxes.Character:Divider())
	UiLibrary:Mount(Groupboxes.Character, "Toggle", "RemoveAcceleration", {
			["Title"] = "Remove Acceleration",
			["Value"] = false,
			["Desc"] = "Removes 'sliding' when moving at high speeds",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Character, Groupboxes.Character:Divider())
	UiLibrary:Mount(Groupboxes.Character, "Toggle", "EnableCharacterJump", {
			["Title"] = "Enable Jumping",
			["Value"] = false,
			["Desc"] = "Enables the doors jumping feature",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Character, "Toggle", "InfiniteJumps", { ["Title"] = "Infinite Jump", ["Value"] = false, ["Desc"] = "Allows you to jump mid-air" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Character, Groupboxes.Character:Divider())
	UiLibrary:Mount(Groupboxes.Character, "Toggle", "EnableCharacterSlide", {
			["Title"] = "Enable Sliding",
			["Value"] = false,
			["Desc"] = "Enables the doors sliding feature (only at speeds above 20)",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Character, "Toggle", "Noclip", {
			["Title"] = "Noclip",
			["Value"] = false,
			["Desc"] = "Allows you to go through walls (rubberbands you)",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.Noclip.Section, "KeyPicker", "NoclipKeybind", { ["Title"] = "Noclip", ["Value"] = "N", ["Mode"] = "Toggle", ["SyncToggleState"] = true }, function(state, spec)
		return state.Section:Keybind({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Value = state.Value,
			Callback = function() end,
		})
	end, Toggles.Noclip)
	UiLibrary:Mount(Groupboxes.Character, "Toggle", "Phase", {
			["Title"] = "Phase",
			["Value"] = false,
			["Desc"] = "Slowly floats you forward with noclip enabled for no rubberbanding",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.Phase.Section, "KeyPicker", "PhaseKeybind", { ["Title"] = "Phase", ["Value"] = "T", ["Mode"] = "Toggle", ["SyncToggleState"] = true }, function(state, spec)
		return state.Section:Keybind({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Value = state.Value,
			Callback = function() end,
		})
	end, Toggles.Phase)
	UiLibrary:Mount(Groupboxes.Other, "Toggle", "AnticheatManipulation", {
			["Title"] = "Anticheat Manipulation",
			["Value"] = false,
			["Desc"] = "Makes your character fly forwards fast to trick the anticheat to send you through walls",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.AnticheatManipulation.Section, "KeyPicker", "AnticheatManipulationKeybind", {
			["Title"] = "Anticheat Manipulation",
			["Value"] = "B",
			["Mode"] = "Hold",
			["SyncToggleState"] = true,
		}, function(state, spec)
		return state.Section:Keybind({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Value = state.Value,
			Callback = function() end,
		})
	end, Toggles.AnticheatManipulation)
	UiLibrary:Mount(Groupboxes.Other, "Toggle", "AutoInteract", {
			["Title"] = "Auto Interact",
			["Value"] = false,
			["Desc"] = "Auto interacts with prompts near you (you can change it to be a hold keybind)",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.AutoInteract.Section, "KeyPicker", "AutoInteractKeybind", { ["Title"] = "Auto Interact", ["Value"] = "R", ["Mode"] = "Toggle", ["SyncToggleState"] = true }, function(state, spec)
		return state.Section:Keybind({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Value = state.Value,
			Callback = function() end,
		})
	end, Toggles.AutoInteract)
	UiLibrary:Mount(Groupboxes.Other, "Dropdown", "AutoInteractIgnoreList", {
			["Title"] = "Interact Blacklist",
			["Values"] = {
				"Locks",
				"Glitch Fragments",
				"Dropped Items",
				"Mandrake",
				"Archives Lockers",
				"Pizza",
				"Donut",
				"PaperPlane",
				"PaperPlanePickup",
				"GweenSodaPack",
				"BottleCrate",
				"DinkyLamp",
				"JerryCan",
				"HoneyPot",
				"RiftJar",
				"BoxingGloves",
				"Green_Herb",
				"BrokenMonitor",
				"SecretCD",
				"Drakobloxxer",
				"GrumbleRig",
				"Snare",
				"GiggleCeiling",
				"WaterPump",
				"TimerLever",
				"VineGuillotine",
				"StardustPickup",
				"GoldPile",
				"ElectricalKeyObtain",
				"LiveBreakerPolePickup",
				"LibraryHintPaper",
				"LiveHintBook",
			},
			["Value"] = { "Dropped Items" },
			["Multi"] = true,
			["AllowNone"] = true,
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Other, Groupboxes.Other:Divider())
	UiLibrary:Mount(Groupboxes.Other, "Toggle", "Godmode", {
			["Title"] = "Godmode",
			["Value"] = false,
			["Desc"] = "Makes your character appear underground on the server, protecting you from rush-like entities.",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.Godmode.Section, "KeyPicker", "GodmodeKeybind", { ["Title"] = "Godmode", ["Value"] = "G", ["Mode"] = "Toggle", ["SyncToggleState"] = true }, function(state, spec)
		return state.Section:Keybind({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Value = state.Value,
			Callback = function() end,
		})
	end, Toggles.Godmode)
	Toggles.Godmode:OnChanged(function(o)
		if o then
			if shouldUseGodmode() then
				applyGodmode()
			end
		else
			restoreGodmode()
		end
	end)
	UiLibrary:Mount(Groupboxes.Other, "Dropdown", "GodmodeMethod", {
			["Title"] = "Godmode Method",
			["Values"] = { "Always enabled", "On entity spawn" },
			["Value"] = "Always enabled",
			["Desc"] = "Always enabled keeps godmode active while the toggle is on. On entity spawn only activates it when a listed entity exists.",
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Other, "Toggle", "FigureGodmode", {
			["Title"] = "Figure Godmode",
			["Value"] = false,
			["Desc"] = "Holds you out of the Figure's reach while it is close, without moving your camera",
			["Disabled"] = CurrentFloor == "OldHotel" or CurrentFloor == "Fools",
			["DisabledTooltip"] = "This feature doesn't work in this floor",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	do
		local o = {}
		FigureNames = { ["Figure"] = true, ["FigureRig"] = true, ["FigureRagdoll"] = true }
		FigureOffset = 10.5
		FigureRange = 25
		GroundskeeperRigs = {}
		GroundskeeperRange = 90
		GroundskeeperReduction = 3
		local T = { ["Active"] = false, ["BaseY"] = 0, ["Hum"] = nil, ["SavedOffset"] = nil }
		local function getFigureModelRoot(o)
			if not o or not o:IsA("Model") then
				return nil
			end
			return o.PrimaryPart or o:FindFirstChild("Root") or o:FindFirstChildWhichIsA("BasePart", true)
		end
		local function getGroundskeeperModelRoot(o)
			if not o or not o:IsA("Model") then
				return nil
			end
			return o:FindFirstChild("HumanoidRootPart")
				or o.PrimaryPart
				or o:FindFirstChildWhichIsA("BasePart", true)
		end
		local function trackFigureOrGroundskeeper(T)
			if not T then
				return
			end
			if T:IsA("Model") and T.Name == "Groundskeeper" then
				local o = getGroundskeeperModelRoot(T)
				if o then
					GroundskeeperRigs[T] = o
				end
			elseif T:IsA("Model") and FigureNames[T.Name] then
				local P = getFigureModelRoot(T)
				if P then
					o[T] = P
				end
			elseif T:IsA("BasePart") and T.Name == "Root" then
				local k = T.Parent
				if k and (k:IsA("Model") and FigureNames[k.Name]) then
					o[k] = T
				end
			end
		end
		local function untrackFigureOrGroundskeeper(T)
			o[T] = nil
			GroundskeeperRigs[T] = nil
		end
		local A = workspace.CurrentCamera
		local function refreshFigureCameraReference()
			local o = workspace.CurrentCamera
			if o ~= A then
				A = o
			end
		end
		local function captureFigureCamera()
			T.Cam = workspace.CurrentCamera
		end
		local function clearFigureGodmodeState(o)
			if not T.Active then
				return
			end
			T.Cam = nil
			T.Active = false
		end
		local function getFigureCameraOffset(o)
			local T = FigureOffset
			local k = GroundskeeperRange * GroundskeeperRange
			for P, w in pairs(GroundskeeperRigs) do
				if w and w.Parent then
					local P = w.Position
					local F = P.X - o.X
					local A = (P.Y - o.Y) * 5
					local d = P.Z - o.Z
					if (F * F + A * A) + d * d < k then
						T = T - GroundskeeperReduction
						break
					end
				else
					GroundskeeperRigs[P] = nil
				end
			end
			if T < 0 then
				T = 0
			end
			return T
		end
		local function offsetCameraNearFigure(o)
			if not T.Active then
				T.Active = true
				captureFigureCamera()
			end
			local k = getFigureCameraOffset(o.Position)
			local P = o.CFrame
			o.CFrame = P * CFrame.new(0, k, 0)
			RunService.RenderStepped:Wait()
			o.CFrame = P
			local w = A
			if w then
				w.CFrame = w.CFrame - Vector3.new(0, k, 0)
			end
		end
		local function startFigureGodmodeWatcher()
			if Connections.FigureGodmode then
				return
			end
			local T = workspace.CurrentRooms
			if not T then
				return
			end
			for o, T in T:GetDescendants() do
				trackFigureOrGroundskeeper(T)
			end
			Connections.FigureGodmodeFig = T.DescendantAdded:Connect(trackFigureOrGroundskeeper)
			Connections.FigureGodmodeFigGone = T.DescendantRemoving:Connect(untrackFigureOrGroundskeeper)
			Connections.FigureGodmode = RunService.Heartbeat:Connect(function()
				if _Unloading then
					return
				end
				local T = HumanoidRootPart
				if not T or not T.Parent then
					clearFigureGodmodeState(T)
					return
				end
				local k = T.Position
				local P = FigureRange * FigureRange
				local w = nil
				for T, F in pairs(o) do
					if F and F.Parent then
						local o = F.Position
						local T = o.X - k.X
						local A = o.Z - k.Z
						local d = T * T + A * A
						if d < P and (not w or d < w) then
							w = d
						end
					else
						o[T] = nil
					end
				end
				if w then
					refreshFigureCameraReference()
					offsetCameraNearFigure(T)
				else
					clearFigureGodmodeState(T)
				end
			end)
		end
		local function stopFigureGodmodeWatcher()
			for o, T in ipairs({ "FigureGodmode", "FigureGodmodeFig", "FigureGodmodeFigGone" }) do
				if Connections[T] then
					pcall(function()
						Connections[T]:Disconnect()
					end)
					Connections[T] = nil
				end
			end
			clearFigureGodmodeState(HumanoidRootPart)
			TableClear(o)
			TableClear(GroundskeeperRigs)
		end
		Toggles.FigureGodmode:OnChanged(function(o)
			if o then
				startFigureGodmodeWatcher()
			else
				stopFigureGodmodeWatcher()
			end
		end)
	end
	UiLibrary:Mount(Groupboxes.Other, "Toggle", "NotifyVulnerable", {
			["Title"] = "Notify When Vulnerable",
			["Value"] = false,
			["Desc"] = "Notifies you when your character moves 3+ studs upward",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Other, "Toggle", "AutoClosetToggle", {
			["Title"] = "Auto Closet",
			["Value"] = false,
			["Desc"] = "Automatically hides in a closet next to you when a rush-like entity is near",
			["Disabled"] = not hasFirePrompt,
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.AutoClosetToggle.Section, "KeyPicker", "AutoClosetKeybind", { ["Title"] = "Auto Closet", ["Value"] = "H", ["Mode"] = "Toggle", ["SyncToggleState"] = true }, function(state, spec)
		return state.Section:Keybind({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Value = state.Value,
			Callback = function() end,
		})
	end, Toggles.AutoClosetToggle)
	UiLibrary:Mount(Groupboxes.Other, "Dropdown", "AutoClosetEntityList", {
			["Title"] = "Ignore List",
			["Values"] = {
				"Rush",
				"Ambush",
				"Blitz",
				"A-60",
				"A-120",
				"Glitch Rush",
				"Glitch Ambush",
			},
			["Multi"] = true,
			["AllowNone"] = true,
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Other, Groupboxes.Other:Divider())
	UiLibrary:Mount(Groupboxes.Other, "Toggle", "DoorReachToggle", {
			["Title"] = "Door Reach",
			["Value"] = false,
			["Desc"] = "Increases your door opening reach by your chosen amount",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Other, "Slider", "DoorReachDistance", {
			["Title"] = "Distance",
			["Min"] = 15,
			["Max"] = 75,
			["Value"] = 45,
			["Precision"] = 0,
			["Compact"] = true,
			["Suffix"] = " studs",
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Fly = { ["Connection"] = nil, ["Body"] = nil }
	local gT = nil
	LastControlledChair = nil
	local function isWalkspeedEnabled()
		return Toggles.WalkspeedEnabled ~= nil and Toggles.WalkspeedEnabled.Value == true
	end
	local function stopSpeedBypass()
		if BypassConnection then
			BypassConnection:Disconnect()
			BypassConnection = nil
		end
		local o = Character and Character:FindFirstChild("CollisionPartClone")
		if o then
			o:Destroy()
		end
		if not Toggles.FlyToggle.Value and Humanoid then
			Humanoid.WalkSpeed = 16
		end
		if Character then
			Character:SetAttribute("SpeedBoost", 0)
			Character:SetAttribute("SpeedBoostBehind", 0)
			Character:SetAttribute("SpeedBoostExtra", 0)
			Character:SetAttribute("SpeedBoostMod", 0)
			Character:SetAttribute("AntiSpeed", nil)
			Character:SetAttribute("Antispeed", nil)
			Character:SetAttribute("SpeedBypass", nil)
		end
		if Humanoid then
			Humanoid:SetAttribute("AntiSpeed", nil)
			Humanoid:SetAttribute("Antispeed", nil)
		end
		pcall(function()
			local o = GameRemotes and GameRemotes:FindFirstChild("Crouch")
			if o then
				o:FireServer(false, false)
			end
		end)
	end
	local function disconnectSpeedLoop()
		if SpeedConnection then
			SpeedConnection:Disconnect()
			SpeedConnection = nil
		end
	end
	local function setupSpeedBypass()
		stopSpeedBypass()
		if not Toggles.FlyToggle.Value and Options.Walkspeed.Value == 16 then
			return
		end
		local o = GameRemotes and GameRemotes:FindFirstChild("Crouch")
		if CharacterCollisionPart and not Character:FindFirstChild("CollisionPartClone") then
			local o = CharacterCollisionPart:Clone()
			o.Name = "CollisionPartClone"
			o.RootPriority = 127
			o.Anchored = false
			o.CanCollide = false
			local T = o:FindFirstChild("CollisionCrouch")
			if T then
				T:Destroy()
			end
			o.Parent = Character
		end
		BypassConnection = RunService.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if not Character or not HumanoidRootPart or not Humanoid then
				stopSpeedBypass()
				return
			end
			if o then
				o:FireServer(true, true)
			end
			if not Toggles.FlyToggle.Value then
				local o = Character:FindFirstChild("CollisionPartClone")
				if o then
					o.Massless = true
				end
			end
		end)
	end
	local function startBypassWalkspeed()
		disconnectSpeedLoop()
		SpeedConnection = RunService.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if not isWalkspeedEnabled() then
				return
			end
			if not Humanoid or not HumanoidRootPart or not Character then
				return
			end
			local o = Options.Walkspeed.Value
			if o == 16 then
				return
			end
			if not BypassConnection then
				setupSpeedBypass()
			end
			Character:SetAttribute("AntiSpeed", true)
			Character:SetAttribute("Antispeed", true)
			Character:SetAttribute("SpeedBypass", true)
			Humanoid:SetAttribute("AntiSpeed", true)
			Humanoid:SetAttribute("Antispeed", true)
			Humanoid.WalkSpeed = o
			local T = Humanoid.MoveDirection
			if T.Magnitude > 0 then
				local k = HumanoidRootPart.AssemblyLinearVelocity
				HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(T.X * o, k.Y, T.Z * o)
			end
		end)
	end
	local function startAttributeWalkspeed()
		disconnectSpeedLoop()
		stopSpeedBypass()
		if not Toggles.FlyToggle.Value and Options.Walkspeed.Value == 16 then
			return
		end
		SpeedConnection = RunService.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if not isWalkspeedEnabled() then
				return
			end
			if not Humanoid or not HumanoidRootPart or not Character then
				return
			end
			local o = Options.Walkspeed.Value
			Character:SetAttribute("SpeedBoost", o - 16)
			Character:SetAttribute("SpeedBoostBehind", 0)
			Character:SetAttribute("SpeedBoostExtra", 0)
			if GameRemotes and GameRemotes:FindFirstChild("Crouch") then
				GameRemotes.Crouch:FireServer(true, true)
			end
			if o ~= 16 then
				Humanoid.WalkSpeed = o
				local T = Humanoid.MoveDirection
				if T.Magnitude > 0 then
					local k = HumanoidRootPart.AssemblyLinearVelocity
					HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(T.X * o, k.Y, T.Z * o)
				end
			end
		end)
	end
	local function stopFly()
		if Fly.Connection then
			Fly.Connection:Disconnect()
			Fly.Connection = nil
		end
		if Fly.Body then
			Fly.Body:Destroy()
			Fly.Body = nil
		end
		if HumanoidRootPart then
			HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
		end
		if Humanoid then
			Humanoid.PlatformStand = false
		end
	end
	function updateFly()
		stopFly()
		if not Toggles.FlyToggle.Value or not HumanoidRootPart then
			stopFly()
			return
		end
		Fly.Body = Instance.new("BodyVelocity")
		Fly.Body.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
		Fly.Body.P = math.huge
		Fly.Body.Parent = HumanoidRootPart
		Fly.Connection = RunService.RenderStepped:Connect(function()
			if _Unloading then
				return
			end
			if not Toggles.FlyToggle.Value or not Humanoid then
				stopFly()
				return
			end
			local o = Vector3.zero
			local T = Humanoid.MoveDirection
			if T.Magnitude > 0 then
				local k = CurrentCamera.CFrame.LookVector
				local P = CurrentCamera.CFrame.RightVector
				local w = T:Dot(k)
				local F = T:Dot(P)
				o = k * w + P * F
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
				o = o + Vector3.yAxis
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
				o = o - Vector3.yAxis
			end
			if o.Magnitude > 0 then
				o = o.Unit
			end
			Fly.Body.Velocity = o * Options.FlySpeed.Value
		end)
	end
	local function findNearbyOfficeChair()
		local o = Character and Character:FindFirstChild("HumanoidRootPart")
		if not o then
			return nil
		end
		local T, k = nil, math.huge
		local function considerNearbyOfficeChair(P)
			if (P.Name == "ArchivesOfficeChair" or P.Name == "StairwellOfficeChair") and P:IsA("Model") then
				local w = P:FindFirstChild("Collider")
					or P.PrimaryPart
					or P:FindFirstChildWhichIsA("BasePart")
				if w and w:IsA("BasePart") then
					local F = ((o.Position - w.Position)).Magnitude
					if F < k then
						k = F
						T = P
					end
				end
			end
		end
		local w = workspace:FindFirstChild("Misc")
		if w then
			for o, T in ipairs(w:GetDescendants()) do
				considerNearbyOfficeChair(T)
			end
		end
		local F = workspace:FindFirstChild("CurrentRooms")
		if F then
			for o, T in ipairs(F:GetChildren()) do
				local k = T:FindFirstChild("Assets")
				if k then
					for o, T in ipairs(k:GetChildren()) do
						considerNearbyOfficeChair(T)
					end
				end
			end
		end
		return T
	end
	function StopChairBypass()
		local o = gT
		if not o then
			return
		end
		if o.movement then
			o.movement:Disconnect()
		end
		if o.pollSeat then
			o.pollSeat:Disconnect()
		end
		if o.inputBegan then
			o.inputBegan:Disconnect()
		end
		if o.inputEnded then
			o.inputEnded:Disconnect()
		end
		if o.mouseInput then
			o.mouseInput:Disconnect()
		end
		pcall(function()
			RunService:UnbindFromRenderStep("ChairBypassCamera")
		end)
		pcall(function()
			ContextActionService:UnbindAction("ChairBypassBlockExit")
		end)
		if o.originalCollision then
			for o, T in pairs(o.originalCollision) do
				if o and o.Parent then
					o.CanCollide = T
				end
			end
		end
		if o.collider then
			pcall(function()
				o.collider.AssemblyLinearVelocity = o.oldVelocity
				o.collider.AssemblyAngularVelocity = o.oldAngularVelocity
			end)
			if o.chair and o.chair.Parent then
				local T = Character and Character:FindFirstChild("HumanoidRootPart")
				if T and o.collider.Parent then
					local k = o.collider.CFrame * CFrame.new(3, 0, 0)
					T.CFrame = CFrame.lookAt(k.Position, o.collider.Position)
				end
			end
		end
		if o.oldCameraType then
			pcall(function()
				workspace.CurrentCamera.CameraType = o.oldCameraType
				workspace.CurrentCamera.CameraSubject = o.oldCameraSubject
				UserInputService.MouseBehavior = o.oldMouseBehavior or Enum.MouseBehavior.Default
			end)
		end
		LastControlledChair = nil
		gT = nil
	end
	local function activateChairBypass()
		local o = findNearbyOfficeChair()
		if not o then
			return false
		end
		local T = o:FindFirstChild("Collider") or o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart")
		if not T or not T:IsA("BasePart") then
			return false
		end
		StopChairBypass()
		local k = {
			["chair"] = o,
			["collider"] = T,
			["held"] = {},
			["originalCollision"] = {},
			["oldVelocity"] = T.AssemblyLinearVelocity,
			["oldAngularVelocity"] = T.AssemblyAngularVelocity,
			["oldCameraType"] = workspace.CurrentCamera.CameraType,
			["oldCameraSubject"] = workspace.CurrentCamera.CameraSubject,
			["oldMouseBehavior"] = UserInputService.MouseBehavior,
			["cameraYaw"] = 0,
			["cameraPitch"] = 0,
		}
		local P = workspace.CurrentCamera.CFrame.LookVector
		k.cameraYaw = math.atan2(-P.X, -P.Z)
		k.cameraPitch = math.asin(math.clamp(P.Y, -1, 1))
		gT = k
		LastControlledChair = o
		pcall(function()
			workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
			workspace.CurrentCamera.CameraSubject = Humanoid
		end)
		for o, T in ipairs(o:GetDescendants()) do
			if T:IsA("BasePart") then
				k.originalCollision[T] = T.CanCollide
				T.CanCollide = false
			end
		end
		pcall(function()
			ContextActionService:BindActionAtPriority(
				"ChairBypassBlockExit",
				function(o, T, P)
					if P.KeyCode == Enum.KeyCode.LeftControl then
						if T == Enum.UserInputState.Begin then
							Toggles.ArchiveChairFly:SetValue(false)
						end
						return Enum.ContextActionResult.Sink
					end
					if
						P.KeyCode == Enum.KeyCode.Space
						or P.KeyCode == Enum.KeyCode.LeftShift
						or P.KeyCode == Enum.KeyCode.RightShift
					then
						if T == Enum.UserInputState.Begin then
							k.held[P.KeyCode] = true
						elseif T == Enum.UserInputState.End or T == Enum.UserInputState.Cancel then
							k.held[P.KeyCode] = nil
						end
					end
					return Enum.ContextActionResult.Sink
				end,
				false,
				Enum.ContextActionPriority.High.Value + 100,
				Enum.KeyCode.E,
				Enum.KeyCode.Space,
				Enum.KeyCode.LeftShift,
				Enum.KeyCode.RightShift,
				Enum.KeyCode.LeftControl
			)
		end)
		k.inputBegan = UserInputService.InputBegan:Connect(function(o, T)
			if T then
				return
			end
			if
				o.KeyCode == Enum.KeyCode.E
				or o.KeyCode == Enum.KeyCode.Space
				or o.KeyCode == Enum.KeyCode.LeftShift
				or o.KeyCode == Enum.KeyCode.RightShift
				or o.KeyCode == Enum.KeyCode.LeftControl
			then
				return
			end
			k.held[o.KeyCode] = true
		end)
		k.inputEnded = UserInputService.InputEnded:Connect(function(o)
			k.held[o.KeyCode] = nil
		end)
		k.mouseInput = UserInputService.InputChanged:Connect(function(o)
			if o.UserInputType == Enum.UserInputType.MouseMovement and gT == k then
				k.cameraYaw = k.cameraYaw - o.Delta.X * 0.0025
				k.cameraPitch = math.clamp(k.cameraPitch - o.Delta.Y * 0.0025, -1.25, 1.15)
			end
		end)
		pcall(function()
			RunService:BindToRenderStep("ChairBypassCamera", Enum.RenderPriority.Camera.Value + 10, function()
				if gT ~= k or not T.Parent then
					return
				end
				local o = workspace.CurrentCamera
				local P = CFrame.fromOrientation(k.cameraPitch, k.cameraYaw, 0)
				local w = T.Position + Vector3.new(0, 2, 0)
				local F = P:VectorToWorldSpace(Vector3.new(0, 0, -1))
				o.CameraType = Enum.CameraType.Scriptable
				o.CFrame = CFrame.lookAt(w, w + F)
				UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
			end)
		end)
		k.movement = RunService.Heartbeat:Connect(function()
			if gT ~= k or not T.Parent then
				return
			end
			for o, T in ipairs(o:GetDescendants()) do
				if T:IsA("BasePart") then
					T.CanCollide = false
				end
			end
			local P = workspace.CurrentCamera
			local w = P.CFrame
			local F = Vector3.new(w.LookVector.X, 0, w.LookVector.Z)
			local A = Vector3.new(w.RightVector.X, 0, w.RightVector.Z)
			if F.Magnitude > 0.01 then
				F = F.Unit
			else
				F = Vector3.new(0, 0, -1)
			end
			if A.Magnitude > 0.01 then
				A = A.Unit
			else
				A = Vector3.new(1, 0, 0)
			end
			local d = Vector3.zero
			if k.held[Enum.KeyCode.W] then
				d = d + F
			end
			if k.held[Enum.KeyCode.S] then
				d = d - F
			end
			if k.held[Enum.KeyCode.D] then
				d = d + A
			end
			if k.held[Enum.KeyCode.A] then
				d = d - A
			end
			if d.Magnitude == 0 and Humanoid.MoveDirection.Magnitude > 0 then
				local o = Humanoid.MoveDirection
				d = F * o:Dot(F) + A * o:Dot(A)
			end
			if k.held[Enum.KeyCode.Space] then
				d = d + Vector3.yAxis
			end
			if k.held[Enum.KeyCode.LeftShift] then
				d = d - Vector3.yAxis
			end
			local C = math.asin(math.clamp(w.LookVector.Y, -1, 1))
			if d.Magnitude > 0 then
				local o = d.Unit
				local k = o * math.sin(C) + Vector3.new(0, math.cos(C), 0) * o.Magnitude
				local P = Vector3.new(o.X, 0, o.Z) + Vector3.new(0, math.sin(C), 0)
				if P.Magnitude > 0.01 then
					T.AssemblyLinearVelocity = P.Unit * Options.ArchiveChairFlySpeed.Value
				else
					T.AssemblyLinearVelocity = Vector3.zero
				end
			else
				T.AssemblyLinearVelocity = Vector3.zero
			end
			T.AssemblyAngularVelocity = Vector3.zero
		end)
		return true
	end
	local function startChairFly()
		StopChairBypass()
		if activateChairBypass() then
			UiLibrary:Notify({
				["Title"] = "Chair anticheat bypass",
				["Description"] = "Bypass active, prompts are not able to be used while active, press ctrl and then space or turn off the toggle to stop it",
				["Time"] = 3,
			})
			return
		end
		local o
		local k = {}
		o = RunService.Heartbeat:Connect(function()
			local P = (Toggles.ArchiveChairFly and Toggles.ArchiveChairFly.Value)
				or (Toggles.StairwellChairFly and Toggles.StairwellChairFly.Value)
			if not P or gT ~= k then
				o:Disconnect()
				return
			end
			local w = Character and Character:FindFirstChild("HumanoidRootPart")
			if not w then
				return
			end
			local F = findNearbyOfficeChair()
			if not F then
				return
			end
			local A = F:FindFirstChild("Collider") or F.PrimaryPart or F:FindFirstChildWhichIsA("BasePart")
			if A and ((w.Position - A.Position)).Magnitude < 8 then
				o:Disconnect()
				if P and not gT then
					activateChairBypass()
					UiLibrary:Notify({
						["Title"] = "Chair anticheat bypass",
						["Description"] = "Bypass active, prompts are not able to be used while active, press ctrl and then space or turn off the toggle to stop it",
						["Time"] = 3,
					})
				end
			end
		end)
		k.pollSeat = o
		gT = k
	end
	function updateWalkspeed()
		disconnectSpeedLoop()
		stopSpeedBypass()
		local o = isWalkspeedEnabled()
		local T = Toggles.FlyToggle ~= nil and Toggles.FlyToggle.Value == true
		if not (o or T) then
			disconnectSpeedLoop()
			stopSpeedBypass()
			return
		end
		if Options.SpeedBypassMode.Value == "Boost" then
			startAttributeWalkspeed()
		else
			startBypassWalkspeed()
			if T or (o and Options.Walkspeed.Value ~= 16) then
				setupSpeedBypass()
			end
		end
	end
	Toggles.WalkspeedEnabled:OnChanged(updateWalkspeed)
	Toggles.FlyToggle:OnChanged(function()
		if Toggles.FlyToggle.Value then
			updateWalkspeed()
			updateFly()
		else
			stopFly()
			updateWalkspeed()
		end
	end)
	Toggles.RemoveAcceleration:OnChanged(function(o)
		for T, k in pairs(PartProperties) do
			T.CustomPhysicalProperties = o and CustomPhysics or k
		end
	end)
	Toggles.EnableCharacterJump:OnChanged(function(o)
		if Character then
			Character:SetAttribute("CanJump", o and true or OldJump)
		end
	end)
	Toggles.EnableCharacterSlide:OnChanged(function(o)
		if Character then
			Character:SetAttribute("CanSlide", o and true or OldSlide)
		end
	end)
	NoclipConnection = nil
	NoclipParts = {}
	local function collectNoclipParts()
		TableClear(NoclipParts)
		if not Character then
			return
		end
		for o, T in Character:GetDescendants() do
			if T:IsA("BasePart") then
				table.insert(NoclipParts, T)
			end
		end
		if CharacterCollisionPart then
			table.insert(NoclipParts, CharacterCollisionPart)
			local o = CharacterCollisionPart:FindFirstChild("CollisionCrouch")
			if o then
				table.insert(NoclipParts, o)
			end
		end
		local o = Character:FindFirstChild("CollisionClone")
		if o then
			table.insert(NoclipParts, o)
			local T = o:FindFirstChild("CollisionCrouch")
			if T then
				table.insert(NoclipParts, T)
			end
		end
	end
	local function setNoclipPartsCollision(o)
		for T, k in ipairs(NoclipParts) do
			if k then
				k.CanCollide = o
			end
		end
	end
	function updateNoclip()
		if NoclipConnection then
			NoclipConnection:Disconnect()
			NoclipConnection = nil
		end
		if Toggles.Noclip.Value then
			collectNoclipParts()
			NoclipConnection = RunService.Stepped:Connect(function()
				setNoclipPartsCollision(false)
			end)
		else
			setNoclipPartsCollision(true)
		end
	end
	Toggles.Noclip:OnChanged(updateNoclip)
	MonumentParts = {}
	local function refreshEyesAndMonumentState()
		CheesyState.IsEyes = workspace:FindFirstChild("Eyes") ~= nil
			or workspace:FindFirstChild("Lookman") ~= nil
		CheesyState.IsLookman = workspace:FindFirstChild("BackdoorLookman") ~= nil
		CheesyState.IsMonument = false
		RefreshMonuments()
	end
	local function trackMonumentInRoom(o)
		local T = o:FindFirstChild("MonumentEntity", true)
		if not T then
			return
		end
		table.insert(MonumentParts, T)
		CheesyState.IsMonument = true
	end
	function RefreshMonuments()
		table.clear(MonumentParts)
		CheesyState.IsMonument = false
		if not CurrentRooms then
			return
		end
		local o = LatestRoomValue and tonumber(LatestRoomValue.Value)
		if o == nil then
			for o, T in ipairs(CurrentRooms:GetChildren()) do
				if T then
					trackMonumentInRoom(T)
				end
			end
			return
		end
		for o = math.max(0, o - 4), o, 1 do
			local T = CurrentRooms:FindFirstChild(tostring(o))
			if T then
				trackMonumentInRoom(T)
			end
		end
	end
	function GetMonumentLookAngle()
		if not HumanoidRootPart or not HumanoidRootPart.Parent then
			return nil
		end
		local o = HumanoidRootPart.Position
		local T, k = nil, math.huge
		for P, w in ipairs(MonumentParts) do
			if w and w.Parent then
				local P = nil
				if w:IsA("BasePart") then
					P = w
				else
					P = w.PrimaryPart or w:FindFirstChildWhichIsA("BasePart", true)
				end
				if P then
					local w = ((P.Position - o)).Magnitude
					if w < k then
						k = w
						T = P.Position
					end
				end
			end
		end
		if not T then
			return nil
		end
		local P = T - o
		if P.Magnitude < 0.001 then
			return nil
		end
		return math.deg(math.atan2(P.X, P.Z))
	end
	local function fireMonumentLookAngle()
		local o = GetMonumentLookAngle()
		if o == nil then
			return false
		end
		GameRemotes.MotorReplication:FireServer(o)
		return true
	end
	refreshEyesAndMonumentState()
	Connections.MonumentRoomWatcher = CurrentRooms
			and CurrentRooms.ChildAdded:Connect(function()
				task.spawn(function()
					for o = 1, 4, 1 do
						if CheesyState.IsMonument then
							return
						end
						RefreshMonuments()
						task.wait(0.5)
					end
				end)
			end)
		or nil
	workspace.ChildAdded:Connect(function(o)
		local T = o.Name
		if T == "Eyes" or T == "Lookman" then
			CheesyState.IsEyes = true
		elseif T == "BackdoorLookman" then
			CheesyState.IsLookman = true
		end
	end)
	workspace.ChildRemoved:Connect(function(o)
		local T = o.Name
		if T == "Eyes" or T == "Lookman" then
			CheesyState.IsEyes = workspace:FindFirstChild("Eyes") ~= nil
				or workspace:FindFirstChild("Lookman") ~= nil
		elseif T == "BackdoorLookman" then
			CheesyState.IsLookman = workspace:FindFirstChild("BackdoorLookman") ~= nil
		end
	end)
	local ET = RunService.RenderStepped:Connect(function()
		if _Unloading then
			return
		end
		if CheesyState.InLobby then
			return
		end
		if Toggles.FOVChanger and (Toggles.FOVChanger.Value and Options.FieldOfView) then
			CurrentCamera.FieldOfView = Options.FieldOfView.Value
		end
		if PlayerGui and not CheesyState.SurgeFrame then
			local o = PlayerGui:FindFirstChild("SurgeVignette", true)
			if o then
				CheesyState.SurgeFrame = o
				if Toggles.RemoveSurge and Toggles.RemoveSurge.Value then
					o.Name = "SurgeVignette_Disabled"
				end
			end
		end
		local o = Toggles.BypassMonument and (Toggles.BypassMonument.Value and CheesyState.IsMonument)
		if o then
			fireMonumentLookAngle()
		else
			local o = (Toggles.BypassEyes.Value and CheesyState.IsEyes)
				or (Toggles.BypassLookman.Value and CheesyState.IsLookman)
			if o then
				local o = CurrentFloor
				if o == "Fools" or o == "OldHotel" then
					GameRemotes.MotorReplication:FireServer(
						0,
						(CheesyState.SpoofOffset == 200 and 65 or -65),
						0,
						false
					)
				else
					GameRemotes.MotorReplication:FireServer(-650)
				end
			end
		end
	end)
	TPTranspParts = {}
	local function collectThirdPersonParts()
		TableClear(TPTranspParts)
		if not Character then
			return
		end
		for o, T in Character:GetDescendants() do
			if T:IsA("BasePart") and (T.Name == "Head" or (T.Parent and T.Parent:IsA("Accessory"))) then
				table.insert(TPTranspParts, T)
			end
		end
	end
	local function refreshThirdPersonParts()
		task.wait()
		collectThirdPersonParts()
	end
	local function setThirdPersonTransparency(o)
		for T, k in ipairs(TPTranspParts) do
			if k then
				k.Transparency = o
				k.LocalTransparencyModifier = o
			end
		end
	end
	function updateThirdPerson()
		if CameraConnection then
			CameraConnection:Disconnect()
			CameraConnection = nil
		end
		if _TPCharConn then
			_TPCharConn:Disconnect()
			_TPCharConn = nil
		end
		collectThirdPersonParts()
		if Character then
			_TPCharConn = Character.ChildAdded:Connect(refreshThirdPersonParts)
		end
		local o = RaycastParams.new()
		o.FilterType = Enum.RaycastFilterType.Exclude
		CameraConnection = RunService.RenderStepped:Connect(function()
			if _Unloading then
				return
			end
			if not Character then
				return
			end
			o.FilterDescendantsInstances = { Character }
			if Options.ThirdPersonOffsetX and (Options.ThirdPersonOffsetY and Options.ThirdPersonOffsetZ) then
				local T = CFrame.new(
					Options.ThirdPersonOffsetX.Value,
					Options.ThirdPersonOffsetY.Value,
					Options.ThirdPersonOffsetZ.Value
				)
				if Toggles.ThirdPerson.Value then
					local k = ((CurrentCamera.CFrame * T)).Position - CurrentCamera.CFrame.Position
					local P = workspace:Spherecast(CurrentCamera.CFrame.Position, 0.2, k, o)
					if Toggles.ThirdPersonWallCheck.Value and (P and P.Instance.CanCollide) then
						local o = CurrentCamera.CFrame.Position + k.Unit * P.Distance
						CurrentCamera.CFrame = CFrame.new(o, o + CurrentCamera.CFrame.LookVector)
					else
						CurrentCamera.CFrame = CurrentCamera.CFrame * T
					end
				end
			end
			for o, T in ipairs(TPTranspParts) do
				T.Transparency = Toggles.ThirdPerson.Value and 0 or 1
				T.LocalTransparencyModifier = Toggles.ThirdPerson.Value and 0 or 1
			end
		end)
	end
	CheesyState.LastCrouchFire = 0
	local function restoreGodmodeCharacter()
		if not Character or not Humanoid or not HumanoidRootPart then
			return
		end
		if
			Character:GetAttribute("GodmodeSunk") and (CurrentFloor ~= "Fools" and CurrentFloor ~= "OldHotel")
		then
			HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, 2.346, 0)
			Humanoid.HipHeight = CheesyState.OriginalHipHeight or 2.396
			Character:SetAttribute("GodmodeSunk", nil)
		end
		local o = Character:FindFirstChild("LowerTorso")
		local T = o and o:FindFirstChild("Root")
		if T and CheesyState.OriginalC1 then
			T.C1 = CheesyState.OriginalC1
		end
		CheesyState.SpoofOffset = 0
		CheesyState.SkipGodmodeCrouchForce = true
		pcall(function()
			local o = GameRemotes and GameRemotes:FindFirstChild("Crouch")
			if o then
				o:FireServer(false, false)
			end
			if Character then
				Character:SetAttribute("Crouching", false)
			end
		end)
		CheesyState.SkipGodmodeCrouchForce = false
	end
	Connections.GodmodeEnforce = RunService.RenderStepped:Connect(function()
		if _Unloading then
			return
		end
		if not Character or not Humanoid or not HumanoidRootPart then
			return
		end
		if not Toggles or not Toggles.Godmode then
			return
		end
		local o = shouldUseGodmode()
		local T = Character:GetAttribute("GodmodeSunk") and true or false
		if o and not T then
			applyGodmode()
		elseif not o and T then
			restoreGodmode()
		end
		if
			(o or (Toggles.CrouchSpoof and Toggles.CrouchSpoof.Value))
			and (GameRemotes and GameRemotes:FindFirstChild("Crouch"))
		then
			GameRemotes.Crouch:FireServer(true, true)
		end
		if
			CurrentFloor ~= "Fools"
			and (
				CurrentFloor ~= "OldHotel"
				and not (CurrentCamera and CurrentCamera:FindFirstChild("MinecartRig"))
			)
		then
			HumanoidRootPart.CanCollide = false
		end
		for o, T in Character:GetChildren() do
			if T:IsA("BasePart") then
				T.CanCollide = false
			end
		end
		local k = Character:FindFirstChild("Collision")
		local P = Character:FindFirstChild("CollisionPart")
		local w = Character:FindFirstChild("CollisionClone")
		if CurrentFloor == "OldHotel" or CurrentFloor == "Fools" then
			local T = o and (Functions.GetNearestEntity() and 200)
				or Toggles.FigureGodmodeFools and (Toggles.FigureGodmodeFools.Value and (Functions.GetNearestFigure() and 200))
				or 0
			CheesyState.SpoofOffset = T
			if k then
				k.Position = HumanoidRootPart.Position + Vector3.new(0, T, 0)
				k.CanCollide = false
			end
			if CurrentFloor == "Fools" then
				if k and k:FindFirstChild("CollisionCrouch") then
					k.CollisionCrouch.CanCollide = false
				end
				if w and w:FindFirstChild("CollisionCrouch") then
					w.CollisionCrouch.CanCollide = false
				end
			end
			HumanoidRootPart.CanCollide = not Toggles.Noclip.Value
		else
			if k then
				k.CanCollide = false
				if k:FindFirstChild("CollisionCrouch") then
					k.CollisionCrouch.CanCollide = false
				end
			end
			if w and w:FindFirstChild("CollisionCrouch") then
				local T = o or Functions.IsCrouching()
				w.CanCollide = not (Toggles.Noclip.Value or T)
				w.CollisionCrouch.CanCollide = not (Toggles.Noclip.Value or not T)
			elseif w then
				w.CanCollide = not (Toggles.Noclip.Value or o or Functions.IsCrouching())
			else
				HumanoidRootPart.CanCollide = not Toggles.Noclip.Value
			end
			local T = Character:FindFirstChild("LowerTorso")
			local F = T and T:FindFirstChild("Root")
			if F and CheesyState.OriginalC1 then
				F.C1 = CheesyState.OriginalC1 * CFrame.new(0, o and -2.346 or 0, 0)
			end
			local A = o and 2.328 or 0.18
			if k then
				k.Position = HumanoidRootPart.Position + Vector3.new(0, A, 0)
			end
			if P then
				P.Position = HumanoidRootPart.Position + Vector3.new(0, A, 0)
			end
			if
				k and (k:FindFirstChild("CollisionCrouch") and (w and w:FindFirstChild("CollisionCrouch")))
			then
				local T = o and 1.328 or -0.982
				k.CollisionCrouch.Position = HumanoidRootPart.Position + Vector3.new(0, T, 0)
				w.CollisionCrouch.CollisionGroup = k.CollisionCrouch.CollisionGroup
			end
			if w and w:FindFirstChild("CollisionCrouch") then
				w.CollisionCrouch.Position = HumanoidRootPart.Position
					+ Vector3.new(0, o and 0.75 or -0.982, 0)
			end
		end
		if w and k then
			w.CollisionGroup = k.CollisionGroup
			w.Position = HumanoidRootPart.Position + Vector3.new(0, o and 1.75 or 0.18, 0)
		end
		local F = GameRemotes and GameRemotes:FindFirstChild("Crouch")
		if F and (CharacterCollisionPart and tick() - CheesyState.LastCrouchFire > 0.1) then
			local T = o or Functions.IsCrouching()
			if Toggles.CrouchSpoof and Toggles.CrouchSpoof.Value then
				T = true
			end
			F:FireServer(T and true or false, true)
			CheesyState.LastCrouchFire = tick()
		end
		local A = o or Functions.IsCrouching()
		if Toggles.CrouchSpoof and Toggles.CrouchSpoof.Value then
			A = true
		end
		if Character:GetAttribute("Crouching") ~= A then
			Character:SetAttribute("Crouching", A)
		end
	end)
	VulnerableLastY = nil
	VulnerableNotifCooldown = 0
	Functions.IsCrouching = function()
		if CurrentFloor == "Fools" or CurrentFloor == "OldHotel" then
			return Character:GetAttribute("Crouching")
		end
		return CharacterCollisionPart.CollisionGroup == "PlayerCrouching"
	end
	ESP_FIGURE_NAMES = { ["FigureRig"] = true, ["FigureRagdoll"] = true, ["Figure"] = true }
	Functions.GetNearestFigure = function()
		local o = { ["Distance"] = math.huge, ["Object"] = nil }
		for T, k in wT.Entities do
			if k:IsA("Model") and (k.PrimaryPart and ESP_FIGURE_NAMES[k.Name]) then
				local T = LocalPlayer:DistanceFromCharacter(k.PrimaryPart.Position)
				if T < o.Distance and T < 25 then
					o.Distance = T
					o.Object = k
				end
			end
		end
		return o.Object
	end
	Phase = { ["Connection"] = nil, ["Body"] = nil, ["Parts"] = {}, ["CharConn"] = nil }
	local function collectPhaseParts()
		TableClear(Phase.Parts)
		if not Character then
			return
		end
		for o, T in Character:GetDescendants() do
			if T:IsA("BasePart") then
				table.insert(Phase.Parts, T)
			end
		end
	end
	function updatePhase()
		if Phase.Connection then
			Phase.Connection:Disconnect()
			Phase.Connection = nil
		end
		if Phase.Body then
			Phase.Body:Destroy()
			Phase.Body = nil
		end
		if Phase.CharConn then
			Phase.CharConn:Disconnect()
			Phase.CharConn = nil
		end
		if Toggles.Phase.Value then
			collectPhaseParts()
			if Character then
				Phase.CharConn = Character.ChildAdded:Connect(function()
					task.wait()
					collectPhaseParts()
				end)
			end
			Phase.Connection = RunService.Stepped:Connect(function()
				if not Character then
					return
				end
				for o, T in ipairs(Phase.Parts) do
					if T then
						T.CanCollide = false
					end
				end
				if CharacterCollisionPart then
					CharacterCollisionPart.CanCollide = false
					local o = CharacterCollisionPart:FindFirstChild("CollisionCrouch")
					if o then
						o.CanCollide = false
					end
				end
				local o = Character:FindFirstChild("CollisionClone")
				if o then
					o.CanCollide = false
					local T = o:FindFirstChild("CollisionCrouch")
					if T then
						T.CanCollide = false
					end
				end
				if HumanoidRootPart and (Humanoid and (CurrentCamera and Phase.Body)) then
					local o = Vector3.zero
					local T = Humanoid.MoveDirection
					if T.Magnitude > 0 then
						local k = CurrentCamera.CFrame.LookVector
						local P = CurrentCamera.CFrame.RightVector
						local w = T:Dot(k)
						local F = T:Dot(P)
						o = k * w + P * F
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
						o = o + Vector3.yAxis
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
						o = o - Vector3.yAxis
					end
					if o.Magnitude > 0 then
						o = o.Unit
					end
					Phase.Body.Velocity = o * 2.25
				end
			end)
			Phase.Body = Instance.new("BodyVelocity")
			Phase.Body.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
			Phase.Body.P = math.huge
			Phase.Body.Velocity = Vector3.zero
			if HumanoidRootPart then
				Phase.Body.Parent = HumanoidRootPart
			end
		elseif not Toggles.Noclip.Value then
			collectNoclipParts()
			setNoclipPartsCollision(true)
		end
	end
	Toggles.Phase:OnChanged(updatePhase)
	Toggles.AnticheatManipulation:OnChanged(function(o)
		if AnticheatConnection then
			AnticheatConnection:Disconnect()
			AnticheatConnection = nil
		end
		if o then
			AnticheatConnection = RunService.Heartbeat:Connect(function()
				if _Unloading then
					return
				end
				if not Character or not HumanoidRootPart then
					return
				end
				local o = LocalPlayer:GetAttribute("CurrentFloor") or ""
				if o ~= "Fools" and o ~= "OldHotel" then
					Character:PivotTo(Character:GetPivot() * CFrame.new(0, 0, 750))
				end
			end)
		end
	end)
	local Pd = {
		["Connection"] = nil,
		["LastFire"] = 0,
		["Debounce"] = false,
		["Looted"] = {},
		["Blacklist"] = {
			["HidePrompt"] = true,
			["RiftPrompt"] = true,
			["StarRiftPrompt"] = true,
			["InteractPrompt"] = true,
			["ClimbPrompt"] = true,
			["DonatePrompt"] = true,
			["DialoguePrompt"] = true,
			["RevivePrompt"] = true,
			["EnterPrompt"] = true,
			["AnimatePrompt"] = true,
			["ToolEventPrompt"] = true,
			["Prompt"] = true,
			["PropPrompt"] = true,
		},
	}
	AutoInteractSkipNames = {
		["Pizza"] = true,
		["Donut"] = true,
		["PaperPlane"] = true,
		["PaperPlanePickup"] = true,
		["GweenSodaPack"] = true,
		["BottleCrate"] = true,
		["DinkyLamp"] = true,
		["JerryCan"] = true,
		["HoneyPot"] = true,
		["RiftJar"] = true,
		["BoxingGloves"] = true,
		["Green_Herb"] = true,
		["BrokenMonitor"] = true,
		["SecretCD"] = true,
		["Drakobloxxer"] = true,
		["GrumbleRig"] = true,
		["Snare"] = true,
		["GiggleCeiling"] = true,
		["WaterPump"] = true,
		["TimerLever"] = true,
		["VineGuillotine"] = true,
		["StardustPickup"] = true,
		["GoldPile"] = true,
		["ElectricalKeyObtain"] = true,
		["LiveBreakerPolePickup"] = true,
		["LibraryHintPaper"] = true,
		["LiveHintBook"] = true,
	}
	HidingSpotNames = {
		["Wardrobe"] = true,
		["Backdoor_Wardrobe"] = true,
		["Toolshed"] = true,
		["RetroWardrobe"] = true,
		["Wardrobe-FOOLS26"] = true,
		["Locker_Large"] = true,
		["Rooms_Locker"] = true,
		["Rooms_Locker_Fridge"] = true,
		["Bed"] = true,
		["Double_Bed"] = true,
		["CircularVent"] = true,
		["Dumpster"] = true,
	}
	LockPromptNames = {
		["UnlockPrompt"] = true,
		["SkullPrompt"] = true,
		["LockPrompt"] = true,
		["ThingToEnable"] = true,
		["FusesPrompt"] = true,
	}
	local function processAutoInteractPrompt(o)
		if o and o.Parent then
			if not o.Enabled then
				Pd.Looted[o] = nil
			end
			if not Options.AutoInteractIgnoreList.Value["Archives Lockers"] then
				if
					o.Parent.Name:match("^HidingSpot%d+$")
					and (
						o.Name == "InteractPrompt"
						and (o.ActionText == "Loot" and (o.Enabled and not Pd.Debounce))
					)
				then
					if not Pd.Looted[o] then
						Pd.Looted[o] = true
						Functions.ForceFirePrompt(o)
					end
					return
				end
			end
		end
		if Pd.Blacklist[o.Name] then
			return
		end
		if
			o:FindFirstAncestor("ArchivesWaitingSeats")
			or o:FindFirstAncestor("ArchivesTrashcan")
			or o:FindFirstAncestor("ArchivesOfficeChair")
			or o:FindFirstAncestor("PrincipalChair")
			or o:FindFirstAncestor("Vendor_ShakelightVendingMachine")
			or o:FindFirstAncestor("ArchivesTerminal")
			or o:FindFirstAncestor("Regal_Chair")
			or o:FindFirstAncestor("Regal_Couch")
			or o:FindFirstAncestor("ArchivesLargePrinter")
			or o:FindFirstAncestor("ForgetMeNotVineDoors")
			or o:FindFirstAncestor("StairwellTerminal")
			or o:FindFirstAncestor("StairwellOfficeChair")
			or o:FindFirstAncestor("WaitingSeats")
			or o:FindFirstAncestor("MeldChord")
			or o:FindFirstAncestor("StemsEntity")
			or o:FindFirstAncestor("NoiseTV")
			or o:FindFirstAncestor("Stems" .. LocalPlayer.Name)
		then
			return
		end
		local T = CurrentRooms
			and (
				CurrentRooms:FindFirstChild("50")
				and (CurrentRooms:FindFirstChild("50")):FindFirstChild("Door")
			)
		if T and o:FindFirstAncestor("Door") == T then
			return
		end
		if not o or not o.Parent then
			return
		end
		if Pd.Debounce then
			return
		end
		local k = LockPromptNames[o.Name]
			or (o.Parent and o.Parent:GetAttribute("Locked") == true)
			or (
				o.Parent
				and (
					o.Parent.Parent
					and (o.Parent.Parent.Name == "Locker_Small_Locked" and o.Name == "ActivateEventPrompt")
				)
			)
		if k then
			if Options.AutoInteractIgnoreList.Value.Locks then
				return
			end
			local o = {
				"Key",
				"GeneratorFuse",
				"KeyBackdoor",
				"KeyElectrical",
				"KeyIron",
				"Lockpick",
				"SkeletonKey",
				"Shears",
				"Multitool",
			}
			local T = { "Key", "GeneratorFuse", "KeyElectrical", "KeyIron" }
			local k = false
			for o, T in ipairs(o) do
				if Functions.HasItem(T, true) then
					k = true
					break
				end
			end
			for o, T in ipairs(T) do
				if Functions.HasItem(T) then
					k = true
					break
				end
			end
			if not k then
				return
			end
		end
		if HidingSpotNames[o.Parent.Name] then
			return
		end
		local P = Options.AutoInteractIgnoreList.Value
		if P then
			local T = o.Parent
			for o = 1, 3, 1 do
				if T and (AutoInteractSkipNames[T.Name] and P[T.Name]) then
					return
				end
				T = T and T.Parent
			end
		end
		if o.Parent.Name == "GlitchCube" and Options.AutoInteractIgnoreList.Value["Glitch Fragments"] then
			return
		end
		local w = o
		if Options.AutoInteractIgnoreList.Value.Mandrake then
			while w do
				local o = w.Name
				if o == "MandrakeLive" or o == "MandrakeHole" or o == "Mandrakes" then
					return
				end
				w = w.Parent
			end
		end
		local F = workspace:FindFirstChild("Drops")
		if F and (o:IsDescendantOf(F) and Options.AutoInteractIgnoreList.Value["Dropped Items"]) then
			return
		end
		if o.Parent.Name == "TrackLever" then
			return
		end
		if o.Name == "ActivateEventPrompt" then
			if o.ActionText == "Close" then
				return
			end
			if o.Parent.Name == "Padlock" or o.Parent.Name == "MinesAnchor" then
				return
			end
		end
		if o.Parent.Name == "LeverForGate" and o:GetAttribute("Interactions") then
			return
		end
		local A = o.Parent.Parent
		if A and (A.Name == "DoorFake" or A.Name == "FakeDoor") then
			return
		end
		if o.Parent:GetAttribute("JeffShop") then
			return
		end
		if o:GetAttribute("AutoInteractIgnore") then
			return
		end
		if o.Name == "PushPrompt" then
			return
		end
		if
			(o.Parent.Name == "LibraryHintPaper" or o.Parent.Name == "PickupItem")
			and (Functions.HasItem("LibraryHintPaper") or Functions.HasItem("LibraryHintPaperHard"))
		then
			return
		end
		Functions.ForceFirePrompt(o)
		Pd.Debounce = true
		if detectFloor() == "OldHotel" then
			task.wait()
		end
		Pd.Debounce = false
	end
	AutoInteractRoomCache = setmetatable({}, { ["__mode"] = "k" })
	function AutoInteractRoomOf(o)
		local T = o.Parent
		local k = AutoInteractRoomCache[o]
		if k and k.Parent == T then
			return k.Room
		end
		local P = workspace:FindFirstChild("CurrentRooms")
		local w = 0
		if P then
			local o = T
			local k = 0
			while o and (o ~= P and k < 64) do
				k = k + 1
				local T = o.Parent
				if T == P then
					w = tonumber(o.Name) or 0
					break
				end
				o = T
			end
		end
		AutoInteractRoomCache[o] = { ["Parent"] = T, ["Room"] = w }
		return w
	end
	Toggles.AutoInteract:OnChanged(function(o)
		if Pd.Connection then
			Pd.Connection:Disconnect()
			Pd.Connection = nil
		end
		if o then
			Pd.Connection = RunService.Heartbeat:Connect(function()
				if _Unloading then
					return
				end
				local o = Toggles and (Toggles.AutoInteract and Toggles.AutoInteract.Value)
					or Options
						and (Options.AutoInteractKeybind and Options.AutoInteractKeybind:GetState())
				if not o then
					return
				end
				local T = tick()
				if T - Pd.LastFire < 0.1 then
					return
				end
				Pd.LastFire = T
				local k = LocalPlayer:GetAttribute("CurrentRoom")
				local P = tonumber(k)
				local w = LocalPlayer.Character
				local F = w and w:FindFirstChildOfClass("Humanoid")
				local A = w and w:FindFirstChild("HumanoidRootPart")
				if not A then
					return
				end
				local d = Toggles.PromptReach and Toggles.PromptReach.Value
				local C = Options.PromptRange and Options.PromptRange.Value or 1
				local f = 4096
				for o = #_TrackedPrompts, 1, -1 do
					local T = _TrackedPrompts[o]
					if not T or not T.Parent then
						table.remove(_TrackedPrompts, o)
					else
						local o = AutoInteractRoomOf(T)
						local k = o > 0 and (P ~= nil and o ~= P)
						if not k then
							local o = T.Parent
							local k
							if o:IsA("BasePart") then
								k = o.Position
							elseif o:IsA("Model") then
								local T = o.PrimaryPart
								k = T and T.Position or (o:GetPivot()).Position
							end
							if k then
								local o = k.X - A.Position.X
								local P = k.Y - A.Position.Y
								local w = k.Z - A.Position.Z
								local F = (o * o + P * P) + w * w
								local d = (
									T:GetAttribute("MaxActivationDistance_Old") or T.MaxActivationDistance
								) + 5
								if
									F <= (d + f) * (d + f)
									and (
										(T.Enabled or T.Name == "LongPushPrompt" or T.Name == "BigPropPrompt")
										and F <= d * d
									)
								then
									task.spawn(processAutoInteractPrompt, T)
								end
							end
						end
					end
				end
			end)
		end
	end)
	function updateInfiniteJump()
		if InfiniteJumpConnection then
			InfiniteJumpConnection:Disconnect()
			InfiniteJumpConnection = nil
		end
		if not Toggles.InfiniteJumps.Value then
			return
		end
		InfiniteJumpConnection = UserInputService.InputBegan:Connect(function(o)
			if o.KeyCode == Enum.KeyCode.Space and Humanoid then
				Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end
	Toggles.InfiniteJumps:OnChanged(updateInfiniteJump)
	ESPCategories = {
		["Entities"] = {},
		["Doors"] = {},
		["Objectives"] = {},
		["Items"] = {},
		["Chests"] = {},
		["HidingSpots"] = {},
		["Ladders"] = {},
	}
	ESPBlacklist = {}
	ESPCleanup = {}
	ESPConnections = {}
	ESPDoorSet = {}
	RoomESPMap = {}
	RoomESPConnection = nil
	TRACER_CATEGORIES = { "Entities", "Doors", "Objectives", "Items", "Chests", "HidingSpots", "Ladders" }
	local function enableCategoryTracers(o)
		if not ESPLibrary or not o then
			return
		end
		for T, k in ipairs(TRACER_CATEGORIES) do
			local P = k .. "Tracers"
			if Toggles[P] and (Toggles[P].Value and TableFind(ESPCategories[k], o)) then
				ESPLibrary:SetTracersEnabled(o, true)
				break
			end
		end
	end
	function ForcePurgeESP(o)
		if not o or not ESPLibrary then
			return
		end
		pcall(function()
			for o, T in ipairs(ESPLibrary.ConnectionsTable[o] or {}) do
				if T then
					pcall(function()
						T:Disconnect()
					end)
				end
			end
			ESPLibrary.ConnectionsTable[o] = nil
			local T = ESPLibrary.Highlights and ESPLibrary.Highlights[o]
			if T then
				T:Destroy()
				ESPLibrary.Highlights[o] = nil
			end
			local k = ESPLibrary.Frames and ESPLibrary.Frames[o]
			if k then
				k:Destroy()
				ESPLibrary.Frames[o] = nil
			end
			local P = ESPLibrary.Lines and ESPLibrary.Lines[o]
			if P then
				if P[1] then
					P[1]:Destroy()
				end
				if P[2] then
					P[2]:Destroy()
				end
				ESPLibrary.Lines[o] = nil
			end
			local w = ESPLibrary.ArrowsTable and ESPLibrary.ArrowsTable[o]
			if w then
				w:Destroy()
				ESPLibrary.ArrowsTable[o] = nil
			end
			if ESPLibrary.Labels then
				ESPLibrary.Labels[o] = nil
			end
			if ESPLibrary.ColorTable then
				ESPLibrary.ColorTable[o] = nil
			end
			if ESPLibrary.TextTable then
				ESPLibrary.TextTable[o] = nil
			end
			if ESPLibrary.ElementsEnabled then
				ESPLibrary.ElementsEnabled[o] = nil
			end
			if ESPLibrary.TransparencyEnabled then
				ESPLibrary.TransparencyEnabled[o] = nil
			end
			if ESPLibrary.Objects then
				ESPLibrary.Objects[o] = nil
			end
			if ESPLibrary.TracersEnabled then
				ESPLibrary.TracersEnabled[o] = nil
			end
			for T = #ESPLibrary.TotalObjects, 1, -1 do
				if ESPLibrary.TotalObjects[T] == o then
					table.remove(ESPLibrary.TotalObjects, T)
					break
				end
			end
		end)
		pcall(function()
			ESPLibrary:SetTracersEnabled(o, false)
		end)
		RoomESPMap[o] = nil
		ESPConnections[o] = nil
		for T, k in pairs(ESPCategories or {}) do
			local P = TableFind(k, o)
			while P do
				table.remove(k, P)
				P = TableFind(k, o)
			end
		end
	end
	local function refreshRoomESP()
		if not ESPLibrary then
			return
		end
		local o = {}
		for T in pairs(RoomESPMap) do
			o[#o + 1] = T
		end
		local T = tonumber(LocalPlayer:GetAttribute("CurrentRoom"))
		for o, k in ipairs(o) do
			local P = RoomESPMap[k]
			if P then
				if ESPLibrary.ColorTable and ESPLibrary.ColorTable[k] then
					P.Color = ESPLibrary.ColorTable[k]
				end
				local o = tonumber(k:GetAttribute("ParentRoom"))
				if o == T or (ESPDoorSet[k] and o == T + 1) then
					ESPLibrary:AddESP(P)
					enableCategoryTracers(k)
				else
					ForcePurgeESP(k)
				end
			end
		end
	end
	local function watchRoomForESP()
		if RoomESPConnection then
			return
		end
		RoomESPConnection = (LocalPlayer:GetAttributeChangedSignal("CurrentRoom")):Connect(refreshRoomESP)
		table.insert(Connections, RoomESPConnection)
	end
	Functions.AddESP = function(o, T)
		local k = o.Object
		if not k then
			return
		end
		if ESPBlacklist[k] then
			return
		end
		if T then
			local T = tonumber(LocalPlayer:GetAttribute("CurrentRoom"))
			local P = tonumber(k:GetAttribute("ParentRoom"))
			if P == T or (ESPDoorSet[k] and P == T + 1) then
				ESPLibrary:AddESP(o)
				enableCategoryTracers(k)
			end
			RoomESPMap[k] = o
			watchRoomForESP()
			k.Destroying:Once(function()
				ForcePurgeESP(k)
			end)
		else
			ESPLibrary:AddESP(o)
			enableCategoryTracers(k)
		end
	end
	Functions.RemoveESP = function(o)
		RoomESPMap[o] = nil
		local T = ESPConnections[o]
		if T then
			T:Disconnect()
			ESPConnections[o] = nil
			local k = TableFind(Connections, T)
			if k then
				table.remove(Connections, k)
			end
		end
		if ESPLibrary then
			ESPLibrary:RemoveESP(o)
			ESPLibrary:SetTracersEnabled(o, false)
		end
	end
	local Cd = {
		["Door"] = true,
		["Ladder"] = true,
		["GoldPile"] = true,
		["StardustPickup"] = true,
		["KeyObtain"] = true,
		["ElectricalKeyObtain"] = true,
		["MinesGenerator"] = true,
		["FuseObtain"] = true,
		["LiveHintBook"] = true,
		["LiveBreakerPolePickup"] = true,
		["LibraryHintPaper"] = true,
		["PickupItem"] = true,
		["CringlePresent"] = true,
		["LeverForGate"] = true,
		["MinesGateButton"] = true,
		["GardenGateButton"] = true,
		["MinesAnchor"] = true,
		["WaterPump"] = true,
		["TimerLever"] = true,
		["VineGuillotine"] = true,
		["KeyObtainFake"] = true,
		["GiggleCeiling"] = true,
		["Snare"] = true,
		["GrumbleRig"] = true,
		["Drakobloxxer"] = true,
		["LiveEntityBramble"] = true,
		["Groundskeeper"] = true,
		["Figure"] = true,
		["FigureRig"] = true,
		["FigureRagdoll"] = true,
		["MandrakeLive"] = true,
		["ChestBox"] = true,
		["ChestBoxLocked"] = true,
		["Chest_Vine"] = true,
		["Toolbox"] = true,
		["Toolbox_Locked"] = true,
		["Toolshed_Small"] = true,
		["Locker_Small_Locked"] = true,
		["MouseHole"] = true,
		["Wardrobe"] = true,
		["Backdoor_Wardrobe"] = true,
		["Toolshed"] = true,
		["RetroWardrobe"] = true,
		["Wardrobe-FOOLS26"] = true,
		["Locker_Large"] = true,
		["Rooms_Locker"] = true,
		["Rooms_Locker_Fridge"] = true,
		["Bed"] = true,
		["Double_Bed"] = true,
		["CircularVent"] = true,
		["Dumpster"] = true,
		["Lighter"] = true,
		["Flashlight"] = true,
		["Lockpick"] = true,
		["Vitamins"] = true,
		["Bandage"] = true,
		["StarVial"] = true,
		["StarBottle"] = true,
		["StarJug"] = true,
		["Shakelight"] = true,
		["Straplight"] = true,
		["Bulklight"] = true,
		["Battery"] = true,
		["Candle"] = true,
		["Crucifix"] = true,
		["CrucifixWall"] = true,
		["Glowsticks"] = true,
		["SkeletonKey"] = true,
		["Candy"] = true,
		["ShieldMini"] = true,
		["ShieldBig"] = true,
		["BandagePack"] = true,
		["BatteryPack"] = true,
		["RiftCandle"] = true,
		["LaserPointer"] = true,
		["HolyGrenade"] = true,
		["Shears"] = true,
		["Smoothie"] = true,
		["Cheese"] = true,
		["Bread"] = true,
		["AlarmClock"] = true,
		["RiftSmoothie"] = true,
		["GweenSoda"] = true,
		["GlitchCube"] = true,
		["Scanner"] = true,
		["Bomb"] = true,
		["Knockbomb"] = true,
		["Nanner"] = true,
		["BigBomb"] = true,
		["SnakeBox"] = true,
		["GoldGun"] = true,
		["StopSign"] = true,
		["TipJar"] = true,
		["Lantern"] = true,
		["IronKey"] = true,
		["LotusPetal"] = true,
		["Compass"] = true,
		["LotusPetalPickup"] = true,
		["LanternLitItem"] = true,
		["KeyIron"] = true,
		["IronKeyForCrypt"] = true,
		["LotusHolder"] = true,
		["Multitool"] = true,
		["RiftJar"] = true,
		["AloeVera"] = true,
		["Donut"] = true,
		["Lotus"] = true,
		["BoxingGloves"] = true,
		["Green_Herb"] = true,
		["PaperPlane"] = true,
		["Pizza"] = true,
		["FihFlakes"] = true,
		["Leftovers"] = true,
		["PaperPlanePickup"] = true,
		["DinkyLamp"] = true,
		["BottleCrate"] = true,
		["GweenSodaPack"] = true,
		["BrokenMonitor"] = true,
		["JerryCan"] = true,
		["SallyToyObtain"] = true,
		["HoneyPot"] = true,
		["SecretCD"] = true,
		["Briefcase"] = true,
		["ArchivesTerminal"] = true,
		["StairwellTerminal"] = true,
		["StairwellFireAlarm"] = true,
		["TV_Stand"] = true,
		["StairwellScrapper"] = true,
		["SalvageScrap"] = true,
	}
	local fd = {
		["RushMoving"] = true,
		["AmbushMoving"] = true,
		["A60"] = true,
		["A120"] = true,
		["Eyes"] = true,
		["Lookman"] = true,
		["BackdoorRush"] = true,
		["BackdoorLookman"] = true,
		["Groundskeeper"] = true,
		["GloombatSwarm"] = true,
		["AR0xMBUSH"] = true,
		["RNIUSHCG=="] = true,
		["MonumentEntity"] = true,
		["GlitchRush"] = true,
		["GlitchAmbush"] = true,
		["JeffTheKiller"] = true,
		["CustomEntity"] = true,
		["FrozenAmbush"] = true,
		["SallyMoving"] = true,
		["Figure"] = true,
		["FigureRig"] = true,
		["FigureRagdoll"] = true,
		["GiggleCeiling"] = true,
		["GrumbleRig"] = true,
		["DronesStampede"] = true,
		["BashMoving"] = true,
		["Water"] = true,
		["TellerRig"] = true,
		["Scribbles"] = true,
		["Creak"] = true,
		["NoiseModel"] = true,
	}
	FT = {
		["Lighter"] = "Lighter",
		["Flashlight"] = "Flashlight",
		["Lockpick"] = "Lockpicks",
		["Vitamins"] = "Vitamins",
		["Bandage"] = "Bandage",
		["StarVial"] = "Starlight Vial",
		["StarBottle"] = "Starlight Bottle",
		["StarJug"] = "Starlight Barrel",
		["Shakelight"] = "Gummy Flashlight",
		["Straplight"] = "Straplight",
		["Bulklight"] = "Spotlight",
		["Battery"] = "Battery",
		["Candle"] = "Candle",
		["Crucifix"] = "Crucifix",
		["CrucifixWall"] = "Crucifix",
		["Glowsticks"] = "Glowstick",
		["SkeletonKey"] = "Skeleton Key",
		["Candy"] = "Candy",
		["ShieldMini"] = "Mini Shield Potion",
		["ShieldBig"] = "Big Shield Potion",
		["BandagePack"] = "Bandage Pack",
		["BatteryPack"] = "Battery Pack",
		["RiftCandle"] = "Moonlight Candle",
		["LaserPointer"] = "Laser Pointer",
		["HolyGrenade"] = "Holy Hand Grenade",
		["Shears"] = "Shears",
		["Smoothie"] = "Smoothie",
		["Cheese"] = "Cheese",
		["Bread"] = "Bread",
		["AlarmClock"] = "Alarm Clock",
		["RiftSmoothie"] = "Moonlight Smoothie",
		["GweenSoda"] = "Gween Soda",
		["GlitchCube"] = "Glitch Fragment",
		["Scanner"] = "Tablet",
		["Bomb"] = "Bomb",
		["Knockbomb"] = "Knockbomb",
		["Nanner"] = "Nanner",
		["BigBomb"] = "Big Bomb",
		["SnakeBox"] = "Hiding Box",
		["GoldGun"] = "Golden Gun",
		["StopSign"] = "Stop Sign",
		["TipJar"] = "Tip Jar",
		["Lantern"] = "Lantern",
		["IronKey"] = "Iron Key",
		["LotusPetal"] = "Lotus Petal",
		["Compass"] = "Compass",
		["LotusPetalPickup"] = "Lotus Petal",
		["LanternLitItem"] = "Lantern",
		["KeyIron"] = "Iron Key",
		["IronKeyForCrypt"] = "Iron Key",
		["LotusHolder"] = "Lotus Petal",
		["Multitool"] = "Multitool",
		["RiftJar"] = "Rift Jar",
		["AloeVera"] = "Aloe Vera",
		["Donut"] = "Donut",
		["Lotus"] = "Lotus",
		["BoxingGloves"] = "Boxing Gloves",
		["GoldPile"] = "Gold Pile",
		["PaperPlane"] = "Paper Plane",
		["PaperPlanePickup"] = "Paper Plane",
		["Pizza"] = "Pizza",
		["FihFlakes"] = "Fih Food",
		["Leftovers"] = "Lunch Box",
		["Briefcase"] = "Briefcase",
		["DinkyLamp"] = "Lamp",
		["BottleCrate"] = "Alcohol Bottles",
		["GweenSodaPack"] = "Gween Soda Pack",
		["BrokenMonitor"] = "Broken Monitor",
		["JerryCan"] = "Jerry Can",
		["SallyToyObtain"] = "Sally Toy",
		["HoneyPot"] = "Honey Pot",
		["SecretCD"] = "CD Disc",
	}
	FunctionGetDoorNumber = function(o)
		local T = tonumber(o.Parent.Name) or tonumber(o.Parent.Parent and o.Parent.Parent.Name)
		if T then
			T = T + 1
		end
		if CurrentFloor == "Mines" then
			T = (T or 0) + 100
		end
		if CurrentFloor == "Backdoor" then
			T = (T or 0) - 50
		end
		return tostring(T)
	end
	ESPToggleKeys = {
		["Entities"] = "EntitiesESP",
		["Doors"] = "DoorsESP",
		["Objectives"] = "ObjectivesESP",
		["Items"] = "ItemsESP",
		["Chests"] = "ChestsESP",
		["HidingSpots"] = "HidingSpotsESP",
		["Ladders"] = "LaddersESP",
	}
	ESPColorKeys = {
		["Entities"] = "EntitiesESPColor",
		["Doors"] = "DoorsESPColor",
		["Objectives"] = "ObjectivesESPColor",
		["Items"] = "ItemsESPColor",
		["Chests"] = "ChestsESPColor",
		["HidingSpots"] = "HidingSpotsESPColor",
		["Ladders"] = "LaddersESPColor",
	}
	function GetESPTarget(o, T)
		return o
	end
	local md
	local rd = {
		["PlaySound"] = nil,
		["ShowAchievement"] = nil,
		["ActiveItem"] = 0,
		["SoundAssets"] = nil,
		["SoundInstance"] = nil,
		["ActiveAchievement"] = nil,
		["ActiveEntity"] = 0,
	}
	local function addCategoryESP(o, T, k)
		local P = ESPToggleKeys[T]
		local w = ESPColorKeys[T]
		local F = P and Toggles[P]
		if not F or not F.Value then
			return
		end
		local A = w and Options[w]
		if not A then
			return
		end
		local d = A.Value
		local C = (Toggles.ESPShowText and Toggles.ESPShowText.Value) and k or ""
		local f = GetESPTarget(o, T)
		local m = o:GetAttribute("ParentRoom") ~= nil
		Functions.AddESP({ ["Object"] = f, ["Text"] = C, ["Color"] = d }, m)
	end
	local function removeCategoryESP(o)
		for T, k in ipairs(ESPCategories[o]) do
			Functions.RemoveESP(GetESPTarget(k, o))
		end
	end
	local function notifyFoundItem(o, k)
		if not Toggles.NotifyItems.Value then
			return
		end
		local P = Options.ItemList.Value
		if P and (next(P) ~= nil and not P[o]) then
			return
		end
		if rd.ActiveItem >= 6 then
			return
		end
		rd.ActiveItem = rd.ActiveItem + 1
		rd.PlaySound("ItemNotifySound")
		local w = Options.ItemNotifyStyle.Value
		local F = ""
		if k and k.PrimaryPart then
			F = " (" .. (math.floor(LocalPlayer:DistanceFromCharacter(k.PrimaryPart.Position) + 0.5) .. " m)")
		end
		if w == "WindUI" or w == "Obsidian" then
			UiLibrary:Notify({ ["Title"] = "An item has spawned", ["Description"] = o .. F, ["Time"] = 4 })
		else
			task.spawn(function()
				rd.ShowAchievement("An item has spawned", o, F)
			end)
		end
		if Toggles.ItemChatToggle.Value then
			Functions.SendChat(o .. (" " .. Options.ItemChatMessage.Value))
		end
		task.delay(5, function()
			rd.ActiveItem = math.max(0, rd.ActiveItem - 1)
		end)
	end
	ESP_HIDING_SPOT_NAMES = {
		["Wardrobe"] = true,
		["Backdoor_Wardrobe"] = true,
		["Toolshed"] = true,
		["RetroWardrobe"] = true,
		["Wardrobe-FOOLS26"] = true,
		["Locker_Large"] = true,
		["Rooms_Locker"] = true,
		["Rooms_Locker_Fridge"] = true,
		["Bed"] = true,
		["Double_Bed"] = true,
		["CircularVent"] = true,
		["Dumpster"] = true,
	}
	ESP_HIDING_SPOT_LABELS = {
		["Wardrobe"] = "Closet",
		["Backdoor_Wardrobe"] = "Closet",
		["Toolshed"] = "Closet",
		["RetroWardrobe"] = "Closet",
		["Wardrobe-FOOLS26"] = "Closet",
		["Locker_Large"] = "Locker",
		["Rooms_Locker"] = "Locker",
		["Rooms_Locker_Fridge"] = "Locker",
		["Bed"] = "Bed",
		["Double_Bed"] = "Double Bed",
		["CircularVent"] = "Vent",
		["Dumpster"] = "Dumpster",
	}
	ESP_OBJECTIVE_LABELS = {
		["KeyObtain"] = "Key",
		["ElectricalKeyObtain"] = "Electrical Key",
		["MinesGenerator"] = "Generator",
		["FuseObtain"] = "Fuse",
		["LiveHintBook"] = "Book",
		["LiveBreakerPolePickup"] = "Fuse Breaker",
		["LibraryHintPaper"] = "Library Paper",
		["PickupItem"] = "Library Paper",
		["CringlePresent"] = "Present",
		["LeverForGate"] = "Gate Lever",
		["MinesGateButton"] = "Gate Button",
		["GardenGateButton"] = "Gate Button",
		["MinesAnchor"] = "Anchor",
		["WaterPump"] = "Water Pump",
		["TimerLever"] = "Timer Lever",
		["VineGuillotine"] = "Vine Guillotine",
		["StairwellFireAlarm"] = "Fire Alarm",
		["TV_Stand"] = "Noise TV",
		["StairwellScrapper"] = "Stairwell Scrapper",
	}
	ESP_LABELS_ALL = {
		["KeyObtain"] = "Key",
		["ElectricalKeyObtain"] = "Electrical Key",
		["MinesGenerator"] = "Generator",
		["FuseObtain"] = "Generator Fuse",
		["LiveHintBook"] = "Book",
		["LiveBreakerPolePickup"] = "Fuse Breaker",
		["LibraryHintPaper"] = "Library Paper",
		["PickupItem"] = "Library Paper",
		["CringlePresent"] = "Present",
		["LeverForGate"] = "Gate Lever",
		["MinesGateButton"] = "Gate Button",
		["GardenGateButton"] = "Gate Button",
		["MinesAnchor"] = "Anchor",
		["WaterPump"] = "Water Pump",
		["TimerLever"] = "Timer Lever",
		["VineGuillotine"] = "Vine Guillotine",
		["ChestBox"] = "Chest",
		["ChestBoxLocked"] = "Locked Chest",
		["Toolbox"] = "Toolbox",
		["Toolbox_Locked"] = "Locked Toolbox",
		["Chest_Vine"] = "Vine Chest",
		["Toolshed_Small"] = "Toolshed",
		["Locker_Small_Locked"] = "Locked Locker",
		["MouseHole"] = "Mouse",
		["GoldPile"] = "Gold",
		["StardustPickup"] = "Stardust",
	}
	RetireESP = function(o)
		if not o then
			return
		end
		ESPBlacklist[o] = true
		pcall(function()
			Functions.RemoveESP(o)
		end)
		for T, k in pairs(ESPCategories or {}) do
			local P = TableFind(k, o)
			if P then
				table.remove(k, P)
			end
		end
	end
	local function processESPObject(o)
		if not o or not o.Parent then
			return
		end
		if ESPBlacklist[o] then
			return
		end
		if not Cd[o.Name] and (not fd[o.Name] and not o.Name:match("^HidingSpot%d+$")) then
			return
		end
		local T = o.Name
		if T == "Door" and not o:GetAttribute("ESPDelayed") then
			o:SetAttribute("ESPDelayed", true)
			task.spawn(function()
				task.wait(0.25)
				processESPObject(o)
			end)
			return
		end
		local k, P
		if T == "Door" and (o.Parent and tonumber(o.Parent.Name)) then
			k = "Doors"
			local T = {}
			for o, k in o:GetChildren() do
				if k.Name == "Door" and k:IsA("BasePart") then
					table.insert(T, k)
				end
			end
			if #T == 0 then
				return
			end
			local w = FunctionGetDoorNumber(o)
			P = "Door " .. w
			if CurrentFloor == "Archives" then
				local T = o:FindFirstChild("Sign")
				local k = T and T:FindFirstChild("Stinker")
				if k and (k:IsA("TextLabel") and k.Text ~= "") then
					P = "Door " .. k.Text
				end
			end
			if o:GetAttribute("Opened") == true then
				P = P .. " (Opened)"
			elseif o.Parent then
				local T = o.Parent
				if T:GetAttribute("RequiresKey") == true or T:GetAttribute("RequiresGenerator") == true then
					P = P .. " (Locked)"
				end
			end
			if CurrentFloor == "OldHotel" then
				o:SetAttribute("ParentRoom", tonumber(o.Parent.Name))
				table.insert(ESPCategories.Doors, o)
				ESPDoorSet[o] = true
				addCategoryESP(o, "Doors", P)
				if not ESPCleanup[o] then
					ESPCleanup[o] = o.Destroying:Once(function()
						Functions.RemoveESP(o)
						ESPCleanup[o] = nil
					end)
				end
			else
				local k
				if #T == 2 then
					local P = Instance.new("Model")
					P.Name = "HighlightModel"
					(Instance.new("Humanoid", P)).Name = "HighlightHumanoid"
					P:SetAttribute("ParentRoom", tonumber(o.Parent.Name))
					for T, k in ipairs(T) do
						local w = Instance.new("Part", P)
						w.Transparency = 0.999
						w.Size = k.Size
						w.CanCollide = false
						w.CFrame = k.CFrame
						w.Name = "HighlightPart"
						w.Material = Enum.Material.Glass
						w:SetAttribute("ParentRoom", tonumber(o.Parent.Name))
						local F = Instance.new("WeldConstraint", w)
						F.Part0 = w
						F.Part1 = k
						F.Enabled = true
					end
					P.Parent = workspace
					k = P
				else
					local P = T[1]
					k = Instance.new("Part")
					k.Transparency = 0.999
					k.Size = P.Size
					k.CanCollide = false
					k.CFrame = P.CFrame
					k.Name = "HighlightPart"
					k.Material = Enum.Material.Glass
					k:SetAttribute("ParentRoom", tonumber(o.Parent.Name))
					local w = Instance.new("WeldConstraint", k)
					w.Part0 = k
					w.Part1 = P
					w.Enabled = true
					(Instance.new("Humanoid", o)).Name = "HighlightHumanoid"
					k.Parent = workspace
				end
				table.insert(ESPCategories.Doors, k)
				ESPDoorSet[k] = true
				addCategoryESP(k, "Doors", P)
				if not ESPCleanup[k] then
					ESPCleanup[k] = o.Destroying:Once(function()
						Functions.RemoveESP(k)
						ESPCleanup[k] = nil
					end)
				end
			end
			local F = tick()
			local A = RunService.Heartbeat:Connect(function()
				if _Unloading then
					return
				end
				if o:FindFirstChild("Door") and o:FindFirstChild("ClientOpen") then
					if
						Options
						and (
							Options.DoorReachDistance
							and (
								LocalPlayer:DistanceFromCharacter(o.Door.Position)
									< Options.DoorReachDistance.Value
								and (
									tick() - F > 0.1
									and (
										Toggles
										and (Toggles.DoorReachToggle and Toggles.DoorReachToggle.Value)
									)
								)
							)
						)
					then
						o.ClientOpen:FireServer()
						F = tick()
					end
				end
			end)
			local d = o:FindFirstChild("Door")
			if d then
				local o = d:FindFirstChild("Open")
				if o then
					o.Played:Once(function()
						A:Disconnect()
					end)
				end
			end
			o.Destroying:Once(function()
				A:Disconnect()
			end)
			return
		end
		if fd[T] then
			if T == "Water" and CurrentFloor ~= "Archives" then
				return
			end
			if T == "Water" then
				if
					o:FindFirstAncestor("Toilet")
					or o:FindFirstAncestor("ArchivesBathroomSink")
					or o:FindFirstAncestor("ArchivesFihTank")
				then
					return
				end
				if o:FindFirstAncestor("WaterCup") then
					return
				end
				if o:FindFirstAncestor("DeathBackgroundYellow") then
					return
				end
				if o.Parent and (o.Parent.Name == "Parts" and o.Parent:FindFirstAncestor("CurrentRooms")) then
					return
				end
				if o:IsDescendantOf(LocalPlayer:WaitForChild("Backpack")) then
					return
				end
				table.insert(ESPCategories.Entities, o)
				addCategoryESP(o, "Entities", "Electric Puddle")
				md(o)
				return
			end
			if not o:IsA("Model") then
				return
			end
			task.spawn(function()
				while not o.PrimaryPart and o.Parent do
					for T, k in o:GetChildren() do
						if k:IsA("BasePart") then
							o.PrimaryPart = k
							break
						end
					end
					task.wait()
				end
				task.wait(0.1)
				if not o.Parent then
					return
				end
				if o.PrimaryPart and LocalPlayer:DistanceFromCharacter(o.PrimaryPart.Position) >= 10000 then
					return
				end
				if not o.PrimaryPart then
					local T = o:FindFirstChildWhichIsA("BasePart")
					if T then
						o.PrimaryPart = T
					end
				end
				if not o:FindFirstChildOfClass("Humanoid") then
					local T = Instance.new("Humanoid")
					T.Name = "HighlightHumanoid"
					T.Parent = o
				end
				local k = o.PrimaryPart
				if k then
					k.Transparency = 0.999
					k.Material = Enum.Material.Glass
				end
				table.insert(ESPCategories.Entities, o)
				if ESPLibrary and ESPLibrary.ObjectMaxDistance then
					ESPLibrary.ObjectMaxDistance[o] = 10000
				end
				if Toggles.EntitiesESP.Value then
					local k = (T == "FigureRig" or T == "FigureRagdoll") and "Figure"
						or (EntityNotifyData[T] and EntityNotifyData[T].Alias or T)
					local P = Options.EntitiesESPAllowed and Options.EntitiesESPAllowed.Value
					if not P or next(P) == nil or P[k] then
						if T == "NoiseModel" then
							task.wait(7)
							if _Unloading then
								return
							end
							if not o or not o.Parent then
								return
							end
							if not (Toggles.EntitiesESP and Toggles.EntitiesESP.Value) then
								return
							end
							local T = Options.EntitiesESPAllowed and Options.EntitiesESPAllowed.Value
							if not T or next(T) == nil or T[k] then
								Functions.AddESP(
									{
										["Object"] = o,
										["Text"] = k,
										["Color"] = Options.EntitiesESPColor.Value,
									},
									o:GetAttribute("ParentRoom") ~= nil
								)
							end
						else
							local T = o:GetAttribute("ParentRoom") ~= nil
							Functions.AddESP(
								{ ["Object"] = o, ["Text"] = k, ["Color"] = Options.EntitiesESPColor.Value },
								T
							)
						end
					end
				end
				md(o)
			end)
			return
		end
		if T == "Ladder" then
			k = "Ladders"
			P = "Ladder"
			table.insert(ESPCategories.Ladders, o)
			if CurrentFloor == "Mines" then
				addCategoryESP(o, k, P)
			end
			return
		elseif T == "GoldPile" and o:GetAttribute("GoldValue") then
			k = "Items"
			P = "Gold Pile [" .. (o:GetAttribute("GoldValue") .. "]")
		elseif T == "StardustPickup" then
			k = "Objectives"
			P = "Stardust"
		elseif T == "SalvageScrap" then
			k = "Items"
			P = "Salvage Scrap"
		elseif FT[T] and o:FindFirstChild("ModulePrompt") then
			k = "Items"
			P = FT[T]
			if not o:IsDescendantOf(LocalPlayer) and o.Parent.Name ~= "Drops" then
				notifyFoundItem(FT[T], o)
			end
			if T == "LotusHolder" or T == "LotusPetalPickup" then
				task.spawn(function()
					local T = o:WaitForChild("Handle", 5)
					if T then
						(T:GetPropertyChangedSignal("LocalTransparencyModifier")):Once(function()
							RetireESP(o)
						end)
					end
				end)
			end
		elseif T == "Green_Herb" then
			k = "Items"
			P = "Green Herb"
		elseif T == "ChestBox" or T == "ChestBoxLocked" then
			k = "Chests"
			P = o:GetAttribute("Locked") and "Locked Chest" or "Chest"
		elseif T == "Toolbox" or T == "Toolbox_Locked" then
			k = "Chests"
			P = o:GetAttribute("Locked") and "Locked Toolbox" or "Toolbox"
		elseif T == "Chest_Vine" then
			k = "Chests"
			P = "Vine Chest"
		elseif T == "Toolshed_Small" then
			k = "Chests"
			P = "Toolshed"
		elseif T == "Locker_Small_Locked" then
			k = "Chests"
			P = "Locked Locker"
		elseif T == "MouseHole" then
			k = "Chests"
			P = "Mouse"
		elseif ESP_HIDING_SPOT_NAMES[T] then
			k = "HidingSpots"
			P = ESP_HIDING_SPOT_LABELS[T]
			Functions.HandleHidingTransparency(o)
			table.insert(wT.HidingSpots, o)
		elseif T:match("^HidingSpot%d+$") then
			k = "HidingSpots"
			P = "Hiding Spot"
			Functions.HandleHidingTransparency(o)
			table.insert(wT.HidingSpots, o)
		elseif ESP_OBJECTIVE_LABELS[T] then
			local w = ESP_OBJECTIVE_LABELS
			k = "Objectives"
			P = w[T]
			if T == "KeyObtain" then
				task.spawn(function()
					task.wait(1)
					if _Unloading then
						return
					end
					if not o or not o.Parent then
						return
					end
					table.insert(ESPCategories[k], o)
					addCategoryESP(o, k, P)
				end)
				return
			end
			if T == "TimerLever" then
				task.spawn(function()
					task.wait(1.25)
					if _Unloading then
						return
					end
					if not o or not o.Parent then
						return
					end
					table.insert(ESPCategories[k], o)
					addCategoryESP(o, k, P)
				end)
				return
			end
			if T == "WaterPump" then
				task.spawn(function()
					local T = o:FindFirstChild("Wheel")
					if T then
						local k = T:FindFirstChild("Sound")
						if k then
							k.Played:Once(function()
								o:SetAttribute("CH_Completed", true)
								RetireESP(o)
							end)
						end
					end
				end)
			end
			if T == "MinesGateButton" or T == "GardenGateButton" then
				local k = T == "MinesGateButton" and "MinesGate" or "GardenGate"
				local P = T == "MinesGateButton" and "Main" or "Collision"
				local w = T == "MinesGateButton" and "SoundOpen" or "Sound"
				task.spawn(function()
					local T = o.Parent and o.Parent:FindFirstChild(k)
					local F = T and T:FindFirstChild(P)
					local A = F and F:FindFirstChild(w)
					if A then
						A.Played:Once(function()
							RetireESP(o)
						end)
					end
				end)
			end
		elseif T == "ArchivesTerminal" and CurrentFloor == "Archives" then
			k = "Objectives"
			P = "Archives Terminal"
		elseif T == "StairwellTerminal" and CurrentFloor == "Stairwell" then
			k = "Objectives"
			P = "Stairwell Terminal"
		else
			return
		end
		table.insert(ESPCategories[k], o)
		addCategoryESP(o, k, P)
	end
	local function getESPLabel(o, T)
		local k = o.Name
		if k == "ArchivesStorageBoxCorrect" then
			local T = o:GetAttribute("Tool_BoxID")
			return "Correct Box (" .. (tostring(T or "?") .. ")")
		end
		if k == "ArchivesPackageDeposit" or k:match("^ArchivesPackageDeposit") then
			local T = o:GetAttribute("BoxID")
			return "Deposit (" .. (tostring(T or "?") .. ")")
		end
		if T == "Doors" then
			local T = o:GetAttribute("ParentRoom")
			return "Door " .. (T and tostring(T) or "")
		end
		if T == "Items" then
			return k == "Green_Herb" and "Green Herb" or (FT[k] or k)
		end
		if T == "Ladders" then
			return "Ladder"
		end
		if T == "Entities" then
			if k == "Creak" then
				return GetCreakLabel(o)
			end
			return EntityNotifyData[k] and EntityNotifyData[k].Alias or k
		end
		if ESP_HIDING_SPOT_LABELS[k] then
			return ESP_HIDING_SPOT_LABELS[k]
		end
		return ESP_LABELS_ALL[k] or k
	end
	local function refreshCategoryESP(o)
		local T = ESPColorKeys[o]
		local k = Options[T].Value
		local P = Toggles.ESPShowText.Value
		local w = Toggles[o .. "Tracers"] and Toggles[o .. "Tracers"].Value
		local F = o == "Entities" and (Options.EntitiesESPAllowed and Options.EntitiesESPAllowed.Value)
		for T, A in ipairs(ESPCategories[o]) do
			local d = true
			if F and next(F) ~= nil then
				local o = EntityNotifyData[A.Name] and EntityNotifyData[A.Name].Alias or A.Name
				if not F[o] then
					d = false
				end
			end
			if d then
				local T = GetESPTarget(A, o)
				if T then
					local F = A:GetAttribute("ParentRoom") ~= nil
					Functions.AddESP(
						{ ["Object"] = T, ["Text"] = P and getESPLabel(A, o) or "", ["Color"] = k },
						F
					)
					if w then
						ESPLibrary:SetTracersEnabled(T, true)
					end
				end
			end
		end
	end
	HonchoBoxesConn = nil
	HonchoBoxesRooms = {}
	function HonchoStopBoxes()
		if HonchoBoxesConn then
			HonchoBoxesConn:Disconnect()
			HonchoBoxesConn = nil
		end
		table.clear(HonchoBoxesRooms)
	end
	function HonchoTrackBox(o)
		if not o or not o.Parent then
			return
		end
		if not table.find(ESPCategories.Objectives, o) then
			table.insert(ESPCategories.Objectives, o)
		end
		addCategoryESP(o, "Objectives", getESPLabel(o, "Objectives"))
		o.Destroying:Once(function()
			local T = table.find(ESPCategories.Objectives, o)
			if T then
				table.remove(ESPCategories.Objectives, T)
			end
		end)
	end
	function HonchoScanBoxesRoom(o)
		if not o or not o.Parent or HonchoBoxesRooms[o] then
			return
		end
		if not tonumber(o.Name) then
			return
		end
		HonchoBoxesRooms[o] = true
		task.spawn(function()
			task.wait(3)
			HonchoBoxesRooms[o] = nil
			if _Unloading or not o.Parent then
				return
			end
			if not (Toggles.ObjectivesESP and Toggles.ObjectivesESP.Value) then
				return
			end
			if CurrentFloor ~= "Archives" then
				return
			end
			local T = o:FindFirstChild("ArchivesHonchoRoom", true)
			if not T then
				return
			end
			local k = {}
			for o, T in ipairs(o:GetDescendants()) do
				if T.Name == "ArchivesPackageDeposit" or T.Name:match("^ArchivesPackageDeposit") then
					local o = T:GetAttribute("BoxID")
					if o ~= nil then
						k[tostring(o)] = true
						HonchoTrackBox(T)
					end
				end
			end
			if not next(k) then
				return
			end
			for T, P in ipairs(T:GetDescendants()) do
				if P.Name == "ArchivesStorageBox" then
					local T = P:GetAttribute("Tool_BoxID")
					if T ~= nil and k[tostring(T)] then
						if not P:GetAttribute("ParentRoom") then
							P:SetAttribute("ParentRoom", tonumber(o.Name))
						end
						P.Name = "ArchivesStorageBoxCorrect"
						HonchoTrackBox(P)
					end
				end
			end
		end)
	end
	if CurrentRooms then
		for o, T in ipairs(CurrentRooms:GetChildren()) do
			HonchoScanBoxesRoom(T)
		end
		if not HonchoBoxesConn then
			HonchoBoxesConn = CurrentRooms.ChildAdded:Connect(function(o)
				HonchoScanBoxesRoom(o)
			end)
		end
	end
	local function setupCategoryESP(o, T)
		local k = ESPToggleKeys[o]
		local P = ESPColorKeys[o]
		local w = o .. "Tracers"
		local F = {
			["Entities"] = Color3.fromRGB(255, 0, 0),
			["Doors"] = Color3.fromRGB(0, 255, 0),
			["Objectives"] = Color3.fromRGB(121, 31, 255),
			["Items"] = Color3.fromRGB(0, 200, 255),
			["Chests"] = Color3.fromRGB(210, 150, 100),
			["HidingSpots"] = Color3.fromRGB(255, 99, 225),
			["Ladders"] = Color3.fromRGB(255, 255, 0),
		}
		UiLibrary:Mount(Groupboxes.Visuals_ESP, "Toggle", k, { ["Title"] = T, ["Value"] = false }, function(state, spec)
			return state.Section:Toggle({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Value = state.Value,
				Callback = function(value) state:Receive(value) end,
			})
		end)
		UiLibrary:Mount(Toggles[k].Section, "ColorPicker", P, { ["Title"] = T, ["Value"] = F[o] }, function(state, spec)
			return state.Section:Colorpicker({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Default = state.Value,
				Transparency = state.Transparency,
				Callback = function(value, transparency) state:Receive(value, transparency) end,
			})
		end, Toggles[k])
		Toggles[k]:OnChanged(function(T)
			if T then
				refreshCategoryESP(o)
			else
				removeCategoryESP(o)
			end
		end)
		Options[P]:OnChanged(function(T)
			for k, P in ipairs(ESPCategories[o]) do
				local w = GetESPTarget(P, o)
				if ESPLibrary.ColorTable and ESPLibrary.ColorTable[w] then
					ESPLibrary:UpdateObjectColor(w, T)
				end
			end
		end)
	end
	Groupboxes.Visuals_ESP = WindTabs.Visuals:Section({ Title = UiLibrary:Text("ESP / Settings / ESP"), Box = true, Opened = true })
	Groupboxes.Visuals_Settings = WindTabs.Visuals:Section({ Title = UiLibrary:Text("ESP / Settings / Settings"), Box = true, Opened = true })
	setupCategoryESP("Entities", "Entities")
	UiLibrary:Mount(Groupboxes.Visuals_ESP, "Dropdown", "EntitiesESPAllowed", {
			["Title"] = "Allowed Entities",
			["Values"] = {
				"Rush",
				"Ambush",
				"A-60",
				"A-120",
				"Eyes",
				"Lookman",
				"Figure",
				"Blitz",
				"Groundskeeper",
				"Gloombat Swarm",
				"Glitch Rush",
				"Glitch Ambush",
				"Frozen Ambush",
				"Monument",
				"Jeff the Killer",
				"Sally",
				"Dupe",
				"Giggle",
				"Snare",
				"Gloombat Eggs",
				"Grumble",
				"Bash",
				"Drones",
				"Electric Puddle",
				"Teller",
				"Scribbles",
				"Noise",
				"Creak",
			},
			["Multi"] = true,
			["AllowNone"] = true,
			["Desc"] = "Only show ESP for selected entities (leave empty to show all)",
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	setupCategoryESP("Doors", "Doors")
	setupCategoryESP("Objectives", "Objectives")
	setupCategoryESP("Items", "Items")
	setupCategoryESP("Chests", "Chests")
	setupCategoryESP("HidingSpots", "Hiding Spots")
	UiLibrary:Mount(Groupboxes.Visuals_ESP, "Toggle", "PlayersESP", { ["Title"] = "Players", ["Value"] = false }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.PlayersESP.Section, "ColorPicker", "PlayersESPColor", { ["Title"] = "Players", ["Value"] = Color3.fromRGB(255, 255, 255) }, function(state, spec)
		return state.Section:Colorpicker({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Default = state.Value,
			Transparency = state.Transparency,
			Callback = function(value, transparency) state:Receive(value, transparency) end,
		})
	end, Toggles.PlayersESP)
	local id = {}
	local function refreshPlayersESP()
		for o, T in ipairs(id) do
			ESPLibrary:RemoveESP(T)
			local k = ESPCleanup[T]
			if k then
				k:Disconnect()
				ESPCleanup[T] = nil
			end
		end
		for o = #id, 1, -1 do
			id[o] = nil
		end
		if not Toggles.PlayersESP.Value then
			return
		end
		for o, T in Players:GetPlayers() do
			if T ~= LocalPlayer then
				local o = T.Character
				if o then
					local k = o:FindFirstChild("HumanoidRootPart") or o:FindFirstChildOfClass("BasePart")
					if k then
						local k = o:FindFirstChildOfClass("Humanoid")
						local P = T.Name .. (k and " [" .. (math.floor(k.Health) .. " HP]") or "")
						ESPLibrary:AddESP({
							["Object"] = o,
							["Text"] = P,
							["Color"] = Options.PlayersESPColor.Value,
						})
						local w = o.Destroying:Once(function()
							ESPLibrary:RemoveESP(o)
							ESPCleanup[o] = nil
						end)
						ESPCleanup[o] = w
						table.insert(id, o)
					end
				end
			end
		end
	end
	local function watchPlayerESP(o)
		if o == LocalPlayer then
			return
		end
		local T = o.CharacterAdded:Connect(function(T)
			task.wait(0.5)
			if Toggles.PlayersESP and (Toggles.PlayersESP.Value and T) then
				local k = T:FindFirstChild("HumanoidRootPart") or T:FindFirstChildOfClass("BasePart")
				if k then
					local k = T:FindFirstChildOfClass("Humanoid")
					local P = o.Name .. (k and " [" .. (math.floor(k.Health) .. " HP]") or "")
					ESPLibrary:AddESP({
						["Object"] = T,
						["Text"] = P,
						["Color"] = Options.PlayersESPColor.Value,
					})
					local w = T.Destroying:Once(function()
						ESPLibrary:RemoveESP(T)
						ESPCleanup[T] = nil
					end)
					ESPCleanup[T] = w
					table.insert(id, T)
				end
			end
		end)
		table.insert(Connections, T)
	end
	Toggles.PlayersESP:OnChanged(function(o)
		if o then
			refreshPlayersESP()
		else
			refreshPlayersESP()
		end
	end)
	Options.PlayersESPColor:OnChanged(function(o)
		for T, k in ipairs(id) do
			ESPLibrary:UpdateObjectColor(k, o)
		end
	end)
	Players.PlayerAdded:Connect(watchPlayerESP)
	for o, T in Players:GetPlayers() do
		if T ~= LocalPlayer then
			watchPlayerESP(T)
		end
	end
	refreshPlayersESP()
	UiLibrary:Mount(Groupboxes.Visuals_ESP, "Toggle", "ESPFade", {
			["Title"] = "ESP Fade",
			["Value"] = false,
			["Desc"] = "Enables smooth fading effect on ESP highlights",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_ESP, "Slider", "ESPFadeTime", {
			["Title"] = "Fade Time",
			["Min"] = 0,
			["Max"] = 1,
			["Value"] = 0.25,
			["Precision"] = 2,
			["Compact"] = true,
			["Suffix"] = "s",
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_ESP, "Toggle", "ESPArrowsToggle", {
			["Title"] = "Enable Arrows",
			["Value"] = false,
			["Desc"] = "Shows arrows that point to off-screen objects",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_ESP, "Slider", "ESPArrowsRadius", {
			["Title"] = "Arrow Radius",
			["Min"] = 100,
			["Max"] = 500,
			["Value"] = 250,
			["Precision"] = 0,
			["Compact"] = true,
			["Suffix"] = " px",
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	EntityPathNodes = {}
	EntityPathConns = {}
	EntityPathContainers = setmetatable({}, { ["__mode"] = "k" })
	local function isEntityPathNode(o)
		if typeof(o) ~= "Instance" then
			return false
		end
		if not (o:IsA("Folder") or o:IsA("Model")) then
			return false
		end
		return (string.lower(o.Name)):find("node") ~= nil
	end
	function ClearEntityPath()
		for o, T in ipairs(EntityPathNodes) do
			if T and T.Parent then
				pcall(function()
					T.Transparency = 1
				end)
			end
		end
		table.clear(EntityPathNodes)
		for o, T in pairs(EntityPathConns) do
			pcall(T.Disconnect, T)
		end
		table.clear(EntityPathConns)
		table.clear(EntityPathContainers)
		if Connections.EntityPathWatch then
			pcall(Connections.EntityPathWatch.Disconnect, Connections.EntityPathWatch)
			Connections.EntityPathWatch = nil
		end
		if Connections.EntityPathRooms then
			pcall(Connections.EntityPathRooms.Disconnect, Connections.EntityPathRooms)
			Connections.EntityPathRooms = nil
		end
	end
	function ApplyEntityPath(o)
		if typeof(o) ~= "Instance" then
			return
		end
		if not o:IsA("BasePart") then
			return
		end
		if o.Transparency == 0 then
			return
		end
		pcall(function()
			o.Transparency = 0
		end)
		table.insert(EntityPathNodes, o)
	end
	function WatchEntityPathContainer(o)
		if EntityPathContainers[o] then
			return
		end
		EntityPathContainers[o] = true
		for o, T in ipairs(o:GetDescendants()) do
			ApplyEntityPath(T)
		end
		EntityPathConns[o] = o.DescendantAdded:Connect(ApplyEntityPath)
	end
	function InEntityPathContainer(o)
		local T = o.Parent
		while T and T ~= CurrentRooms do
			if EntityPathContainers[T] or isEntityPathNode(T) then
				return true
			end
			T = T.Parent
		end
		return false
	end
	function RebuildEntityPath()
		ClearEntityPath()
		if not Toggles.ShowEntityPath or not Toggles.ShowEntityPath.Value then
			return
		end
		if not CurrentRooms then
			return
		end
		for o, T in ipairs(CurrentRooms:GetDescendants()) do
			if isEntityPathNode(T) then
				WatchEntityPathContainer(T)
			elseif T:IsA("BasePart") and InEntityPathContainer(T) then
				ApplyEntityPath(T)
			end
		end
		Connections.EntityPathWatch = CurrentRooms.DescendantAdded:Connect(function(o)
			if typeof(o) ~= "Instance" then
				return
			end
			if isEntityPathNode(o) then
				WatchEntityPathContainer(o)
			elseif o:IsA("BasePart") and InEntityPathContainer(o) then
				ApplyEntityPath(o)
			end
		end)
	end
	UiLibrary:Mount(Groupboxes.Visuals_ESP, "Toggle", "ShowEntityPath", {
		["Title"] = "Show Entity Path",
		["Value"] = false,
		["Desc"] = "Shows the pathfind nodes entities follow in each room",
		["Callback"] = function(o)
			RebuildEntityPath()
		end,
	}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	if Toggles.ShowEntityPath and Toggles.ShowEntityPath.Value then
		task.defer(RebuildEntityPath)
	end
	local Jd = { ["MainTab"] = nil, ["MainButton"] = nil, ["NoclipConn"] = nil }
	LobbyFlyState = {
		["Flying"] = false,
		["FlyKeyDown"] = nil,
		["FlyKeyUp"] = nil,
		["BodyGyro"] = nil,
		["BodyVelocity"] = nil,
		["Control"] = nil,
		["LastControl"] = nil,
		["Speed"] = 0,
		["SpeedCoeff"] = 1,
	}
	local function stopLobbyFly()
		if not LobbyFlyState.Flying then
			return
		end
		LobbyFlyState.Flying = false
		if LobbyFlyState.FlyKeyDown then
			LobbyFlyState.FlyKeyDown:Disconnect()
			LobbyFlyState.FlyKeyDown = nil
		end
		if LobbyFlyState.FlyKeyUp then
			LobbyFlyState.FlyKeyUp:Disconnect()
			LobbyFlyState.FlyKeyUp = nil
		end
		if LobbyFlyState.BodyGyro then
			LobbyFlyState.BodyGyro:Destroy()
			LobbyFlyState.BodyGyro = nil
		end
		if LobbyFlyState.BodyVelocity then
			LobbyFlyState.BodyVelocity:Destroy()
			LobbyFlyState.BodyVelocity = nil
		end
		local o = Character and Character:FindFirstChildOfClass("Humanoid")
		if o then
			o.PlatformStand = false
		end
		pcall(function()
			workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		end)
	end
	local function startLobbyFly()
		if LobbyFlyState.Flying then
			return
		end
		if not Character then
			return
		end
		local o = Character:FindFirstChildOfClass("Humanoid")
		if not o then
			return
		end
		local T = o.RootPart
			or Character:FindFirstChild("HumanoidRootPart")
			or Character:FindFirstChildOfClass("Part")
		if not T then
			return
		end
		stopLobbyFly()
		local k = LobbyFlyState
		k.Flying = true
		k.Control = { ["F"] = 0, ["B"] = 0, ["L"] = 0, ["R"] = 0, ["Q"] = 0, ["E"] = 0 }
		k.LastControl = { ["F"] = 0, ["B"] = 0, ["L"] = 0, ["R"] = 0, ["Q"] = 0, ["E"] = 0 }
		k.Speed = 0
		k.SpeedCoeff = (Options.LobbyFlySpeed and Options.LobbyFlySpeed.Value or 35) / 50
		local P = Instance.new("BodyGyro")
		P.P = 90000
		P.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
		P.CFrame = T.CFrame
		P.Parent = T
		local w = Instance.new("BodyVelocity")
		w.Velocity = Vector3.new(0, 0, 0)
		w.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
		w.Parent = T
		k.BodyGyro = P
		k.BodyVelocity = w
		k.FlyKeyDown = UserInputService.InputBegan:Connect(function(o, T)
			if T then
				return
			end
			local P = k.Control
			local w = k.SpeedCoeff
			if o.KeyCode == Enum.KeyCode.W then
				P.F = w
			elseif o.KeyCode == Enum.KeyCode.S then
				P.B = -w
			elseif o.KeyCode == Enum.KeyCode.A then
				P.L = -w
			elseif o.KeyCode == Enum.KeyCode.D then
				P.R = w
			elseif o.KeyCode == Enum.KeyCode.E then
				P.Q = w * 2
			elseif o.KeyCode == Enum.KeyCode.Q then
				P.E = -w * 2
			end
			pcall(function()
				workspace.CurrentCamera.CameraType = Enum.CameraType.Track
			end)
		end)
		k.FlyKeyUp = UserInputService.InputEnded:Connect(function(o, T)
			if T then
				return
			end
			local P = k.Control
			if o.KeyCode == Enum.KeyCode.W then
				P.F = 0
			elseif o.KeyCode == Enum.KeyCode.S then
				P.B = 0
			elseif o.KeyCode == Enum.KeyCode.A then
				P.L = 0
			elseif o.KeyCode == Enum.KeyCode.D then
				P.R = 0
			elseif o.KeyCode == Enum.KeyCode.E then
				P.Q = 0
			elseif o.KeyCode == Enum.KeyCode.Q then
				P.E = 0
			end
		end)
		task.spawn(function()
			repeat
				task.wait()
				if not k.Flying then
					break
				end
				local T = workspace.CurrentCamera
				o.PlatformStand = true
				local F = k.Control
				local A = k.LastControl
				local d = k.Speed
				if F.L + F.R ~= 0 or F.F + F.B ~= 0 or F.Q + F.E ~= 0 then
					d = 50
				elseif not (F.L + F.R ~= 0 or F.F + F.B ~= 0 or F.Q + F.E ~= 0) and d ~= 0 then
					d = 0
				end
				if (F.L + F.R) ~= 0 or (F.F + F.B) ~= 0 or (F.Q + F.E) ~= 0 then
					pcall(function()
						w.Velocity = (
							(T.CFrame.LookVector * (F.F + F.B))
							+ (
								(
									T.CFrame
									* (CFrame.new(F.L + F.R, (((F.F + F.B) + F.Q) + F.E) * 0.2, 0)).Position
								) - T.CFrame.Position
							)
						) * d
					end)
					A.F, A.B, A.L, A.R = F.F, F.B, F.L, F.R
				elseif (F.L + F.R) == 0 and ((F.F + F.B) == 0 and ((F.Q + F.E) == 0 and d ~= 0)) then
					pcall(function()
						w.Velocity = (
							(T.CFrame.LookVector * (A.F + A.B))
							+ (
								(
									T.CFrame
									* (CFrame.new(A.L + A.R, (((A.F + A.B) + F.Q) + F.E) * 0.2, 0)).Position
								) - T.CFrame.Position
							)
						) * d
					end)
				else
					pcall(function()
						w.Velocity = Vector3.new(0, 0, 0)
					end)
				end
				pcall(function()
					P.CFrame = T.CFrame
				end)
				k.Speed = d
			until not k.Flying
			stopLobbyFly()
		end)
	end
	function Jd.MainTab()
		if type(Jd.MainTab) ~= "function" then
			return
		end
		local o = UiLibrary:RegisterTab(WindWindow:Tab({ Title = "LobbyMain", Icon = "house" }), "LobbyMain")
		Jd.MainTab = o
		Jd.MainButton = getTabButton(o)
		local k = getTabLabel(o)
		if k then
			k.Text = "Main"
		end
		if Jd.MainButton then
			Jd.MainButton.Visible = false
		end
		local P = o:Section({ Title = UiLibrary:Text("Stuff"), Box = true, Opened = true })
		UiLibrary:Mount(P, "Button", nil, {
			["Title"] = "Free Outdoors",
			["Callback"] = function()
				local o = GameRemotes and GameRemotes:FindFirstChild("CreateElevator")
				if o then
					o:FireServer({
						["Mods"] = { "AdminPanel" },
						["Settings"] = {},
						["Destination"] = "Garden",
						["FriendsOnly"] = false,
						["MaxPlayers"] = "1",
					})
				end
			end,
		}, function(state, spec)
			return state.Section:Button({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Callback = state.Action,
			})
		end)
		UiLibrary:Mount(P, "Label", nil, {
			["Title"] = '<font size="14">This puts you into a game of outdoors, but with the admin panel modifier, meaning that it is free, but you can not get any achievements/progress.</font>',
			["DoesWrap"] = true,
		}, function(state, spec)
			return state.Section:Paragraph({
				Title = UiLibrary:Text(spec.Title or ""),
			})
		end)
		UiLibrary:TrackElement(P, P:Divider())
		UiLibrary:Mount(P, "Toggle", "AutoJoinElevator", {
				["Title"] = "Auto Join Elevator",
				["Value"] = false,
				["Desc"] = "Automatically joins the selected player's elevator.",
			}, function(state, spec)
			return state.Section:Toggle({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Value = state.Value,
				Callback = function(value) state:Receive(value) end,
			})
		end)
		UiLibrary:Mount(P, "Dropdown", "AutoJoinElevatorTarget", {
				["Title"] = "Target",
				["SpecialType"] = "Player",
				["ExcludeLocalPlayer"] = true,
				["SearchBarEnabled"] = true,
			}, function(state, spec)
			return state.Section:Dropdown({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Values = state.Values,
				Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
				Multi = state.Multi,
				AllowNone = spec.AllowNone ~= false,
				SearchBarEnabled = spec.SearchBarEnabled == true,
				Callback = function(value) state:Receive(value) end,
			})
		end)
		UiLibrary:Mount(P, "Button", nil, {
			["Title"] = "Redeem All Codes",
			["Callback"] = function()
				if CheesyState.RedeemingCodes then
					return
				end
				UiLibrary:Notify({
					["Title"] = "Redeeming " .. (#CheesyState.CodesList .. " codes."),
					["Time"] = 5,
				})
				CheesyState.RedeemingCodes = true
				for o, T in ipairs(CheesyState.CodesList) do
					local k = GameRemotes and GameRemotes:FindFirstChild("ShopCode")
					if k then
						k:FireServer(T)
					end
					task.wait(5.1)
				end
				CheesyState.RedeemingCodes = false
			end,
		}, function(state, spec)
			return state.Section:Button({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Callback = state.Action,
			})
		end)
		local w = o:Section({ Title = UiLibrary:Text("Other stuff"), Box = true, Opened = true })
		UiLibrary:Mount(w, "Toggle", "LobbyNoclip", { ["Title"] = "Noclip", ["Value"] = false }, function(state, spec)
			return state.Section:Toggle({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Value = state.Value,
				Callback = function(value) state:Receive(value) end,
			})
		end)
		Toggles.LobbyNoclip:OnChanged(function(o)
			if Jd.NoclipConn then
				Jd.NoclipConn:Disconnect()
			end
			if o and Character then
				for o, T in Character:GetDescendants() do
					if T:IsA("BasePart") then
						T.CanCollide = false
					end
				end
				Jd.NoclipConn = Character.ChildAdded:Connect(function(o)
					task.wait()
					if o:IsA("BasePart") then
						o.CanCollide = false
					end
				end)
			end
		end)
		UiLibrary:Mount(w, "Toggle", "LobbyFly", { ["Title"] = "Fly", ["Value"] = false }, function(state, spec)
			return state.Section:Toggle({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Value = state.Value,
				Callback = function(value) state:Receive(value) end,
			})
		end)
		Toggles.LobbyFly:OnChanged(function(o)
			if o then
				startLobbyFly()
			else
				stopLobbyFly()
			end
		end)
		UiLibrary:Mount(w, "Slider", "LobbyFlySpeed", {
				["Title"] = "Fly Speed",
				["Min"] = 25,
				["Max"] = 150,
				["Value"] = 35,
				["Precision"] = 0,
				["Compact"] = true,
			}, function(state, spec)
			return state.Section:Slider({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Step = 10 ^ -(spec.Precision or 0),
				Value = { Min = state.Min, Max = state.Max, Default = state.Value },
				Callback = function(value) state:Receive(value) end,
			})
		end)
		Options.LobbyFlySpeed:OnChanged(function()
			LobbyFlyState.SpeedCoeff = (Options.LobbyFlySpeed and Options.LobbyFlySpeed.Value or 35) / 50
		end)
	end
	local bd = { "Main", "Visuals", "Exploits", "Miscellaneous", "Mines", "Archives", "Settings" }
	local function refreshCurrentFloor()
		local o = detectFloor()
		if o == CurrentFloor then
			return
		end
		CurrentFloor = o
		if CheesyState.RefreshAddonFloors then
			CheesyState.RefreshAddonFloors()
		end
		if RefreshScrapKeybind then
			RefreshScrapKeybind()
		end
		local T = o == "" or o == "Lobby"
		local k = o == "Hotel" or o == "OldHotel"
		local P = o == "Mines"
		local w = o == "Garden"
		local F = o == "Fools"
		local A = o == "OldHotel"
		local d = o == "Rooms"
		local C = o == "Archives"
		local m = o == "Stairwell"
		if T then
			CheesyState.InLobby = true
			Jd.MainTab()
			if rT.Home then
				rT.Home.UIElements.Main.Visible = true
			end
			for o, T in ipairs(bd) do
				local k = rT[T]
				if k and T ~= "Settings" then
					k.UIElements.Main.Visible = false
				end
			end
			if Jd.MainButton then
				Jd.MainButton.Visible = true
			end
			if not isActiveTab(rT.Home) and not isActiveTab(Jd.MainTab) then
				rT.Home:Select(); UiLibrary.ActiveTab = rT.Home
			end
			local o = {
				"Godmode",
				"ThirdPerson",
				"Noclip",
				"FlyToggle",
				"Phase",
				"AnticheatManipulation",
				"AutoInteract",
				"ArchiveChairFly",
				"StairwellChairFly",
				"AntiElectricPuddle",
				"AntiRansom",
				"AntiScribbles",
				"NoAlmaDamage",
				"AntiDrone",
				"DisableDroneStampede",
				"RoomsAutoWalk",
				"RoomsAutoWalkIgnoreA60",
				"RoomsAutoWalkShowPathToggle",
				"RoomsAutoWalkSpoofFootsteps",
				"RoomsPickupStardust",
				"RoomsPickupGold",
				"HotelAutoWalk",
				"NoSurgeDamage",
				"RemoveSurge",
				"RemoveMandrake",
				"BypassKillbricks",
				"BypassSeekingWall",
				"BypassBanana",
				"BypassJeff",
				"BypassGiggle",
				"BypassDupe",
				"BypassEyes",
				"BypassLookman",
				"BypassGloombatEggs",
				"BypassSeekObstructions",
				"BypassVacuum",
				"BypassSnare",
				"RemoveSeekTrigger",
				"RemoveFigure",
				"RemoveFigureMines",
				"RemoveA90",
				"RemoveDread",
				"AutoRevive",
				"FigureGodmode",
				"AutoSteerMinecart",
				"AutoSolveAnchors",
				"MinecartTeleport",
				"AutoMinecart",
				"AutoHeartbeatMinigame",
				"AutoBreakerBox",
				"AutoLibraryBruteForce",
				"InfiniteItemsToggle",
				"InfiniteCrucifix",
				"ShowSeekPathToggle",
				"BreakNoiseTv",
				"AntiCrusher",
			}
			for o, T in ipairs(o) do
				local k = Toggles[T]
				if k and k.Value then
					k:SetValue(false)
				end
			end
			if not CheesyState.LobbyGuardConnection then
				CheesyState.LobbyGuardConnection = (game:GetService("RunService")).Heartbeat:Connect(
					function()
						if _Unloading then
							return
						end
						if not CheesyState.InLobby then
							return
						end
						local o = {
							"Godmode",
							"ThirdPerson",
							"Noclip",
							"FlyToggle",
							"Phase",
							"AnticheatManipulation",
							"AutoInteract",
						}
						for o, T in ipairs(o) do
							local k = Toggles[T]
							if k and k.Value then
								k:SetValue(false)
							end
						end
						if Toggles.AutoJoinElevator and Toggles.AutoJoinElevator.Value then
							local o
							if typeof(Options.AutoJoinElevatorTarget.Value) == "Instance" then
								o = Options.AutoJoinElevatorTarget.Value.Character
							elseif typeof(Options.AutoJoinElevatorTarget.Value) == "string" then
								o = ((game:GetService("Players")):FindFirstChild(
									Options.AutoJoinElevatorTarget.Value
								)).Character
							end
							local T = false
							local k = workspace:FindFirstChild("Lobby")
								and workspace.Lobby:FindFirstChild("LobbyElevators")
							if k then
								for k, P in k:GetChildren() do
									if
										o
										and (
											P
											and (
												o:GetAttribute("InGameElevator")
												and (
													P:GetAttribute("ID")
													and P:GetAttribute("ID")
														== o:GetAttribute("InGameElevator")
												)
											)
										)
									then
										T = true
										if GameRemotes and GameRemotes:FindFirstChild("ElevatorJoin") then
											GameRemotes.ElevatorJoin:FireServer(P)
										end
									end
								end
							end
							if not T and (GameRemotes and GameRemotes:FindFirstChild("ElevatorExit")) then
								GameRemotes.ElevatorExit:FireServer()
							end
						end
					end
				)
			end
			if rT.FoolsHotel then
				rT.FoolsHotel.UIElements.Main.Visible = false
			end
			if rT.Rooms then
				rT.Rooms.UIElements.Main.Visible = false
			end
			if rT.Stairwell then
				rT.Stairwell.UIElements.Main.Visible = false
			end
			return
		end
		CheesyState.InLobby = false
		if CheesyState.LobbyGuardConnection then
			CheesyState.LobbyGuardConnection:Disconnect()
			CheesyState.LobbyGuardConnection = nil
		end
		if Jd.MainTab then
			if Jd.MainButton then
				Jd.MainButton.Visible = false
			end
			if Toggles.LobbyNoclip then
				Toggles.LobbyNoclip:SetValue(false)
			end
			if Toggles.LobbyFly then
				Toggles.LobbyFly:SetValue(false)
			end
			if isActiveTab(Jd.MainTab) then
				rT.Home:Select(); UiLibrary.ActiveTab = rT.Home
			end
		end
		if CurrentFloor and CurrentFloor ~= "Lobby" then
			TableClear(ESPCleanup)
			TableClear(ESPBlacklist)
			for o, T in pairs(ESPCategories) do
				TableClear(T)
			end
			TableClear(ESPDoorSet)
			TableClear(RoomESPMap)
			for o, T in ipairs(wT.Entities) do
				if T.Name == "FakeDoor" or T.Name == "DoorFake" then
					local o = T:FindFirstChild("Hidden")
					if o then
						o.CanTouch = true
					end
					local k = T:FindFirstChild("Lock")
					if k and k:FindFirstChild("UnlockPrompt") then
						k.UnlockPrompt.Enabled = true
					end
				end
				if T.Name == "SideroomSpace" then
					local o = T:FindFirstChild("Collision")
					if o then
						o.CanCollide = false
						o.CanTouch = true
					end
				end
			end
			TableClear(wT.Entities)
			TableClear(wT.HidingSpots)
			TableClear(wT.Obstructions)
			TableClear(wT.SeekObstructions)
			TableClear(wT.SeekBridges)
			TableClear(wT.SeekNodes)
			TableClear(wT.SeekDuckBoards)
			TableClear(wT.SeekHighlights)
			TableClear(wT.EyestalkHighlights)
			TableClear(wT.PathLights)
			TableClear(wT.EventTriggers)
		end
		local r = not (k or P)
		if Options.SpamBuyCount then
			pcall(function()
				Options.SpamBuyCount:SetDisabled(r)
			end)
		end
		if Options.SpamBuyItems then
			pcall(function()
				Options.SpamBuyItems:SetDisabled(r)
			end)
		end
		if k and Options.SpamBuyItems then
			local o = { "Lockpick", "Lighter", "Flashlight", "Vitamins" }
			if A then
				table.insert(o, "Crucifix")
				table.insert(o, "Skeleton Key")
			end
			pcall(Options.SpamBuyItems.SetValues, Options.SpamBuyItems, o)
		elseif P and Options.SpamBuyItems then
			pcall(
				Options.SpamBuyItems.SetValues,
				Options.SpamBuyItems,
				{ "Straplight", "Bulklight", "BandagePack", "Lockpick" }
			)
		end
		if Toggles.ShowCrucifix then
			pcall(function()
				Toggles.ShowCrucifix:SetDisabled(not A)
			end)
		end
		if Toggles.ShowSkeletonKey then
			pcall(function()
				Toggles.ShowSkeletonKey:SetDisabled(not A)
			end)
		end
		local G = not (k or (type(o) == "string" and o:find("Fools")))
		if Toggles.AutoUnlockPadlockToggle then
			pcall(function()
				Toggles.AutoUnlockPadlockToggle:SetDisabled(G)
			end)
		end
		if Toggles.AutoBreakerBox then
			pcall(function()
				Toggles.AutoBreakerBox:SetDisabled(G)
			end)
		end
		if Toggles.AutoLibraryBruteForce then
			pcall(function()
				Toggles.AutoLibraryBruteForce:SetDisabled(G)
			end)
		end
		if Toggles.HotelAutoWalk then
			pcall(function()
				Toggles.HotelAutoWalk:SetDisabled(not k)
			end)
		end
		if Options.HotelAutoWalkMethod then
			pcall(function()
				Options.HotelAutoWalkMethod:SetDisabled(not k)
			end)
		end
		if Toggles.HotelShowPath then
			pcall(function()
				Toggles.HotelShowPath:SetDisabled(not k)
			end)
		end
		if Options.HotelPathfindTimeout then
			pcall(function()
				Options.HotelPathfindTimeout:SetDisabled(not k)
			end)
		end
		if Toggles.OrbitItems then
			pcall(function()
				Toggles.OrbitItems:SetDisabled(F)
			end)
		end
		if rT.Mines then
			rT.Mines.UIElements.Main.Visible = P
		end
		for o, T in ipairs(bd) do
			if T ~= "Mines" and T ~= "Archives" then
				local o = rT[T]
				if o then
					o.UIElements.Main.Visible = true
				end
			end
		end
		if rT.Mines and (not P and isActiveTab(rT.Mines)) then
			rT.Home:Select(); UiLibrary.ActiveTab = rT.Home
		end
		if rT.FoolsHotel then
			if F or A then
				rT.FoolsHotel.UIElements.Main.Visible = true
				if rT.FoolsHotel.TabLabelRef then
					rT.FoolsHotel.TabLabelRef.Text = F and "Fools" or "Hotel-/Fools"
				end
				local o = F
				for T, k in ipairs(Groupboxes.SubfloorsFools.CheesyElements) do
					if T <= 5 then
						k.Holder.Visible = o
					end
				end
			else
				if isActiveTab(rT.FoolsHotel) then
					rT.Home:Select(); UiLibrary.ActiveTab = rT.Home
				end
				rT.FoolsHotel.UIElements.Main.Visible = false
			end
		end
		if rT.Garden then
			if w then
				rT.Garden.UIElements.Main.Visible = true
			else
				if isActiveTab(rT.Garden) then
					rT.Home:Select(); UiLibrary.ActiveTab = rT.Home
				end
				rT.Garden.UIElements.Main.Visible = false
			end
		end
		if rT.Rooms then
			if d then
				rT.Rooms.UIElements.Main.Visible = true
			else
				if isActiveTab(rT.Rooms) then
					rT.Home:Select(); UiLibrary.ActiveTab = rT.Home
				end
				rT.Rooms.UIElements.Main.Visible = false
			end
		end
		if rT.Archives then
			if C then
				rT.Archives.UIElements.Main.Visible = true
			else
				if isActiveTab(rT.Archives) then
					rT.Home:Select(); UiLibrary.ActiveTab = rT.Home
				end
				rT.Archives.UIElements.Main.Visible = false
			end
		end
		if rT.Stairwell then
			if m then
				rT.Stairwell.UIElements.Main.Visible = true
			else
				if isActiveTab(rT.Stairwell) then
					rT.Home:Select(); UiLibrary.ActiveTab = rT.Home
				end
				rT.Stairwell.UIElements.Main.Visible = false
			end
		end
		if Toggles.LaddersESP and Toggles.LaddersESP.Value then
			for o, T in ipairs(ESPCategories.Ladders) do
				if P then
					addCategoryESP(T, "Ladders", "Ladder")
				else
					Functions.RemoveESP(T)
				end
			end
		end
	end
	function GetLatestClock()
		local o, T = nil, -1
		local k = (game:GetService("Workspace")):FindFirstChild("CurrentRooms")
		if not k then
			return nil
		end
		for k, P in ipairs(k:GetChildren()) do
			local w = tonumber(P.Name)
			if w and w >= T then
				local k = P:FindFirstChild("Assets")
				local F = k and k:FindFirstChild("ArchivesClock")
				if F then
					o, T = F, w
				end
			end
		end
		return o
	end
	function FormatClock(o)
		local T = math.floor(o / 60)
		local k = o % 60
		local P = T >= 12 and "PM" or "AM"
		local w = T % 12
		if w == 0 then
			w = 12
		end
		return string.format("%d:%02d %s", w, k, P)
	end
	Groupboxes.ArchivesMain = WindTabs.Archives:Section({ Title = UiLibrary:Text("Archives"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Toggle", "AntiDrone", {
			["Title"] = "Anti Drone",
			["Value"] = false,
			["Desc"] = "Prevents you from bumping/falling over when walking into (singular) drones",
			["Disabled"] = not hasHookMeta,
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Toggle", "DisableDroneStampede", {
			["Title"] = "Disable Drone Stampede (FE)",
			["Value"] = false,
			["Desc"] = "Disables the drone stampede from spawning FE",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.DisableDroneStampede:OnChanged(function(o)
		if o and not CheesyState.DisableDroneStampedeRunning then
			CheesyState.DisableDroneStampedeRunning = true
			task.spawn(function()
				while
					not _Unloading
					and (Toggles.DisableDroneStampede and Toggles.DisableDroneStampede.Value)
				do
					local o = GetLatestClock()
					local T = o and o:FindFirstChild("LookedAtRemote")
					if T then
						pcall(function()
							T:FireServer()
						end)
					end
					task.wait(0.5)
				end
				CheesyState.DisableDroneStampedeRunning = false
			end)
		end
	end)
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Toggle", "DroneTimer", {
			["Title"] = "Drone Stampede Timer",
			["Value"] = false,
			["Desc"] = "Notifies you 60s and 30s before the 05:00 and 09:00 drone stampede",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.DroneTimer:OnChanged(function(o)
		if o and not CheesyState.DroneTimerRunning then
			CheesyState.DroneTimerRunning = true
			task.spawn(function()
				local o = {}
				while not _Unloading and (Toggles.DroneTimer and Toggles.DroneTimer.Value) do
					local k = GetLatestClock()
					local P = k and k:FindFirstChild("Time")
					local w = P and P:FindFirstChild("TextLabel")
					local F = w and w.Text
					if F then
						local k, P = F:match("(%d+):(%d+)")
						if k and P then
							local w = tonumber(k) * 60 + tonumber(P)
							for k, P in ipairs({ 300, 540 }) do
								local F = (P - w) % 1440
								if F > 90 then
									o["h_" .. P] = nil
									o["m_" .. P] = nil
								else
									if F <= 60 and (F > 0 and not o["h_" .. P]) then
										o["h_" .. P] = true
										UiLibrary:Notify({
											["Title"] = "Drones",
											["Description"] = string.format(
												"Drone stampede in 1 hour (%s)",
												FormatClock(P)
											),
											["Time"] = 5,
										})
									end
									if F <= 30 and (F > 0 and not o["m_" .. P]) then
										o["m_" .. P] = true
										UiLibrary:Notify({
											["Title"] = "Drones",
											["Description"] = string.format(
												"Drone stampede in 30 minutes (%s)",
												FormatClock(P)
											),
											["Time"] = 5,
										})
									end
								end
							end
						end
					end
					task.wait(1)
				end
				CheesyState.DroneTimerRunning = false
			end)
		end
	end)
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Toggle", "NoAlmaDamage", {
			["Title"] = "Anti Alma",
			["Value"] = false,
			["Desc"] = "Prevents alma from ever interacting with you/you can look at her freely",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.NoAlmaDamage:OnChanged(function(o)
		if o and not CheesyState.NoAlmaDamageRunning then
			CheesyState.NoAlmaDamageRunning = true
			local function disableAlmaAggression(o)
				local T = o:WaitForChild("Config", 5)
				if not T then
					return
				end
				local k = {
					["idle_angerGain"] = 0,
					["idle_angerIndirectGain"] = 0,
					["idle_angerDecay"] = 100,
					["aggro_initialWindup"] = 9999,
					["aggro_subsequentWindups"] = 9999,
					["attack_slashCount"] = 0,
					["attack_dashSpeed"] = 0,
					["attack_hitDistance"] = 0,
					["attack_minigameLength"] = 9999,
				}
				for o, k in pairs(k) do
					local P, w = o:match("^([^_]+)_(.+)$")
					local F = T:FindFirstChild(P)
					local A = F and F:FindFirstChild(w)
					if A and A:IsA("ValueBase") then
						A.Changed:Connect(function()
							if A.Value ~= k then
								A.Value = k
							end
						end)
						A.Value = k
					end
				end
			end
			local function processAlmaModel(T)
				if T:IsA("Model") and T.Name == "Alma" then
					disableAlmaAggression(T)
				end
			end
			Connections.NoAlmaDamage = workspace.ChildAdded:Connect(processAlmaModel)
			for o, k in ipairs(workspace:GetChildren()) do
				processAlmaModel(k)
			end
		elseif not o then
			CheesyState.NoAlmaDamageRunning = false
			if Connections.NoAlmaDamage then
				Connections.NoAlmaDamage:Disconnect()
				Connections.NoAlmaDamage = nil
			end
		end
	end)
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Toggle", "AntiElectricPuddle", {
			["Title"] = "Anti Electric Puddle",
			["Value"] = false,
			["Desc"] = "Prevents you from getting damaged from electric puddles",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	local ud = {}
	local ed = nil
	local td = 0
	local function clearElectricPuddleMarkers()
		for o, T in pairs(ud) do
			if T then
				pcall(function()
					T:Destroy()
				end)
			end
		end
		table.clear(ud)
	end
	local function processElectricPuddle(o, T)
		if not o or not tonumber(o.Name) then
			return
		end
		if T ~= td then
			return
		end
		if not Toggles.AntiElectricPuddle or not Toggles.AntiElectricPuddle.Value then
			return
		end
		local k
		for P = 1, 10, 1 do
			if T ~= td then
				return
			end
			k = o:FindFirstChild("Water") or o:FindFirstChild("Water", true)
			if k then
				break
			end
			task.wait(0.3)
		end
		if not k or ud[k] then
			return
		end
		if not k:IsA("BasePart") and not k:IsA("Model") then
			return
		end
		local P = Instance.new("Part")
		P.Name = "CheesyWaterBypass"
		P.Anchored = true
		P.CanCollide = true
		P.CanTouch = false
		P.CanQuery = false
		P.Transparency = 0.25
		P.Color = Color3.fromRGB(0, 150, 255)
		P.Material = Enum.Material.ForceField
		if k:IsA("BasePart") then
			P.Size = k.Size + Vector3.new(0, 0.5, 0)
			P.CFrame = k.CFrame * CFrame.new(0, 0.25, 0)
		else
			local o, T = k:GetBoundingBox()
			P.Size = T + Vector3.new(0, 0.5, 0)
			P.CFrame = o * CFrame.new(0, 0.25, 0)
		end
		if P.Size.Y > 3 then
			P:Destroy()
			return
		end
		if T ~= td then
			P:Destroy()
			return
		end
		P.Parent = o
		ud[k] = P
	end
	Toggles.AntiElectricPuddle:OnChanged(function(o)
		td = td + 1
		local T = td
		if ed then
			ed:Disconnect()
			ed = nil
		end
		clearElectricPuddleMarkers()
		if not o then
			return
		end
		local k = workspace.CurrentRooms
		if not k then
			return
		end
		local P = tonumber(LatestRoomValue and LatestRoomValue.Value) or 0
		for o = math.max(0, P - 4), P, 1 do
			local P = k:FindFirstChild(tostring(o))
			if P then
				task.spawn(processElectricPuddle, P, T)
			end
		end
		ed = k.ChildAdded:Connect(function(o)
			task.spawn(processElectricPuddle, o, T)
		end)
	end)
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Toggle", "AntiRansom", {
			["Title"] = "Anti Ransom",
			["Value"] = false,
			["Desc"] = "Prevents ransom from attacking you even when moving",
			["Disabled"] = not (
					Executor.hookmetamethod and (Executor.newcclosure and Executor.getnamecallmethod)
				),
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Toggle", "AntiScribbles", {
			["Title"] = "No Scribbles Damage",
			["Value"] = false,
			["Desc"] = "Prevents scribbles from damaging you",
			["Disabled"] = not (
					Executor.hookmetamethod and (Executor.newcclosure and Executor.getnamecallmethod)
				),
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Toggle", "ArchiveChairFly", {
			["Title"] = "Chair Anticheat Bypass",
			["Value"] = false,
			["Desc"] = "Allows you to bypass the anticheat by flying on a chair, allowing you to noclip and fly freely, drag an office chair, then sit in it and press the 'Start Bypass' button",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Slider", "ArchiveChairFlySpeed", { ["Title"] = "Chair Speed", ["Min"] = 15, ["Max"] = 150, ["Value"] = 55, ["Precision"] = 0 }, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Groupboxes.ArchivesMain:Button({
		Title = CheesyTranslate("Start Bypass") or "Start Bypass",
		Desc = CheesyTranslate("Press this AFTER you have dragged the chair and sat in it, shift to go down and ctrl and then space to exit (or just turn off the toggle)") or "Press this AFTER you have dragged the chair and sat in it, shift to go down and ctrl and then space to exit (or just turn off the toggle)",
		Callback = function()
			if not Toggles.ArchiveChairFly.Value then
				Toggles.ArchiveChairFly:SetValue(true)
			end
			startChairFly()
		end,
	})
	Toggles.ArchiveChairFly:OnChanged(function()
		if not Toggles.ArchiveChairFly.Value then
			StopChairBypass()
		end
	end)
	local gd = nil
	local Wd = false
	local pd = {}
	local ld = {}
	UiLibrary:Mount(Groupboxes.ArchivesMain, "Toggle", "ForgetMeNotSolver", {
			["Title"] = "Auto Skip ForgetMeNot",
			["Value"] = false,
			["Desc"] = "Automatically skips the ForgetMeNot minigame",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.ForgetMeNotSolver:OnChanged(function(o)
		if gd then
			gd:Disconnect()
			gd = nil
		end
		Wd = false
		pd = {}
		ld = {}
		if not o then
			return
		end
		Wd = true
		local function getCharacterForSkip()
			return game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		end
		local function waitForFutureRoom(o)
			while Wd do
				for o = o + 1, o + 5, 1 do
					local T = workspace:FindFirstChild("CurrentRooms")
					local k = T and T:FindFirstChild(tostring(o))
					if k then
						return k
					end
				end
				task.wait(0.1)
			end
			return nil
		end
		local function fireRoomLookAtRemotes(o)
			for T = 1, 6, 1 do
				local k = o:FindFirstChild(tostring(T))
				if k then
					local o = k:FindFirstChild("LookAt")
					if o then
						pcall(function()
							o:FireServer()
						end)
					end
				end
			end
		end
		local function processVineSkipRoom(o)
			if not Wd or pd[o] then
				return
			end
			pd[o] = true
			task.wait(2)
			if not Wd or not o.Parent then
				pd[o] = nil
				return
			end
			if not o:FindFirstChild("ForgetMeNotVineDoors", true) then
				pd[o] = nil
				return
			end
			fireRoomLookAtRemotes(o)
			local F = waitForFutureRoom(tonumber(o.Name))
			if not F then
				pd[o] = nil
				return
			end
			local A = F:FindFirstChild("Door")
			if not A then
				pd[o] = nil
				return
			end
			if A:GetAttribute("Opened") == true then
				pd[o] = nil
				return
			end
			if not o:FindFirstChild(game.Players.LocalPlayer.Name, true) then
				if not ld[o] then
					ld[o] = true
					UiLibrary:Notify({
						["Title"] = "Enter the first door",
						["Description"] = "Walk through the first door to continue skipping.",
						["Time"] = 4,
					})
				end
				repeat
					task.wait()
				until o:FindFirstChild(game.Players.LocalPlayer.Name, true) or not Wd or not o.Parent
				if not Wd or not o.Parent then
					pd[o] = nil
					return
				end
			end
			if not Wd or A:GetAttribute("Opened") == true then
				pd[o] = nil
				return
			end
			local d = A:WaitForChild("Hidden", 10)
			if not d or not Wd or A:GetAttribute("Opened") == true then
				pd[o] = nil
				return
			end
			task.wait(3)
			if not Wd or not F.Parent or A:GetAttribute("Opened") == true then
				pd[o] = nil
				return
			end
			while Wd and (F.Parent and A:GetAttribute("Opened") ~= true) do
				local o = getCharacterForSkip()
				if o then
					if d:IsA("BasePart") then
						o:PivotTo(d.CFrame)
					elseif d:IsA("Model") then
						o:PivotTo(d:GetPivot())
					end
				end
				pcall(function()
					A.ClientOpen:Fire()
				end)
				pcall(function()
					A.ClientOpen:FireServer()
				end)
				task.wait()
			end
			if Wd and A:GetAttribute("Opened") == true then
				local T = getCharacterForSkip()
				if T then
					T:PivotTo(CFrame.new(0, -120, 0))
					T:PivotTo(CFrame.new(0, -120, 0))
					T:PivotTo(CFrame.new(0, -120, 0))
					T:PivotTo(CFrame.new(0, -120, 0))
				end
				ld[o] = nil
			end
			pd[o] = nil
		end
		local function scanVineSkipRooms()
			if not LatestRoomValue then
				return
			end
			local o = tonumber(LatestRoomValue.Value) or 0
			local T = math.max(0, o - 4)
			for o = T, o, 1 do
				if not Wd then
					return
				end
				local T = workspace:FindFirstChild("CurrentRooms")
				local k = T and T:FindFirstChild(tostring(o))
				if k and not pd[k] then
					task.spawn(processVineSkipRoom, k)
				end
			end
		end
		local d = workspace:FindFirstChild("CurrentRooms")
		if d then
			gd = d.ChildAdded:Connect(function(o)
				if not tonumber(o.Name) then
					return
				end
				task.spawn(function()
					task.wait(2)
					if Wd and o.Parent then
						task.spawn(processVineSkipRoom, o)
					end
				end)
			end)
		end
		task.spawn(function()
			while Wd do
				scanVineSkipRooms()
				task.wait(2)
			end
		end)
		scanVineSkipRooms()
	end)
	Groupboxes.StairwellMain = WindTabs.Stairwell:Section({ Title = UiLibrary:Text("Stairwell"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.StairwellMain, "Toggle", "StairwellChairFly", {
			["Title"] = "Chair Anticheat Bypass",
			["Value"] = false,
			["Desc"] = "Allows you to bypass the anticheat by flying on a chair, allowing you to noclip and fly freely, drag an office chair, then sit in it and press the 'Start Bypass' button",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.StairwellMain, "Slider", "StairwellChairFlySpeed", { ["Title"] = "Chair Speed", ["Min"] = 15, ["Max"] = 150, ["Value"] = 55, ["Precision"] = 0 }, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Groupboxes.StairwellMain:Button({
		Title = CheesyTranslate("Start Bypass") or "Start Bypass",
		Desc = CheesyTranslate("Press this AFTER you have dragged the chair and sat in it, shift to go down and ctrl and then space to exit (or just turn off the toggle)") or "Press this AFTER you have dragged the chair and sat in it, shift to go down and ctrl and then space to exit (or just turn off the toggle)",
		Callback = function()
			if not Toggles.StairwellChairFly.Value then
				Toggles.StairwellChairFly:SetValue(true)
			end
			startChairFly()
		end,
	})
	Toggles.StairwellChairFly:OnChanged(function()
		if not Toggles.StairwellChairFly.Value then
			StopChairBypass()
		end
	end)
	UiLibrary:Mount(Groupboxes.StairwellMain, "Toggle", "BreakNoiseTv", {
			["Title"] = "Break Noise TV",
			["Value"] = false,
			["Desc"] = "Breaks noise's TV when you are holding it (holy tuff)",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	BreakNoiseTvConn = nil
	BreakNoiseTvRoomsConn = nil
	NoiseTvDropHeight = 250
	local function lowerNoiseTVStand(o)
		if not o or not o:IsA("Model") then
			return
		end
		if o.Name ~= "TV_Stand" then
			return
		end
		if o:GetAttribute("LastPusherId") ~= LocalPlayer.UserId then
			return
		end
		local T = o:GetPivot()
		local k = T.Position.Y - NoiseTvDropHeight
		if T.Position.Y > k then
			o:PivotTo(CFrame.new(T.Position.X, k, T.Position.Z))
		end
	end
	function ScanNoiseTvStands()
		local o = workspace:FindFirstChild("CurrentRooms")
		if o then
			for o, T in ipairs(o:GetChildren()) do
				local k = T:FindFirstChild("Assets")
				if k then
					local o = k:FindFirstChild("TV_Stand")
					if o then
						lowerNoiseTVStand(o)
					end
				end
			end
		end
		local T = workspace:FindFirstChild("Misc")
		if T then
			for o, T in ipairs(T:GetChildren()) do
				lowerNoiseTVStand(T)
			end
		end
	end
	function StopBreakNoiseTv()
		if BreakNoiseTvConn then
			BreakNoiseTvConn:Disconnect()
			BreakNoiseTvConn = nil
		end
		if BreakNoiseTvRoomsConn then
			BreakNoiseTvRoomsConn:Disconnect()
			BreakNoiseTvRoomsConn = nil
		end
	end
	Toggles.BreakNoiseTv:OnChanged(function(o)
		StopBreakNoiseTv()
		if not o then
			return
		end
		ScanNoiseTvStands()
		local T = workspace:FindFirstChild("CurrentRooms")
		if T then
			BreakNoiseTvRoomsConn = T.ChildAdded:Connect(function()
				task.wait(0.2)
				if _Unloading then
					return
				end
				ScanNoiseTvStands()
			end)
		end
		task.spawn(function()
			while Toggles.BreakNoiseTv and (Toggles.BreakNoiseTv.Value and not _Unloading) do
				ScanNoiseTvStands()
				task.wait(1)
			end
		end)
	end)
	UiLibrary:Mount(Groupboxes.StairwellMain, "Toggle", "CreakAggressionMeter", {
			["Title"] = "Creak Aggression Meter",
			["Value"] = true,
			["Desc"] = "Shows in the ESP text the percentage of creaks aggression/before he attacks (you need esp for this)",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	function GetCreakAggressionValue(o)
		if not o then
			return nil
		end
		local T = o:FindFirstChildOfClass("Animator")
			or (o:FindFirstChild("AnimationController") and o.AnimationController:FindFirstChildOfClass(
				"Animator"
			))
			or o:FindFirstChildOfClass("AnimationController")
		if not T then
			return nil
		end
		for o, T in ipairs(T:GetPlayingAnimationTracks()) do
			if T.Name == "CreakGraph" or (T.Animation and T.Animation.Name == "CreakGraph") then
				local o, k = pcall(T.GetParameter, T, "Aggression")
				if o and typeof(k) == "number" then
					return math.clamp(k, 0, 1)
				end
			end
		end
		return nil
	end
	function GetCreakLabel(o)
		if not (Toggles.CreakAggressionMeter and Toggles.CreakAggressionMeter.Value) then
			return "Creak"
		end
		local T = GetCreakAggressionValue(o)
		local k = T and tostring(math.floor(T * 100 + 0.5)) or "--"
		return "Creak [" .. (k .. "% Aggression]")
	end
	function FindCreakModel()
		local o = workspace:FindFirstChild("LiveEntities")
		local T = o and o:FindFirstChild("Creak")
		if T and T.Parent then
			return T
		end
		for o, T in ipairs(wT and wT.Entities or {}) do
			if T and (T.Parent and T.Name == "Creak") then
				return T
			end
		end
		return nil
	end
	CreakESPLastLabel = nil
	Toggles.CreakAggressionMeter:OnChanged(function()
		CreakESPLastLabel = nil
	end)
	task.spawn(function()
		while not _Unloading do
			task.wait(0.5)
			if not (Toggles.EntitiesESP and Toggles.EntitiesESP.Value) then
				continue
			end
			if not (Toggles.ESPShowText and Toggles.ESPShowText.Value) then
				continue
			end
			if not (Toggles.CreakAggressionMeter and Toggles.CreakAggressionMeter.Value) then
				continue
			end
			local o = FindCreakModel()
			if not o then
				CreakESPLastLabel = nil
				continue
			end
			local T = GetCreakLabel(o)
			if T == CreakESPLastLabel then
				continue
			end
			CreakESPLastLabel = T
			pcall(function()
				ESPLibrary:RemoveESP(o)
			end)
			pcall(function()
				Functions.AddESP(
					{
						["Object"] = o,
						["Text"] = T,
						["Color"] = Options.EntitiesESPColor and Options.EntitiesESPColor.Value,
					},
					false
				)
			end)
		end
	end)
	UiLibrary:Mount(Groupboxes.StairwellMain, "Toggle", "AntiCrusher", {
			["Title"] = "Anti Crusher",
			["Value"] = false,
			["Desc"] = "Prevents you from getting hurt from crushers",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	AntiCrusherConn = nil
	CrusherConns = {}
	function IsCrusherUnderBasicWall(o, T)
		local k = o.Parent
		while k and k ~= T do
			if k.Name == "BasicWall" then
				return true
			end
			k = k.Parent
		end
		return false
	end
	function StripCrusherParts(o)
		if not o then
			return
		end
		for T, k in ipairs(o:GetDescendants()) do
			if k:IsA("BasePart") then
				if not IsCrusherUnderBasicWall(k, o) then
					k.CanCollide = false
					k.CanTouch = false
				end
			end
			if k.Name == "StairwellCrusher" then
				for o, T in ipairs({ "OuterTrigger", "CoreTrigger" }) do
					local P = k:FindFirstChild(T)
					if P then
						pcall(function()
							P:Destroy()
						end)
					end
				end
			end
		end
		if CrusherConns[o] then
			return
		end
		CrusherConns[o] = o.DescendantAdded:Connect(function(T)
			if T:IsA("BasePart") and not IsCrusherUnderBasicWall(T, o) then
				T.CanCollide = false
				T.CanTouch = false
			end
		end)
	end
	function ScanCrushers()
		local o = workspace:FindFirstChild("CurrentRooms")
		if not o then
			return
		end
		for o, T in ipairs(o:GetChildren()) do
			local k = T:FindFirstChild("Assets")
			if k then
				for o, T in ipairs(k:GetChildren()) do
					if T.Name:match("^StairwellCrusherContainer%d+$") then
						StripCrusherParts(T)
					end
				end
			end
		end
	end
	function StopAntiCrusher()
		if AntiCrusherConn then
			AntiCrusherConn:Disconnect()
			AntiCrusherConn = nil
		end
		for o, T in pairs(CrusherConns) do
			if T then
				pcall(function()
					T:Disconnect()
				end)
			end
			CrusherConns[o] = nil
		end
	end
	Toggles.AntiCrusher:OnChanged(function(o)
		StopAntiCrusher()
		if not o then
			return
		end
		ScanCrushers()
		AntiCrusherConn = workspace.DescendantAdded:Connect(function(o)
			if o.Name:match("^StairwellCrusherContainer%d+$") then
				task.wait(0.1)
				if _Unloading then
					return
				end
				StripCrusherParts(o)
			end
		end)
		task.spawn(function()
			while Toggles.AntiCrusher and (Toggles.AntiCrusher.Value and not _Unloading) do
				ScanCrushers()
				task.wait(1)
			end
		end)
	end)
	ScrapDroppedItemsHoldUntil = 0
	function ScrapDroppedItemsFindGrinder()
		local o = workspace:FindFirstChild("CurrentRooms")
		if not o then
			return nil
		end
		local T = LocalPlayer
			and (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
		local k, P = nil, math.huge
		for o, w in ipairs(o:GetChildren()) do
			local F = w:FindFirstChild("StairwellScrapper", true)
			if F then
				for o, w in ipairs(F:GetDescendants()) do
					if w.Name == "Grinder1" and (w:IsA("Model") or w:IsA("BasePart")) then
						local o, F = pcall(function()
							if w:IsA("Model") then
								return w:GetPivot()
							end
							return w.CFrame
						end)
						if o and F then
							local o = T and ((F.Position - T.Position)).Magnitude or 0
							if o < P then
								k, P = F, o
							end
						end
					end
				end
			end
		end
		return k
	end
	function ScrapDroppedItems()
		local o = workspace:FindFirstChild("Drops")
		if not o then
			UiLibrary:Notify({
				["Title"] = "Scrap Dropped Items",
				["Description"] = "No Drops folder found",
				["Time"] = 4,
			})
			return
		end
		local k = ScrapDroppedItemsFindGrinder()
		if not k then
			UiLibrary:Notify({
				["Title"] = "Scrap Dropped Items",
				["Description"] = "No scrapper found",
				["Time"] = 4,
			})
			return
		end
		ScrapDroppedItemsHoldUntil = tick() + 2.5
		local P = 0
		for o, T in ipairs(o:GetChildren()) do
			if T:IsA("Model") then
				if pcall(function()
					T:PivotTo(k)
				end) then
					P += 1
				end
			elseif T:IsA("BasePart") then
				if pcall(function()
					T.CFrame = k
				end) then
					P += 1
				end
			end
		end
		return P
	end
	function ScrapKeybindVisible()
		return CurrentFloor == "Stairwell"
	end
	function RefreshScrapKeybind()
		local o = Options.ScrapDroppedItemsKeybind
		if o and o.Update then
			pcall(function()
				o:Update()
			end)
		end
	end
	do
		local owner = UiLibrary:Mount(Groupboxes.StairwellMain, "Button", nil, {
		["Title"] = "Scrap Dropped Items",
		["Desc"] = "Puts all of your dropped items into a scrapper",
		["Callback"] = function()
			local o, k = pcall(ScrapDroppedItems)
			if not o then
				UiLibrary:Notify({
					["Title"] = "Scrap Dropped Items",
					["Description"] = tostring(k),
					["Time"] = 6,
				})
			end
		end,
	}, function(state, spec)
			return state.Section:Button({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Callback = state.Action,
			})
		end)
		UiLibrary:Mount(Groupboxes.StairwellMain, "KeyPicker", "ScrapDroppedItemsKeybind", {
			["Title"] = "Scrap Dropped Items",
			["Value"] = "P",
			["Mode"] = "Press",
			["SyncToggleState"] = false,
			["VisibleWhen"] = ScrapKeybindVisible,
		}, function(state, spec)
			return state.Section:Keybind({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Value = state.Value,
				Callback = function() end,
			})
		end, owner)
	end
	Groupboxes.SubfloorsRooms = WindTabs.Rooms:Section({ Title = UiLibrary:Text("Rooms"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.SubfloorsRooms, "Toggle", "RoomsAutoWalk", {
			["Title"] = "Auto Rooms",
			["Value"] = false,
			["Desc"] = "Automatically moves and hides from entities in The Rooms (stops at A-1000)",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsRooms, "Slider", "RoomsAutoWalkPathfindTimeout", { ["Title"] = "Pathfind Timeout", ["Min"] = 0.5, ["Max"] = 3, ["Value"] = 1, ["Precision"] = 1 }, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsRooms, "Toggle", "RoomsAutoWalkIgnoreA60", {
			["Title"] = "Ignore A-60",
			["Value"] = false,
			["Desc"] = "Continues to walk if A-60 spawns, enables godmode",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsRooms, "Toggle", "RoomsAutoWalkShowPathToggle", {
			["Title"] = "Show Path",
			["Value"] = false,
			["Desc"] = "Shows the current path of rooms auto-walk",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.RoomsAutoWalkShowPathToggle.Section, "ColorPicker", "RoomsAutoWalkShowPathColor", { ["Title"] = "Path", ["Value"] = Color3.fromRGB(0, 255, 0), ["Transparency"] = 0 }, function(state, spec)
		return state.Section:Colorpicker({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Default = state.Value,
			Transparency = state.Transparency,
			Callback = function(value, transparency) state:Receive(value, transparency) end,
		})
	end, Toggles.RoomsAutoWalkShowPathToggle)
	UiLibrary:Mount(Groupboxes.SubfloorsRooms, "Toggle", "RoomsAutoWalkSpoofFootsteps", {
			["Title"] = "Spoof Footsteps",
			["Value"] = false,
			["Desc"] = "Makes it appear as if your character is walking normally",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.SubfloorsRooms, Groupboxes.SubfloorsRooms:Divider())
	UiLibrary:Mount(Groupboxes.SubfloorsRooms, "Toggle", "RoomsPickupStardust", {
			["Title"] = "Pickup Stardust",
			["Value"] = false,
			["Desc"] = "Automatically pathfinds to stardust in the current room",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsRooms, "Toggle", "RoomsPickupGold", {
			["Title"] = "Pickup Gold",
			["Value"] = false,
			["Desc"] = "Automatically pathfinds to gold piles in the current room",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	local Ld, Od
	Groupboxes.SubfloorsOutdoors = WindTabs.Garden:Section({ Title = UiLibrary:Text("Outdoors"), Box = true, Opened = true })
	Groupboxes.SubfloorsMonument = WindTabs.Garden:Section({ Title = UiLibrary:Text("Monument"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.SubfloorsMonument, "Toggle", "BypassMonument", {
			["Title"] = "Anti Monument",
			["Value"] = false,
			["Desc"] = "Makes the server think you are looking at the closest monument, without turning your camera",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.BypassMonument:OnChanged(function()
		RefreshMonuments()
		fireMonumentLookAngle()
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsOutdoors, "Toggle", "NoSurgeDamage", { ["Title"] = "No Surge Damage", ["Value"] = false, ["Desc"] = "Prevents Surge from hurting you" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.NoSurgeDamage:OnChanged(NoSurgeDamageHandler)
	UiLibrary:Mount(Groupboxes.SubfloorsOutdoors, "Toggle", "RemoveSurge", { ["Title"] = "Remove Surge", ["Value"] = false, ["Desc"] = "Prevents Surge from spawning" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.RemoveSurge:OnChanged(function(o)
		if CheesyState.SurgeFrame then
			CheesyState.SurgeFrame.Name = o and "SurgeVignette_Disabled" or "SurgeVignette"
		end
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsOutdoors, "Toggle", "RemoveMandrake", {
			["Title"] = "Disable Mandrake (FE)",
			["Value"] = false,
			["Desc"] = "Prevents mandrakes from attacking you, but this is inconsistent",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.RemoveMandrake:OnChanged(function(o)
		for T, k in wT.Entities do
			if k.Name == "Root" and k:IsA("BasePart") then
				local T = k:FindFirstChild("AntiMandrakeForce")
				if o then
					if not T then
						T = Instance.new("BodyForce")
						T.Name = "AntiMandrakeForce"
						T.Parent = k
					end
					T.Force = Vector3.new(100000, -99999999, 100000)
				else
					if T then
						T:Destroy()
					end
				end
			end
		end
	end)
	UiLibrary:Mount(Groupboxes.SubfloorsOutdoors, "Toggle", "ShowEyestalkPathToggle", {
			["Title"] = "Show Eyestalk Path",
			["Value"] = false,
			["Desc"] = "Shows you the correct path in the eyestalk chase",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.ShowEyestalkPathToggle.Section, "ColorPicker", "ShowEyestalkPathColor", { ["Title"] = "Eyestalk Path", ["Value"] = Color3.fromRGB(0, 255, 0), ["Transparency"] = 0 }, function(state, spec)
		return state.Section:Colorpicker({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Default = state.Value,
			Transparency = state.Transparency,
			Callback = function(value, transparency) state:Receive(value, transparency) end,
		})
	end, Toggles.ShowEyestalkPathToggle)
	Toggles.ShowEyestalkPathToggle:OnChanged(function(o)
		Ld(wT.EyestalkHighlights, "ShowEyestalkPathColor", o)
	end)
	Options.ShowEyestalkPathColor:OnChanged(function(o)
		Od(wT.EyestalkHighlights, o)
	end)
	rT.Garden.UIElements.Main.Visible = false
	CheesyState.RoomsNodesFolder = Instance.new("Folder")
	CheesyState.RoomsNodesFolder.Name = "RoomsPathNodes"
	CheesyState.RoomsNodesFolder.Parent = workspace
	CheesyState.SeekNodesFolder = Instance.new("Folder")
	CheesyState.SeekNodesFolder.Name = "SeekPathNodes"
	CheesyState.SeekNodesFolder.Parent = workspace
	CheesyState.HotelNodesFolder = Instance.new("Folder")
	CheesyState.HotelNodesFolder.Name = "HotelPathNodes"
	CheesyState.HotelNodesFolder.Parent = workspace
	Toggles.BypassKillbricks:OnChanged(function(o)
		for T, k in workspace:GetDescendants() do
			if k.Name == "Lava" and k:IsA("BasePart") then
				k.CanTouch = not o
			end
		end
	end)
	Toggles.BypassSeekingWall:OnChanged(function(o)
		for T, k in workspace:GetDescendants() do
			if k.Name == "ScaryWall" then
				for T, k in k:GetDescendants() do
					if k:IsA("BasePart") then
						k.CanTouch = not o
						k.CanCollide = not o
					end
				end
			end
		end
	end)
	Toggles.BypassBanana:OnChanged(function(o)
		for T, k in workspace:GetDescendants() do
			if k.Name == "BananaPeel" and k:IsA("BasePart") then
				k.CanTouch = not o
			end
		end
	end)
	Toggles.BypassJeff:OnChanged(function(o)
		for T, k in workspace:GetDescendants() do
			if k.Name == "JeffTheKiller" then
				for T, k in k:GetDescendants() do
					if k:IsA("BasePart") then
						k.CanCollide = not o
						k.CanTouch = not o
					end
				end
				local T = k:FindFirstChildOfClass("Humanoid")
				if T then
					T.Health = 0
				end
			end
		end
	end)
	Toggles.RemoveSeekTrigger:OnChanged(function(o)
		if o and Executor.firetouchinterest then
			for o, T in ipairs(wT.Entities) do
				if T.Name == "TriggerEventCollision" then
					for o, T in T:GetChildren() do
						if T:IsA("BasePart") and HumanoidRootPart then
							Executor.firetouchinterest(HumanoidRootPart, T, 0)
							task.wait()
							Executor.firetouchinterest(HumanoidRootPart, T, 1)
						end
					end
				end
			end
			task.spawn(function()
				while Toggles.RemoveSeekTrigger.Value do
					for o, T in ipairs(wT.Entities) do
						if T.Name == "TriggerEventCollision" and HumanoidRootPart then
							for o, T in T:GetChildren() do
								if T:IsA("BasePart") then
									Executor.firetouchinterest(HumanoidRootPart, T, 0)
									task.wait()
									Executor.firetouchinterest(HumanoidRootPart, T, 1)
								end
							end
						end
					end
					task.wait(0.5)
				end
			end)
		end
		for T, k in workspace:GetDescendants() do
			if k.Name == "Seeking" or k.Name == "SeekTrigger" or k.Name == "ChaseStartTrigger" then
				for T, k in k:GetDescendants() do
					if k:IsA("BasePart") then
						k.CanTouch = not o
					end
				end
			end
		end
	end)
	Toggles.AutoRoomSkip:OnChanged(function(o)
		if o then
			task.spawn(function()
				pcall(function()
					local o = 0
					local T = 0
					local k = false
					repeat
						local P = nil
						local w = 0
						for o, T in workspace.CurrentRooms:GetChildren() do
							local k = tonumber(T.Name)
							if k and k > w then
								local o = T:FindFirstChild("Door")
								if o then
									P = o
									w = k
								end
							end
						end
						if P then
							if w > o then
								o = w
								T = 0
								if k then
									Toggles.Noclip:SetValue(false)
									k = false
								end
							end
							local F = P:IsA("BasePart") and P or P:FindFirstChildWhichIsA("BasePart")
							if F then
								game.Players.LocalPlayer.Character:PivotTo(CFrame.new(F.Position))
							end
						else
							T = T + 0.25
							if T >= 5 then
								if not Toggles.Noclip.Value then
									Toggles.Noclip:SetValue(true)
								end
								k = true
								local o = game.Players.LocalPlayer.Character
								if o and o:FindFirstChild("HumanoidRootPart") then
									o.HumanoidRootPart.CFrame = o.HumanoidRootPart.CFrame
										* CFrame.new(0, 0, 10)
								end
								T = 0
							end
						end
						task.wait(0.25)
					until not Toggles.AutoRoomSkip.Value
					if k then
						Toggles.Noclip:SetValue(false)
					end
				end)
			end)
		end
	end)
	Toggles.RemoveFigure:OnChanged(function(o)
		if o and (Executor.isnetworkowner and workspace:FindFirstChild("Figure")) then
			local o = detectFloor()
			for T, k in ipairs(wT.Entities) do
				if k.Name == "Figure" or k.Name == "FigureRig" or k.Name == "FigureRagdoll" then
					if o == "Mines" then
						for o, T in k:GetDescendants() do
							local k = T
							if
								T:IsA("BasePart") and pcall(function()
									return Executor.isnetworkowner(k)
								end)
							then
								k.Position = Vector3.new(-49999, -49999, -49999)
							end
						end
					elseif o == "OldHotel" or o == "Fools" then
						for o, T in k:GetDescendants() do
							local k = T
							if T:IsA("BasePart") then
								T.CanCollide = false
								if
									pcall(function()
										return Executor.isnetworkowner(k)
									end)
								then
									k.Position = Vector3.new(
										math.random(-29999, 29999),
										math.random(-29999, 29999),
										math.random(-29999, 29999)
									)
								end
							end
						end
					end
				end
			end
		end
		if o then
			local o = workspace:FindFirstChild("Figure")
			if o then
				for o, T in o:GetDescendants() do
					if T:IsA("BasePart") then
						T.CanCollide = false
					end
				end
			end
		end
	end)
	Connections.AutoReviveHandler = (LocalPlayer:GetAttributeChangedSignal("Alive")):Connect(function()
		if LocalPlayer:GetAttribute("Alive") == false and Toggles.AutoRevive.Value then
			local o = detectFloor()
			if o == "Fools" or o == "OldHotel" then
				while LocalPlayer:GetAttribute("Alive") ~= true do
					local o = ReplicatedStorage:FindFirstChild("RemotesFolder")
					if o and o:FindFirstChild("Revive") then
						o.Revive:FireServer()
					end
					task.wait(0.5)
				end
			end
		end
	end)
	ObstructionNames = {
		["ThingToOpen"] = "RemoveBasementGate",
		["MovingDoor"] = "RemovePaintingsDoor",
		["Wax_Door"] = "RemoveSkeletonDoor",
	}
	for o, T in pairs(ObstructionNames) do
		local k = o
		Toggles[T]:OnChanged(function(o)
			for T, P in workspace:GetDescendants() do
				if P.Name == k and P:IsA("Model") then
					if o then
						P:PivotTo(CFrame.new(-10000, -10000, -10000))
					else
						local o = P:GetAttribute("OriginalPosition")
						if o then
							if typeof(o) == "string" then
								local T, k = pcall(function()
									return (game:GetService("HttpService")):JSONDecode(o)
								end)
								if T and typeof(k) == "table" then
									P:PivotTo(CFrame.new(unpack(k)))
								end
							elseif typeof(o) == "table" and #o >= 12 then
								P:PivotTo(CFrame.new(unpack(o)))
							end
						end
					end
				end
			end
		end)
	end
	Connections.DescendantAddedObstructions = workspace.DescendantAdded:Connect(function(o)
		if o:IsA("Model") and (o.Name == "ThingToOpen" or o.Name == "MovingDoor" or o.Name == "Wax_Door") then
			local T = {
				["ThingToOpen"] = "RemoveBasementGate",
				["MovingDoor"] = "RemovePaintingsDoor",
				["Wax_Door"] = "RemoveSkeletonDoor",
			}
			local k, P = pcall(function()
				return (game:GetService("HttpService")):JSONEncode({ (o:GetPivot()):GetComponents() })
			end)
			if k and P then
				o:SetAttribute("OriginalPosition", P)
			end
			if Toggles[T[o.Name]] and Toggles[T[o.Name]].Value then
				o:PivotTo(CFrame.new(-10000, -10000, -10000))
			end
		end
	end)
	Toggles.RoomsAutoWalkShowPathToggle:OnChanged(function(o)
		for T, k in CheesyState.RoomsNodesFolder:GetChildren() do
			if k.Name == "PathNode" then
				k.Transparency = o and 0.5 or 1
			end
		end
	end)
	Options.RoomsAutoWalkShowPathColor:OnChanged(function(o)
		for T, k in CheesyState.RoomsNodesFolder:GetChildren() do
			if k.Name == "PathNode" then
				k.Color = o
			end
		end
	end)
	RoomsEntityList = {
		"RushMoving",
		"AmbushMoving",
		"BackdoorRush",
		"A60",
		"A120",
		"CustomEntity",
		"GlitchRush",
		"GlitchAmbush",
	}
	HotelRoomWaitTimeout = 25
	HotelSeekTimeout = 180
	HotelDoorReach = 14
	HotelPromptKinds = { ["key"] = true, ["paper"] = true, ["book"] = true, ["sally"] = true }
	local function getCurrentRoom()
		if not LatestRoomValue or not CurrentRooms then
			return nil
		end
		return CurrentRooms[tostring(LatestRoomValue.Value)]
	end
	local function getRoomDoorPart(o)
		if not o then
			return nil, nil
		end
		local T = o:FindFirstChild("Door")
		local k = nil
		if T then
			if T:IsA("BasePart") then
				k = T
			else
				k = T:FindFirstChild("Door") or T:FindFirstChildWhichIsA("BasePart", true)
			end
		end
		local P = o:FindFirstChild("ClientOpen", true)
		return k, P
	end
	local function findRoomKeyPrompt(o)
		if not o then
			return nil
		end
		for o, T in o:GetDescendants() do
			if T.Name == "KeyObtain" then
				return T
			end
		end
		return nil
	end
	local function isThreatNearby()
		if hasActiveThreats() then
			return true
		end
		for o in pairs(GodmodeState.ThreatNames) do
			local T = workspace:FindFirstChild(o)
			if T and (T:IsA("Model") and T.PrimaryPart) then
				local o, k = pcall(function()
					return LocalPlayer:DistanceFromCharacter(T.PrimaryPart.Position)
				end)
				if o and (typeof(k) == "number" and k < 300) then
					return true
				end
			end
		end
		if Functions.GetNearestEntity(true) then
			return true
		end
		if Functions.GetNearestFigure and Functions.GetNearestFigure() then
			return true
		end
		return false
	end
	HotelAmbushRooms = { [48] = true, [49] = true }
	function HotelAmbushHold(o)
		if not HotelAmbushRooms[o] then
			return false
		end
		if CheesyState.HotelAmbushHoldRoom ~= o then
			CheesyState.HotelAmbushHoldRoom = o
			CheesyState.HotelAmbushHoldUntil = tick() + 2
		end
		if isThreatNearby() then
			CheesyState.HotelAmbushHoldUntil = tick() + 2
		end
		if tick() < (CheesyState.HotelAmbushHoldUntil or 0) then
			return true
		end
		return false
	end
	local function setHotelCrouchHeld(o)
		o = o and true or false
		if CheesyState.HotelCrouchHeld == o then
			return
		end
		CheesyState.HotelCrouchHeld = o
		pcall(function()
			(game:GetService("VirtualInputManager")):SendKeyEvent(o, Enum.KeyCode.LeftControl, false, game)
		end)
	end
	local function clearHotelPathNodes()
		for o, T in CheesyState.HotelNodesFolder:GetChildren() do
			if T.Name == "HotelPathNode" or T.Name == "HotelStuckPart" then
				T:Destroy()
			end
		end
	end
	local function isRaycastBlocked(o, T, k)
		local P = workspace:Raycast(T, k, o)
		if P and (P.Instance and P.Instance.CanCollide) then
			return true
		end
		return false
	end
	local function faceTravelDirection(o, T)
		if not HumanoidRootPart then
			return
		end
		local function getHorizontalUnitVector(o)
			o = Vector3.new(o.X, 0, o.Z)
			if o.Magnitude < 0.01 then
				return nil
			end
			return o.Unit
		end
		local P = getHorizontalUnitVector(T - HumanoidRootPart.Position)
		local w = getHorizontalUnitVector(HumanoidRootPart.CFrame.LookVector)
		local F = false
		for T, k in ipairs({ P, w }) do
			if k then
				local T = HumanoidRootPart.Position + Vector3.new(0, 2.2, 0)
				local P = HumanoidRootPart.Position + Vector3.new(0, 0.3, 0)
				if isRaycastBlocked(o, T, k * 6) and not isRaycastBlocked(o, P, k * 6) then
					F = true
					break
				end
			end
		end
		setHotelCrouchHeld(F)
	end
	local function fireNearbyPrompts(o, T)
		if not o then
			return
		end
		for o, k in o:GetDescendants() do
			if k:IsA("ProximityPrompt") then
				local o = (k.Parent and k.Parent:IsA("BasePart")) and k.Parent.Position or T
				if LocalPlayer:DistanceFromCharacter(o) < (k.MaxActivationDistance or 12) then
					Functions.ForceFirePrompt(k)
				end
			end
		end
	end
	local function getObjectPosition(o)
		if not o then
			return nil
		end
		if o:IsA("BasePart") then
			return o.Position
		end
		local T, k = pcall(function()
			return o:GetPivot()
		end)
		if T and k then
			return k.Position
		end
		return nil
	end
	local function findNextDoor()
		local o, T = nil, nil
		if not CurrentRooms then
			return nil, nil
		end
		local k = (LatestRoomValue and LatestRoomValue.Value) or 0
		for P, w in CurrentRooms:GetChildren() do
			local F = tonumber(w.Name)
			if F and (F >= k and (T == nil or F < T)) then
				local k = getRoomDoorPart(w)
				if k then
					o, T = k, F
				end
			end
		end
		return o, T
	end
	local function findNearbySeekTrigger()
		if not CurrentRooms then
			return nil
		end
		for o, T in CurrentRooms:GetDescendants() do
			if T.Name == "Seeking" or T.Name == "SeekTrigger" or T.Name == "ChaseStartTrigger" then
				local o = getObjectPosition(T)
				if o and LocalPlayer:DistanceFromCharacter(o) < 80 then
					return T
				end
			end
		end
		return nil
	end
	Functions.HotelAutoWalk = {}
	local function getInteractablePrompt(o)
		if not o then
			return false
		end
		local T = o:FindFirstChildWhichIsA("ProximityPrompt", true)
		if not T and o.Parent then
			T = o.Parent:FindFirstChildWhichIsA("ProximityPrompt", true)
		end
		local k = nil
		if T then
			local o = T.Parent
			if o and o:IsA("BasePart") then
				k = o.Position
			elseif o then
				local T, P = pcall(function()
					return o:GetPivot()
				end)
				if T and P then
					k = P.Position
				end
			end
		end
		if not k then
			k = getObjectPosition(o)
		end
		if not k then
			return false
		end
		if HumanoidRootPart and Humanoid then
			HumanoidRootPart.CFrame = CFrame.new(k + Vector3.new(0, 1, 0))
			Humanoid:MoveTo(HumanoidRootPart.Position)
		end
		if T then
			Functions.ForceFirePrompt(T)
			return true
		end
		return false
	end
	local function getCurrentDoorTarget()
		local o = getCurrentRoom()
		if not o then
			return nil
		end
		local T, k = getRoomDoorPart(o)
		if not T then
			return nil
		end
		if HumanoidRootPart then
			local k = T.Position
			local P = Vector3.zero
			local w, F = pcall(function()
				return o:GetPivot()
			end)
			if w and F then
				P = Vector3.new(k.X - F.Position.X, 0, k.Z - F.Position.Z)
			end
			if P.Magnitude < 0.5 and (Character and HumanoidRootPart) then
				P = Vector3.new(k.X - HumanoidRootPart.Position.X, 0, k.Z - HumanoidRootPart.Position.Z)
			end
			if P.Magnitude >= 0.5 then
				P = P.Unit * 3
				HumanoidRootPart.CFrame = CFrame.lookAt(k + P, k + P * 5)
			else
				HumanoidRootPart.CFrame = CFrame.new(k + Vector3.new(0, 1, 0))
			end
		end
		if k then
			pcall(function()
				k:FireServer()
			end)
		end
		fireNearbyPrompts(T.Parent or o, T.Position)
		return T
	end
	local function findNamedDescendant(o, T)
		for o, k in o:GetDescendants() do
			if k.Name == T and k.Parent then
				return k
			end
		end
		return nil
	end
	local function waitForNamedDescendant(o, T, k)
		local P = findNamedDescendant(o, T)
		if P then
			return P
		end
		local w = CheesyState.HotelTpScan[T]
		local F = not w
		if w then
			for o, T in ipairs(w) do
				if not T.Parent then
					F = true
					break
				end
			end
		end
		if F then
			w = {}
			for o, k in workspace:GetDescendants() do
				if k.Name == T and k.Parent then
					table.insert(w, k)
				end
			end
			CheesyState.HotelTpScan[T] = w
		end
		local A = HumanoidRootPart and HumanoidRootPart.Position
		for o, T in ipairs(w) do
			local P = getObjectPosition(T)
			if P and (not A or not k or ((P - A)).Magnitude <= k) then
				return T
			end
		end
		return nil
	end
	function Functions.HotelAutoWalk.TeleportStep()
		if _Unloading then
			return
		end
		if not Toggles.HotelAutoWalk.Value then
			return
		end
		if CurrentFloor ~= "Hotel" and CurrentFloor ~= "OldHotel" then
			return
		end
		if not Character or not Humanoid or Humanoid.Health <= 0 then
			return
		end
		if hasActiveThreats() then
			return
		end
		local o = getCurrentRoom()
		local k = (LatestRoomValue and LatestRoomValue.Value) or 0
		if not o or k <= 0 then
			return
		end
		if HotelAmbushHold(k) then
			return
		end
		if k >= 100 then
			local k = nil
			for o, T in o:GetDescendants() do
				if
					T.Name == "LiveBreakerPolePickup"
					and (T.Parent and not CheesyState.HotelBreakersFired[T])
				then
					k = T
					break
				end
			end
			if k then
				CheesyState.HotelBreakersFired[k] = true
				getInteractablePrompt(k)
			else
				UiLibrary:Notify({
					["Title"] = "Auto Hotel",
					["Description"] = "Every breaker fired. Turning off.",
					["Time"] = 4,
				})
				Toggles.HotelAutoWalk:SetValue(false)
			end
			return
		end
		if CheesyState.HotelTpRoom ~= k then
			CheesyState.HotelTpRoom = k
			CheesyState.HotelKeyTries = 0
			CheesyState.HotelToyTries = 0
		end
		local P = findNamedDescendant(o, "SallyToyObtain")
		if P and not CheesyState.HotelSallyToys[P] then
			local o = getInteractablePrompt(P)
			if o and not P.Parent then
				CheesyState.HotelSallyToys[P] = true
				CheesyState.HotelToyTries = 0
			else
				CheesyState.HotelToyTries = (CheesyState.HotelToyTries or 0) + 1
			end
			if CheesyState.HotelToyTries < 5 then
				return
			end
			CheesyState.HotelToyTries = 0
		end
		if k ~= 50 then
			if CheesyState.HotelPaperDone or next(CheesyState.HotelBooksVisited) ~= nil then
				CheesyState.HotelPaperDone = false
				CheesyState.HotelBooksVisited = {}
			end
			if not CheesyState.HotelKeyRooms[k] then
				local T = findNamedDescendant(o, "KeyObtain")
				if T then
					local o = LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChild("Key")
						or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Key"))
					if o then
						CheesyState.HotelKeyRooms[k] = true
						CheesyState.HotelKeyTries = 0
						return
					end
					local P = getInteractablePrompt(T)
					if P and not T.Parent then
						CheesyState.HotelKeyRooms[k] = true
						CheesyState.HotelKeyTries = 0
						return
					end
					CheesyState.HotelKeyTries = (CheesyState.HotelKeyTries or 0) + 1
					if CheesyState.HotelKeyTries < 5 then
						return
					end
					CheesyState.HotelKeyTries = 0
				end
			end
		else
			if not HotelLibraryReady() then
				return
			end
		end
		local w = getCurrentDoorTarget()
		if w then
			local o = w:GetAttribute("Opened")
			if o == nil then
				o = w:GetAttribute("Open")
			end
			if o == true then
				CheesyState.HotelTpStage = "key"
			end
		end
	end
	function Functions.HotelAutoWalk.RunTeleport()
		if CheesyState.HotelTeleportThread then
			return
		end
		CheesyState.HotelTeleportThread = task.spawn(function()
			while Toggles.HotelAutoWalk.Value and HotelMethodName() == "Teleport" do
				pcall(function()
					Functions.HotelAutoWalk.TeleportStep()
				end)
				task.wait(0.15)
			end
			CheesyState.HotelTeleportThread = nil
		end)
	end
	function Functions.HotelAutoWalk.StopTeleport()
		if CheesyState.HotelTeleportThread then
			pcall(function()
				CheesyState.HotelTeleportThread:Takeover()
			end)
			CheesyState.HotelTeleportThread = nil
		end
		CheesyState.HotelTpRoom = nil
		CheesyState.HotelTpStage = nil
	end
	Functions.HotelAutoWalk.GetTarget = function()
		local o = getCurrentRoom()
		if not o or not LatestRoomValue then
			return nil
		end
		local T = LatestRoomValue.Value
		if T ~= 50 and (CheesyState.HotelPaperDone or next(CheesyState.HotelBooksVisited) ~= nil) then
			CheesyState.HotelPaperDone = false
			CheesyState.HotelBooksVisited = {}
		end
		for o, T in o:GetDescendants() do
			if T.Name == "SallyToyObtain" and (T.Parent and not CheesyState.HotelSallyToys[T]) then
				return T, "sally"
			end
		end
		if T == 50 then
			if not CheesyState.HotelPaperDone then
				local T = nil
				for o, k in o:GetDescendants() do
					if k.Name == "LibraryHintPaper" and k.Parent then
						T = k
						break
					end
				end
				if T then
					return T, "paper"
				end
				CheesyState.HotelPaperDone = true
			end
			local T, k = nil, math.huge
			for o, P in o:GetDescendants() do
				if P.Name == "LiveHintBook" and (P.Parent and not CheesyState.HotelBooksVisited[P]) then
					local o = getObjectPosition(P)
					if o then
						local w = LocalPlayer:DistanceFromCharacter(o)
						if w < k then
							T, k = P, w
						end
					end
				end
			end
			if T then
				return T, "book"
			end
		end
		if T == 1 and not CheesyState.HotelDoorRooms[T] then
			local o = findNextDoor()
			local T = getObjectPosition(o)
			if o and (T and LocalPlayer:DistanceFromCharacter(T) < 250) then
				return o, "doorscout"
			end
		end
		if not CheesyState.HotelKeyRooms[T] then
			local T = findRoomKeyPrompt(o)
			if T and T.Parent then
				return T, "key"
			end
		end
		local k = findNearbySeekTrigger()
		if k then
			return k, "seektrigger"
		end
		local P = nil
		if not CheesyState.HotelGateRooms[T] then
			local T = o:FindFirstChild("Assets")
			if T then
				for o, T in T:GetDescendants() do
					if T.Name == "Gate" and (T:IsA("BasePart") or T:IsA("Model")) then
						P = T
						break
					end
				end
			end
			if not P then
				for o, T in o:GetDescendants() do
					if T.Name == "Gate" and (T:IsA("BasePart") or T:IsA("Model")) then
						P = T
						break
					end
				end
			end
		end
		if P then
			return P, "gate"
		end
		local w = findNextDoor()
		local F = getObjectPosition(w)
		if w and (F and LocalPlayer:DistanceFromCharacter(F) < 250) then
			return w, "door"
		end
		return nil
	end
	Connections.HotelAutoWalkHandler = (game:GetService("RunService")).Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if not Toggles.HotelAutoWalk.Value then
			CheesyState.HotelAutoWalkActive = false
			return
		end
		if CurrentFloor ~= "Hotel" and CurrentFloor ~= "OldHotel" then
			return
		end
		if HotelMethodName() == "Teleport" then
			CheesyState.HotelAutoWalkActive = false
			return
		end
		if CheesyState.HotelAutoWalkActive then
			local o = tick() - (CheesyState.HotelActiveSince or 0) > 90
			local T = CheesyState.HotelSeekActive or CheesyState.HotelFigureActive
			if o and not T then
				CheesyState.HotelAutoWalkActive = false
			else
				return
			end
		end
		if not CharacterCollisionPart or not Humanoid or Humanoid.Health <= 0 then
			return
		end
		local o, k = pcall(function()
			return LatestRoomValue and LatestRoomValue.Value
		end)
		if not o or not k then
			return
		end
		if k >= 100 then
			UiLibrary:Notify({
				["Title"] = "Auto Hotel",
				["Description"] = "Finished (door 100)! Turning off.",
				["Time"] = 5,
			})
			Toggles.HotelAutoWalk:SetValue(false)
			return
		end
		CheesyState.HotelAutoWalkActive = true
		CheesyState.HotelActiveSince = CheesyState.HotelActiveSince or tick()
		if tick() < (CheesyState.HotelFailCooldownUntil or 0) then
			CheesyState.HotelAutoWalkActive = false
			return
		end
		if HotelAmbushHold(k) then
			return
		end
		if CheesyState.HotelSeekActive then
			local o = tick()
			local T = k
			local P = 0
			local w = false
			local F, A = nil, nil
			while
				CheesyState.HotelSeekActive
				and (
					Toggles.HotelAutoWalk.Value
					and (not CheesyState.HotelSeekVoiding and tick() - o < HotelSeekTimeout)
				)
			do
				if not Character or not Humanoid or not HumanoidRootPart then
					break
				end
				if
					(
						Character:GetAttribute("InCutscene") == nil
						or Character:GetAttribute("InCutscene") == false
					) and tick() - CheesyState.HotelSeekSince > 5
				then
					break
				end
				local o, k = pcall(function()
					return LatestRoomValue and LatestRoomValue.Value
				end)
				local d = (o and k) or 0
				local C = {}
				if CurrentRooms and HumanoidRootPart then
					for o, T in CurrentRooms:GetChildren() do
						local k = tonumber(T.Name)
						if k and k >= d then
							local o = getRoomDoorPart(T)
							if o then
								table.insert(
									C,
									{
										["Part"] = o,
										["Room"] = k,
										["Dist"] = ((o.Position - HumanoidRootPart.Position)).Magnitude,
									}
								)
							end
						end
					end
				end
				table.sort(C, function(o, T)
					return o.Dist < T.Dist
				end)
				local f = nil
				for o, T in ipairs(C) do
					if not (F and (T.Room == A and ((T.Part.Position - F)).Magnitude < 6)) then
						f = T
						break
					end
				end
				if not f then
					f = C[1]
				end
				if f then
					if f.Room > T then
						T = f.Room
						P = 0
						if w then
							pcall(function()
								Toggles.Noclip:SetValue(false)
							end)
							w = false
						end
					end
					local o, k = pcall(function()
						return LatestRoomValue and LatestRoomValue.Value
					end)
					Character:PivotTo(CFrame.new(f.Part.Position))
					HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					F = f.Part.Position
					A = f.Room
					local d = tick()
					while CheesyState.HotelSeekActive and (Toggles.HotelAutoWalk.Value and tick() - d < 8) do
						local o, T = pcall(function()
							return LatestRoomValue and LatestRoomValue.Value
						end)
						if o and (T and T ~= k) then
							break
						end
						task.wait(0.25)
					end
				else
					P = P + 0.25
					if P >= 5 then
						if not Toggles.Noclip.Value then
							pcall(function()
								Toggles.Noclip:SetValue(true)
							end)
						end
						w = true
						if HumanoidRootPart then
							HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 0, 10)
						end
						P = 0
					end
				end
				task.wait(0.25)
			end
			if w then
				pcall(function()
					Toggles.Noclip:SetValue(false)
				end)
			end
			CheesyState.HotelSeekActive = false
			setHotelCrouchHeld(false)
			CheesyState.HotelAutoWalkActive = false
			return
		end
		if CheesyState.HotelFigureActive then
			if k ~= 50 then
				CheesyState.HotelFigureActive = false
			else
				local o = tick()
				while CheesyState.HotelFigureActive and (Toggles.HotelAutoWalk.Value and tick() - o < 120) do
					if not Character or not Humanoid or not HumanoidRootPart then
						break
					end
					if
						(
							Character:GetAttribute("InCutscene") == nil
							or Character:GetAttribute("InCutscene") == false
						) and tick() - CheesyState.HotelFigureSince > 5
					then
						break
					end
					local o = getCurrentRoom()
					local T = {}
					if o then
						for o, k in o:GetDescendants() do
							if (k.Name == "LiveHintBook" or k.Name == "LibraryHintPaper") and k.Parent then
								table.insert(T, k)
								if #T >= 7 then
									break
								end
							end
						end
					end
					if #T == 0 then
						task.wait(0.5)
					else
						for T, k in T do
							if not CheesyState.HotelFigureActive or not Toggles.HotelAutoWalk.Value then
								break
							end
							if not Character or not HumanoidRootPart then
								break
							end
							local P = getObjectPosition(k)
							if P and k.Parent then
								Character:PivotTo(CFrame.new(P + Vector3.new(0, 3, 0)))
								HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
								for o, T in k:GetDescendants() do
									if T:IsA("ProximityPrompt") then
										Functions.ForceFirePrompt(T)
									end
								end
								if k.Parent and k.Parent ~= o then
									for o, T in k.Parent:GetDescendants() do
										if T:IsA("ProximityPrompt") then
											Functions.ForceFirePrompt(T)
										end
									end
								end
							end
							task.wait(0.3)
						end
					end
					task.wait(0.3)
				end
				CheesyState.HotelFigureActive = false
				setHotelCrouchHeld(false)
				CheesyState.HotelAutoWalkActive = false
				return
			end
		end
		if hasActiveThreats() then
			CheesyState.HotelLegRetryAt = tick() + 0.4
			CheesyState.HotelAutoWalkActive = false
			return
		end
		if tick() < (CheesyState.HotelLegRetryAt or 0) then
			CheesyState.HotelAutoWalkActive = false
			return
		end
		local P, w = Functions.HotelAutoWalk.GetTarget()
		if not P or not P.Parent then
			CheesyState.HotelLegRetryAt = tick() + 0.4
			CheesyState.HotelAutoWalkActive = false
			return
		end
		local F = nil
		local A = nil
		if HotelPromptKinds[w] then
			F = getObjectPosition(P)
			A = P:FindFirstChildWhichIsA("ProximityPrompt", true)
		elseif w == "seektrigger" then
			F = getObjectPosition(P)
		elseif w == "gate" then
			F = getObjectPosition(P)
		elseif w == "door" or w == "doorscout" then
			F = P.Position
			pcall(function()
				P.CanCollide = false
			end)
		end
		local d = HumanoidRootPart.Position
		local C = false
		local f = false
		if not F or LocalPlayer:DistanceFromCharacter(F) >= 750 then
			CheesyState.HotelLegRetryAt = tick() + 0.4
			CheesyState.HotelAutoWalkActive = false
			return
		end
		local m = RaycastParams.new()
		m.FilterType = Enum.RaycastFilterType.Exclude
		m.FilterDescendantsInstances = { Character }
		local r = CharacterCollisionPart.Position
		if CharacterCollisionPart:IsA("BasePart") then
			local o = workspace:Raycast(CharacterCollisionPart.Position, Vector3.new(0, -60, 0), m)
			if o then
				r = Vector3.new(
					CharacterCollisionPart.Position.X,
					o.Position.Y,
					CharacterCollisionPart.Position.Z
				)
			end
		end
		local G = Vector3.new(F.X, r.Y, F.Z)
		local y = workspace:Raycast(F + Vector3.new(0, 1, 0), Vector3.new(0, -80, 0), m)
		if y and math.abs(y.Position.Y - F.Y) <= 4 then
			G = Vector3.new(F.X, y.Position.Y, F.Z)
		end
		local X = {
			{
				["AgentCanJump"] = true,
				["AgentCanClimb"] = false,
				["WaypointSpacing"] = 4,
				["AgentRadius"] = 1.5,
				["AgentHeight"] = 1.5,
				["Costs"] = { ["HotelStuckPart"] = 8 },
			},
			{
				["AgentCanJump"] = true,
				["AgentCanClimb"] = true,
				["WaypointSpacing"] = 4,
				["AgentRadius"] = 1,
				["AgentHeight"] = 1,
			},
			{
				["AgentCanJump"] = true,
				["AgentCanClimb"] = true,
				["WaypointSpacing"] = 2,
				["AgentRadius"] = 1,
				["AgentHeight"] = 1,
			},
			{
				["AgentCanJump"] = true,
				["AgentCanClimb"] = true,
				["WaypointSpacing"] = 2,
				["AgentRadius"] = 2,
				["AgentHeight"] = 3,
			},
			{
				["AgentCanJump"] = true,
				["AgentCanClimb"] = true,
				["WaypointSpacing"] = 1,
				["AgentRadius"] = 0.5,
				["AgentHeight"] = 1,
			},
		}
		local I = {}
		for o, T in ipairs(X) do
			local k = (game:GetService("PathfindingService")):CreatePath(T)
			if pcall(k.ComputeAsync, k, r, G) then
				I = k:GetWaypoints()
			end
			if #I > 0 then
				break
			end
		end
		if #I == 0 then
			CheesyState.HotelLegRetryAt = tick() + 0.4
			CheesyState.HotelAutoWalkActive = false
			return
		end
		clearHotelPathNodes()
		for o, T in ipairs(I) do
			local k = Instance.new("Part", CheesyState.HotelNodesFolder)
			k.Transparency = Toggles.HotelShowPath.Value and 0.5 or 1
			k.Size = Vector3.one
			k.Position = T.Position
			k.Shape = Enum.PartType.Ball
			k.CanCollide = false
			k.Anchored = true
			k.Name = "HotelPathNode"
			k.Color = Options.HotelShowPathColor.Value
			k.Material = Enum.Material.Neon
		end
		local V = RaycastParams.new()
		V.FilterType = Enum.RaycastFilterType.Exclude
		V.FilterDescendantsInstances = { Character }
		local q = 0
		local M = (Options.HotelPathfindTimeout and Options.HotelPathfindTimeout.Value) or 2
		for o, T in ipairs(I) do
			if not Toggles.HotelAutoWalk.Value then
				break
			end
			if C then
				break
			end
			local k = false
			local d = tick()
			local m = HumanoidRootPart.Position
			local r = tick()
			local G = 0
			local y = (game:GetService("RunService")).RenderStepped:Connect(function()
				if _Unloading then
					k = true
					return
				end
				if not Toggles.HotelAutoWalk.Value then
					k = true
					return
				end
				if isThreatNearby() then
					setHotelCrouchHeld(false)
					if Humanoid and HumanoidRootPart then
						Humanoid:MoveTo(HumanoidRootPart.Position)
					end
					d = tick()
					f = true
					return
				end
				if f then
					f = false
					C = true
					k = true
					return
				end
				if ((HumanoidRootPart.Position - m)).Magnitude > 1.5 then
					m = HumanoidRootPart.Position
					r = tick()
				elseif tick() - r > 4 and tick() - G > 6 then
					G = tick()
					r = tick()
					pcall(function()
						Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end)
				end
				if not P.Parent then
					k = true
					return
				end
				if HotelPromptKinds[w] then
					if
						A
						and (
							A.Parent
							and (F and LocalPlayer:DistanceFromCharacter(F) < (A.MaxActivationDistance or 10))
						)
					then
						Functions.ForceFirePrompt(A)
						if q == 0 then
							q = tick()
						end
					end
					if q > 0 and tick() - q > 8 then
						k = true
						return
					end
				elseif w == "door" or w == "doorscout" then
					if LocalPlayer:DistanceFromCharacter(F) < HotelDoorReach then
						local o = getCurrentRoom()
						if o then
							local T = o:FindFirstChild("ClientOpen", true)
							if T then
								pcall(function()
									T:FireServer()
								end)
							end
						end
						fireNearbyPrompts(P.Parent, F)
					end
				end
				faceTravelDirection(V, T.Position)
				local o = Vector3.new(T.Position.X, HumanoidRootPart.Position.Y, T.Position.Z)
				if LocalPlayer:DistanceFromCharacter(o) < 5 then
					k = true
				end
				Humanoid:MoveTo(T.Position)
			end)
			while not k do
				if tick() - d > M then
					local o = 0
					local T = nil
					for k, P in CheesyState.HotelNodesFolder:GetChildren() do
						if P.Name == "HotelStuckPart" then
							o = o + 1
							if not T then
								T = P
							end
						end
					end
					if T and o >= 24 then
						T:Destroy()
					end
					if CharacterCollision then
						local o = Instance.new("Part", CheesyState.HotelNodesFolder)
						o.Transparency = 1
						o.Size = Vector3.one
						o.CFrame = CharacterCollision.CFrame
						o.Shape = Enum.PartType.Ball
						o.CanCollide = false
						o.Anchored = true
						o.Name = "HotelStuckPart"
						local T = Instance.new("PathfindingModifier", o)
						T.Label = "HotelStuckPart"
					end
					if (CheesyState.HotelRepathTries or 0) < 4 then
						CheesyState.HotelRepathTries = (CheesyState.HotelRepathTries or 0) + 1
						C = true
					end
					break
				end
				task.wait()
			end
			y:Disconnect()
			setHotelCrouchHeld(false)
			Humanoid:MoveTo(HumanoidRootPart.Position)
			if C then
				break
			end
		end
		if C then
			CheesyState.HotelLegRetryAt = tick() + 0.4
			CheesyState.HotelAutoWalkActive = false
			return
		end
		CheesyState.HotelRepathTries = 0
		CheesyState.HotelActiveSince = tick()
		if w == "doorscout" then
			CheesyState.HotelDoorRooms[k] = true
		elseif HotelPromptKinds[w] then
			if q > 0 then
				if w == "key" then
					CheesyState.HotelKeyRooms[k] = true
				elseif w == "paper" then
					CheesyState.HotelPaperDone = true
				elseif w == "book" then
					CheesyState.HotelBooksVisited[P] = true
				elseif w == "sally" then
					CheesyState.HotelSallyToys[P] = true
				end
			else
				CheesyState.HotelLegRetryAt = tick() + 0.5
				CheesyState.HotelAutoWalkActive = false
				return
			end
		end
		if w == "door" then
			local o = tick()
			local T = false
			while Toggles.HotelAutoWalk.Value and tick() - o < HotelRoomWaitTimeout do
				local o, P = pcall(function()
					return LatestRoomValue and LatestRoomValue.Value
				end)
				if o and (P and P ~= k) then
					T = true
					break
				end
				task.wait(0.5)
			end
			if
				not T and (Toggles.HotelAutoWalk.Value and (Character and (Humanoid and HumanoidRootPart)))
			then
				local o = F - d
				o = Vector3.new(o.X, 0, o.Z)
				if o.Magnitude > 0.5 then
					local T = F + o.Unit * 15
					local P = tick()
					while Toggles.HotelAutoWalk.Value and tick() - P < 8 do
						local o = Vector3.new(T.X, HumanoidRootPart.Position.Y, T.Z)
						if LocalPlayer:DistanceFromCharacter(o) < 4 then
							break
						end
						Humanoid:MoveTo(T)
						local P, w = pcall(function()
							return LatestRoomValue and LatestRoomValue.Value
						end)
						if P and (w and w ~= k) then
							break
						end
						task.wait()
					end
					Humanoid:MoveTo(HumanoidRootPart.Position)
				end
			end
		end
		if w == "gate" then
			local o = CheesyState.HotelGateTries[k] or 0
			local T = F and LocalPlayer:DistanceFromCharacter(F) < 10
			if T and (Character and (Humanoid and HumanoidRootPart)) then
				local o = nil
				do
					local T = (F or HumanoidRootPart.Position) - HumanoidRootPart.Position
					T = Vector3.new(T.X, 0, T.Z)
					if T.Magnitude > 0.01 then
						o = T.Unit
					end
				end
				if not o then
					local T = HumanoidRootPart.CFrame.LookVector
					T = Vector3.new(T.X, 0, T.Z)
					if T.Magnitude > 0.01 then
						o = T.Unit
					end
				end
				if o then
					local T = Toggles.Noclip and Toggles.Noclip.Value
					if not T then
						pcall(function()
							Toggles.Noclip:SetValue(true)
						end)
					end
					for o, T in Character:GetDescendants() do
						if T:IsA("BasePart") then
							T.CanCollide = false
						end
					end
					local k = Instance.new("BodyVelocity")
					k.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
					k.Velocity = o * 2.25
					k.Parent = HumanoidRootPart
					local P = tick()
					while Toggles.HotelAutoWalk.Value and tick() - P < 3 do
						if not Character or not HumanoidRootPart then
							break
						end
						for o, T in Character:GetDescendants() do
							if T:IsA("BasePart") then
								T.CanCollide = false
							end
						end
						k.Velocity = o * 2.25
						task.wait()
					end
					pcall(function()
						k:Destroy()
					end)
					if not T and Toggles.Noclip then
						pcall(function()
							Toggles.Noclip:SetValue(false)
						end)
					end
					if not Toggles.Noclip.Value and not (Toggles.Phase and Toggles.Phase.Value) then
						collectNoclipParts()
						setNoclipPartsCollision(true)
					end
				end
			end
			if T or o >= 2 then
				CheesyState.HotelGateRooms[k] = true
			else
				CheesyState.HotelGateTries[k] = o + 1
			end
		end
		CheesyState.HotelAutoWalkActive = false
	end)
	Functions.RoomsAutoWalk = {}
	Functions.RoomsAutoWalk.GetNearestHidingSpot = function()
		local o = { ["Distance"] = math.huge, ["Object"] = nil }
		for T, k in ipairs(wT.HidingSpots) do
			if k.PrimaryPart and k:FindFirstChild("HidePrompt") then
				local T = LocalPlayer:DistanceFromCharacter(k.PrimaryPart.Position)
				if T < o.Distance and k.PrimaryPart.Position.Y > -10 then
					local P = k:FindFirstChild("HiddenPlayer", true)
					if P and not P.Value then
						o.Distance = T
						o.Object = k
					end
				end
			end
		end
		return o.Object
	end
	_RoomsPickupStart = 0
	_RoomsPickupTimeoutRoom = nil
	Functions.RoomsAutoWalk.GetPathfindTarget = function()
		if not LatestRoomValue or not CurrentRooms then
			return
		end
		local o = CurrentRooms[tostring(LatestRoomValue.Value)]
		if not o then
			return
		end
		for T, k in workspace:GetChildren() do
			if TableFind(RoomsEntityList, k.Name) and k.PrimaryPart then
				local T = k.PrimaryPart.Position.Y
				if T > -10 and T < 150 then
					if k.Name == "A60" and not Toggles.RoomsAutoWalkIgnoreA60.Value or k.Name ~= "A60" then
						return Functions.RoomsAutoWalk.GetNearestHidingSpot() or o:FindFirstChild("RoomExit")
					end
				end
			end
		end
		if Toggles.RoomsAutoWalkIgnoreA60.Value and Functions.GetNearestEntity() then
			return o:FindFirstChild("RoomExit")
		end
		if
			(Toggles.RoomsPickupStardust.Value or Toggles.RoomsPickupGold.Value)
			and _RoomsPickupTimeoutRoom ~= LatestRoomValue.Value
		then
			local T = { ["Distance"] = math.huge, ["Object"] = nil }
			for o, k in o:GetDescendants() do
				if
					k.Name == "GoldPile"
					and (k:GetAttribute("GoldValue") and Toggles.RoomsPickupGold.Value)
				then
					local o = (k:GetPivot()).Position
					local P = LocalPlayer:DistanceFromCharacter(o)
					if P < T.Distance then
						T.Distance = P
						T.Object = k
					end
				elseif k.Name == "StardustPickup" and Toggles.RoomsPickupStardust.Value then
					local o = (k:GetPivot()).Position
					local P = LocalPlayer:DistanceFromCharacter(o)
					if P < T.Distance then
						T.Distance = P
						T.Object = k
					end
				end
			end
			if T.Object then
				return T.Object
			end
		end
		return o:FindFirstChild("RoomExit")
	end
	Toggles.RoomsAutoWalk:OnChanged(function(o)
		for o, T in CheesyState.RoomsNodesFolder:GetChildren() do
			if T.Name == "PathNode" then
				T:Destroy()
			end
		end
		if o and not Toggles.NoA90Damage.Value then
			Toggles.NoA90Damage:SetValue(true)
		end
	end)
	Connections.RoomsAutoWalkHandler = (game:GetService("RunService")).Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if
			not Toggles.RoomsAutoWalk.Value
			or CurrentFloor ~= "Rooms"
			or CheesyState.RoomsAutoWalkActive
			or not CharacterCollisionPart
		then
			return
		end
		local o, T = pcall(function()
			return LatestRoomValue and LatestRoomValue.Value
		end)
		if not o or not T or T >= 1000 then
			return
		end
		CheesyState.RoomsAutoWalkActive = true
		local k = (game:GetService("PathfindingService")):CreatePath({
			["AgentCanJump"] = true,
			["AgentCanClimb"] = false,
			["WaypointSpacing"] = 4,
			["AgentRadius"] = 1.5,
			["AgentHeight"] = 1.5,
			["Costs"] = { ["StuckPart"] = 8 },
		})
		if Toggles.RoomsAutoWalkIgnoreA60.Value and not Toggles.Godmode.Value then
			Toggles.Godmode:SetValue(true)
		end
		local P = Functions.RoomsAutoWalk.GetPathfindTarget()
		if not P then
			CheesyState.RoomsAutoWalkActive = false
			return
		end
		local w
		if P.Name == "RoomExit" then
			w = P.Position
		elseif P:FindFirstChild("HidePrompt") then
			for o, T in P:GetDescendants() do
				if T:IsA("BasePart") then
					T.CanCollide = false
				end
			end
			w = P.PrimaryPart.Position
		elseif P.Name == "GoldPile" or P.Name == "StardustPickup" then
			w = (P:GetPivot()).Position
			if _RoomsPickupStart == 0 then
				_RoomsPickupStart = tick()
			end
		end
		if P.Name ~= "GoldPile" and P.Name ~= "StardustPickup" then
			_RoomsPickupStart = 0
		end
		if CharacterCollisionPart.Anchored and not P:FindFirstChild("HidePrompt") then
			Character:SetAttribute("Hiding", true)
			GameRemotes.CamLock:FireServer()
			Character:SetAttribute("Hiding", false)
		end
		if not LatestRoomValue or not CurrentRooms then
			CheesyState.RoomsAutoWalkActive = false
			return
		end
		local F = CurrentRooms[tostring(LatestRoomValue.Value)]
		if not F then
			CheesyState.RoomsAutoWalkActive = false
			return
		end
		if F:FindFirstChild("Door") then
			F.Door.Door.CanCollide = false
		end
		if not w or LocalPlayer:DistanceFromCharacter(w) >= 750 then
			CheesyState.RoomsAutoWalkActive = false
			return
		end
		local A, d = pcall(k.ComputeAsync, k, CharacterCollisionPart.Position, w)
		if d then
			CheesyState.RoomsAutoWalkActive = false
			return
		end
		local C = k:GetWaypoints()
		if #C == 0 then
			local o = F:FindFirstChild("RoomExit")
			if o then
				Humanoid:MoveTo(o.Position)
			end
			CheesyState.RoomsAutoWalkActive = false
			return
		end
		for o, T in CheesyState.RoomsNodesFolder:GetChildren() do
			if T.Name == "PathNode" then
				T:Destroy()
			end
		end
		for o, T in ipairs(C) do
			local k = Instance.new("Part", CheesyState.RoomsNodesFolder)
			k.Transparency = Toggles.RoomsAutoWalkShowPathToggle.Value and 0.5 or 1
			k.Size = Vector3.one
			k.Position = T.Position
			k.Shape = Enum.PartType.Ball
			k.CanCollide = false
			k.Anchored = true
			k.Name = "PathNode"
			k.Color = Options.RoomsAutoWalkShowPathColor.Value
			k.Material = Enum.Material.Neon
		end
		local f = false
		for o, T in ipairs(C) do
			if f or not Toggles.RoomsAutoWalk.Value then
				break
			end
			local k = false
			local F = tick()
			local A = T
			local d = (game:GetService("RunService")).RenderStepped:Connect(function()
				if _Unloading then
					return
				end
				if f or not Toggles.RoomsAutoWalk.Value then
					k = true
					return
				end
				local o = Functions.RoomsAutoWalk.GetPathfindTarget()
				if o and (o:FindFirstChild("HidePrompt") and not P:FindFirstChild("HidePrompt")) then
					k = true
					return
				end
				if
					(P.Name == "GoldPile" and (not P.Parent or not P:GetAttribute("GoldValue")))
					or (P.Name == "StardustPickup" and not P.Parent)
				then
					k = true
					return
				end
				if P:FindFirstChild("HidePrompt") then
					local o = P:FindFirstChild("HidePrompt")
					if
						LocalPlayer:DistanceFromCharacter(w) < o.MaxActivationDistance
						and Character:GetAttribute("Hiding") ~= true
					then
						Functions.ForceFirePrompt(o)
					end
				elseif P.Name == "GoldPile" or P.Name == "StardustPickup" then
					local o = P:FindFirstChild("LootPrompt")
					if o and LocalPlayer:DistanceFromCharacter(w) < o.MaxActivationDistance then
						Functions.ForceFirePrompt(o)
					end
				end
				local T = Vector3.new(A.Position.X, HumanoidRootPart.Position.Y, A.Position.Z)
				if LocalPlayer:DistanceFromCharacter(T) < 5 then
					k = true
				end
				Humanoid:MoveTo(A.Position)
			end)
			while not k do
				if tick() - F > Options.RoomsAutoWalkPathfindTimeout.Value then
					local o = Instance.new("Part", CheesyState.RoomsNodesFolder)
					o.Transparency = 1
					o.Size = Vector3.one
					o.CFrame = CharacterCollision.CFrame
					o.Shape = Enum.PartType.Ball
					o.CanCollide = false
					o.Anchored = true
					o.Name = "StuckPart"
					local T = Instance.new("PathfindingModifier", o)
					T.Label = "StuckPart"
					f = true
					break
				end
				if _RoomsPickupStart > 0 and tick() - _RoomsPickupStart > 5 then
					_RoomsPickupTimeoutRoom = LatestRoomValue.Value
					_RoomsPickupStart = 0
					f = true
					break
				end
				task.wait()
			end
			d:Disconnect()
			Humanoid:MoveTo(HumanoidRootPart.Position)
		end
		CheesyState.RoomsAutoWalkActive = false
	end)
	if CurrentRooms then
		Connections.RoomsHandler = CurrentRooms.ChildAdded:Connect(function(o)
			for o, T in CheesyState.RoomsNodesFolder:GetChildren() do
				if T.Name == "StuckPart" then
					T:Destroy()
				end
			end
			if o:GetAttribute("RawName") and string.find(o:GetAttribute("RawName"), "Eyestalk") then
				local T
				local function createSeekPathNode(o)
					local k = Instance.new("Part")
					k.Size = Vector3.one
					k.Transparency = 1
					k.Parent = CheesyState.SeekNodesFolder
					k.Anchored = true
					k.Position = o
					k.CanCollide = false
					k.Name = "SeekLightNode"
					local P = T or k
					T = k
					local w = Instance.new("Beam")
					local F = rawget(Toggles, "ShowEyestalkPathColor")
							and Options.ShowEyestalkPathColor.Value
						or Color3.fromRGB(0, 255, 0)
					w.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, F),
						ColorSequenceKeypoint.new(1, F),
					})
					w.FaceCamera = true
					w.Width0 = 0.2
					w.Width1 = 0.2
					w.Brightness = 10
					w.LightInfluence = 0
					w.LightEmission = 0
					w.Enabled = true
					local A = rawget(Toggles, "ShowEyestalkPathToggle")
							and (Toggles.ShowEyestalkPathToggle.Value and 0)
						or 1
					w.Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, A),
						NumberSequenceKeypoint.new(1, A),
					})
					w.Parent = CheesyState.SeekNodesFolder
					local d = Instance.new("Attachment", k)
					local C = Instance.new("Attachment", P)
					w.Attachment0 = d
					w.Attachment1 = C
					table.insert(wT.EyestalkHighlights, w)
				end
				o:WaitForChild("RoomEntrance", 9000000000)
				o:WaitForChild("RoomExit", 9000000000)
				while not o:GetAttribute("PathFound") do
					if rawget(Toggles, "ShowEyestalkPathToggle") and Toggles.ShowEyestalkPathToggle.Value then
						local T = (game:GetService("PathfindingService")):CreatePath({
							["AgentCanJump"] = false,
							["AgentCanClimb"] = false,
							["WaypointSpacing"] = 2,
							["AgentRadius"] = 1,
							["AgentHeight"] = 1,
						})
						local P, w = pcall(T.ComputeAsync, T, HumanoidRootPart.Position, o.RoomExit.Position)
						if w then
							break
						end
						if T.Status == Enum.PathStatus.Success then
							o:SetAttribute("PathFound", true)
							for o, T in T:GetWaypoints() do
								createSeekPathNode(T.Position)
								task.wait()
							end
							break
						end
					end
					task.wait(0.25)
				end
			end
		end)
	end
	local function watchFloorChanges()
		local o = ReplicatedStorage:FindFirstChild("GameData")
		if o then
			local T = o:FindFirstChild("Floor")
			if T then
				_FloorConnection = (T:GetPropertyChangedSignal("Value")):Connect(refreshCurrentFloor)
				refreshCurrentFloor()
				return
			end
			local k
			k = o.ChildAdded:Connect(function(o)
				if o.Name == "Floor" then
					if k then
						k:Disconnect()
					end
					watchFloorChanges()
				end
			end)
			refreshCurrentFloor()
			return
		end
		local T
		T = ReplicatedStorage.ChildAdded:Connect(function(o)
			if o.Name == "GameData" then
				if T then
					T:Disconnect()
				end
				watchFloorChanges()
			end
		end)
		refreshCurrentFloor()
	end
	watchFloorChanges()
	Groupboxes.MinesLadder = WindTabs.Mines:Section({ Title = UiLibrary:Text("Visuals"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.MinesLadder, "Toggle", "LaddersESP", { ["Title"] = "Ladders", ["Value"] = false }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.LaddersESP.Section, "ColorPicker", "LaddersESPColor", { ["Title"] = "Ladders", ["Value"] = Color3.fromRGB(255, 255, 0) }, function(state, spec)
		return state.Section:Colorpicker({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Default = state.Value,
			Transparency = state.Transparency,
			Callback = function(value, transparency) state:Receive(value, transparency) end,
		})
	end, Toggles.LaddersESP)
	UiLibrary:Mount(Groupboxes.MinesLadder, "Toggle", "LaddersTracers", { ["Title"] = "Ladders Tracers", ["Value"] = false }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.LaddersTracers:OnChanged(function(o)
		if o and not Toggles.LaddersESP.Value then
			Toggles.LaddersTracers:SetValue(false)
			return
		end
		for T, k in ipairs(ESPCategories.Ladders) do
			local P = GetESPTarget(k, "Ladders")
			if P then
				ESPLibrary:SetTracersEnabled(P, o)
			end
		end
	end)
	Toggles.LaddersESP:OnChanged(function(o)
		if o then
			for o, T in ipairs(ESPCategories.Ladders) do
				addCategoryESP(T, "Ladders", "Ladder")
			end
		else
			removeCategoryESP("Ladders")
		end
	end)
	Options.LaddersESPColor:OnChanged(function(o)
		for T, k in ipairs(ESPCategories.Ladders) do
			ESPLibrary:UpdateObjectColor(GetESPTarget(k, "Ladders"), o)
		end
	end)
	UiLibrary:Mount(Groupboxes.MinesLadder, "Toggle", "ShowSeekPathToggle", {
			["Title"] = "Show Seek Path",
			["Value"] = false,
			["Desc"] = "Shows you the correct path in the seek chase",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.ShowSeekPathToggle.Section, "ColorPicker", "ShowSeekPathColor", { ["Title"] = "Seek Path", ["Value"] = Color3.fromRGB(0, 255, 0), ["Transparency"] = 0 }, function(state, spec)
		return state.Section:Colorpicker({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Default = state.Value,
			Transparency = state.Transparency,
			Callback = function(value, transparency) state:Receive(value, transparency) end,
		})
	end, Toggles.ShowSeekPathToggle)
	Toggles.ShowSeekPathToggle:OnChanged(function(o)
		Ld(wT.SeekHighlights, "ShowSeekPathColor", o)
	end)
	Options.ShowSeekPathColor:OnChanged(function(o)
		Od(wT.SeekHighlights, o)
	end)
	Groupboxes.MinesAnticheat = WindTabs.Mines:Section({ Title = UiLibrary:Text("Exploits"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.MinesAnticheat, "Toggle", "DisableAnticheat", {
			["Title"] = "Anticheat Bypass",
			["Value"] = false,
			["Desc"] = "Completely disables the anticheat, after interacting with a ladder.",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.DisableAnticheat:OnChanged(function(o)
		if CheesyState.AnticheatDisabled == true and not o then
			GameRemotes.ClimbLadder:FireServer()
			CheesyState.AnticheatDisabled = false
		end
	end)
	UiLibrary:TrackElement(Groupboxes.MinesAnticheat, Groupboxes.MinesAnticheat:Divider())
	UiLibrary:Mount(Groupboxes.MinesAnticheat, "Toggle", "RemoveFigureMines", {
			["Title"] = "Delete Figure (FE)",
			["Value"] = false,
			["Desc"] = "Removes figure for everyone, however this is inconsistent",
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.RemoveFigureMines:OnChanged(function(o)
		if o and (Executor.isnetworkowner and workspace:FindFirstChild("Figure")) then
			local o = detectFloor()
			for T, k in ipairs(wT.Entities) do
				if k.Name == "Figure" or k.Name == "FigureRig" or k.Name == "FigureRagdoll" then
					if o == "Mines" then
						for o, T in k:GetDescendants() do
							local k = T
							if
								T:IsA("BasePart") and pcall(function()
									return Executor.isnetworkowner(k)
								end)
							then
								k.Position = Vector3.new(-49999, -49999, -49999)
							end
						end
					elseif o == "OldHotel" or o == "Fools" then
						for o, T in k:GetDescendants() do
							local k = T
							if T:IsA("BasePart") then
								T.CanCollide = false
								if
									pcall(function()
										return Executor.isnetworkowner(k)
									end)
								then
									k.Position = Vector3.new(
										math.random(-29999, 29999),
										math.random(-29999, 29999),
										math.random(-29999, 29999)
									)
								end
							end
						end
					end
				end
			end
		end
		if o then
			local o = workspace:FindFirstChild("Figure")
			if o then
				for o, T in o:GetDescendants() do
					if T:IsA("BasePart") then
						T.CanCollide = false
					end
				end
			end
		end
	end)
	Ld = function(o, T, k)
		local P = k and 0 or 1
		local w = NumberSequence.new({ NumberSequenceKeypoint.new(0, P), NumberSequenceKeypoint.new(1, P) })
		for o, T in ipairs(o) do
			T.Transparency = w
		end
	end
	Od = function(o, T)
		local k = ColorSequence.new({ ColorSequenceKeypoint.new(0, T), ColorSequenceKeypoint.new(1, T) })
		for o, T in ipairs(o) do
			T.Color = k
		end
	end
	Groupboxes.MinesAutomation = WindTabs.Mines:Section({ Title = UiLibrary:Text("Automation"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.MinesAutomation, "Toggle", "AutoSteerMinecart", {
			["Title"] = "Auto Minecart",
			["Value"] = false,
			["Desc"] = "Automatically completes the minecart section of the seek chase",
			["Disabled"] = isSolara(),
			["DisabledTooltip"] = "Solara sandboxes require(), so the PlayerModule controls hook would land on a dead object :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.MinesAutomation, "Slider", "AutoSteerMinecartTurnDistance", { ["Title"] = "Turn Distance", ["Min"] = 20, ["Max"] = 40, ["Value"] = 30, ["Precision"] = 0 }, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.MinesAutomation, "Slider", "AutoSteerMinecartDuckDistance", { ["Title"] = "Crouch Distance", ["Min"] = 20, ["Max"] = 40, ["Value"] = 30, ["Precision"] = 0 }, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.MinesAutomation, "Toggle", "AutoSolveAnchors", {
			["Title"] = "Auto Solve Anchors",
			["Value"] = false,
			["Desc"] = "Automatically enters the correct code into anchors when you are near them.",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.MinesAutomation, "Toggle", "MinecartTeleport", {
			["Title"] = "Minecart Teleport",
			["Value"] = false,
			["Desc"] = "Teleports your minecart to complete the seek chase, do NOT use on high ping or low fps",
			["Disabled"] = not (hasHookMeta and hasHookFunction),
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.MinecartTeleport:OnChanged(function(o)
		if not MainHook then
			return
		end
		if o then
			local o = game:FindFirstChild("MinecartPos", true)
			if not o then
				UiLibrary:Notify({
					["Title"] = "Minecart Teleport",
					["Description"] = "Minecart chase is not active yet.",
					["Time"] = 3,
				})
				return
			end
			local k = restorefunction or restore_function
			local P = hookfunction or hook_function
			local w = {
				["DecodeHook"] = nil,
				["Decode"] = nil,
				["MinecartPos"] = o,
				["LatestRoom"] = tonumber(tostring(LatestRoomValue.Value)) or 0,
				["LatestRoomConn"] = nil,
				["GetDoor"] = nil,
				["RestoreDecode"] = k,
			}
			pcall(function()
				w.Decode = (require(ReplicatedStorage.NodeObject.MinecartNodes)).Decode
			end)
			w.GetDoor = function()
				local o = CurrentRooms and CurrentRooms:FindFirstChild(tostring(w.LatestRoom))
				return o and o:FindFirstChild("Door")
			end
			local function installMinecartDecodeHook()
				if not P or not w.Decode then
					return
				end
				w.DecodeHook = P(w.Decode, function(o, T, k)
					if T and (T.Parent and (tonumber(T.Parent.Name) or 0) < 49) then
						return nil
					end
					return w.DecodeHook(o, T, k)
				end)
			end
			w.LatestRoomConn = (LatestRoomValue:GetPropertyChangedSignal("Value")):Connect(function()
				task.wait()
				w.LatestRoom = tonumber(tostring(LatestRoomValue.Value)) or 0
			end)
			pcall(installMinecartDecodeHook)
			CheesyState.MinecartTeleportState = w
		else
			local o = CheesyState.MinecartTeleportState
			if o then
				if o.LatestRoomConn then
					pcall(function()
						o.LatestRoomConn:Disconnect()
					end)
				end
				if o.DecodeHook and o.RestoreDecode then
					pcall(function()
						o.RestoreDecode(o.Decode)
					end)
				end
				CheesyState.MinecartTeleportState = nil
			end
		end
	end)
	Groupboxes.MinesAutomation:Button({
		Title = CheesyTranslate("Complete Door 200") or "Complete Door 200",
		Desc = CheesyTranslate("Automatically teleports to and interacts with each water pump to complete the Dam Seek") or "Automatically teleports to and interacts with each water pump to complete the Dam Seek",
		Callback = function()
			if CurrentFloor ~= "Mines" then
				return
			end
			if not Character then
				UiLibrary:Notify({
					["Title"] = "Error",
					["Description"] = "Character not found",
					["Time"] = 3,
				})
				return
			end
			if LatestRoomValue and LatestRoomValue.Value < 99 then
				UiLibrary:Notify({
					["Title"] = "Door 200",
					["Description"] = "You haven't reached door 200...",
					["Time"] = 4,
				})
				return
			end
			UiLibrary:Notify({
				["Title"] = "Door 200",
				["Description"] = "Starting water pump automation...",
				["Time"] = 3,
			})
			local o = Character.CFrame
			local k = workspace:FindFirstChild("CurrentRooms")
			if not k then
				UiLibrary:Notify({
					["Title"] = "Error",
					["Description"] = "Could not find CurrentRooms",
					["Time"] = 4,
				})
				return
			end
			local P = k:FindFirstChild(LatestRoomValue and LatestRoomValue.Value or "200")
			if not P then
				UiLibrary:Notify({
					["Title"] = "Error",
					["Description"] = "Could not find the current room",
					["Time"] = 4,
				})
				return
			end
			local function waitUntilCutscene(o)
				for o = 1, (o or 40), 1 do
					if not Character then
						return
					end
					if Character:GetAttribute("InCutscene") ~= true then
						return
					end
					task.wait(0.25)
				end
			end
			local function teleportCharacterToNode(o, T)
				if not o or not Character then
					return
				end
				Character:PivotTo(o.CFrame)
				task.wait(0.25)
				local k = o:FindFirstChild(T, true)
				if k then
					Functions.ForceFirePrompt(k)
				end
				task.wait(0.25)
			end
			waitUntilCutscene()
			local A = P:FindFirstChild("_DamHandler")
			local d = 0
			if A then
				for o = 1, 3, 1 do
					local T = A:FindFirstChild("PlayerBarriers" .. o)
					local k = T and T:FindFirstChild("Flood" .. o)
					local P = k and k:FindFirstChild("Pumps")
					if P then
						for o, T in ipairs(P:GetChildren()) do
							local k = T:FindFirstChild("Wheel", true)
							if k then
								teleportCharacterToNode(k, "ValvePrompt")
								d = d + 1
							end
						end
					end
					waitUntilCutscene()
					task.wait(0.5)
				end
			end
			waitUntilCutscene()
			local C = P:FindFirstChild("MinesGenerator", true)
			if C then
				local o = C:FindFirstChild("Lever", true)
				if o then
					local T = C.PrimaryPart or o
					teleportCharacterToNode(T, "LeverPrompt")
				end
			end
			Character:PivotTo(o)
			if d == 0 then
				UiLibrary:Notify({
					["Title"] = "Door 200",
					["Description"] = "No pumps found, is the dam loaded?",
					["Time"] = 5,
				})
			else
				UiLibrary:Notify({
					["Title"] = "Door 200",
					["Description"] = "Finished " .. (d .. " pumps"),
					["Time"] = 4,
				})
			end
		end,
	})
	local function setupAutoSolveAnchors()
		if AutoSolveAnchorsConnection then
			AutoSolveAnchorsConnection:Disconnect()
			AutoSolveAnchorsConnection = nil
		end
		if not Toggles.AutoSolveAnchors.Value then
			return
		end
		local o = 0
		AutoSolveAnchorsConnection = RunService.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if not Toggles.AutoSolveAnchors.Value or CurrentFloor ~= "Mines" then
				return
			end
			local T = os.clock()
			if T - o < 0.1 then
				return
			end
			o = T
			local k = LocalPlayer:FindFirstChildOfClass("PlayerGui")
			if not k then
				return
			end
			local P = k:FindFirstChild("AnchorHintFrame", true)
			if not P then
				return
			end
			local w = P:FindFirstChild("AnchorCode")
			local F = P:FindFirstChild("Code")
			if not w or not F then
				return
			end
			local A = tostring(w.Text or "")
			if A == "" then
				return
			end
			local d = workspace:FindFirstChild("CurrentRooms")
			if not d then
				return
			end
			for o, T in d:GetDescendants() do
				if T.Name ~= "MinesAnchor" or not T:IsA("Model") then
					continue
				end
				if T:GetAttribute("Activated") then
					continue
				end
				local k = T:FindFirstChild("Sign")
				if not k then
					continue
				end
				local P = k:FindFirstChildOfClass("TextLabel")
				if not P or P.Text ~= A then
					continue
				end
				local w = T.PrimaryPart
				if not w then
					continue
				end
				local d = T:FindFirstChild("ActivateEventPrompt")
						and T.ActivateEventPrompt.MaxActivationDistance
					or 20
				if
					HumanoidRootPart
					and (
						HumanoidRootPart.Position
						and ((HumanoidRootPart.Position - w.Position)).Magnitude <= d
					)
				then
					local o = T:FindFirstChild("AnchorRemote")
					if o then
						o:InvokeServer(F.Text)
					end
					break
				end
			end
		end)
	end
	Toggles.AutoSolveAnchors:OnChanged(setupAutoSolveAnchors)
	local function setupAutoMinecart()
		if AutoMinecartConnection then
			AutoMinecartConnection:Disconnect()
			AutoMinecartConnection = nil
		end
		if CheesyState.OriginalGetMoveVector then
			pcall(function()
				local o = (require(LocalPlayer.PlayerScripts.PlayerModule)):GetControls()
				o.GetMoveVector = CheesyState.OriginalGetMoveVector
			end)
			CheesyState.OriginalGetMoveVector = nil
		end
		if not Toggles.AutoSteerMinecart.Value then
			return
		end
		local o = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		local T = o and o:FindFirstChild("MainUI")
		local k = T and T:FindFirstChild("Initiator")
		local P = k and k:FindFirstChild("Main_Game")
		if not P then
			return
		end
		local w
		if isSolara() then
			w = setmetatable({
				["crouch"] = function(o)
					pcall(function()
						local T = (game:GetService("ReplicatedStorage")):FindFirstChild("RemotesFolder")
						local k = T and T:FindFirstChild("Crouch")
						if k then
							k:FireServer(o and true or false, true)
						end
					end)
				end,
			}, {
				["__newindex"] = function(o, T, k)
					if T == "fovtarget" then
						pcall(function()
							workspace.CurrentCamera.FieldOfView = k
						end)
					else
						rawset(o, T, k)
					end
				end,
			})
		else
			local o, T = pcall(require, P)
			if not o or not T then
				return
			end
			w = T
		end
		local F
		local A, d = pcall(function()
			return (require(LocalPlayer.PlayerScripts.PlayerModule)):GetControls()
		end)
		if A and d then
			F = d
		else
			return
		end
		local C = F.GetMoveVector
		CheesyState.OriginalGetMoveVector = C
		F.GetMoveVector = function(...)
			if Toggles.AutoSteerMinecart.Value and CurrentFloor == "Mines" then
				local o = CheesyState.NearestTurnNode
				if o and Functions.GetMinecart() then
					local T = o:GetAttribute("Turn")
					return T == "Left" and Vector3.new(-1, 0, 0)
						or T == "Right" and Vector3.new(1, 0, 0)
						or Vector3.zero
				end
			end
			return C(...)
		end
		CheesyState.AutoMinecartDucked = false
		CheesyState.LastDuck = tick()
		AutoMinecartConnection = RunService.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if
				not Toggles.AutoSteerMinecart.Value
				or not Functions.GetMinecart()
				or tick() - CheesyState.LastDuck < 0.1
			then
				return
			end
			CheesyState.NearestTurnNode = Functions.GetNearestTurnNode()
			if not CheesyState.AutoMinecartDucked and Functions.GetNearestDuckBoard() then
				w.crouch(true)
				CheesyState.AutoMinecartDucked = true
			elseif not Functions.GetNearestDuckBoard() and CheesyState.AutoMinecartDucked then
				w.crouch(false)
				CheesyState.AutoMinecartDucked = false
			end
			if Toggles.FOVChanger and (Toggles.FOVChanger.Value and Options.FieldOfView) then
				if w then
					w.fovtarget = Options.FieldOfView.Value
				else
					CurrentCamera.FieldOfView = Options.FieldOfView.Value
				end
			end
			CheesyState.LastDuck = tick()
		end)
	end
	Toggles.AutoSteerMinecart:OnChanged(setupAutoMinecart)
	Groupboxes.Visuals_Camera = WindTabs.Visuals:Section({ Title = UiLibrary:Text("Camera"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "Fullbright", {
			["Title"] = "Fullbright",
			["Value"] = false,
			["Desc"] = "Makes your game very bright, and removes shadows",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "FullbrightBrightness", {
			["Title"] = "Brightness Level",
			["Value"] = 3,
			["Min"] = 1,
			["Max"] = 10,
			["Precision"] = 1,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	local function applyFullbright()
		local o = Options.FullbrightBrightness.Value
		Lighting.Ambient = Color3.new(1, 1, 1)
		Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
		Lighting.GlobalShadows = false
		Lighting.Brightness = o
		Lighting.ClockTime = 14
		Lighting.FogColor = Color3.new(1, 1, 1)
		Lighting.FogEnd = 1000000000
		Lighting.ColorShift_Top = Color3.new(1, 1, 1)
		Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
		Lighting.ExposureCompensation = 0
		local T = Lighting:FindFirstChildOfClass("Atmosphere")
		if T then
			T.Haze = 0
			T.Density = 0
			T.Offset = 0
			T.Color = Color3.new(1, 1, 1)
			T.Decay = Color3.new(1, 1, 1)
			T.Glare = 0
		end
	end
	local function restoreLighting()
		if not fbDefaults then
			return
		end
		Lighting.Ambient = fbDefaults.Ambient
		Lighting.OutdoorAmbient = fbDefaults.OutdoorAmbient
		Lighting.GlobalShadows = fbDefaults.GlobalShadows
		Lighting.Brightness = fbDefaults.Brightness
		Lighting.ClockTime = fbDefaults.ClockTime
		Lighting.FogColor = fbDefaults.FogColor
		Lighting.FogEnd = fbDefaults.FogEnd
		Lighting.ColorShift_Top = fbDefaults.ColorShift_Top
		Lighting.ColorShift_Bottom = fbDefaults.ColorShift_Bottom
		Lighting.ExposureCompensation = fbDefaults.ExposureCompensation
		if fbAtmos and fbAtmosDefaults then
			fbAtmos.Haze = fbAtmosDefaults.Haze
			fbAtmos.Density = fbAtmosDefaults.Density
			fbAtmos.Offset = fbAtmosDefaults.Offset
			fbAtmos.Color = fbAtmosDefaults.Color
			fbAtmos.Decay = fbAtmosDefaults.Decay
			fbAtmos.Glare = fbAtmosDefaults.Glare
		end
	end
	Toggles.Fullbright:OnChanged(function(o)
		if _FullbrightConnection then
			_FullbrightConnection:Disconnect()
			_FullbrightConnection = nil
		end
		if _FullbrightRoomConn then
			_FullbrightRoomConn:Disconnect()
			_FullbrightRoomConn = nil
		end
		if o then
			fbDefaults = {
				["Ambient"] = Lighting.Ambient,
				["OutdoorAmbient"] = Lighting.OutdoorAmbient,
				["GlobalShadows"] = Lighting.GlobalShadows,
				["Brightness"] = Lighting.Brightness,
				["ClockTime"] = Lighting.ClockTime,
				["FogColor"] = Lighting.FogColor,
				["FogEnd"] = Lighting.FogEnd,
				["ColorShift_Top"] = Lighting.ColorShift_Top,
				["ColorShift_Bottom"] = Lighting.ColorShift_Bottom,
				["ExposureCompensation"] = Lighting.ExposureCompensation,
			}
			fbAtmos = Lighting:FindFirstChildOfClass("Atmosphere")
			if fbAtmos then
				fbAtmosDefaults = {
					["Haze"] = fbAtmos.Haze,
					["Density"] = fbAtmos.Density,
					["Offset"] = fbAtmos.Offset,
					["Color"] = fbAtmos.Color,
					["Decay"] = fbAtmos.Decay,
					["Glare"] = fbAtmos.Glare,
				}
			end
			applyFullbright()
			local o = 0
			_FullbrightConnection = RunService.Heartbeat:Connect(function()
				if _Unloading then
					return
				end
				local T = tick()
				if T - o < 0.3 then
					return
				end
				o = T
				applyFullbright()
			end)
			local T = workspace:FindFirstChild("CurrentRooms")
			if T then
				_FullbrightRoomConn = T.ChildAdded:Connect(function()
					applyFullbright()
				end)
			end
		else
			restoreLighting()
			fbDefaults = nil
			fbAtmosDefaults = nil
		end
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "AmbientToggle", {
			["Title"] = "Ambient",
			["Value"] = false,
			["Desc"] = "Changes the lighting color to the specified value",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.AmbientToggle.Section, "ColorPicker", "AmbientColor", { ["Title"] = "Ambient", ["Value"] = Color3.fromRGB(255, 255, 255), ["Transparency"] = 0 }, function(state, spec)
		return state.Section:Colorpicker({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Default = state.Value,
			Transparency = state.Transparency,
			Callback = function(value, transparency) state:Receive(value, transparency) end,
		})
	end, Toggles.AmbientToggle)
	Toggles.AmbientToggle:OnChanged(function(o)
		local T = CurrentRooms
			and CurrentRooms:FindFirstChild(tostring(LocalPlayer:GetAttribute("CurrentRoom")))
		local k = T and T:GetAttribute("Ambient");
		(TweenService:Create(
			Lighting,
			TweenInfo.new(0.2, Enum.EasingStyle.Exponential),
			{ ["Ambient"] = o and Options.AmbientColor.Value or k or Color3.fromRGB(255, 255, 255) }
		)):Play()
	end)
	Options.AmbientColor:OnChanged(function()
		if Toggles.AmbientToggle and Toggles.AmbientToggle.Value then
			(TweenService:Create(
				Lighting,
				TweenInfo.new(0.2, Enum.EasingStyle.Exponential),
				{ ["Ambient"] = Options.AmbientColor.Value }
			)):Play()
		end
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_Camera, Groupboxes.Visuals_Camera:Divider())
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "FOVChanger", {
			["Title"] = "Field of View",
			["Value"] = false,
			["Desc"] = "Applies the field of view value from the slider below",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "FieldOfView", {
			["Title"] = "Field of View",
			["Min"] = 70,
			["Max"] = 120,
			["Value"] = 70,
			["Precision"] = 0,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "ThirdPerson", {
			["Title"] = "Third Person",
			["Value"] = false,
			["Desc"] = "Puts your camera in a third person view",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.ThirdPerson.Section, "KeyPicker", "ThirdPersonKeybind", { ["Title"] = "Third Person", ["Value"] = "V", ["Mode"] = "Toggle", ["SyncToggleState"] = true }, function(state, spec)
		return state.Section:Keybind({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Value = state.Value,
			Callback = function() end,
		})
	end, Toggles.ThirdPerson)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "ThirdPersonOffsetX", {
			["Title"] = "X Offset",
			["Min"] = -10,
			["Max"] = 10,
			["Value"] = 0,
			["Precision"] = 1,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "ThirdPersonOffsetY", {
			["Title"] = "Y Offset",
			["Min"] = -10,
			["Max"] = 10,
			["Value"] = 0.5,
			["Precision"] = 1,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "ThirdPersonOffsetZ", {
			["Title"] = "Z Offset",
			["Min"] = -10,
			["Max"] = 10,
			["Value"] = 7.5,
			["Precision"] = 1,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "ThirdPersonWallCheck", {
			["Title"] = "Wall Check",
			["Value"] = false,
			["Desc"] = "Prevents third person camera from going through walls",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.ThirdPerson:OnChanged(updateThirdPerson)
	UiLibrary:TrackElement(Groupboxes.Visuals_Camera, Groupboxes.Visuals_Camera:Divider())
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "ViewmodelOffsetToggle", {
			["Title"] = "Viewmodel Offset",
			["Value"] = false,
			["Desc"] = "Changes the offset of your viewmodel while holding an item.",
			["Disabled"] = (not hasRequire) or isSolara(),
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "ViewmodelOffsetX", {
			["Title"] = "X Offset",
			["Min"] = -10,
			["Max"] = 10,
			["Value"] = 0,
			["Precision"] = 1,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "ViewmodelOffsetY", {
			["Title"] = "Y Offset",
			["Min"] = -10,
			["Max"] = 10,
			["Value"] = 0,
			["Precision"] = 1,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "ViewmodelOffsetZ", {
			["Title"] = "Z Offset",
			["Min"] = -10,
			["Max"] = 10,
			["Value"] = 0,
			["Precision"] = 1,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "FreecamToggle", {
			["Title"] = "Freecam",
			["Value"] = false,
			["Desc"] = "Enables freecam with WASD movement and mouse look",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.FreecamToggle.Section, "KeyPicker", "FreecamKeybind", { ["Title"] = "Freecam", ["Value"] = "Q", ["Mode"] = "Toggle", ["SyncToggleState"] = true }, function(state, spec)
		return state.Section:Keybind({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Value = state.Value,
			Callback = function() end,
		})
	end, Toggles.FreecamToggle)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "FreecamSpeed", {
			["Title"] = "Freecam Speed",
			["Min"] = 10,
			["Max"] = 300,
			["Value"] = 75,
			["Precision"] = 0,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_Camera, Groupboxes.Visuals_Camera:Divider())
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "RemoveCameraBobbing", {
			["Title"] = "Remove Camera Bobbing",
			["Value"] = false,
			["Desc"] = "Removes camera 'bobbing'",
			["Disabled"] = (not hasRequire) or isSolara(),
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "RemoveCameraShake", {
			["Title"] = "Remove Camera Shake",
			["Value"] = false,
			["Desc"] = "Removes camera shake",
			["Disabled"] = (not hasRequire) or isSolara(),
			["DisabledTooltip"] = "Your executor doesn't support this feature :(",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "RemoveCameraFog", { ["Title"] = "Remove Fog", ["Value"] = false, ["Desc"] = "Removes camera fog" }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "DisableFiredampEffect", {
			["Title"] = "Remove Firedamp Effect",
			["Value"] = false,
			["Desc"] = "Removes the firedamp fog/effect when inside a room",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	FreecamConnection = nil
	local function stopFreecam()
		local o = workspace:FindFirstChild("FreecamPart")
		if o then
			o:Destroy()
		end
		local T = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if T then
			T.Anchored = false
		end
		if LocalPlayer:GetAttribute("fc_om") then
			LocalPlayer.CameraMinZoomDistance = LocalPlayer:GetAttribute("fc_om")
		end
		if LocalPlayer:GetAttribute("fc_ox") then
			LocalPlayer.CameraMaxZoomDistance = LocalPlayer:GetAttribute("fc_ox")
		end
	end
	Toggles.FreecamToggle:OnChanged(function(o)
		if FreecamConnection then
			FreecamConnection:Disconnect()
		end
		if not o then
			stopFreecam()
		else
			FreecamConnection = RunService.RenderStepped:Connect(function(o)
				if _Unloading then
					return
				end
				if not Toggles.FreecamToggle.Value then
					return
				end
				local T = LocalPlayer.Character
				local k = T and T:FindFirstChildOfClass("Humanoid")
				local P = T and T:FindFirstChild("HumanoidRootPart")
				if P and not P.Anchored then
					P.Anchored = true
				end
				if not workspace:FindFirstChild("FreecamPart") then
					local o = Instance.new("Part")
					o.Name = "FreecamPart"
					o.Size = Vector3.new(0.01, 0.01, 0.01)
					o.Transparency = 1
					o.CanCollide = false
					o.Anchored = true
					o.CFrame = CurrentCamera.CFrame
					o.Parent = workspace
					LocalPlayer:SetAttribute("fc_om", LocalPlayer.CameraMinZoomDistance)
					LocalPlayer:SetAttribute("fc_ox", LocalPlayer.CameraMaxZoomDistance)
					LocalPlayer.CameraMinZoomDistance = 0
					LocalPlayer.CameraMaxZoomDistance = 0
					local T, k, P = CurrentCamera.CFrame:ToOrientation()
					LocalPlayer:SetAttribute("fc_p", math.deg(T))
					LocalPlayer:SetAttribute("fc_y", math.deg(k))
				end
				local w = workspace:FindFirstChild("FreecamPart")
				local F = CurrentCamera
				if w and F then
					local T = UserInputService:GetMouseDelta()
					local P = UserInputService.KeyboardEnabled and 0.3 or 0.6
					local A = (LocalPlayer:GetAttribute("fc_p") or 0) - (T.Y * P)
					local d = (LocalPlayer:GetAttribute("fc_y") or 0) - (T.X * P)
					A = math.max(-80, math.min(80, A))
					LocalPlayer:SetAttribute("fc_p", A)
					LocalPlayer:SetAttribute("fc_y", d)
					w.CFrame = CFrame.new(w.Position) * CFrame.fromOrientation(math.rad(A), math.rad(d), 0)
					F.CFrame = w.CFrame
					F.Focus = F.CFrame * CFrame.new(0, 0, -10)
					if k and k.MoveDirection.Magnitude > 0 then
						local T = Options.FreecamSpeed and Options.FreecamSpeed.Value or 75
						local P = k.MoveDirection
						local A = F.CFrame:VectorToObjectSpace(P)
						local d = (F.CFrame.RightVector * A.X) + (F.CFrame.LookVector * -A.Z)
						w.Position = w.Position + ((d * T) * o)
					end
				end
			end)
		end
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_Camera, Groupboxes.Visuals_Camera:Divider())
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "NotifyOxygen", {
			["Title"] = "Oxygen Notifications",
			["Value"] = false,
			["Desc"] = "Shows a notification when your oxygen level changes",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "NotifyHasteTime", {
			["Title"] = "Haste/Time Notifications",
			["Value"] = false,
			["Desc"] = "Shows a notification of the remaining time before Haste spawns",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_Camera, Groupboxes.Visuals_Camera:Divider())
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "TransparentHidingSpotsToggle", {
			["Title"] = "Transparent Hiding Spots",
			["Value"] = false,
			["Desc"] = "Makes a hiding spot transparent when you enter it",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Slider", "TransparentHidingSpotsSlider", {
			["Title"] = "Transparency",
			["Min"] = 0,
			["Max"] = 1,
			["Value"] = 0.5,
			["Precision"] = 2,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_Camera, Groupboxes.Visuals_Camera:Divider())
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "DisableJumpscares", {
			["Title"] = "Disable Jumpscares",
			["Value"] = false,
			["Desc"] = "Removes jumpscares from the chosen entities",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Dropdown", "JumpscaresList", {
			["Title"] = "Jumpscares To Disable",
			["Values"] = {
				"Glitch",
				"Timothy",
				"Void",
				"Rush",
				"Ambush",
				"Screech",
				"Figure",
				"Seek",
			},
			["Multi"] = true,
			["AllowNone"] = true,
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_Camera, Groupboxes.Visuals_Camera:Divider())
	CutsceneNames = {
		"Figure",
		"FigureEnd",
		"FigureHotelEnd",
		"FigureHotelFire",
		"SeekIntroFools",
		"SeekIntroHotel",
		"SeekIntroMines",
		"SeekIntroMines2",
		"SerewSeekDrain",
		"SewerSeekLower",
		"GrumbleNestEnd",
		"EyestalkIntro",
	}
	UiLibrary:Mount(Groupboxes.Visuals_Camera, "Toggle", "RemoveCutscenes", {
			["Title"] = "Remove Cutscenes",
			["Value"] = false,
			["Desc"] = "Removes cutscenes that aren't needed for progression",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.RemoveCutscenes:OnChanged(function(o)
		local T = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		local k = T and T:FindFirstChild("MainUI")
		local P = k and k:FindFirstChild("Initiator")
		local w = P and P:FindFirstChild("Main_Game")
		local F = w and w:FindFirstChild("RemoteListener")
		if not F then
			return
		end
		local A = F:FindFirstChild("Cutscenes")
		if A then
			for T, k in pairs(A:GetChildren()) do
				if
					TableFind(CutsceneNames, k.Name) and k:IsA("ModuleScript")
					or TableFind(CutsceneNames, k:GetAttribute("OriginalName"))
						and k:IsA("ModuleScript")
				then
					k.Name = (o and k.Name .. "_Disabled" or k:GetAttribute("OriginalName") or k.Name)
				end
			end
		end
		local d = ReplicatedStorage:FindFirstChild("FloorReplicated")
		if d then
			for T, k in pairs(d:GetChildren()) do
				if
					TableFind(CutsceneNames, k.Name) and k:IsA("ModuleScript")
					or TableFind(CutsceneNames, k:GetAttribute("OriginalName"))
						and k:IsA("ModuleScript")
				then
					k.Name = (o and k.Name .. "_Disabled" or k:GetAttribute("OriginalName") or k.Name)
				end
			end
		end
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Toggle", "ESPRainbow", { ["Title"] = "Rainbow ESP", ["Value"] = false }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_Settings, Groupboxes.Visuals_Settings:Divider())
	TracerCategories = { "Entities", "Doors", "Objectives", "Items", "Chests", "HidingSpots" }
	for o, T in ipairs(TracerCategories) do
		local k = T
		local P = k .. "Tracers"
		local w = ESPToggleKeys[k]
		local F = k == "HidingSpots" and "Hiding Spots" or k
		UiLibrary:Mount(Groupboxes.Visuals_Settings, "Toggle", P, { ["Title"] = F .. " Tracers", ["Value"] = false }, function(state, spec)
			return state.Section:Toggle({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Value = state.Value,
				Callback = function(value) state:Receive(value) end,
			})
		end)
		Toggles[P]:OnChanged(function(o)
			if o and not Toggles[w].Value then
				Toggles[P]:SetValue(false)
				return
			end
			for T, P in ipairs(ESPCategories[k]) do
				local w = GetESPTarget(P, k)
				if w then
					ESPLibrary:SetTracersEnabled(w, o)
				end
			end
		end)
	end
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Dropdown", "ESPTracerOrigin", { ["Title"] = "Tracer Origin", ["Values"] = { "Top", "Middle", "Bottom" }, ["Value"] = 3 }, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Toggle", "ESPShowText", { ["Title"] = "Show ESP Text", ["Value"] = true }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Toggle", "ESPShowDistance", { ["Title"] = "Show Distance", ["Value"] = true }, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Slider", "ESPTextSize", {
			["Title"] = "Text Size",
			["Min"] = 8,
			["Max"] = 24,
			["Value"] = 15,
			["Precision"] = 0,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Dropdown", "ESPTextFont", {
			["Title"] = "Text Font",
			["Values"] = {
				"Legacy",
				"Arial",
				"ArialBold",
				"SourceSans",
				"SourceSansBold",
				"SourceSansLight",
				"SourceSansItalic",
				"Bodoni",
				"Garamond",
				"Cartoon",
				"Code",
				"Highway",
				"SciFi",
				"Arcade",
				"Fantasy",
				"Antique",
				"SourceSansSemibold",
				"Gotham",
				"GothamMedium",
				"GothamBold",
				"GothamBlack",
				"AmaticSC",
				"Bangers",
				"Creepster",
				"DenkOne",
				"Fondamento",
				"FredokaOne",
				"GrenzeGotisch",
				"IndieFlower",
				"JosefinSans",
				"Jura",
				"Kalam",
				"LuckiestGuy",
				"Merriweather",
				"Michroma",
				"Nunito",
				"Oswald",
				"PatrickHand",
				"PermanentMarker",
				"Roboto",
				"RobotoCondensed",
				"RobotoMono",
				"Sarpanch",
				"SpecialElite",
				"TitilliumWeb",
				"Ubuntu",
			},
			["Value"] = 11,
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Slider", "ESPRenderLimit", {
			["Title"] = "ESP Highlight Limit",
			["Min"] = 30,
			["Max"] = 240,
			["Value"] = 240,
			["Precision"] = 0,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Slider", "ESPMaxDistance", {
			["Title"] = "ESP Distance",
			["Min"] = 50,
			["Max"] = 500,
			["Value"] = 250,
			["Precision"] = 0,
			["Compact"] = true,
			["Suffix"] = " studs",
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_Settings, Groupboxes.Visuals_Settings:Divider())
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Toggle", "UseESPOutlineColour", {
			["Title"] = "Use ESP Outline (colour)",
			["Value"] = false,
			["Desc"] = "Makes the outline of all ESP the same colour as the ESP itself",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Toggles.UseESPOutlineColour.Section, "ColorPicker", "ESPOutline", { ["Title"] = "ESP Outline", ["Value"] = Color3.fromRGB(255, 255, 255) }, function(state, spec)
		return state.Section:Colorpicker({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Default = state.Value,
			Transparency = state.Transparency,
			Callback = function(value, transparency) state:Receive(value, transparency) end,
		})
	end, Toggles.UseESPOutlineColour)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Slider", "ESPFillTransparency", {
			["Title"] = "Fill Transparency",
			["Min"] = 0,
			["Max"] = 1,
			["Value"] = 0.75,
			["Precision"] = 2,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Slider", "ESPOutlineTransparency", {
			["Title"] = "Outline Transparency",
			["Min"] = 0,
			["Max"] = 1,
			["Value"] = 0,
			["Precision"] = 2,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Slider", "ESPTextTransparency", {
			["Title"] = "Text Transparency",
			["Min"] = 0,
			["Max"] = 1,
			["Value"] = 0,
			["Precision"] = 2,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Slider", "ESPTextOutlineTransparency", {
			["Title"] = "Text Outline Transparency",
			["Min"] = 0,
			["Max"] = 1,
			["Value"] = 0,
			["Precision"] = 2,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Settings, "Slider", "ESPTracerThickness", {
			["Title"] = "Tracer Thickness",
			["Min"] = 0.5,
			["Max"] = 2,
			["Value"] = 0.75,
			["Precision"] = 2,
			["Compact"] = true,
		}, function(state, spec)
		return state.Section:Slider({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Step = 10 ^ -(spec.Precision or 0),
			Value = { Min = state.Min, Max = state.Max, Default = state.Value },
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Groupboxes.Visuals_Notifs = WindTabs.Visuals:Section({ Title = UiLibrary:Text("Entity Notifications"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.Visuals_Notifs, "Toggle", "NotifyEntities", {
			["Title"] = "Entity Notifications",
			["Value"] = false,
			["Desc"] = "Receive notifications/popups when entities spawn",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Notifs, "Dropdown", "EntityList", {
			["Title"] = "Entity List",
			["Values"] = {
				"Rush",
				"Ambush",
				"A-60",
				"A-120",
				"Blitz",
				"Eyes",
				"Lookman",
				"Monument",
				"Sally",
				"Gloombat Swarm",
				"Glitch Rush",
				"Glitch Ambush",
				"Drones",
				"Bash",
				"Electric Puddle",
				"Scribbles",
				"Noise",
				"Creak",
			},
			["Multi"] = true,
			["AllowNone"] = true,
			["Desc"] = "Only notify for selected entities (leave empty to notify all)",
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Notifs, "Dropdown", "NotifyStyle", { ["Title"] = "Notification Style", ["Values"] = { "WindUI", "Achievement" }, ["Value"] = 1 }, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Notifs, "Dropdown", "NotifySound", {
			["Title"] = "Notification Sound",
			["Values"] = { "Achievement", "Tone", "Alert", "Windows XP", "GTA Cell" },
			["Value"] = 5,
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_Notifs, Groupboxes.Visuals_Notifs:Divider())
	UiLibrary:Mount(Groupboxes.Visuals_Notifs, "Toggle", "EntityChatToggle", {
			["Title"] = "Notify Chat",
			["Value"] = false,
			["Desc"] = "Sends a message in the chat when an entity spawns",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_Notifs, "Input", "EntityChatMessage", { ["Title"] = "Message", ["Value"] = "spawned!", ["Numeric"] = false, ["Placeholder"] = "Message" }, function(state, spec)
		return state.Section:Input({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Placeholder = UiLibrary:Text(spec.Placeholder),
			Value = state.Value,
			ClearTextOnFocus = spec.ClearTextOnFocus,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Groupboxes.Visuals_ItemNotifs = WindTabs.Visuals:Section({ Title = UiLibrary:Text("Item Notifications"), Box = true, Opened = true })
	UiLibrary:Mount(Groupboxes.Visuals_ItemNotifs, "Toggle", "NotifyItems", {
			["Title"] = "Item Notifications",
			["Value"] = false,
			["Desc"] = "Receive notifications/popups when items spawn (shows distance)",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_ItemNotifs, "Dropdown", "ItemList", {
			["Title"] = "Item List",
			["Values"] = {
				"Alcohol Bottles",
				"Alarm Clock",
				"Aloe Vera",
				"Bandage",
				"Bandage Pack",
				"Battery",
				"Battery Pack",
				"Big Bomb",
				"Big Shield Potion",
				"Bomb",
				"Boxing Gloves",
				"Briefcase",
				"Bread",
				"Broken Monitor",
				"Candle",
				"Candy",
				"CD Disc",
				"Cheese",
				"Compass",
				"Crucifix",
				"Donut",
				"Flashlight",
				"Fih Food",
				"Glitch Fragment",
				"Glowstick",
				"Golden Gun",
				"Gummy Flashlight",
				"Gween Soda",
				"Gween Soda Pack",
				"Hiding Box",
				"Holy Hand Grenade",
				"Honey Pot",
				"Iron Key",
				"Jerry Can",
				"Knockbomb",
				"Lamp",
				"Lantern",
				"Laser Pointer",
				"Lighter",
				"Lockpicks",
				"Lotus",
				"Lotus Petal",
				"Mini Shield Potion",
				"Moonlight Candle",
				"Moonlight Smoothie",
				"Multitool",
				"Nanner",
				"Paper Plane",
				"Pizza",
				"Lunch Box",
				"Rift Jar",
				"Sally Toy",
				"Shears",
				"Skeleton Key",
				"Smoothie",
				"Spotlight",
				"Starlight Barrel",
				"Starlight Bottle",
				"Starlight Vial",
				"Stop Sign",
				"Straplight",
				"Tablet",
				"Tip Jar",
				"Vitamins",
			},
			["Multi"] = true,
			["AllowNone"] = true,
			["Desc"] = "Only notify for selected items (leave empty to notify all)",
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_ItemNotifs, "Dropdown", "ItemNotifyStyle", { ["Title"] = "Notification Style", ["Values"] = { "WindUI", "Achievement" }, ["Value"] = 1 }, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_ItemNotifs, "Dropdown", "ItemNotifySound", {
			["Title"] = "Notification Sound",
			["Values"] = { "Achievement", "Tone", "Alert", "Windows XP", "GTA Cell" },
			["Value"] = 4,
		}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Groupboxes.Visuals_ItemNotifs, Groupboxes.Visuals_ItemNotifs:Divider())
	UiLibrary:Mount(Groupboxes.Visuals_ItemNotifs, "Toggle", "ItemChatToggle", {
			["Title"] = "Notify Chat",
			["Value"] = false,
			["Desc"] = "Sends a message in the chat when an item spawns",
		}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Groupboxes.Visuals_ItemNotifs, "Input", "ItemChatMessage", { ["Title"] = "Message", ["Value"] = "spawned!", ["Numeric"] = false, ["Placeholder"] = "Message" }, function(state, spec)
		return state.Section:Input({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Placeholder = UiLibrary:Text(spec.Placeholder),
			Value = state.Value,
			ClearTextOnFocus = spec.ClearTextOnFocus,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	Toggles.ESPRainbow:OnChanged(function(o)
		ESPLibrary:SetRainbow(o)
	end)
	Options.ESPTracerOrigin:OnChanged(function(o)
		local T = { ["Top"] = "Top", ["Middle"] = "Center", ["Bottom"] = "Bottom" }
		ESPLibrary:SetTracerOrigin(T[o] or "Bottom")
	end)
	Toggles.ESPShowText:OnChanged(function(o)
		ESPLibrary.ShowESPText = o
	end)
	Toggles.ESPShowDistance:OnChanged(function(o)
		ESPLibrary:SetShowDistance(o)
	end)
	Options.ESPTextSize:OnChanged(function(o)
		ESPLibrary:SetTextSize(o)
	end)
	Options.ESPTextFont:OnChanged(function(o)
		ESPLibrary:SetFont(Enum.Font[o])
	end)
	Options.ESPRenderLimit:OnChanged(function(o)
		ESPLibrary:SetRenderLimit(o)
	end)
	Options.ESPMaxDistance:OnChanged(function(o)
		ESPLibrary.MaxDistance = o
	end)
	Options.ESPFillTransparency:OnChanged(function(o)
		ESPLibrary:SetFillTransparency(o)
	end)
	Options.ESPOutlineTransparency:OnChanged(function(o)
		ESPLibrary:SetOutlineTransparency(o)
	end)
	Options.ESPTextTransparency:OnChanged(function(o)
		ESPLibrary:SetTextTransparency(o)
	end)
	Options.ESPTextOutlineTransparency:OnChanged(function(o)
		ESPLibrary:SetTextOutlineTransparency(o)
	end)
	Options.ESPFadeTime:OnChanged(function(o)
		if Toggles.ESPFade.Value then
			ESPLibrary:SetFadeTime(o)
		end
	end)
	Toggles.ESPFade:OnChanged(function(o)
		ESPLibrary:SetFadeTime(o and Options.ESPFadeTime.Value or 0)
	end)
	Toggles.ESPArrowsToggle:OnChanged(function(o)
		ESPLibrary:SetArrows(o)
	end)
	Options.ESPArrowsRadius:OnChanged(function(o)
		ESPLibrary:SetArrowRadius(o)
	end)
	Options.ESPTracerThickness:OnChanged(function(o)
		ESPLibrary:SetTracerSize(o)
	end)
	Toggles.UseESPOutlineColour:OnChanged(function(o)
		ESPLibrary:SetMatchColors(o)
	end)
	Options.ESPOutline:OnChanged(function(o)
		ESPLibrary:SetOutlineColor(o)
	end)
	ESPLibrary:SetMatchColors(Toggles.UseESPOutlineColour.Value)
	ESPLibrary:SetOutlineColor(Options.ESPOutline.Value)
	ESPLibrary:SetShowDistance(true)
	ESPLibrary:SetFont(Enum.Font.Code)
	ESPLibrary:SetTextSize(15)
	ESPLibrary.ShowESPText = true
	ESPLibrary:SetRenderLimit(240)
	ESPLibrary.MaxDistance = 250
	ESPLibrary:SetFillTransparency(0.75)
	ESPLibrary:SetOutlineTransparency(0)
	ESPLibrary:SetTextTransparency(0)
	ESPLibrary:SetTextOutlineTransparency(0)
	ESPLibrary:SetFadeTime(Toggles.ESPFade and (Toggles.ESPFade.Value and Options.ESPFadeTime.Value) or 0)
	ESPLibrary:SetArrows(false)
	ESPLibrary:SetArrowRadius(250)
	ESPLibrary:SetTracerSize(0.75)
	local mu
	local ru = ReplicatedStorage:FindFirstChild("FloorReplicated")
	if not ru then
		ru = Instance.new("Folder")
	end
	_mgPending = false
	_mgLastTry = 0
	local function requestMinesGenerator()
		if mu then
			return mu
		end
		if isSolara() then
			return nil
		end
		if _mgPending or tick() - _mgLastTry < 5 then
			return nil
		end
		_mgLastTry = tick()
		_mgPending = true
		task.spawn(function()
			pcall(function()
				local o = LocalPlayer:FindFirstChildOfClass("PlayerGui")
				local T = o and o:FindFirstChild("MainUI")
				local k = T and T:FindFirstChild("Initiator")
				local P = k and k:FindFirstChild("Main_Game")
				if P then
					local o, T = pcall(require, P)
					if o and type(T) == "table" then
						mu = T
					end
				end
			end)
			_mgPending = false
		end)
		return nil
	end
	Toggles.RemoveCameraBobbing:OnChanged(function(o)
		local T = requestMinesGenerator()
		if T and T.spring then
			T.spring.Speed = o and 9000000000 or 8
		end
	end)
	Toggles.RemoveCameraFog:OnChanged(function(o)
		Lighting.FogEnd = o and 10000000 or (CheesyState.OldFog or Lighting.FogEnd)
		for T, k in ipairs(CheesyState.FogInstances) do
			k.Density = o and 0 or k:GetAttribute("Density_Old")
		end
	end)
	Toggles.DisableFiredampEffect:OnChanged(function(o)
		local T = workspace:FindFirstChild("CurrentRooms")
		if T then
			for T, k in T:GetChildren() do
				if o then
					k:SetAttribute("Firedamp", false)
					for o, T in CurrentCamera:GetChildren() do
						if T.Name == "LiveFiredamp" then
							T:Destroy()
						end
					end
				else
					k:SetAttribute("Firedamp", k:GetAttribute("Firedamp_Old"))
				end
			end
		end
		local k = LocalPlayer:GetAttribute("CurrentRoom")
		LocalPlayer:SetAttribute("CurrentRoom", 0)
		task.wait()
		LocalPlayer:SetAttribute("CurrentRoom", k)
	end)
	local function refreshHidingSpotVisibility(o, T)
		for k, P in ipairs(ESPCategories.HidingSpots) do
			local w = false
			for o, T in P:GetDescendants() do
				if T.Name == "HiddenPlayer" and T.Value == Character then
					w = true
					break
				end
			end
			for k, P in P:GetDescendants() do
				if P:IsA("BasePart") and P:GetAttribute("Transparency_Old") then
					(TweenService:Create(
						P,
						TweenInfo.new(0.25, Enum.EasingStyle.Linear),
						{ ["Transparency"] = (o and w) and T or P:GetAttribute("Transparency_Old") }
					)):Play()
				end
			end
		end
	end
	Toggles.TransparentHidingSpotsToggle:OnChanged(function(o)
		refreshHidingSpotVisibility(o, Options.TransparentHidingSpotsSlider.Value)
	end)
	Options.TransparentHidingSpotsSlider:OnChanged(function(o)
		refreshHidingSpotVisibility(Toggles.TransparentHidingSpotsToggle.Value, o)
	end)
	local function updateJumpscareSettings(o)
		local T = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		local k = T and T:FindFirstChild("MainUI")
		local P = k and k:FindFirstChild("Initiator")
		local w = P and P:FindFirstChild("Main_Game")
		local F = w and w:FindFirstChild("RemoteListener")
		local A = Options.JumpscaresList.Value or {}
		pcall(function()
			local T = F and (F:FindFirstChild("Jumpscares") or F:FindFirstChild("Jumpscares_Disabled"))
			if T then
				T.Name = o and "Jumpscares_Disabled" or "Jumpscares"
				for T, k in T:GetDescendants() do
					if k:IsA("ModuleScript") then
						local T = k:GetAttribute("CHOriginalName") or k.Name:gsub("_Disabled", "")
						k:SetAttribute("CHOriginalName", T)
						for P, w in pairs(A) do
							if (T:lower()):find((tostring(P)):lower(), 1, true) then
								k.Name = o and (T .. "_Disabled") or T
								break
							end
						end
					end
				end
			end
		end)
	end
	Toggles.DisableJumpscares:OnChanged(updateJumpscareSettings)
	Options.JumpscaresList:OnChanged(function()
		if Toggles.DisableJumpscares.Value then
			updateJumpscareSettings(true)
		end
	end)
	do
		local o
		o = RunService.RenderStepped:Connect(function()
			if _Unloading then
				if o then
					o:Disconnect()
				end
				return
			end
			local T = requestMinesGenerator()
			if T then
				if Toggles.RemoveCameraShake.Value then
					T.csgo = CFrame.new()
				end
				if Toggles.RemoveCameraBobbing.Value and (T.spring and T.spring.Speed ~= 9000000000) then
					T.spring.Speed = 9000000000
				end
				if Toggles.ViewmodelOffsetToggle.Value then
					T.tooloffset = Vector3.new(
						Options.ViewmodelOffsetX.Value,
						Options.ViewmodelOffsetY.Value,
						Options.ViewmodelOffsetZ.Value
					)
				else
					T.tooloffset = Vector3.zero
				end
			end
			if Toggles.AmbientToggle and Toggles.AmbientToggle.Value then
				(TweenService:Create(
					Lighting,
					TweenInfo.new(0.2, Enum.EasingStyle.Exponential),
					{ ["Ambient"] = Options.AmbientColor.Value }
				)):Play()
			end
		end)
	end
	EntityNotifyData = {
		["RushMoving"] = { ["Alias"] = "Rush", ["Danger"] = true },
		["AmbushMoving"] = { ["Alias"] = "Ambush", ["Danger"] = true },
		["A60"] = { ["Alias"] = "A-60", ["Danger"] = true },
		["A120"] = {
			["Alias"] = "A-120",
			["Danger"] = true,
			["GodmodeText"] = "A-120 is coming, godmode does not work, hide!",
		},
		["BackdoorRush"] = { ["Alias"] = "Blitz", ["Danger"] = true },
		["Eyes"] = { ["Alias"] = "Eyes", ["Text"] = "Eyes has spawned, look away!" },
		["Lookman"] = { ["Alias"] = "Lookman", ["Text"] = "Lookman has spawned, look away!" },
		["BackdoorLookman"] = { ["Alias"] = "Lookman", ["Text"] = "Lookman has spawned, look away!" },
		["MonumentEntity"] = { ["Alias"] = "Monument", ["Text"] = "Monument has spawned, look at it!" },
		["SallyMoving"] = {
			["Alias"] = "Sally",
			["Text"] = "Sally has spawned, grab her horse and hold it out or hold out an item of your own!",
		},
		["GloombatSwarm"] = {
			["Alias"] = "Gloombat Swarm",
			["Text"] = "Gloombats have spawned, turn off lights!",
		},
		["RNIUSHCG=="] = { ["Alias"] = "Glitch Rush", ["Danger"] = true },
		["AR0xMBUSH"] = { ["Alias"] = "Glitch Ambush", ["Danger"] = true },
		["GlitchRush"] = { ["Alias"] = "Glitch Rush", ["Danger"] = true },
		["GlitchAmbush"] = { ["Alias"] = "Glitch Ambush", ["Danger"] = true },
		["GiggleCeiling"] = { ["Alias"] = "Giggle" },
		["GrumbleRig"] = { ["Alias"] = "Grumble" },
		["DronesStampede"] = {
			["Alias"] = "Drones",
			["Danger"] = true,
			["Text"] = "Drones are stampeding, hide!",
		},
		["BashMoving"] = { ["Alias"] = "Bash", ["Danger"] = true },
		["Water"] = {
			["Alias"] = "Electric Puddle",
			["Danger"] = false,
			["Text"] = "Electric Puddle nearby!",
		},
		["TellerRig"] = { ["Alias"] = "Teller", ["Danger"] = true, ["NoNotify"] = true },
		["Scribbles"] = { ["Alias"] = "Scribbles", ["Danger"] = true },
		["NoiseModel"] = {
			["Alias"] = "Noise",
			["Danger"] = true,
			["Text"] = "Noise has spawned, be careful with where you move!",
		},
		["Creak"] = {
			["Alias"] = "Creak",
			["Danger"] = true,
			["Text"] = "Creak has spawned, look at him and walk at him!",
		},
	}
	local function getEntityNotificationText(o)
		if o.Text then
			return o.Text
		end
		if o.GodmodeText then
			return o.GodmodeText
		end
		if o.Danger then
			return o.Alias .. " is coming, hide!"
		end
		return "Entity detected!"
	end
	rd.SoundAssets = {
		["Achievement"] = "rbxassetid://10469938989",
		["Tone"] = nil,
		["Alert"] = nil,
		["Windows XP"] = nil,
		["GTA Cell"] = nil,
	}
	pcall(function()
		if isfolder then
			local o = "cheesy/Notification Sounds"
			if not isfolder(o) then
				makefolder(o)
			end
			local function cacheNotificationSound(T, k)
				local P = k:match("%.([a-zA-Z0-9]+)$") or "mp3"
				local w = o .. ("/" .. (T .. ("." .. P)))
				if not isfile(w) then
					writefile(w, game:HttpGet(k))
				end
				return getcustomasset(w)
			end
			rd.SoundAssets.Tone = cacheNotificationSound(
				"tone",
				"https://raw.githubusercontent.com/doram44/cheesy/main/notif%20sounds/tone%20notification.mp3"
			)
			rd.SoundAssets.Alert = cacheNotificationSound(
				"alert",
				"https://raw.githubusercontent.com/doram44/cheesy/main/notif%20sounds/alert%20notification.mp3"
			)
			rd.SoundAssets["Windows XP"] = cacheNotificationSound(
				"xp",
				"https://raw.githubusercontent.com/doram44/cheesy/main/notif%20sounds/windows%20xp%20exclamation.ogg"
			)
			rd.SoundAssets["GTA Cell"] = cacheNotificationSound(
				"gta",
				"https://raw.githubusercontent.com/doram44/cheesy/main/notif%20sounds/gta%20notification.ogg"
			)
		end
	end)
	rd.SoundInstance = Instance.new("Sound")
	rd.SoundInstance.Name = "cheesehubnotifsound"
	rd.SoundInstance.Volume = 0.65
	pcall(function()
		rd.SoundInstance.Parent = SoundService
	end)
	rd.PlaySound = function(o)
		o = o or "NotifySound"
		pcall(function()
			local T = Options[o].Value
			local k = rd.SoundAssets[T] or rd.SoundAssets.Achievement
			rd.SoundInstance.SoundId = k
			rd.SoundInstance.TimePosition = 0
			rd.SoundInstance:Play()
		end)
	end
	rd.ActiveAchievement = {}
	local function repositionAchievementNotices(o)
		local T = 150
		for o = o, #rd.ActiveAchievement, 1 do
			local k = rd.ActiveAchievement[o]
			local P = 72 + (o - 1) * T;
			(TweenService:Create(
				k,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ ["Position"] = UDim2.new(1, -22, 0, P) }
			)):Play()
		end
	end
	rd.CustomAchievement = function(o, T, k)
		local P = Instance.new("ScreenGui")
		P.Name = "cheesehubentitynotif"
		P.ResetOnSpawn = false
		P.IgnoreGuiInset = true
		P.Parent = CoreGui
		local w = k and 110 or 90
		local F = Instance.new("Frame")
		F.Size = UDim2.new(0, 350, 0, w)
		F.AnchorPoint = Vector2.new(1, 0)
		F.BackgroundTransparency = 1
		F.Parent = P
		local A = 150
		local d = #rd.ActiveAchievement + 1
		local C = 72 + (d - 1) * A
		F.Position = UDim2.new(1, 370, 0, C)
		table.insert(rd.ActiveAchievement, F)
		local f = Instance.new("TextLabel")
		f.BackgroundTransparency = 1
		f.Position = UDim2.new(0, 0, 0, -30)
		f.Size = UDim2.new(1, 0, 0, 28)
		f.Font = Enum.Font.GothamBlack
		f.Text = "Entity detected"
		f.TextColor3 = Color3.fromRGB(255, 238, 216)
		f.TextStrokeTransparency = 0.75
		f.TextSize = 20
		f.TextXAlignment = Enum.TextXAlignment.Left
		f.Parent = F
		local m = Instance.new("Frame")
		m.Name = "Frame"
		m.Size = UDim2.new(1, 0, 1, 0)
		m.BackgroundColor3 = Color3.fromRGB(35, 22, 18)
		m.BorderSizePixel = 0
		m.Parent = F;
		(Instance.new("UICorner", m)).CornerRadius = UDim.new(0, 9)
		local r = Instance.new("UIStroke", m)
		r.Color = Color3.fromRGB(255, 236, 214)
		r.Thickness = 3
		local G = Instance.new("ImageLabel")
		G.Name = "ImageLabel"
		G.BackgroundTransparency = 1
		G.Image = "rbxassetid://106990021902592"
		G.Size = UDim2.new(0, 76, 0, 76)
		G.Position = UDim2.new(0, 10, 0, 10)
		G.ScaleType = Enum.ScaleType.Fit
		G.Parent = m
		local y = Instance.new("Frame")
		y.Name = "Details"
		y.BackgroundTransparency = 1
		y.Position = UDim2.new(0, 96, 0, 10)
		y.Size = UDim2.new(1, -106, 1, -20)
		y.Parent = m
		local function createAchievementTextLabel(o, T, k, P, w)
			local F = Instance.new("TextLabel")
			F.Name = o
			F.BackgroundTransparency = 1
			F.Position = UDim2.new(0, 0, 0, k)
			F.Size = UDim2.new(1, 0, 0, P + 12)
			F.Font = w
			F.Text = T
			F.TextScaled = true
			F.TextSize = P
			F.TextWrapped = true
			F.TextXAlignment = Enum.TextXAlignment.Left
			F.TextYAlignment = Enum.TextYAlignment.Top
			F.TextColor3 = Color3.fromRGB(255, 238, 216)
			F.TextStrokeTransparency = 0.8
			F.Parent = y
		end
		createAchievementTextLabel("Title", o, 0, 18, Enum.Font.GothamBold)
		createAchievementTextLabel("Desc", T, 34, 14, Enum.Font.Gotham)
		if k then
			createAchievementTextLabel("Reason", k, 64, 14, Enum.Font.Gotham)
		end
		task.spawn(function()
			(TweenService:Create(
				F,
				TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ ["Position"] = UDim2.new(1, -22, 0, C) }
			)):Play()
			task.wait(5.5);
			(TweenService:Create(
				F,
				TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{ ["Position"] = UDim2.new(1, 370, 0, C) }
			)):Play()
			task.wait(0.5)
			for o, T in ipairs(rd.ActiveAchievement) do
				if T == F then
					table.remove(rd.ActiveAchievement, o)
					repositionAchievementNotices(o)
					break
				end
			end
			P:Destroy()
		end)
	end
	rd.ShowAchievement = function(o, T, k, P)
		if not LocalPlayer then
			rd.CustomAchievement(o, T, k)
			return
		end
		local w = LocalPlayer:FindFirstChild("PlayerGui")
		local F = w and (w:FindFirstChild("GlobalUI") or w:FindFirstChild("MainUI"))
		local A = F and F:FindFirstChild("AchievementsHolder")
		local d = A and A:FindFirstChild("Achievement")
		if not (F and (A and d)) then
			rd.CustomAchievement(o, T, k)
			return
		end
		local function playNotificationSound(o, T, k)
			local P = Instance.new("Sound")
			P.SoundId = T
			P.Volume = k or 1
			P.Parent = o
			task.spawn(function()
				task.wait(0.1)
				P:Play()
				P.Ended:Wait()
				P:Destroy()
			end)
		end
		local f = d:Clone()
		f.Size = UDim2.new(0, 0, 0, 0)
		f.Frame.Position = UDim2.new(1.1, 0, 0, 0)
		f.Name = "LiveAchievement"
		f.Visible = true
		f.Frame.TextLabel.Text = o or "NOTIFICATION"
		f.Frame.Details.Title.Text = P or o or ""
		f.Frame.Details.Desc.Text = T or ""
		f.Frame.Details.Reason.Text = k or ""
		f.Frame.TextLabel.TextWrapped = true
		f.Frame.Details.Title.TextWrapped = true
		f.Frame.Details.Desc.TextWrapped = true
		f.Frame.Details.Reason.TextWrapped = true
		f.Frame.ImageLabel.Image = "rbxassetid://106990021902592"
		local m = Color3.new(1, 1, 1)
		f.Frame.TextLabel.TextColor3 = m
		f.Frame.UIStroke.Color = m
		f.Frame.Glow.ImageColor3 = m
		f.Parent = A
		playNotificationSound(A, "rbxassetid://10469938989", 1)
		task.spawn(function()
			f:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.8, true)
			task.wait(0.8)
			f.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true);
			(TweenService:Create(
				f.Frame.Glow,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{ ["ImageTransparency"] = 1 }
			)):Play()
			task.wait(5)
			f.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), "In", "Quad", 0.5, true)
			task.wait(0.5)
			f:TweenSize(UDim2.new(1, 0, -0.1, 0), "InOut", "Quad", 0.5, true)
			task.wait(0.5)
			f:Destroy()
		end)
	end
	rd.ActiveEntity = 0
	md = function(o)
		if not fd[o.Name] then
			return
		end
		local k = EntityNotifyData[o.Name]
		if not k then
			return
		end
		if k.NoNotify then
			return
		end
		if not Toggles.NotifyEntities.Value then
			return
		end
		local P = Options.EntityList.Value
		if P and (next(P) ~= nil and not P[k.Alias]) then
			return
		end
		if rd.ActiveEntity >= 6 then
			return
		end
		rd.ActiveEntity = rd.ActiveEntity + 1
		rd.PlaySound()
		local w = getEntityNotificationText(k)
		local F = {
			["RushMoving"] = true,
			["AmbushMoving"] = true,
			["A60"] = true,
			["BackdoorRush"] = true,
			["RNIUSHCG=="] = true,
			["AR0xMBUSH"] = true,
			["BashMoving"] = true,
		}
		if Toggles.Godmode.Value and F[o.Name] then
			w = k.Alias .. " is coming, but you have godmode enabled so don't worry!"
		end
		if o.Name == "Scribbles" then
			if Toggles.AntiScribbles and Toggles.AntiScribbles.Value then
				w = "Scribbles is coming, but you have no scribbles damage on so don't worry!"
			else
				w = "Scribbles is coming, hide!"
			end
		end
		local A = Options.NotifyStyle.Value
		if A == "WindUI" or A == "Obsidian" then
			UiLibrary:Notify({ ["Title"] = "Entity detected", ["Description"] = w, ["Time"] = 5 })
		else
			task.spawn(function()
				rd.ShowAchievement(
					"Entity detected",
					w,
					nil,
					"Entity '" .. ((k.Alias or "") .. "' has spawned")
				)
			end)
		end
		if Toggles.EntityChatToggle.Value then
			Functions.SendChat(k.Alias .. (" " .. Options.EntityChatMessage.Value))
		end
		task.delay(6, function()
			rd.ActiveEntity = math.max(0, rd.ActiveEntity - 1)
		end)
	end
	CheesyState.ObjectQueue = {}
	CheesyState.ObjectQueueHead = 1
	CheesyState.ObjectQueueTail = 0
	CheesyState.ObjectQueueCount = 0
	local function queueWorldObject(o)
		if not o then
			return
		end
		CheesyState.ObjectQueueTail = CheesyState.ObjectQueueTail + 1
		CheesyState.ObjectQueue[CheesyState.ObjectQueueTail] = o
		CheesyState.ObjectQueueCount = CheesyState.ObjectQueueCount + 1
	end
	for o, T in workspace:GetDescendants() do
		queueWorldObject(T)
	end
	CheesyState.OldFog = Lighting.FogEnd
	for o, T in Lighting:GetChildren() do
		if T:IsA("Atmosphere") then
			local o = T
			o:SetAttribute("Density_Old", o.Density)
			local k = (o:GetPropertyChangedSignal("Density")):Connect(function()
				if o.Density ~= 0 then
					o:SetAttribute("Density_Old", o.Density)
				end
				if Toggles.RemoveCameraFog.Value then
					o.Density = 0
				end
			end)
			T.Destroying:Once(function()
				k:Disconnect()
			end)
			table.insert(Connections, k)
			table.insert(CheesyState.FogInstances, T)
		end
	end
	local function processWorldObjectQueue()
		if _Unloading then
			return
		end
		local o = CheesyState.ObjectQueueCount
		if o <= 0 then
			return
		end
		local T = CheesyState.ObjectQueue
		local k = CheesyState.ObjectQueueHead
		local P = CheesyState.ObjectQueueTail
		local w = o / 10
		if w < 8 then
			w = 8
		elseif w > 200 then
			w = 200
		end
		local F = os.clock()
		local A = 0
		while A < w and k <= P do
			local o = T[k]
			T[k] = nil
			k = k + 1
			A = A + 1
			CheesyState.ObjectQueueCount = CheesyState.ObjectQueueCount - 1
			if o and o.Parent then
				task.spawn(processESPObject, o)
				task.spawn(trackProximityPrompt, o)
				task.spawn(processRoom, o)
			end
			if (os.clock() - F) * 1000 >= 6 then
				break
			end
		end
		CheesyState.ObjectQueueHead = k
		if k > 1024 and (k - 1) > CheesyState.ObjectQueueCount then
			local o = {}
			for k = k, P, 1 do
				local P = T[k]
				if P ~= nil then
					o[#o + 1] = P
				end
			end
			CheesyState.ObjectQueue = o
			CheesyState.ObjectQueueHead = 1
			CheesyState.ObjectQueueTail = #o
		end
	end
	Connections.ObjectQueueDrain = RunService.RenderStepped:Connect(processWorldObjectQueue)
	Connections.ObjectQueueFeed = workspace.DescendantAdded:Connect(queueWorldObject)
	LastPromptFix = tick()
	RunService.Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if tick() - LastPromptFix <= 0.5 then
			return
		end
		LastPromptFix = tick()
		for o = #_TrackedPrompts, 1, -1 do
			local T = _TrackedPrompts[o]
			if not T or not T.Parent then
				table.remove(_TrackedPrompts, o)
			else
				if T:HasTag("DisableWhenEnabledOnClient") then
					T:RemoveTag("DisableWhenEnabledOnClient")
					if not T.Enabled then
						T.Enabled = true
					end
				end
				if
					Toggles
					and (Toggles.InstantInteract and (Toggles.InstantInteract.Value and T.HoldDuration ~= 0))
				then
					T.HoldDuration = 0
				end
				if
					Toggles
					and (Toggles.PromptClip and (Toggles.PromptClip.Value and T.RequiresLineOfSight ~= false))
				then
					T.RequiresLineOfSight = false
				end
				if Toggles and (Toggles.PromptReach and Toggles.PromptReach.Value) then
					local o = T:GetAttribute("MaxActivationDistance_Old")
					if o then
						local k = Options and (Options.PromptRange and o * Options.PromptRange.Value)
						if k and T.MaxActivationDistance ~= k then
							T.MaxActivationDistance = k
						end
					end
				end
			end
		end
		if
			Toggles and (Toggles.NotifyVulnerable and (Toggles.NotifyVulnerable.Value and HumanoidRootPart))
		then
			local o = HumanoidRootPart.Position.Y
			if VulnerableLastY then
				if o - VulnerableLastY >= 3 and tick() - VulnerableNotifCooldown >= 3 then
					UiLibrary:Notify({
						["Title"] = "Vulnerable",
						["Description"] = "You've moved 3+ studs upward!",
						["Time"] = 3,
					})
					VulnerableNotifCooldown = tick()
				end
			end
			VulnerableLastY = o
		end
	end)
	AutoHide = { ["Last"] = tick(), ["ThreatConns"] = {} }
	Toggles.AutoClosetToggle:OnChanged(function(o)
		if _AutoHideConnection then
			_AutoHideConnection:Disconnect()
			_AutoHideConnection = nil
		end
		if o then
			_AutoHideConnection = RunService.Heartbeat:Connect(function()
				if _Unloading then
					return
				end
				if not Character or not HumanoidRootPart or not Humanoid then
					return
				end
				if tick() - AutoHide.Last <= 0.1 then
					return
				end
				local o = Functions.GetNearestEntity(true, Options.AutoClosetEntityList.Value)
				if o then
					local o = Functions.GetNearestHidingSpot()
					if Character:GetAttribute("Hiding") ~= true and o then
						Functions.ForceFirePrompt(o.HidePrompt)
					end
				elseif Character:GetAttribute("Hiding") == true then
					GameRemotes.CamLock:FireServer()
				end
				if
					Toggles.RemoveClosetDelay.Value
					and (
						Humanoid.MoveDirection ~= Vector3.zero
						and (
							(CharacterCollisionPart.Anchored or HumanoidRootPart.Anchored)
							and (
								Character:GetAttribute("AnimatingClient") ~= true
								and Character:GetAttribute("Hiding") == true
							)
						)
					)
				then
					GameRemotes.CamLock:FireServer()
				end
				AutoHide.Last = tick()
			end)
		end
	end)
	local function watchOxygen()
		if Character then
			local o = -1
			local k = { 80, 60, 40, 20 }
			(Character:GetAttributeChangedSignal("Oxygen")):Connect(function()
				local P = Character:GetAttribute("Oxygen")
				if Toggles.NotifyOxygen and Toggles.NotifyOxygen.Value then
					local w = math.floor(P + 0.5)
					if w ~= o and TableFind(k, w) then
						UiLibrary:Notify({
							["Title"] = "Oxygen decreasing",
							["Description"] = "Your oxygen is at " .. (tostring(w) .. "%"),
							["Time"] = 3,
						})
						o = w
					end
				end
			end)
		end
		if ru:FindFirstChild("DigitalTimer") then
			local o = -1
			(ru.DigitalTimer:GetPropertyChangedSignal("Value")):Connect(function()
				if Toggles.NotifyHasteTime and Toggles.NotifyHasteTime.Value then
					local k = ru.DigitalTimer.Value
					local P = { 90, 60, 30, 15 }
					if TableFind(P, k) and k ~= o then
						o = k
						UiLibrary:Notify({
							["Title"] = "Haste notification",
							["Description"] = "Haste is coming in " .. (k .. " seconds!"),
							["Time"] = 3,
						})
					end
				end
			end)
		end
	end
	watchOxygen()
	LocalPlayer.CharacterAdded:Connect(function()
		task.wait(1)
		watchOxygen()
	end)
	Connections.FogHandler = (Lighting:GetPropertyChangedSignal("FogEnd")):Connect(function()
		if Lighting.FogEnd ~= 10000000 then
			CheesyState.OldFog = Lighting.FogEnd
		end
		if Toggles.RemoveCameraFog.Value then
			Lighting.FogEnd = 10000000
		end
	end)
	Connections.FogHandler2 = Lighting.DescendantAdded:Connect(function(o)
		if not o:IsA("Atmosphere") then
			return
		end
		o:SetAttribute("Density_Old", o.Density)
		if Toggles.RemoveCameraFog.Value then
			o.Density = 0
		end
		local T = (o:GetPropertyChangedSignal("Density")):Connect(function()
			if o.Density ~= 0 then
				o:SetAttribute("Density_Old", o.Density)
			end
			if Toggles.RemoveCameraFog.Value then
				o.Density = 0
			end
		end)
		o.Destroying:Once(function()
			T:Disconnect()
		end)
		table.insert(Connections, T)
		table.insert(CheesyState.FogInstances, o)
	end)
	LocalPlayer.CharacterAppearanceLoaded:Connect(function()
		task.wait(1)
		local o = requestMinesGenerator()
		if Toggles.RemoveCameraBobbing.Value and (o and o.spring) then
			o.spring.Speed = 9000000000
		end
	end)
	LocalPlayer.CharacterAdded:Connect(function()
		task.wait(1)
		mu = nil
		local o = requestMinesGenerator()
		if Toggles.RemoveCameraBobbing.Value and (o and o.spring) then
			o.spring.Speed = 9000000000
		end
		if Toggles.DisableJumpscares.Value then
			updateJumpscareSettings(true)
		end
	end)
	SaveManager:SetFolder("cheesy/Configs")
	SaveManager:SetLibrary(UiLibrary);
	(getgenv()).Library = WindUI
	do
		local o
		LoadedAddonGroupboxes = {}
		AddonFolderPath = "cheesy/addons"
		local k = {}
		AddonConnections = {}
		AddonFilters = {}
		local P = {}
		AddonTabsByOwner = {}
		local w = nil
		local F = {
			["lobby"] = "Lobby",
			["hotel"] = "Hotel",
			["oldhotel"] = "OldHotel",
			["old-hotel"] = "OldHotel",
			["old_hotel"] = "OldHotel",
			["hotelfools"] = "OldHotel",
			["hotel-/fools"] = "OldHotel",
			["hotel/fools"] = "OldHotel",
			["mines"] = "Mines",
			["mine"] = "Mines",
			["garden"] = "Garden",
			["outdoors"] = "Garden",
			["fools"] = "Fools",
			["rooms"] = "Rooms",
			["archives"] = "Archives",
			["stairwell"] = "Stairwell",
		}
		local function normalizeFloorName(o)
			if typeof(o) ~= "string" then
				return nil
			end
			local T = (o:lower()):gsub("[%s%-_/]", "")
			if T == "" then
				return "Lobby"
			end
			return F[T] or o
		end
		local function matchesAddonFloorFilter(o, T)
			if o == nil then
				return true
			end
			if typeof(o) == "string" then
				if o == "*" then
					return true
				end
				return normalizeFloorName(o) == T
			end
			if typeof(o) == "table" then
				for o, k in ipairs(o) do
					if matchesAddonFloorFilter(k, T) then
						return true
					end
				end
				return false
			end
			return true
		end
		local function setAddonGroupboxVisible(section, visible)
			if section and section.ElementFrame then section.ElementFrame.Visible = visible end
		end
		local function setAddonTabVisible(tab, visible)
			if tab and tab.UIElements and tab.UIElements.Main then tab.UIElements.Main.Visible = visible end
		end
		local function refreshAddonFloorVisibility()
			local o = normalizeFloorName(detectFloor())
			for T, k in pairs(AddonFilters) do
				if k ~= nil then
					local w = matchesAddonFloorFilter(k, o)
					for o, T in ipairs(AddonTabsByOwner[T] or {}) do
						setAddonTabVisible(T, w)
					end
					for o, T in ipairs(P[T] or {}) do
						setAddonGroupboxVisible(T, w)
					end
				end
			end
		end
		local function showAddonWarning(title, message)
			UiLibrary:Notify({ Title = title, Description = message, Time = 6 })
		end
		local function trackAddonGroupbox(o)
			if o then
				table.insert(LoadedAddonGroupboxes, o)
			end
			return o
		end
		local function trackOwnedAddonGroupbox(section, owner)
			owner = owner or w
			if section and owner then
				P[owner] = P[owner] or {}
				table.insert(P[owner], section)
				local filter = AddonFilters[owner]
				if filter ~= nil then
					setAddonGroupboxVisible(section, matchesAddonFloorFilter(filter, normalizeFloorName(detectFloor())))
				end
			end
			return section
		end
		local function createAddonGroupbox(tab, title, owner)
			tab = tab or o
			if not tab then return nil end
			local section = tab:Section({ Title = UiLibrary:Text(title), Box = true, Opened = true })
			return trackOwnedAddonGroupbox(trackAddonGroupbox(section), owner)
		end
		local function displayAddonError(name, problem, offset)
			local message = tostring(problem)
			local _, line, detail = message:match("([^%s:]+):(%d+):(.+)")
			if line then message = string.format("Line %d: %s", math.max(tonumber(line) - offset, 1), detail) end
			local section = createAddonGroupbox(o, name .. " Error")
			if section then section:Paragraph({ Title = message }) end
		end
		-- Addons receive real WindUI tabs and sections. They can render native
		-- controls directly, while the context tracks ownership for reload/filtering.
		local function createAddonContext(name)
			local context = { AddonInfo = nil, Connections = {}, Groupboxes = {} }
			context.Groupbox = createAddonGroupbox(nil, name, name)
			function context:Tab(title, icon)
				if type(title) ~= "string" or title == "" then return nil end
				local tab = k[title]
				if not tab then
					tab = UiLibrary:RegisterTab(WindWindow:Tab({ Title = UiLibrary:Text(title), Icon = icon }), title)
					k[title] = tab
				end
				local filter = AddonFilters[name]
				tab.UIElements.Main.Visible = filter == nil or matchesAddonFloorFilter(filter, normalizeFloorName(detectFloor()))
				AddonTabsByOwner[name] = AddonTabsByOwner[name] or {}
				table.insert(AddonTabsByOwner[name], tab)
				return tab
			end
			function context:Section(title, tab)
				return createAddonGroupbox(tab, title or "Addon", name)
			end
			function context:SetSectionVisible(section, visible) setAddonGroupboxVisible(section, visible) end
			function context:SetTabVisible(tab, visible) setAddonTabVisible(tab, visible) end
			function context:Connect(connection)
				if connection then
					table.insert(self.Connections, connection)
					table.insert(AddonConnections, connection)
				end
				return connection
			end
			function context:Track(connection)
				if connection and typeof(connection) == "RBXScriptConnection" then self:Connect(connection) end
				return connection
			end
			function context:Notify(info) return WindUI:Notify(info) end
			context.Globals, context.Options, context.Toggles = CheesyState, Options, Toggles
			context.Groupboxes, context.Tabs, context.Window, context.Library = Groupboxes, rT, WindWindow, WindUI
			context.UIState = UiLibrary
			return context
		end
		local function disconnectAddonConnections()
			for o, T in ipairs(AddonConnections) do
				if T then
					pcall(function()
						T:Disconnect()
					end)
				end
			end
			AddonConnections = {}
			AddonFilters = {}
			P = {}
			for _, tabs in pairs(AddonTabsByOwner) do
				for _, tab in ipairs(tabs) do setAddonTabVisible(tab, false) end
			end
			AddonTabsByOwner = {}
			w = nil
			for _, section in ipairs(LoadedAddonGroupboxes) do
				if section then UiLibrary:ReleaseSection(section) end
			end
			LoadedAddonGroupboxes = {}
		end
		CheesyState.ClearAddonGroupboxes = disconnectAddonConnections
		local function loadUserAddons()
			if not o then
				return
			end
			disconnectAddonConnections()
			if not isfolder or not makefolder or not listfiles or not readfile then
				showAddonWarning(
					"User Addons",
					"Your executor does not support the required filesystem functions for addons."
				)
				return
			end
			pcall(function()
				if not isfolder("cheesy") then
					makefolder("cheesy")
				end
				if not isfolder(AddonFolderPath) then
					makefolder(AddonFolderPath)
				end
			end)
			if not isfolder(AddonFolderPath) then
				showAddonWarning(
					"User Addons",
					"Your addons folder is currently empty. Create .lua files in your executor workspace at '"
						.. (AddonFolderPath .. "'.")
				)
				return
			end
			local k = listfiles(AddonFolderPath)
			local F = {}
			for o, T in ipairs(k) do
				local k = T:match("([^/\\]+)$")
				if k and k:match("%.lua$") then
					table.insert(F, { ["path"] = T, ["name"] = k })
				end
			end
			if #F == 0 then
				showAddonWarning(
					"User Addons",
					"Your addons folder is currently empty. Insert a .lua file into '"
						.. (AddonFolderPath .. "'.")
				)
				return
			end
			showAddonWarning(
				"User Addons",
				"Share your addons in the discord! Addons that aren't checked or aren't open source could be malicious or untrustworthy. Be careful with what you decide to use."
			)
			for k, F in ipairs(F) do
				local A, d = pcall(readfile, F.path)
				if A and (d and d ~= "") then
					P[F.name] = {}
					AddonFilters[F.name] = nil
					w = F.name
					local k = createAddonContext(F.name)
					local A = nil
					local C = warn
					pcall(function()
						warn = function(...)
							local o = {}
							for T = 1, select("#", ...), 1 do
								o[#o + 1] = tostring((select(T, ...)))
							end
							if A == nil then
								A = table.concat(o, " ")
							end
						end
					end)
					local f
					local m, r = pcall(function()
						f = loadstring("local cheesy, Library = ...\n" .. d, F.name)
					end)
					local G, y
					if not m then
						G, y = false, r
					elseif not f then
						G, y =
							false,
							"the addon would not compile, this is usually a syntax error or something in the file your executor does not support"
					else
						G, y = pcall(function()
							f(k, WindUI)
						end)
					end
					pcall(function()
						warn = C
					end)
					if not G then
						displayAddonError(F.name, y, 1)
					elseif k.AddonInfo then
						local info = k.AddonInfo
						AddonFilters[F.name] = info.Floor or info.Game
						if k.Groupbox then
							k.Groupbox:SetTitle(info.Title or info.Name or F.name)
							if info.Description and info.Description ~= "" then k.Groupbox:SetDesc(info.Description) end
						end
					end
					if G and (A and A ~= "") then
						displayAddonError(F.name, A, 0)
					end
					w = nil
				end
			end
			refreshAddonFloorVisibility()
		end
		CheesyState.RefreshAddonFloors = refreshAddonFloorVisibility
		RefreshAddons = function()
			loadUserAddons()
			CheesyApplyTranslationsReport("after addons reload")
		end
		rT.UserAddons = UiLibrary:RegisterTab(WindWindow:Tab({ Title = UiLibrary:Text("User Addons"), Icon = "user-star" }), "User Addons")
		o = rT.UserAddons
		loadUserAddons()
	end
	local ju = UiLibrary:RegisterTab(WindWindow:Tab({ Title = UiLibrary:Text("Settings"), Icon = "palette" }), "Settings")
	rT.Settings = ju
	local Du = ju:Section({ Title = UiLibrary:Text("Menu"), Box = true, Opened = true });
	do
		local owner = UiLibrary:Mount(Du, "Label", nil, { ["Title"] = "Menu Keybind" }, function(state, spec)
			return state.Section:Paragraph({
				Title = UiLibrary:Text(spec.Title or ""),
			})
		end)
		UiLibrary:Mount(Du, "KeyPicker", "MenuKeybind", { ["Value"] = "RightShift", ["NoUI"] = true, ["Title"] = "Menu Keybind" }, function(state, spec)
			return state.Section:Keybind({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Value = state.Value,
				Callback = function() end,
			})
		end, owner)
	end
	UiLibrary.ToggleKeybind = Options.MenuKeybind
	Options.MenuKeybind:Update()
	UiLibrary:Mount(Du, "Dropdown", "DPIScale", {
		["Title"] = "DPI Scale",
		["Values"] = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
		["Value"] = "100%",
		["Callback"] = function(o)
			local k = tonumber((o:gsub("%%", "")))
			UiLibrary:SetDPIScale(k or 100)
		end,
	}, function(state, spec)
		return state.Section:Dropdown({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Values = state.Values,
			Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
			Multi = state.Multi,
			AllowNone = spec.AllowNone ~= false,
			SearchBarEnabled = spec.SearchBarEnabled == true,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:TrackElement(Du, Du:Divider());
	do
		UiLibrary:Mount(Du, "Button", nil, {
		["Title"] = "Test Notif",
		["Desc"] = "Sends a test notification with the selected style and sound settings",
		["Callback"] = function()
			rd.PlaySound()
			UiLibrary:Notify({ ["Title"] = "Test", ["Time"] = 5 })
		end,
	}, function(state, spec)
			return state.Section:Button({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Callback = state.Action,
			})
		end)
		UiLibrary:Mount(Du, "Button", nil, {
		["Title"] = "Refresh Addons",
		["Desc"] = "Reloads all .lua files from cheesy/addons",
		["Callback"] = function()
			if RefreshAddons then
				RefreshAddons()
				UiLibrary:Notify({
					["Title"] = "Addons",
					["Description"] = "Addons reloaded",
					["Time"] = 3,
				})
			end
		end,
	}, function(state, spec)
			return state.Section:Button({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Callback = state.Action,
			})
		end)
	end
	UiLibrary:Mount(Du, "Toggle", "CheesyWindowIcon", {
		["Title"] = "Cheesy Icon",
		["Desc"] = "Show the window title icon",
		["Value"] = true,
		["Callback"] = function(visible) UiLibrary:SetWindowIconVisible(visible) end,
	}, function(state, spec)
		return state.Section:Toggle({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Value = state.Value,
			Callback = function(value) state:Receive(value) end,
		})
	end)
	UiLibrary:Mount(Du, "Button", nil, {
		["Title"] = "Unload Script",
		["Desc"] = "Completely unloads the script and cleans up everything",
		["Callback"] = function()
			UiLibrary:Unload()
		end,
	}, function(state, spec)
		return state.Section:Button({
			Title = UiLibrary:Text(spec.Title),
			LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
			Desc = UiLibrary:Text(spec.Desc),
			Callback = state.Action,
		})
	end)
	do
		local o = Du
		local k, P, w = {}, {}, 1
		for o, T in ipairs(CheesyLanguageList) do
			k[o] = T.Name
			P[T.Name] = T.Code
			if T.Code == CheesyLanguage then
				w = o
			end
		end
		UiLibrary:TrackElement(o, o:Divider())
		UiLibrary:Mount(o, "Label", nil, {
			["Title"] = "Changing the language reloads the UI in the new language",
			["DoesWrap"] = true,
		}, function(state, spec)
			return state.Section:Paragraph({
				Title = UiLibrary:Text(spec.Title or ""),
			})
		end)
		local F = false
		local A
		A = UiLibrary:Mount(o, "Dropdown", "CheesyLanguage", {
			["Title"] = "Language",
			["Values"] = k,
			["Value"] = w,
			["NoUI"] = false,
			["Callback"] = function(o)
				if not F then
					return
				end
				local k = P[o]
				if not k or k == CheesyLanguage then
					return
				end
				CheesyLanguage = k
				CheesySkipLanguagePrompt = true
				local w = CheesyBumpLanguageVersion()
				UiLibrary:Notify({
					["Title"] = "Language",
					["Description"] = "Re-executing the script to apply the new language",
					["Time"] = 3,
				})
			end,
		}, function(state, spec)
			return state.Section:Dropdown({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Values = state.Values,
				Value = state.Multi and UiLibrary:SelectionArray(state.Value) or state.Value,
				Multi = state.Multi,
				AllowNone = spec.AllowNone ~= false,
				SearchBarEnabled = spec.SearchBarEnabled == true,
				Callback = function(value) state:Receive(value) end,
			})
		end)
		UiLibrary:Mount(o, "Button", nil, {
			["Title"] = "Select Language",
			["Desc"] = "Applies the language picked in the dropdown above",
			["Callback"] = function()
				local o = A or (UiLibrary.Options and UiLibrary.Options.CheesyLanguage)
				local k = o and o.Value
				local w = type(k) == "string" and P[k] or nil
				if not w then
					UiLibrary:Notify({
						["Title"] = "Language",
						["Description"] = "Pick a language from the dropdown first",
						["Time"] = 3,
					})
					return
				end
				CheesyLanguage = w
				CheesySkipLanguagePrompt = true
				CheesyWriteUserData()
				UiLibrary:Notify({
					["Title"] = "Language",
					["Description"] = "Re-executing the script to apply " .. tostring(k),
					["Time"] = 3,
				})
			end,
		}, function(state, spec)
			return state.Section:Button({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Callback = state.Action,
			})
		end)
		UiLibrary:TrackElement(o, o:Divider())
		UiLibrary:Mount(o, "Button", nil, {
			["Title"] = "Reset Loading",
			["Desc"] = "Clears the saved language so the loading picker shows again",
			["Callback"] = function()
				CheesySkipLanguagePrompt = false
				CheesyBumpLanguageVersion()
				UiLibrary:Notify({
					["Title"] = "Language",
					["Description"] = "The language picker will show the next time you run the script",
					["Time"] = 4,
				})
			end,
		}, function(state, spec)
			return state.Section:Button({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Callback = state.Action,
			})
		end)
		UiLibrary:TrackElement(o, o:Divider())
		UiLibrary:Mount(o, "Toggle", "QueueOnTeleport", {
				["Title"] = "Queue On Teleport",
				["Value"] = false,
				["Desc"] = "Re-executes the script on teleport (recommended not to use)",
			}, function(state, spec)
			return state.Section:Toggle({
				Title = UiLibrary:Text(spec.Title),
				LockedTitle = UiLibrary:Text(spec.DisabledTooltip),
				Desc = UiLibrary:Text(spec.Desc),
				Value = state.Value,
				Callback = function(value) state:Receive(value) end,
			})
		end)
		Toggles.QueueOnTeleport:OnChanged(function(o)
			if o then
				CheesyQueueOnTeleport()
			end
		end)
	end
	pcall(function()
		ThemeManager:LoadDefault()
	end)
	pcall(function()
		ThemeManager:ApplyToGroupbox(Du)
	end)
	SaveManager:SetIgnoreIndexes({ "MenuKeybind", "UILibrary" })
	SaveManager:BuildConfigSection(ju)
	SaveManager:LoadAutoloadConfig()
	LangReady = true
	if CurrentFloor == "Lobby" then
		local o = {
			"Godmode",
			"ThirdPerson",
			"Noclip",
			"FlyToggle",
			"Phase",
			"AnticheatManipulation",
			"AutoInteract",
			"ArchiveChairFly",
			"StairwellChairFly",
			"AntiElectricPuddle",
			"AntiRansom",
			"AntiScribbles",
			"NoAlmaDamage",
			"AntiDrone",
			"DisableDroneStampede",
			"RoomsAutoWalk",
			"RoomsAutoWalkIgnoreA60",
			"RoomsAutoWalkShowPathToggle",
			"RoomsAutoWalkSpoofFootsteps",
			"RoomsPickupStardust",
			"RoomsPickupGold",
			"HotelAutoWalk",
			"NoSurgeDamage",
			"RemoveSurge",
			"RemoveMandrake",
			"BypassKillbricks",
			"BypassSeekingWall",
			"BypassBanana",
			"BypassJeff",
			"BypassGiggle",
			"BypassDupe",
			"BypassEyes",
			"BypassLookman",
			"BypassGloombatEggs",
			"BypassSeekObstructions",
			"BypassVacuum",
			"BypassSnare",
			"RemoveSeekTrigger",
			"RemoveFigure",
			"RemoveFigureMines",
			"RemoveA90",
			"RemoveDread",
			"AutoRevive",
			"FigureGodmode",
			"AutoSteerMinecart",
			"AutoSolveAnchors",
			"MinecartTeleport",
			"AutoMinecart",
			"AutoHeartbeatMinigame",
			"AutoBreakerBox",
			"AutoLibraryBruteForce",
			"InfiniteItemsToggle",
			"InfiniteCrucifix",
			"ShowSeekPathToggle",
			"BreakNoiseTv",
			"AntiCrusher",
		}
		for o, T in ipairs(o) do
			local k = Toggles[T]
			if k and k.Value then
				k:SetValue(false)
			end
		end
	end
	ScriptCreatedObjectLists = {
		["SeekNodes"] = true,
		["SeekHighlights"] = true,
		["EyestalkHighlights"] = true,
		["PathLights"] = true,
	}
	local function unloadCheesy()
		_Unloading = true
		pcall(restoreGodmodeCharacter)
		pcall(stopFly)
		pcall(disconnectSpeedLoop)
		pcall(stopSpeedBypass)
		pcall(StopChairBypass)
		pcall(StopBreakNoiseTv)
		pcall(StopAntiCrusher)
		pcall(StopAntiLag)
		pcall(HonchoStopBoxes)
		if FreecamConnection then
			FreecamConnection:Disconnect()
			FreecamConnection = nil
		end
		local o = workspace:FindFirstChild("FreecamPart")
		if o then
			o:Destroy()
			local T = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			if T then
				T.Anchored = false
			end
			LocalPlayer.CameraMinZoomDistance = LocalPlayer:GetAttribute("fc_om") or 0.5
			LocalPlayer.CameraMaxZoomDistance = LocalPlayer:GetAttribute("fc_ox") or 128
		end
		if CameraConnection then
			CameraConnection:Disconnect()
			CameraConnection = nil
		end
		if _TPCharConn then
			_TPCharConn:Disconnect()
			_TPCharConn = nil
		end
		if CurrentCamera then
			CurrentCamera.CameraType = Enum.CameraType.Custom
		end
		if NoclipConnection then
			NoclipConnection:Disconnect()
			NoclipConnection = nil
			pcall(setNoclipPartsCollision, true)
		end
		if ET then
			ET:Disconnect()
			ET = nil
		end
		if _AutoHideConnection then
			_AutoHideConnection:Disconnect()
			_AutoHideConnection = nil
		end
		if AnticheatConnection then
			AnticheatConnection:Disconnect()
			AnticheatConnection = nil
		end
		if InfiniteJumpConnection then
			InfiniteJumpConnection:Disconnect()
			InfiniteJumpConnection = nil
		end
		if JumpAttributeConnection then
			JumpAttributeConnection:Disconnect()
			JumpAttributeConnection = nil
		end
		if SlideAttributeConnection then
			SlideAttributeConnection:Disconnect()
			SlideAttributeConnection = nil
		end
		if DisableIdleKickConn then
			DisableIdleKickConn:Disconnect()
			DisableIdleKickConn = nil
		end
		if DisplayInfoConn then
			DisplayInfoConn:Disconnect()
			DisplayInfoConn = nil
		end
		if (getgenv()).Library == UiLibrary then
			(getgenv()).Library = nil
		end
		if UhhhhConn then
			UhhhhConn:Disconnect()
			UhhhhConn = nil
		end
		if OrbitConn then
			OrbitConn:Disconnect()
			OrbitConn = nil
		end
		pcall(stopBringItems)
		if InfCrucifixCon then
			InfCrucifixCon:Disconnect()
			InfCrucifixCon = nil
		end
		if _FloorConnection then
			_FloorConnection:Disconnect()
			_FloorConnection = nil
		end
		if CheesyState and CheesyState.LobbyGuardConnection then
			CheesyState.LobbyGuardConnection:Disconnect()
			CheesyState.LobbyGuardConnection = nil
		end
		if Phase then
			if Phase.Connection then
				Phase.Connection:Disconnect()
				Phase.Connection = nil
			end
			if Phase.Body then
				Phase.Body:Destroy()
				Phase.Body = nil
			end
			if Phase.CharConn then
				Phase.CharConn:Disconnect()
				Phase.CharConn = nil
			end
		end
		stopLobbyFly()
		if Jd and Jd.NoclipConn then
			Jd.NoclipConn:Disconnect()
			Jd.NoclipConn = nil
		end
		if Connections then
			for o, T in pairs(Connections) do
				pcall(T.Disconnect, T)
			end
			if Connections.InfiniteItemsHandler then
				Connections.InfiniteItemsHandler:Disconnect()
				Connections.InfiniteItemsHandler = nil
			end
			if Connections.PadlockConnection then
				Connections.PadlockConnection:Disconnect()
				Connections.PadlockConnection = nil
			end
		end
		for o, T in pairs(ESPConnections or {}) do
			pcall(T.Disconnect, T)
		end
		if ClearEntityPath then
			pcall(ClearEntityPath)
		end
		if _FullbrightConnection then
			_FullbrightConnection:Disconnect()
			_FullbrightConnection = nil
		end
		if _FullbrightRoomConn then
			_FullbrightRoomConn:Disconnect()
			_FullbrightRoomConn = nil
		end
		pcall(restoreLighting)
		pcall(function()
			for o, T in pairs(FakePrompts or {}) do
				pcall(function()
					if o.Parent then
						T.Parent = o.Parent
					end
					o:Destroy()
					if T.Parent then
						T.HoldDuration = T:GetAttribute("HoldDuration_Old") or T.HoldDuration
						T.RequiresLineOfSight = T:GetAttribute("RequiresLineOfSight_Old")
							or T.RequiresLineOfSight
						T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old")
							or T.MaxActivationDistance
					end
				end)
			end
		end)
		if RT then
			RT:ClearAllChildren()
		end
		if RT then
			RT:Destroy()
		end
		if _TrackedPrompts then
			for o, T in ipairs(_TrackedPrompts) do
				pcall(function()
					if T.Parent then
						T.HoldDuration = T:GetAttribute("HoldDuration_Old") or T.HoldDuration
						T.RequiresLineOfSight = T:GetAttribute("RequiresLineOfSight_Old")
							or T.RequiresLineOfSight
						T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old")
							or T.MaxActivationDistance
					end
				end)
			end
		end
		for o, T in pairs(ESPCategories) do
			if type(T) == "table" then
				for o, T in ipairs(T) do
					pcall(Functions.RemoveESP, T)
				end
			end
		end
		for o, T in pairs(wT) do
			if type(T) == "table" then
				for o, T in ipairs(T) do
					pcall(Functions.RemoveESP, T)
				end
			end
		end
		pcall(ESPLibrary.Unload, ESPLibrary)
		pcall(function()
			if Executor.hookmetamethod and MainHook then
				Executor.hookmetamethod(game, "__namecall", MainHook)
			end
		end)
		pcall(function()
			if Executor.hookmetamethod and OtherHook then
				Executor.hookmetamethod(game, "__index", OtherHook)
			end
		end)
		pcall(function()
			local o = requestMinesGenerator()
			if o then
				o.tooloffset = Vector3.zero
				o.spring.Speed = 8
				o.csgo = CFrame.new()
			end
		end)
		pcall(function()
			if Toggles and (Toggles.FOVChanger and Toggles.FOVChanger.SetValue) then
				Toggles.FOVChanger:SetValue(false)
			end
		end)
		pcall(function()
			workspace.Gravity = 196.2
		end)
		pcall(function()
			Lighting.FogEnd = CheesyState and CheesyState.OldFog or Lighting.FogEnd
		end)
		pcall(function()
			for o, T in ipairs(CheesyState.FogInstances or {}) do
				local k = T:GetAttribute("Density_Old")
				if k then
					T.Density = k
				end
			end
		end)
		pcall(function()
			local o = ReplicatedStorage:FindFirstChild("FloorReplicated")
				and (
					ReplicatedStorage.FloorReplicated:FindFirstChild("ClientRemote")
					and ReplicatedStorage.FloorReplicated.ClientRemote:FindFirstChild("Haste")
				)
			if o then
				local T = o:FindFirstChild("Ambience")
				if T then
					T.Playing = true
				end
			end
		end)
		pcall(function()
			local o = LocalPlayer:FindFirstChildOfClass("PlayerGui")
			if o then
				local T = o:FindFirstChild("DisplayInfoLabel", true)
				if T then
					T:Destroy()
				end
			end
		end)
		if CheesyState then
			if CheesyState.SeekNodesFolder then
				CheesyState.SeekNodesFolder:Destroy()
			end
			if CheesyState.RoomsNodesFolder then
				CheesyState.RoomsNodesFolder:Destroy()
			end
			if CheesyState.HotelNodesFolder then
				CheesyState.HotelNodesFolder:Destroy()
			end
			pcall(function()
				if Toggles.ForgetMeNotSolver then
					Toggles.ForgetMeNotSolver:SetValue(false)
				end
			end)
			if CheesyState.OriginalGetMoveVector then
				pcall(function()
					local o = (require(LocalPlayer.PlayerScripts.PlayerModule)):GetControls()
					o.GetMoveVector = CheesyState.OriginalGetMoveVector
				end)
				CheesyState.OriginalGetMoveVector = nil
			end
			CheesyState.AnticheatDisabled = false
			CheesyState.RoomsAutoWalkActive = false
			CheesyState.HotelAutoWalkActive = false
			CheesyState.HotelSeekActive = false
			CheesyState.HotelFigureActive = false
			if CheesyState.HotelSeekConn then
				pcall(function()
					CheesyState.HotelSeekConn:Disconnect()
				end)
				CheesyState.HotelSeekConn = nil
			end
			pcall(function()
				(game:GetService("VirtualInputManager")):SendKeyEvent(
					false,
					Enum.KeyCode.LeftControl,
					false,
					game
				)
			end)
			CheesyState.HotelCrouchHeld = false
		end
		pcall(function()
			if CheesyState.ClearAddonGroupboxes then
				CheesyState.ClearAddonGroupboxes()
			end
		end)
		if AutoMinecartConnection then
			AutoMinecartConnection:Disconnect()
			AutoMinecartConnection = nil
		end
		if Character then
			pcall(function()
				Character:SetAttribute("CanJump", OldJump or false)
			end)
			pcall(function()
				Character:SetAttribute("CanSlide", OldSlide or false)
			end)
			pcall(function()
				Character:SetAttribute("SpeedBoost", 0)
			end)
			pcall(function()
				Character:SetAttribute("SpeedBoostBehind", 0)
			end)
			pcall(function()
				Character:SetAttribute("SpeedBoostExtra", 0)
			end)
			pcall(function()
				Character:SetAttribute("SpeedBoostMod", 0)
			end)
			pcall(function()
				Character:SetAttribute("AntiSpeed", nil)
			end)
			pcall(function()
				Character:SetAttribute("Antispeed", nil)
			end)
			pcall(function()
				Character:SetAttribute("SpeedBypass", nil)
			end)
			pcall(function()
				Character:SetAttribute("Climbing", nil)
			end)
		end
		pcall(function()
			if Toggles and (Toggles.WalkspeedEnabled and Toggles.WalkspeedEnabled.SetValue) then
				Toggles.WalkspeedEnabled:SetValue(false)
			end
		end)
		if Humanoid then
			pcall(function()
				Humanoid.JumpPower = 5
			end)
			pcall(function()
				Humanoid.HipHeight = 2.367
			end)
			pcall(function()
				Humanoid.PlatformStand = false
			end)
			pcall(function()
				Humanoid:SetAttribute("AntiSpeed", nil)
			end)
			pcall(function()
				Humanoid:SetAttribute("Antispeed", nil)
			end)
		end
		if HumanoidRootPart then
			HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
		end
		for o, T in pairs(wT or {}) do
			if type(T) == "table" then
				if ScriptCreatedObjectLists[o] then
					for o, T in ipairs(T) do
						pcall(T.Destroy, T)
					end
				end
				TableClear(T)
			end
		end
		for o, T in pairs(PartProperties or {}) do
			pcall(function()
				T.CustomPhysicalProperties = PartProperties[T]
			end)
		end
		pcall(function()
			local o = getMainGameModules()
			if o then
				for T, k in ipairs({ "Screech", "GlitchScreech", "A90", "Dread", "SurgeVignette" }) do
					local P = o:FindFirstChild(k .. "_Disabled")
					if P then
						P.Name = k
					end
				end
			end
		end)
		if FakeEvents then
			if FakeEvents.Screech_Real then
				FakeEvents.Screech_Real.Parent = GameRemotes
			end
			if FakeEvents.Shade_Real then
				FakeEvents.Shade_Real.Parent = GameRemotes
			end
			if FakeEvents.A90_Real then
				FakeEvents.A90_Real.Parent = GameRemotes
			end
			if FakeEvents.Surge_Real then
				FakeEvents.Surge_Real.Parent = GameRemotes
			end
			for o, T in pairs(FakeEvents) do
				if type(T) == "Instance" and T:IsA("RemoteEvent") then
					pcall(T.Destroy, T)
				end
			end
		end
		if Character then
			local o = Character:FindFirstChild("CollisionClone")
			if o then
				o:Destroy()
			end
			local T = Character:FindFirstChild("CollisionPartClone")
			if T then
				T:Destroy()
			end
		end
		if LocalPlayer then
			LocalPlayer.CameraMinZoomDistance = 0.5
			LocalPlayer.CameraMaxZoomDistance = 128
			LocalPlayer:SetAttribute("fc_om", nil)
			LocalPlayer:SetAttribute("fc_ox", nil)
			LocalPlayer:SetAttribute("fc_p", nil)
			LocalPlayer:SetAttribute("fc_y", nil)
		end
		if rT.Stairwell then
			rT.Stairwell.UIElements.Main.Visible = false
		end
		if rT.FoolsHotel then
			rT.FoolsHotel.UIElements.Main.Visible = false
		end
		if rT.Rooms then
			rT.Rooms.UIElements.Main.Visible = false
		end
		if rT.UserAddons then
			rT.UserAddons.UIElements.Main.Visible = true
		end
	end
	(getgenv()).CheesyUnload = unloadCheesy
	UiLibrary:OnUnload(function()
		_Unloading = true
		unloadCheesy();
		(getgenv()).CheesyUnload = nil
	end)
	UiLibrary.ScreenGui.Destroying:Once(function()
		UiLibrary:Unload()
	end)
	do
		local o = game:GetService("LogService")
		local k
		k = o.MessageOut:Connect(function(o)
			if o == "client teleporting" then
				if CheesyState.AnticheatDisabled then
					CheesyState.AnticheatDisabled = false
					UiLibrary:Notify({
						["Title"] = "Anticheat re-enabled",
						["Description"] = "Interact with a ladder for re-disabling",
						["Time"] = 5,
					})
				end
				k:Disconnect()
			end
		end)
	end
	rT.FoolsHotel.UIElements.Main.Visible = false
	UiLibrary:Toggle(true)
	UiLibrary:Notify({
		["Title"] = "Loaded cheesy in " .. (math.floor((tick() - LoadStart) * 1000) / 1000 .. " seconds"),
		["Description"] = "discord.gg/CuZJQaCquK",
		["Time"] = 5,
	})
	CreditText = 'PLEASE READ: This script is ONLY made by one person, and the official discord server is "dsc.gg/cheesyscript" or "discord.gg/CuZJQaCquK", if you have gotten it from anywhere else, please leave the server and join our one instead. Executing from a different github repo may aswell contain a logger if they have enough info to know how to. This will only pop up the first time you execute, and will not pop up from now on'
	local function showCreditSplash()
		pcall(function()
			local o = (gethui and gethui()) or CoreGui
			local T = Instance.new("ScreenGui")
			T.Name = "CheesyCreditSplash"
			T.ResetOnSpawn = false
			T.IgnoreGuiInset = true
			T.DisplayOrder = 999
			T.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			T.Parent = o
			local k = Instance.new("Frame")
			k.Size = UDim2.new(1, 0, 1, 0)
			k.BackgroundColor3 = Color3.new(0, 0, 0)
			k.BackgroundTransparency = 1
			k.Parent = T
			local P = Instance.new("TextLabel")
			P.AnchorPoint = Vector2.new(0.5, 0.5)
			P.Position = UDim2.new(0.5, 3, 0.45, 3)
			P.Size = UDim2.new(0.85, 0, 0.7, 0)
			P.BackgroundTransparency = 1
			P.Font = Enum.Font.GothamBold
			P.TextScaled = true
			P.TextWrapped = true
			P.TextXAlignment = Enum.TextXAlignment.Center
			P.TextYAlignment = Enum.TextYAlignment.Center
			P.TextColor3 = Color3.new(0, 0, 0)
			P.TextTransparency = 1
			P.Text = CreditText
			P.Parent = k
			local w = Instance.new("UITextSizeConstraint")
			w.MaxTextSize = 30
			w.Parent = P
			local F = Instance.new("TextLabel")
			F.AnchorPoint = Vector2.new(0.5, 0.5)
			F.Position = UDim2.new(0.5, 0, 0.45, 0)
			F.Size = UDim2.new(0.85, 0, 0.7, 0)
			F.BackgroundTransparency = 1
			F.Font = Enum.Font.GothamBold
			F.TextScaled = true
			F.TextWrapped = true
			F.TextXAlignment = Enum.TextXAlignment.Center
			F.TextYAlignment = Enum.TextYAlignment.Center
			F.TextColor3 = Color3.fromRGB(255, 255, 255)
			F.TextTransparency = 1
			F.Text = CreditText
			F.Parent = k
			local A = Instance.new("UITextSizeConstraint")
			A.MaxTextSize = 30
			A.Parent = F
			local d = Instance.new("TextLabel")
			d.AnchorPoint = Vector2.new(0.5, 1)
			d.Position = UDim2.new(0.5, 0, 1, -20)
			d.Size = UDim2.new(1, -40, 0, 30)
			d.BackgroundTransparency = 1
			d.Font = Enum.Font.Gotham
			d.TextSize = 18
			d.TextXAlignment = Enum.TextXAlignment.Center
			d.TextColor3 = Color3.fromRGB(200, 200, 200)
			d.TextTransparency = 1
			d.Text = "Closing in 5 seconds..."
			d.Parent = k;
			(TweenService:Create(
				k,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ ["BackgroundTransparency"] = 0.15 }
			)):Play();
			(TweenService:Create(
				P,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ ["TextTransparency"] = 0.35 }
			)):Play();
			(TweenService:Create(
				F,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ ["TextTransparency"] = 0 }
			)):Play();
			(TweenService:Create(
				d,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ ["TextTransparency"] = 0 }
			)):Play()
			for o = 5, 1, -1 do
				d.Text = "Closing in " .. (o .. (" second" .. ((o == 1 and "" or "s") .. "...")))
				task.wait(1)
			end
			(TweenService:Create(
				k,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{ ["BackgroundTransparency"] = 1 }
			)):Play();
			(TweenService:Create(
				P,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{ ["TextTransparency"] = 1 }
			)):Play();
			(TweenService:Create(
				F,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{ ["TextTransparency"] = 1 }
			)):Play();
			(TweenService:Create(
				d,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{ ["TextTransparency"] = 1 }
			)):Play()
			task.wait(1)
			T:Destroy()
		end)
	end
	if not CreditSeen then
		CreditSeen = true
		pcall(saveUserData)
		task.spawn(showCreditSplash)
	end
	if Toggles.AutoInteract then
		pcall(function()
			Toggles.AutoInteract:SetDisabled(not hasFirePrompt)
		end)
	end
	if Toggles.InfiniteItemsToggle then
		pcall(function()
			Toggles.InfiniteItemsToggle:SetDisabled(not hasFirePrompt)
		end)
	end
	if Toggles.InfiniteCrucifix then
		pcall(function()
			Toggles.InfiniteCrucifix:SetDisabled(not hasFirePrompt)
		end)
	end
	if Toggles.RemoveSeekTrigger then
		pcall(function()
			Toggles.RemoveSeekTrigger:SetDisabled(not hasFireTouch)
		end)
	end
	if Toggles.RemoveFigure then
		pcall(function()
			Toggles.RemoveFigure:SetDisabled(not hasNetworkOwner)
		end)
	end
	if Toggles.RemoveFigureMines then
		pcall(function()
			Toggles.RemoveFigureMines:SetDisabled(not hasNetworkOwner)
		end)
	end
	if Toggles.AutoHeartbeatMinigame then
		pcall(function()
			Toggles.AutoHeartbeatMinigame:SetDisabled(not hasHookMeta)
		end)
	end
	if Toggles.BypassEyes then
		pcall(function()
			Toggles.BypassEyes:SetDisabled(not hasHookMeta)
		end)
	end
	if Toggles.BypassLookman then
		pcall(function()
			Toggles.BypassLookman:SetDisabled(not hasHookMeta)
		end)
	end
	if Toggles.BypassMonument then
		pcall(function()
			Toggles.BypassMonument:SetDisabled(not hasHookMeta)
		end)
	end
	if Toggles.RoomsAutoWalkSpoofFootsteps then
		pcall(function()
			Toggles.RoomsAutoWalkSpoofFootsteps:SetDisabled(not hasHookMeta)
		end)
	end
	pcall(function()
		execName = RootEnv.identifyexecutor()
	end)
	CheesyApplyTranslationsReport("full ui")
	local Ru = hasFirePrompt and (hasFireTouch and (hasReplicateSignal and (hasNetworkOwner and hasHookMeta)))
	if Ru then
		UiLibrary:Notify({
			["Title"] = "Yay",
			["Description"] = "All features should work as all used functions are supported :D ("
				.. (tostring(execName) .. ")"),
			["Time"] = 5,
		})
	else
		UiLibrary:Notify({
			["Title"] = "Uh oh",
			["Description"] = "Some features may not work as not all used functions are supported :( ("
				.. (tostring(execName) .. ")"),
			["Time"] = 5,
		})
	end
	pcall(function()
		local o = string.lower(tostring(execName))
		if o:find("xeno", 1, true) or o:find("solara", 1, true) then
			UiLibrary:Notify({
				["Title"] = "Executor not supported",
				["Description"] = "Xeno and Solara are both very unstable and may/most likely will not work with the script, I advise using a better executor",
				["Time"] = 10,
			})
		end
	end)
end)(...)
