-- Reconstructed from cheesy.obfuscated.luau.txt by tools/deobfuscate.py.
-- Static analysis only; NOT executed or verified in Roblox.
if not game:IsLoaded() then
	repeat
		task.wait()
	until game:IsLoaded()
end
LoadStart = tick()
if not string.split then
	string["\135\153\157<S"] = function(o, T)
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
local o = (function()
	local o, T = pcall(function()
		if isfile and isfile("cheesy/data/userdata.json") then
			return ((game:GetService("HttpService")):JSONDecode(readfile("cheesy/data/userdata.json"))).UILibrary
		end
	end)
	return o and T or nil
end)()
local T, k, P
DPIAnchorFrame = nil
-- inferred: loadObsidianUiLibrary
local function w()
	local o = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
	local w = "?nb=" .. tostring(math.floor(tick()))
	local F = game:HttpGet(o .. ("Library.lua" .. w))
	F = F:gsub(
		"    return Instance\nend\n\n%-%-// Main Instances",
		"    if not Library.TranslateTargets then Library.TranslateTargets = {} end\n    table.insert(Library.TranslateTargets, Instance)\n    return Instance\nend\n\n--// Main Instances"
	)
	F = F:gsub(
		"function Library:AddTooltip%(InfoStr: string, DisabledInfoStr: string, HoverInstance: GuiObject%)\n    local TooltipTable = %{",
		'function Library:AddTooltip(\180\004Zt\250\154\140\147y\204\205\155\155\222\235\015B\157\131V[\183\152t\210\168\132t\163\237\030\027\164r\167x \255\216\161d\224Dk\184\168\152p\242\183\2303\199`M\242X\148\196\194(\157\165;\237\222\250\129m\239\005\198\161gJ\136\210\220\191\141\1866\240\128\167CL\027\149\177\004b\017\187\169\232\251\191\020\210\199\218T\024\012\014QC\209 \203\184)3*r#\188\252\236,9\229\148\139k\217c\136YZX\178\188\230\203\199\160\023\030\215\222c\016\225QG\223\184\011S]\024\017\026\173\185\007O\242=m\183\150\240\012\025=Y\141V\253\023\240\162GB\002o\023\229\184\179ILp\241\237\162\157\191\161\218h\232\246\240S=\177\175\175\170d\175\169k\008\206\146\202\230<\153\216\147\131\131\139\240#\022\148S\029\231\147\134\175\141@\023\242\001I2d^\159Bs\009\137\005\025J\204\221\180\176 \170g]\212\213\200\224\219^2\161jU\007\191^\183\1306\197\164\138\146\229\232\184\239\127\138\028\252\182\201)7\200\198+j<\190\014\2142\149\194\2412\135\1290S\206\225\153\2055\170\201\161\178\141x\167\239(l\141\190\232]\009\154\163\006\140J\022\015\186\216\130\193\179\228<\227\155\148\031\152\140\219\170Y\021\152\190\210\128\179Y\164\179\152\164\248\2197\129\138\238J"\180\137\0059N\137\134\142\131\138N\206C\220\234\0234\023\134'
	)
	F = F:gsub(
		"        local Groupbox = self\n        local Container = Groupbox%.Container\n\n        local Label = %{",
		'        if Library.Translate and typeof(Data.Text) == "string" then local T3 = Library.Translate(Data.Text) if T3 then Data.Text = T3 end end\n        local Groupbox = self\n        local Container = Groupbox.Container\n\n        local Label = {'
	)
	F = F:gsub(
		"    Data%.Title = tostring%(Info%.Title%)\n    Data%.TitleColor = Info%.TitleColor",
		'    if Library.Translate then\n        if typeof(Info.Title) == "string" then local N1 = Library.Translate(Info.Title) if N1 then Info.Title = N1 end end\n    end\n    Data.Title = tostring(Info.Title)\n    Data.TitleColor = Info.TitleColor'
	)
	F = F:gsub(
		"    Data%.Description = tostring%(Info%.Description%)",
		'    if Library.Translate and typeof(Info.Description) == "string" then local N2 = Library.Translate(Info.Description) if N2 then Info.Description = N2 end end\n    Data.Description = tostring(Info.Description)'
	)
	F = F:gsub(
		"        TabButtonsStyle = {%\n            Gap = 0,\n            Padding = 0,",
		"        TabButtonsStyle = {\n            Gap = 5,\n            Padding = 0,"
	)
	F = F:gsub("UDim2%.new%(0%.5, %-3, 1, 0%)", "UDim2.new(0.5, -7, 1, 0)")
	F = F:gsub(
		"Data.Description = tostring(Info.Description)",
		'Data.Description = Info.Description and tostring(Info.Description) or ""'
	)
	F = F:gsub(
		"local LoaderIcon = Library:GetCustomIcon(LoadingInfo.LoadingIcon)",
		'local LoaderIcon = Library:GetCustomIcon(LoadingInfo.LoadingIcon) or Library:GetCustomIcon(LoadingInfo.Icon) or {Url="",ImageRectOffset=Vector2.zero,ImageRectSize=Vector2.zero}'
	)
	F = F:gsub(
		"local Icon = Library:GetCustomIcon(LoadingInfo.Icon)",
		'local Icon = Library:GetCustomIcon(LoadingInfo.Icon) or {Url="",ImageRectOffset=Vector2.zero,ImageRectSize=Vector2.zero}'
	)
	F = F:gsub(
		"local IconData = Library:GetCustomIcon(Icon)",
		'local IconData = Library:GetCustomIcon(Icon) or {Url="",ImageRectOffset=Vector2.zero,ImageRectSize=Vector2.zero}'
	)
	F = F:gsub(
		'assert%(typeof%(NewImage%) == "string", "Image must be a string."%)',
		'if typeof(NewImage) ~= "string" then return end'
	)
	F = F:gsub(
		"local Bounds = TextService:GetTextBoundsAsync%(Params%)",
		'local BoundsOk, Bounds = pcall(function() return TextService:GetTextBoundsAsync(Params) end)\010    if (not BoundsOk) or typeof(Bounds) ~= "Vector2" then\010        Params.RichText = false\010        BoundsOk, Bounds = pcall(function() retur\139\138\202-\023+\030\188\201\205\192\154\163\232\003\009Z\138Y\028\010\134H\000^\013\230\016\029\143\249{O\024F\153_\202?\180\174#\148\138\176\192\031\183L\028+\156\173tG\215p\201D\237X1\152\193#A\018\015\249D\210\215\149\168v\184{d\226\182\156Q+\008\165\146 \164q\2197\159\254q\178\202^)\164\212\236\031\149u\019\138L\025\231\242\184\226\153\151\167\208+\193j\151\169`\030p\228=K\206\250\192\192\192-\2497\187'
	)
	T = (loadstring(F))()
	k = (loadstring(game:HttpGet(o .. ("addons/SaveManager.lua" .. w))))()
	P = (loadstring(game:HttpGet(o .. ("addons/ThemeManager.lua" .. w))))()
end
-- inferred: loadLinoriaUiLibrary
local function F()
	local o = "https://raw.githubusercontent.com/doram44/linorialib/refs/heads/main/"
	local w = "_istable=function(v)if typeof(v)~='table'then return false end return not pcall(string.sub,v,1,1)end;"
	local F = "local function _cheesyhex(v) if typeof(v)~='string'then return false end return v:match('^#?%x%x%x%x%x%x$')~=nil end;"
	local function A(o)
		o = w .. o
		o = o:gsub('typeof%s*%((%w+)%)%s*==%s*"table"', "_istable(%1)")
		o = o:gsub('typeof%s*%((%w+)%)%s*~=%s*"table"', "not _istable(%1)")
		return o
	end
	T = (loadstring(A(game:HttpGet(o .. "Library.lua"))))()
	k = (loadstring(A(game:HttpGet(o .. "addons/SaveManager.lua"))))()
	local d = A(game:HttpGet(o .. "addons/ThemeManager.lua"))
	d = d:gsub(
		"\t\t\t\tself%.Library%[idx%] = Color3%.fromHex%(col%)",
		"\t\t\t\tif _cheesyhex(col) then\n\t\t\t\t\tself.Library[idx] = Color3.fromHex(col)\n\t\t\t\tend"
	)
	d = d:gsub(
		"\t\t\t\t\tself%.Library%.Options%[idx%]:SetValueRGB%(Color3%.fromHex%(col%)%)",
		"\t\t\t\t\tif _cheesyhex(col) then\n\t\t\t\t\t\tself.Library.Options[idx]:SetValueRGB(Color3.fromHex(col))\n\t\t\t\t\tend",
		1
	)
	d = F .. d
	P = (loadstring(d))()
end
w()
function hexToColor3(o)
	if typeof(o) == "string" then
		local T, k = pcall(Color3.fromHex, o)
		if T then
			return k
		end
	end
	local function T(T)
		local k, P = pcall(string.sub, o, T, T + 1)
		if not k then
			return 0
		end
		local w, F = pcall(tonumber, P, 16)
		return w and F or 0
	end
	return Color3.fromRGB(T(1), T(3), T(5))
end
local A = game:GetService("HttpService")
function toRealString(o)
	if typeof(o) == "string" then
		return o
	end
	local T, k = pcall(function()
		return A:JSONDecode('"' .. (o .. '"'))
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
-- inferred: getTabButton
local function d(o)
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
-- inferred: getTabLabel
local function C(o)
	local T = d(o)
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
-- inferred: isActiveTab
local function f(o)
	if type(o) ~= "table" then
		return false
	end
	local k = T.ActiveTab
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
-- inferred: patchUiLibrary
local function m()
	T.TabButtons = {}
	local k = T.Create
	T.Create = function(o, T, P)
		if P then
			for o, T in pairs(P) do
				if typeof(T) == "string" then
					P[o] = toRealString(T)
				end
			end
		end
		return k(o, T, P)
	end
	local w = T.CreateWindow
	T.CreateWindow = function(k, ...)
		local P = w(k, ...)
		DPIAnchorFrame = P.MainFrame or P.Holder
		if o == "Linoria" then
			local o = P.AddTab
			P.AddTab = function(k, P, w)
				local F = o(k, P, w)
				local A = F.LeftSideFrame or F.RightSideFrame
				local d = A and A.Parent
				local C = d and d.Parent
				local f = C and C.Parent
				local m = f and f:FindFirstChildOfClass("ScrollingFrame")
				local r, G
				if m then
					for o, T in ipairs(m:GetChildren()) do
						if T:IsA("Frame") then
							local o = T:FindFirstChildOfClass("TextLabel")
							if o and o.Text == P then
								r = T
								G = o
								break
							end
						end
					end
				end
				if r then
					F._Button = r
					F._Label = G
					table.insert(T.TabButtons, { ["Frame"] = r, ["Label"] = G })
				end
				if not F.SetVisible then
					local function o(o, T)
						return function(k, P)
							if T then
								T.Visible = P
							end
							if o then
								o.Visible = P
							end
						end
					end
					F.SetVisible = o(d, r)
				end
				return F
			end
		end
		return P
	end
	local F = P.ApplyTheme
	P.ApplyTheme = function(o, T)
		local k = o:GetCustomTheme(T)
		local P = k or o.BuiltInThemes[T]
		if not P then
			return false, "Theme not found"
		end
		if o.Library.InnerVideoBackground ~= nil then
			o.Library.InnerVideoBackground.Visible = false
		end
		local w = P[2]
		for T, k in next, k or w do
			if T == "VideoLink" then
				o.Library[T] = k
				if o.Library.Options[T] then
					o.Library.Options[T]:SetValue(k)
				end
			else
				local P = hexToColor3(k)
				o.Library[T] = P
				if o.Library.Options[T] then
					local k, w = pcall(o.Library.Options[T].SetValueRGB, o.Library.Options[T], P)
					if not k then
						pcall(o.Library.Options[T].SetValue, o.Library.Options[T], P)
					end
				end
			end
		end
		o:ThemeUpdate()
		return true
	end
end
m()
Executions = 1
if
	game.PlaceId ~= 6516141723
	and (
		game.PlaceId ~= 6839171747 and (game.PlaceId ~= 1.1025868967237e+014 and game.PlaceId ~= 10549820578)
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
	local o = (game:GetService("ReplicatedStorage"))["\142\001*\172\031pW\222"]:FindFirstChild(
		"FinishedLoadingRoom"
	)
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
										(game:GetService("HttpService")):UrlEncode(k and P.Name or "Unknown")
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
-- inferred: saveUserData
local function r()
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
			["UILibrary"] = o,
			["creditinfo"] = CreditSeen == true,
		}
		if isfile("cheesy/data/userdata.json") then
			local k = (game:GetService("HttpService")):JSONDecode(readfile("cheesy/data/userdata.json"))
			if type(k) == "table" then
				T.UILibrary = o or k.UILibrary
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
-- inferred: loadUserData
local function G()
	local T, k = pcall(function()
		if isfile and isfile("cheesy/data/userdata.json") then
			local T = readfile("cheesy/data/userdata.json")
			local k = (game:GetService("HttpService")):JSONDecode(T)
			if k then
				Executions = (k.executions or 0) + 1
				o = k.UILibrary
				CreditSeen = k.creditinfo == true
				return k.key == CHEESE_KEY
			end
		end
		return false
	end)
	if T and k then
		r()
		return true
	end
	return false
end
-- inferred: makeCheesyTheme
local function y()
	local T = {
		["FontColor"] = "ebebeb",
		["MainColor"] = "0c0c0c",
		["AccentColor"] = "ffc33f",
		["BackgroundColor"] = "151518",
		["OutlineColor"] = "28282a",
	}
	if o == "Obsidian" then
		T.BackgroundImage = ""
	end
	return T
end
-- inferred: registerCheesyTheme
local function X()
	P.BuiltInThemes.cheesy = { #P.BuiltInThemes + 1, y() }
end
do
	pcall(function()
		P:SetFolder("cheesy/Data")
		P:SetLibrary(T)
		X()
		if isfile and not isfile(P.Folder .. "/themes/default.txt") then
			makefolder(P.Folder .. "/themes")
			writefile(P.Folder .. "/themes/default.txt", "cheesy")
		end
		local o = "cheesy"
		if readfile then
			local T = readfile(P.Folder .. "/themes/default.txt")
			if type(T) == "string" then
				local k = T:match("^%s*(.-)%s*$")
				if k and k ~= "" then
					o = k
				end
			end
		end
		if type(P.ApplyTheme) == "function" then
			P:ApplyTheme(o)
		elseif type(P.Apply) == "function" then
			P:Apply(o)
		end
	end)
end
if not G() then
	local o = false
	local k = T:CreateLoading({
		["Title"] = "Disc2\194\156*\187ZA\1311",
		["TotalSteps"] = 1,
		["ShowSidebar"] = true,
		["WindowWidth"] = 520,
		["Icon"] = 1.0699002190259e+014,
		["LoadingIcon"] = 106990021902592,
	})
	k:SetDescription(
		"We don't hav\026\134\015c/Pv-A\232;q\215\251\194;\207\185\235\238\196?\224;f;\251\133\017\009\164\199K\027\224\136\030V\198\181Wom\026D~\164\147Q\250\0263 0\020#>\194\174\184\015\238>\188Tf-\225\220\005\255&|\019?\\\212:\148\137\140\173\233\141\018AU\233\156x|\193S\019\009uJ\021\249\152\175\016\177z\203=kUW#\241\171\154\231\147\161\237\149\031\218\020\193\167\186:\166+\009,u\182\200\178\199p\152"
	)
	k.Sidebar:AddInput("KeyInput", { ["Text"] = "Key", ["Placeholder"] = "", ["ClearTextOnFocus"] = false })
	k.Sidebar:AddButton({
		["Text"] = "Copy/Open Discord Invite",
		["Func"] = function()
			pcall(function()
				setclipboard(DISCORD_INVITE)
			end)
			pcall(function()
				_G.Clipboard.set(DISCORD_INVITE)
			end)
		end,
	})
	k.Sidebar:AddButton({
		["Text"] = "Continue",
		["Func"] = function()
			if T.Options.KeyInput.Value == CHEESE_KEY then
				Executions = 1
				r()
				o = true
				k:Continue()
			end
		end,
	})
	while not o do
		task.wait()
	end
end
pcall(function()
	T.Options.KeyInput:Destroy()
end)
T.Options.KeyInput = nil
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
	["pl"] = "P\021\210\184K\136",
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
-- inferred: ensureDataFolders
local function I()
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
	I()
	local T, k = pcall(readfile, "cheesy/data/userdata.json")
	if not T or type(k) ~= "string" or k == "" then
		return o
	end
	local P, w = pcall(function()
		return A:JSONDecode(k)
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
	I()
	local o = CheesyReadUserData()
	o.Language = CheesyLanguage
	o.LanguageVersion = CheesyLanguageVersion
	o.SkipLanguagePrompt = CheesySkipLanguagePrompt
	local T, k = pcall(function()
		writefile("cheesy/data/userB\141,8\253\222@\142\141", A:JSONEncode(o))
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
			CheesyLanguageBase .. ("/" .. (CheesyLanguage .. (".lua?nb=" .. tostring(math.floor(tick())))))
		)
		local k = (o(T))()
		if type(k) == "table" then
			CheesyTranslations = k
			CheesyBuildTranslateIndex(k)
		end
	end)
	if not T then
		warn("[cheesy] translation fetch failed for " .. (tostring(CheesyLanguage) .. (": " .. tostring(k))))
	end
end
function CheesyBuildTranslateIndex(o)
	CheesyConcatWords = {}
	CheesyWordIndex = {}
	local function T(o, T, k)
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
				T(CheesyWordIndex, P, k)
				if k ~= o then
					T(CheesyConcatWords, P, k)
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
	local k = string["A\006\007\176\152"](o, "^%s*(.-)%s*$")
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
if type(T) == "table" then
	T.Translate = CheesyTranslate
end
function ApplyCheesyTranslations()
	if not CheesyTranslations then
		return 0
	end
	local o = 0
	local k = {}
	local function P(o, T)
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
	local function w(T)
		if type(T) ~= "table" or k[T] then
			return
		end
		k[T] = true
		if type(T.Text) == "string" then
			local k = CheesyTranslate(T.Text)
			if k then
				if P(T, k) then
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
	local function F(o)
		if type(o) ~= "table" then
			return
		end
		for o, T in pairs(o) do
			w(T)
		end
	end
	F(T and T.Toggles)
	F(T and T.Options)
	F(CheesyTrackedWidgets)
	local function A(T)
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
				w(T)
				F(T)
			end
		end
	end
	if type(CheesyTextNodes) == "table" then
		for o, T in ipairs(CheesyTextNodes) do
			A(T)
		end
	end
	if type(T) == "table" and type(T.TabButtons) == "table" then
		for o, T in ipairs(T.TabButtons) do
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
			w(T)
			local o
			if type(T.BoxHolder) == "Instance" then
				o = T.BoxHolder
			elseif type(T.Container) == "table" and type(T.Container.Parent) == "Instance" then
				o = T.Container.Parent
			end
			if o then
				for o, T in ipairs(o:GetDescendants()) do
					A(T)
				end
			end
		end
	end
	local C = T and T.Window
	local f = type(C) == "table" and (C.MainFrame or C.Holder) or nil
	if type(f) == "Instance" then
		for o, T in ipairs(f:GetDescendants()) do
			A(T)
		end
		if not f.__CheesyHooked then
			f.__CheesyHooked = true
			f.DescendantAdded:Connect(function(o)
				if CheesyTranslations then
					A(o)
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
	local k = T and T.TranslateTargets
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
	if type(o.Language) == "8\025\255\182\190G" and not CheesyLanguageNames[o.Language] then
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
	if k and (T and T.CreateLoading) then
		local o, k = {}, 1
		for T, P in ipairs(CheesyLanguageList) do
			o[T] = P.Name
			if P.Code == CheesyLanguage then
				k = T
			end
		end
		local P = o[k]
		local w = false
		local F = T:CreateLoading({
			["Title"] = "Welcome to cheesy",
			["Description"] = "Choose your language",
			["TotalSteps"] = 1,
			["ShowSidebar"] = true,
			["WindowWidth"] = 520,
			["Icon"] = 1.0699002190259e+014,
		})
		F:SetDescription("Choose your language")
		F.Sidebar:AddDropdown("CheesyLangPick", {
			["Text"] = "Language",
			["Values"] = o,
			["Default"] = k,
			["Callback"] = function(o)
				P = o
			end,
		})
		F.Sidebar:AddLabel({
			["Text"] = "(If you would like to reset the language, use Reset Loading in the settings tab)",
			["DoesWrap"] = true,
		})
		F.Sidebar:AddButton({
			["Text"] = "Continue",
			["Func"] = function()
				for o, T in ipairs(CheesyLanguageList) do
					if T.Name == P then
						CheesyLanguage = T.Code
						break
					end
				end
				w = true
				pcall(function()
					F:Continue()
				end)
			end,
		})
		while not w do
			task.wait()
		end
	end
	CheesyWriteUserData()
	CheesyLoadTranslations()
end
if o == "Linoria" then
	F()
	if type(T) == "table" then
		T.Translate = CheesyTranslate
	end
	local o = T.SetDPIScale
	function T.SetDPIScale(k, T)
		o(k, T)
		local P = DPIAnchorFrame
		if not P and k.Watermark then
			P = k.Watermark:FindFirstAncestorOfClass("ScreenGui") or k.Watermark.Parent
		end
		if P then
			local o = P:FindFirstChildOfClass("UIScale")
			if not o or o.Name ~= "CheesyDPIScale" then
				o = Instance.new("UIScale")
				o.Name = "CheesyDPIScale"
				o.Parent = P
			end
			o.Scale = (T or 100) / 100
		end
	end
end
local V = game:HttpGet("https://raw.githubusercontent.com/bocaj111004/ESPLibrary/refs/heads/main/Library.lua")
V = V:gsub("']</font>'", "'M]</font>'")
V = V:gsub("Frame%.Visible = OnScreen", "Frame.Visible = OnScreen and Library.ShowESPText ~= false")
V = V:gsub(
	"local ScreenPoint, OnScreen = Camera:WorldToViewportPoint%(ObjectPos%)",
	"local ScreenPoint, OnScreen = Camera:WorldToViewportPoint(ObjectPos); if OnScreen then local Dist = (Camera.CFrame.Position - ObjectPos).Magnitude; local ObjMaxDist = Library.ObjectMaxDistance and Library.ObjectMaxDistance[Object]; if Dist > (ObjMaxDist or Library.MaxDistance) then OnScreen = false end end"
)
V = V:gsub("Tracers = false,", "Tracers = false, TracersEnabled = {},")
V = V:gsub(
	"LineData%[1%].Visible = OnScreen",
	"LineData[1].Visible = OnScreen and (Library.Tracers == true or Library.TracersEnabled[Object])"
)
V = V:gsub(
	"if LineData and CachedHighlight and Library.Tracers == true and OnScreen then",
	"if LineData and CachedHighlight and (Library.Tracers == true or Library.TracersEnabled[Object]) and OnScreen then"
)
V = V:gsub(
	"TracersFrame.Parent = ScreenGui",
	"TracersFrame.Parent = ScreenGui\n\nfunction Library:SetTracersEnabled(Object, Value)\n\tif Value then\n\t\tLibrary.TracersEnabled[Object] = true\n\t\tTracersFrame.Visible = true\n\telse\n\t\tLibrary.TracersEnabled[Object] = nil\n\t\tlocal any = false\n\t\tfor _ in pairs(Library.TracersEnabled) do any = true break end\n\t\tTracersFrame.Visible = any or Library.Tracers\n\tend\nend"
)
local q = (loadstring(V))()
q.ObjectMaxDistance = {}
local M = game:GetService("^\143\138D\236r9")
local i = game:GetService("RunService")
local j = game:GetService("ReplicatedStorage")
local D = game:GetService("UserInputService")
SoundService = game:GetService("SoundService")
Lighting = game:GetService("Lighting")
TextChatService = game:GetService("TextChatService")
CoreGui = game:GetService("CoreGui")
VirtualUser = game:GetService("VirtualUser")
ProximityPromptService = game:GetService("ProximityPromptService")
TweenService = game:GetService("TweenService")
ContextActionService = game:GetService("ContextActionService")
VirtualInputManager = game:GetService("VirtualInputManager")
local a = M.LocalPlayer
local J = a:FindFirstChildOfClass("PlayerGui")
local R = workspace.CurrentCamera
local x = workspace:FindFirstChild("CurrentRooms")
_CameraChangedConn = (workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function()
	R = workspace.CurrentCamera
end)
local b
local B
local u
local e
local t
PartProperties = {}
local Q
-- inferred: updateCurrentRoom
local function c()
	local o = j:FindFirstChild("GameData") and j.GameData:FindFirstChild("LatestRoom")
	if not o then
		o = j:FindFirstChild("FloorReplicated") and j.FloorReplicated:FindFirstChild("LatestRoom")
	end
	if o and o ~= Q then
		Q = o
		if Q.Value then
			a:SetAttribute("CurrentRoom", Q.Value)
		end
		Q.Changed:Connect(function(o)
			a:SetAttribute("CurrentRoom", o)
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
c()
-- inferred: watchLatestRoom
local function g(o)
	o.ChildAdded:Connect(function(o)
		if o.Name == "LatestRoom" then
			c()
		end
	end)
	if o:FindFirstChild("LatestRo\244&") then
		c()
	end
end
local W = j:FindFirstChild("GameData")
if W then
	g(W)
else
	j.ChildAdded:Connect(function(o)
		if o.Name == "GameData" then
			g(o)
		end
	end)
end
do
	local o = j:FindFirstChild("FloorReplicated")
	if o then
		o.ChildAdded:Connect(function(o)
			if o.Name == "LatestRoom" then
				c()
			end
		end)
	end
end
local p = T.Toggles
local l = T.Options
local Z
local L
local O = {
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
-- inferred: getGodmodeMethod
local function n()
	local o = l.GodmodeMethod and l.GodmodeMethod.Value
	if typeof(o) == "number" then
		return o == 2 and 2 or 1
	end
	if o == "On entity spawn" then
		return 2
	end
	return 1
end
-- inferred: hasActiveThreats
local function v()
	for o in pairs(O.ActiveThreats) do
		if o.Parent then
			return true
		end
		O.ActiveThreats[o] = nil
	end
	return false
end
-- inferred: shouldUseGodmode
local function H()
	if not (p and (p.Godmode and p.Godmode.Value)) then
		return false
	end
	if n() == 1 then
		return true
	end
	return v()
end
-- inferred: trackThreat
local function U(o)
	if not o or not O.ThreatNames[o.Name] then
		return
	end
	if O.ActiveThreats[o] then
		return
	end
	O.ActiveThreats[o] = true
	o.AncestryChanged:Connect(function(T, k)
		if not k then
			O.ActiveThreats[o] = nil
		end
	end)
end
workspace.DescendantAdded:Connect(U)
for o, T in workspace:GetDescendants() do
	U(T)
end
-- inferred: applyGodmode
local function K()
	if not b or not B or not u then
		return
	end
	if CurrentFloor == "Fools" or CurrentFloor == "OldHotel" then
		return
	end
	if L and not L.OriginalC1 then
		local o = b:FindFirstChild("LowerTorso")
		local T = o and o:FindFirstChild("Root")
		if T then
			L.OriginalC1 = T.C1
		end
	end
	if not b:GetAttribute("GodmodeSunk") then
		u.CFrame = u.CFrame + Vector3.new(0, -2.346, 0)
		B.HipHeight = 0.05
		b:SetAttribute("GodmodeSunk", true)
		L.SkipGodmodeCrouchForce = true
		if Z then
			local o = Z:FindFirstChild("Crouch")
			if o then
				o:FireServer(true, true)
			end
		end
	end
end
-- inferred: restoreGodmode
local function N()
	if not b or not B or not u then
		return
	end
	if b:GetAttribute("GodmodeSunk") then
		u.CFrame = u.CFrame + Vector3.new(0, 2.346, 0)
		b:SetAttribute("GodmodeSunk", nil)
	end
	B.HipHeight = L.OriginalHipHeight or 2.396
	L.SkipGodmodeCrouchForce = true
	pcall(function()
		local o = Z and Z:FindFirstChild("Crouch")
		if o then
			o:FireServer(false, false)
		end
		if b then
			b:SetAttribute("Crouching", false)
		end
	end)
	L.SkipGodmodeCrouchForce = false
end
-- inferred: saveCharacterPhysics
local function S()
	if not b or not u then
		return
	end
	TableClear(PartProperties)
	CustomPhysics = PhysicalProperties.new(
		100,
		u.CustomPhysicalProperties.Friction,
		u.CustomPhysicalProperties.Elasticity,
		u.CustomPhysicalProperties.FrictionWeight,
		u.CustomPhysicalProperties.ElasticityWeight
	)
	for o, T in b:GetDescendants() do
		if T:IsA("BasePart") then
			PartProperties[T] = T.CustomPhysicalProperties
			if p.RemoveAcceleration and p.RemoveAcceleration.Value then
				T.CustomPhysicalProperties = CustomPhysics
			end
		end
	end
end
-- inferred: detectFloor
local function z()
	if workspace:FindFirstChild("Lobby") then
		return "Lobby"
	end
	local o = j:FindFirstChild("GameData")
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
		local o = j:FindFirstChild("RemotesFolder") or j:FindFirstChild("Bricks")
		if o and o.Name == "Bricks" then
			return "OldHotel"
		end
	end
	return k
end
CurrentFloor = nil
OldJump = false
OldSlide = false
-- inferred: watchMovementAttributes
local function h()
	if JumpAttributeConnection then
		JumpAttributeConnection:Disconnect()
	end
	if SlideAttributeConnection then
		SlideAttributeConnection:Disconnect()
	end
	if not b then
		return
	end
	OldJump = b:GetAttribute("CanJump") or false
	OldSlide = b:GetAttribute("CanSlide") or false
	if p.EnableCharacterJump and p.EnableCharacterJump.Value then
		b:SetAttribute("CanJump", true)
	end
	if p.EnableCharacterSlide and p.EnableCharacterSlide.Value then
		b:SetAttribute("CanSlide", true)
	end
	JumpAttributeConnection = (b:GetAttributeChangedSignal("CanJump")):Connect(function()
		local o = b:GetAttribute("CanJump")
		if
			(p.EnableCharacterJump and (p.EnableCharacterJump.Value and o ~= true))
			or not (p.EnableCharacterJump and p.EnableCharacterJump.Value)
		then
			OldJump = o
		end
		if p.EnableCharacterJump and p.EnableCharacterJump.Value then
			b:SetAttribute("CanJump", true)
		end
	end)
	SlideAttributeConnection = (b:GetAttributeChangedSignal("CanSlide")):Connect(function()
		local o = b:GetAttribute("CanSlide")
		if
			(p.EnableCharacterSlide and (p.EnableCharacterSlide.Value and o ~= true))
			or not (p.EnableCharacterSlide and p.EnableCharacterSlide.Value)
		then
			OldSlide = o
		end
		if p.EnableCharacterSlide and p.EnableCharacterSlide.Value then
			b:SetAttribute("CanSlide", true)
		end
	end)
end
-- inferred: refreshCharacter
local function E()
	b = a.Character
	if b then
		B = b:FindFirstChildOfClass("Humanoid")
		u = b:FindFirstChild("Huma\137=B\235\253\143:yUfw9")
		e = b:FindFirstChild("Collision") or b:FindFirstChild("CollisionPart")
		t = b:FindFirstChild("CollisionPart") or b:FindFirstChild("Collision")
		S()
		h()
		if L then
			local o = b:FindFirstChild("LowerTorso")
			local T = o and o:FindFirstChild("Root")
			if T then
				L.OriginalC1 = T.C1
			end
			if B then
				L.OriginalHipHeight = B.HipHeight
			end
			L.SpoofOffset = 0
			local k = b:FindFirstChild("CollisionClone")
			if e and not k then
				k = e:Clone()
				k.Parent = b
				k.Name = "CollisionClone"
				k.Massless = true
			end
		end
	end
end
local Y
local s
local oT
local TT
local kT
local PT
local wT
FakePrompts = {}
local FT
Connections = {}
do
	local o
	local k
	local P
	function SetupCharacterAnticheat()
		if not b then
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
		o = (b:GetAttributeChangedSignal("Climbing")):Connect(function()
			if
				b:GetAttribute("Climbing") == true
				and (p.DisableAnticheat.Value and not L.AnticheatDisabled)
			then
				task.wait(0.25)
				b:SetAttribute("Climbing", false)
				L.AnticheatDisabled = true
				T:Notify({
					["Title"] = "Disabled anticheat",
					["Description"] = "Re-enables after cutscenes or halt",
					["Time"] = 5,
				})
			end
		end)
		if Z then
			k = (Z:WaitForChild("Cutscene")).OnClientEvent:Connect(function(o)
				if L.AnticheatDisabled and not o:find("SewerSeek") then
					L.AnticheatDisabled = false
					T:Notify({
						["Title"] = "Anticheat re-enabled",
						["Description"] = "Interact with a ladder for re-disabling",
						["Time"] = 5,
					})
				end
			end)
			P = (Z:WaitForChild("UseEnemyModule")).OnClientEvent:Connect(function(o)
				if o == "Void" or o == "Glitch" then
					if L.AnticheatDisabled then
						L.AnticheatDisabled = false
						T:Notify({
							["Title"] = "Anticheat re-enabled",
							["Description"] = "Interact with a ladder for re-disabling",
							["Time"] = 5,
						})
					end
					if Q then
						a:SetAttribute("CurrentRoom", Q.Value)
					end
				end
			end)
		end
		b:SetAttribute("Climbing", nil)
	end
end
E()
a.CharacterAdded:Connect(function()
	task.wait(0.5)
	E()
	Y()
	if p.FlyToggle.Value then
		s()
	end
	if p.ArchiveChairFly.Value or (p.StairwellChairFly and p.StairwellChairFly.Value) then
		StopChairBypass()
	end
	oT()
	TT()
	kT()
	PT()
	task.spawn(function()
		task.wait(1)
		if H() then
			K()
		end
	end)
	SetupCharacterAnticheat()
	SetupBringItems()
end)
Z = j:FindFirstChild("RemotesFolder")
if not Z then
	if j:FindFirstChild("EntityInfo") then
		Z = j:FindFirstChild("EntityInfo")
	elseif j:FindFirstChild("Bricks") then
		Z = j:FindFirstChild("Bricks")
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
if Z then
	FakeEvents.Screech_Real = Z:FindFirstChild("Screech")
	FakeEvents.Shade_Real = Z:FindFirstChild("ShadeResult")
	FakeEvents.A90_Real = Z:FindFirstChild("A90")
	FakeEvents.Surge_Real = Z:FindFirstChild("SurgeRemote")
end
local function getMainGameModules()
	local o = a:FindFirstChildOfClass("PlayerGui")
	local T = o and o:FindFirstChild("MainUI")
	local k = T and T:FindFirstChild("Initiator")
	local P = k and k:FindFirstChild("Main_Game")
	local w = P and P:FindFirstChild("RemoteListener")
	return w and w:FindFirstChild("Modules")
end
local dT = T:CreateWindow({
	["Title"] = "cheesy",
	["Footer"] = "Revamped :O dsc.gg/cheesyscript",
	["Icon"] = 1.0699002190259e+014,
	["IconSize"] = UDim2.fromOffset(42, 42),
	["ToggleKeybind"] = Enum.KeyCode.RightShift,
	["NotifySide"] = "Right",
	["ShowCustomCursor"] = false,
	["AutoShow"] = false,
	["Center"] = true,
	["TabPadding"] = 3,
	["CornerRadius"] = 2,
})
CHEESY_WINDOW_TITLE = "cheesy"
CheesyIconWarned = false
local CT = nil
local function findMenuFrame()
	if CT and CT.Parent then
		return CT.Parent, CT
	end
	if type(dT) ~= "table" then
		return nil, nil
	end
	local o = dT.MainFrame or dT.Holder
	if not o then
		return nil, nil
	end
	local T
	for o, k in ipairs(o:GetDescendants()) do
		if k:IsA("TextLabel") and k.Text == CHEESY_WINDOW_TITLE then
			T = k
			break
		end
	end
	if not T or not T.Parent then
		return nil, nil
	end
	local k = T.Parent
	for o, T in ipairs(k:GetChildren()) do
		if T:IsA("ImageLabel") then
			CT = T
			return k, T
		end
	end
	return k, nil
end
local function setMenuVisibility(o)
	local T, k = findMenuFrame()
	if not T then
		return false
	end
	if k then
		k.Visible = o and true or false
	end
	return k ~= nil
end
CheesyTrackedWidgets = {}
CheesyTrackedGroupboxes = {}
do
	local o = type(dT) == "table" and dT.AddTab or nil
	if type(o) == "function" then
		dT.AddTab = function(T, ...)
			local k = o(T, ...)
			if type(k) == "table" then
				for o, T in ipairs({ "AddLeftGroupbox", "AddRightGroupbox", "AddGroupbox" }) do
					local P = k[T]
					if type(P) == "function" then
						k[T] = function(...)
							local o = P(...)
							if type(o) == "table" and not o.__CheesyTracked then
								o.__CheesyTracked = true
								table.insert(CheesyTrackedGroupboxes, o)
								local T = o.AddButton
								if type(T) == "function" then
									o.AddButton = function(...)
										local o = T(...)
										if type(o) == "table" then
											table.insert(CheesyTrackedWidgets, o)
										end
										return o
									end
								end
							end
							return o
						end
					end
				end
			end
			return k
		end
	end
end
local rT = {
	["Home"] = dT:AddTab("Home", "door-closed"),
	["Main"] = dT:AddTab("Main", "house"),
	["Visuals"] = dT:AddTab("Visuals", "scan-eye"),
	["Exploits"] = dT:AddTab("Exploits", "sparkle"),
	["Miscellaneous"] = dT:AddTab("Miscellaneous", "settings"),
	["Mines"] = dT:AddTab("Mines", "gem"),
	["FoolsHotel"] = dT:AddTab("Hotel-/Fools", "party-popper"),
	["Rooms"] = dT:AddTab("Rooms", "bed-double"),
	["Garden"] = dT:AddTab("Outdoors", "tree-pine"),
	["Archives"] = dT:AddTab("Archives", "archive"),
	["Stairwell"] = dT:AddTab("Stairwell", "tv"),
}
do
	local o = C(rT.FoolsHotel)
	if o then
		rT.FoolsHotel.TabLabelRef = o
	end
end
Groupboxes = {}
Groupboxes.SubfloorsFools = rT.FoolsHotel:AddLeftGroupbox("Fools")
Groupboxes.SubfloorsFools:AddToggle(
	"BypassKillbricks",
	{ ["Text"] = "Anti Killbricks", ["Default"] = false, ["Tooltip"] = "Disables Lava from hurting you" }
)
Groupboxes.SubfloorsFools:AddToggle(
	"BypassSeekingWall",
	{
		["Text"] = "Anti Seeking Wall",
		["Default"] = false,
		["Tooltip"] = "Disables ScaryWall from hurting you",
	}
)
Groupboxes.SubfloorsFools:AddToggle(
	"BypassBanana",
	{
		["Text"] = "Anti Banana",
		["Default"] = false,
		["Tooltip"] = "Disables Banana Peel from making you slip",
	}
)
Groupboxes.SubfloorsFools:AddToggle(
	"BypassJeff",
	{
		["Text"] = "Anti Jeff",
		["Default"] = false,
		["Tooltip"] = "Disables Jeff the Killer from stabbing you",
	}
)
Groupboxes.SubfloorsFools:AddDivider()
Groupboxes.SubfloorsFools:AddToggle(
	"RemoveSeekTrigger",
	{
		["Text"] = "Delete Seek Trigger",
		["Default"] = false,
		["Tooltip"] = "Deletes/disables the Seek cutscene trigger",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes["SubfloorsFooe\219"]:AddToggle(
	"RemoveFigure",
	{
		["Text"] = "Delete Figure",
		["'\010\255\174\133k\004"] = false,
		["Tooltip"] = "Removes Figure, however this is inconsistent",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.SubfloorsFools:AddToggle(
	"AutoRevive",
	{
		["Text"] = "Infinite Revives",
		["Default"] = false,
		["Tooltip"] = "Automatically revives after dying without using a revive and having infinite usage",
	}
)
Groupboxes.SubfloorsFools:AddToggle(
	"FigureGodmodeFools",
	{ ["Text"] = "Figure Godmode", ["Default"] = false, ["Tooltip"] = "Prevents 'Figure' from hurting you" }
)
Groupboxes.SubfloorsFools:AddDivider()
Groupboxes.SubfloorsFools:AddToggle(
	"RemoveBasementGate",
	{
		["Text"] = "Remove Basement Gate",
		["Default"] = false,
		["Tooltip"] = "Removes the gate from basement rooms",
	}
)
Groupboxes.SubfloorsFools:AddToggle(
	"RemovePaintingsDoor",
	{
		["Text"] = "Remove Paintings Door",
		["Default"] = false,
		["Tooltip"] = "Removes the fireplace doors from painting rooms",
	}
)
Groupboxes.SubfloorsFools:AddToggle(
	"RemoveSkeletonDoor",
	{
		["Text"] = "Remove Skeleton Door",
		["Default"] = false,
		["Tooltip"] = "Removes the skeleton door from the infirmary",
	}
)
Groupboxes.SubfloorsFools:AddToggle(
	"AutoRoomSkip",
	{
		["Text"] = "Auto Room-Skip",
		["Default"] = false,
		["Tooltip"] = "Automatically teleports to the next room",
	}
)
Groupboxes.SubfloorsFools:AddButton({
	["Text"] = "Skip Current Room",
	["Tooltip"] = "Teleports you to the current room's door",
	["Func"] = function()
		task.spawn(function()
			local o = workspace:FindFirstChild("CurrentRooms")
			if not o then
				return
			end
			local T = Q and Q.Value or a:GetAttribute("CurrentRoom")
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
			local w = a.Character
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
Groupboxes.HomeWelcome = rT.Home:AddLeftGroupbox("Welcome")
local yT = '<font size="28">' .. (Greeting .. (", " .. (a.Name .. "</font>")))
Groupboxes.HomeWelcome:AddLabel({ ["Text"] = yT, ["DoesWrap"] = true })
avatarImage = Groupboxes.HomeWelcome:AddImage(
	"AvatarPreview",
	{
		["Image"] = "rbxasset://textures/ui/GuiImagePlaceholder.png",
		["Height"] = 100,
		["Width"] = 100,
		["ScaleType"] = Enum.ScaleType.Fit,
	}
)
avatarImage:SetVisible(false)
local XT, IT = pcall(function()
	return M:GetUserThumbnailAsync(a.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
end)
if XT and IT then
	avatarImage:SetImage(IT)
	avatarImage:SetVisible(true)
else
	local o, T = pcall(function()
		local o = game:HttpGet(
			"https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
				.. (a.UserId .. "&size=420x420&format=Png&isCircular=false")
		)
		local T = (game:GetService("HttpService")):JSONDecode(o)
		if T and (T.data and T.data[1]) then
			return T.data[1].imageUrl
		end
		return nil
	end)
	if o and T then
		avatarImage:SetImage(T)
		avatarImage:SetVisible(true)
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
Groupboxes.HomeFunctions = rT.Home:AddLeftGroupbox("Functions & Features")
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
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Auto Interact " .. (CheckMark(hasFirePrompt) .. " (fireproximityprompt)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Infinite Items " .. (CheckMark(hasFirePrompt) .. " (fireproximityprompt)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Infinite Crucifix " .. (CheckMark(hasFirePrompt) .. " (fireproximityprompt)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Auto Closet " .. (CheckMark(hasFirePrompt) .. " (fireproximityprompt)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Remove Seek Trigger " .. (CheckMark(hasFireTouch) .. " (firetouchinterest)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Fake Revive " .. (CheckMark(hasReplicateSignal) .. " (replicatesignal)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Remove Figure " .. (CheckMark(hasNetworkOwner) .. " (isnetworkowner)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Delete Figure (Mines) " .. (CheckMark(hasNetworkOwner) .. " (isnetworkowner)"),
	["Does\208\193zx"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Win Heartbeat Minigame " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Bypass Eyes " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Bypass Lookman " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Spoof Footsteps " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Auto Minecart " .. (CheckMark(hasRequire) .. " (require)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Viewmodel Offset " .. (CheckMark(hasRequire and not isSolara()) .. " (require)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Minecart Teleport " .. (CheckMark(hasHookMeta) .. " (hookmetamethod, hookfunction)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Remove Camera Bobbing " .. (CheckMark(hasRequire and not isSolara()) .. " (require)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Remove Camera Shake " .. (CheckMark(hasRequire and not isSolara()) .. " (require)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Crouch Spoof " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Anti Drone " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeFunctions:AddLabel({
	["Text"] = "Anti Monument " .. (CheckMark(hasHookMeta) .. " (hookmetamethod)"),
	["DoesWrap"] = true,
})
Groupboxes.HomeInfo = rT.Home:AddRightGroupbox("Info")
Groupboxes.HomeInfo:AddLabel({
	["Text"] = "<font size=\"18\">Cheese Hub revamped :)<br/>'cheesy' is still actively getting updated, so i'm sorry for any bugs that might occur!<br/>also, cheesy/cheese hub will eventually support more games :D</font>",
	["DoesWrap"] = true,
})
Groupboxes.HomeInfo:AddDivider()
Groupboxes.HomeInfo:AddLabel({
	["Text"] = '\209\012\183\189\236\241V\248\009\244\204\161\198\171\194m\175[\031\157\127\229\203\002\192|\147\217?\139\1658a\191\0024\030\209eAK\014\014c\238\127\180\149b\203r\148D\127\181\006\027x\029u\2261~\250\027\136\208a\022\147-\238\201\2200\205\1327\150\226\253\175\008\215Wn\255\027*Ii\203R!\2282\220\002">\195\162',
	["DoesWrap"] = true,
})
Groupboxes.Misc = rT.Miscellaneous:AddLeftGroupbox("Miscellaneous")
Groupboxes.Misc:AddButton({
	["Text"] = "Play Again",
	["Callback"] = function()
		pcall(function()
			local o = Z and Z:FindFirstChild("PlayAgain")
			if o then
				o:FireServer()
			end
		end)
	end,
})
Groupboxes.Misc:AddButton({
	["Text"] = "Return to Lobby",
	["Callback"] = function()
		pcall(function()
			local o = Z and Z:FindFirstChild("Lobby")
			if o then
				o:FireServer()
			end
		end)
	end,
})
Groupboxes.Misc:AddButton({
	["Text"] = "Reset Character",
	["Callback"] = function()
		pcall(function()
			if B then
				B.Health = 0
			end
			local o = Z and Z:FindFirstChild("Underwater")
			if o then
				o:FireServer(true)
			end
		end)
	end,
})
Groupboxes.Misc:AddButton({
	["Text"] = "Give Star Jug",
	["Tooltip"] = "Gives a star jug",
	["Callback"] = function()
		task.spawn(function()
			local o = b or (a.CharacterAdded:Wait())
			local T = B or o:WaitForChild("Humanoid")
			local k = (game:GetObjects("rbxassetid://119885581324516"))[1]
			if not k then
				return
			end
			local P = 4
			local w = false
			k:SetAttribute("Durability", P)
			local F = Instance.new("NumberValue", k)
			k.Parent = a.Backpack
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
				local o = b
				if not o or not o.Parent then
					w = false
					return
				end
				o:SetAttribute("Starlight", true)
				o:SetAttribute("StarlightHuge", true)
				local T = false
				local A = o:FindFirstChild("CollisionPart") or o:FindFirstChild("Collision")
				local C = Z and Z:FindFirstChild("Crouch")
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
Groupboxes.Misc:AddDivider()
Groupboxes.Misc:AddButton({
	["Text"] = "Copy/Open Discord Invite",
	["Tooltip"] = "Copies the Discord invite to your clipboard and opens it in Discord",
	["Callback"] = function()
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
Groupboxes.Misc:AddToggle(
	"ShowKeybinds",
	{ ["Text"] = "Show Keybinds", ["Default"] = false, ["Tooltip"] = "Shows all registered keybinds" }
)
p.ShowKeybinds:OnChanged(function(o)
	T.KeybindFrame.Visible = o
end)
Groupboxes.Misc:AddToggle(
	"DiscordRichPresence",
	{
		["Text"] = "Discord Rich Presence",
		["Default"] = false,
		["Tooltip"] = "Shows your current room in your Discord status via Bloxstrap RPC",
	}
)
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
		W = j:FindFirstChild("GameData")
		local T = W and W:FindFirstChild("LatestRoom")
		if T then
			o = tostring(T.Value)
		elseif a and a:GetAttribute("CurrentRoom") then
			o = tostring(a:GetAttribute("CurrentRoom"))
		end
	end)
	return "Room " .. o
end
local function updateDiscordPresence()
	if _Unloading then
		return
	end
	if not (p.DiscordRichPresence and p.DiscordRichPresence.Value) then
		return
	end
	postBloxstrapRpc(
		"SetRichPresence",
		{
			["details"] = "Using cheesy",
			["state"] = getPresenceRoom(),
			["largeImage"] = { ["assetId"] = BLOXSTRAP_CHEESE_ICON, ["hoverText"] = "cheesy" },
			["smallImage"] = { ["assetId"] = BLOXSTRAP_CHEESE_ICON, ["hoverText"] = "discord.gg/CuZJQaCqu{" },
		}
	)
end
p.DiscordRichPresence:OnChanged(function(o)
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
Groupboxes.Misc:AddToggle(
	"AntiLag",
	{
		["Text"] = "Anti-Lag",
		["Default"] = false,
		["Tooltip"] = "Reduces lag by setting all parts in the current rooms to Plastic material",
	}
)
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
p.AntiLag:OnChanged(function(o)
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
			if not (p.AntiLag and p.AntiLag.Value) then
				return
			end
			AntiLagApplyPart(o)
		end)
	end
end)
Groupboxes.Misc:AddDivider()
Groupboxes.Misc:AddToggle(
	"DisableIdleKick",
	{
		["Text"] = "Disable Idle Kick",
		["Default"] = false,
		["Tooltip"] = "Disables the kick from being afk for 20 minutes",
	}
)
DisableIdleKickConn = nil
p.DisableIdleKick:OnChanged(function(o)
	if DisableIdleKickConn then
		DisableIdleKickConn:Disconnect()
		DisableIdleKickConn = nil
	end
	if o then
		DisableIdleKickConn = a.Idled:Connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
end)
Groupboxes.Misc:AddDivider()
Groupboxes.Misc:AddToggle(
	"DisplayInfo",
	{
		["Text"] = "Display Info",
		["Default"] = false,
		["Tooltip"] = "Shows an overlay with FPS, ping, executor, and username",
	}
)
DisplayInfoFPS = 60
DisplayInfoFC = 0
DisplayInfoFT = tick()
p.DisplayInfo:OnChanged(function(o)
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
		DisplayInfoLabel = T:AddDraggableLabel("cheesy | loading...")
		if L.UILibrary == "Obsidian" then
			local o = DisplayInfoLabel.Label or DisplayInfoLabel
			pcall(function()
				o.TextColor3 = Color3.fromHex("ebebeb")
			end)
		end
		DisplayInfoConn = i.RenderStepped:Connect(function()
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
				return math.floor((game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValue())
			end) and math.floor((game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValue()) or 0
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
					a.Name
				)
			)
		end)
	end
end)
Groupboxes.MiscFun = rT["H\011z\173\198=4\225\238\229\239\245\015"]:AddRightGroupbox("Fun")
Groupboxes.MiscFun:AddToggle(
	"Uhhhh",
	{ ["Text"] = "uhhhh", ["Default"] = false, ["Tooltip"] = "content (this makes a lot of lag btw)" }
)
UhhhhDecals = {}
UhhhhConn = nil
p.Uhhhh:OnChanged(function(o)
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
Groupboxes.MiscFun:AddButton({
	["Text"] = "uhhhh v2",
	["Tooltip"] = "content",
	["Callback"] = function()
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
		P.Text = ".............                                            \010                                           ................                                     ..................                                     \010                                        .......................                               ......................                                   \010                                     .............................                          ..........................                                 \010                                   .................................                      .............................                                \010                                  .....................      .......                     .\008~\0087\009#)6666F\209D\\\022\214'g\022\226\016\200<\209\135\209,cC\140\174B\146\186Z\225\149\228MP\\dd\2498\247\151 \208\148\236\023r'\2125d,\1951\201\185\243Sc#h\197\254\227\2433\016\210\22382\217\203f0\248\203<2\239\026*z\002\225>\155J\\\008\178\184F\030\1307\148\011\186\181\254`6\010r\188\188\186\196\022\0050M\139\016\175zG\140\162n\"rdb\006\173\249\006\250\157y\191Dr\188\024\029\181\142\1904\220>\131\152\255\014\248\178\132\217\170|\027\190\135\250\143\224\009,\194\209\253\223\237\141\173\251\220\168\008\175\232\231\138\177\028\204\224\245.X\001\183;\254\003x\009\196\1292\245\240\158\245\167\2137.\249f\2513\183\188\240@@xd\226N\012\235\230?\130v\134[`v\132U?n\132\026\197\143\176{\011Q\227\201\023\227\013\181\009Z\154``a\140\133\002\12810\151W\202\149\168\141\013\013\024\147\214\189\195\145\148Y`L\222e\165id\016\005\159:v\1976p\236\203\195\143M\233\227\165\202K\171\238\009\147!~q\168![\213\242-?\129\009,\194\008Q\203\1283]Q\006\149\174\198\20659Fb>L@\244\020V\231\016N^{[zjz\127\208\181\211\0246\144\206\218M\236\147GW\183\198\198\188\022vvvvv\"{\136@888t\243\237\187t/\009\190t\130\148\192'37-\183\000\129$'z\199\007\202\145\151*\013\137\"\022\227Qi5AG\176S\136,K\157\136\160o\251\216J5\238\139\139\139\139\139\141z\2334\0183\239@\155\019H)f\021Q\191\191\195\195\195\197\246o\010Y\212\148Q\211\170\131kw\161\191gN\022\2299\227\204\"\192\2535\174\138|\016\245?}R}L\173\215\009]\250\153/\162{\021\181\002IV\188\235\195\142\027\201\012\242\233:<<<<\175\167a\016p\193a\016\237\152S\158\143\205I\004A\201{K+\007\199\137\140\142x\153\153\1657\161\228\159\001]G\201~?\229\153\011\162\220\007\164\251\137\176S\162\023\169\149\184q\209\029\221\009\1651/\007M]\023)\173\173\023x\254\199Ff^\158\154v\008\230/\212\210\022\026\027\225*\127\231\176xe9\026h>\221]]h;\241\150\177\197\2495O\174\183m\003e:\017kc'\010\236\017\000\202\139\132cU:P\232\020,\206-r\021\216\196J \154R\191M\185^V\169\196\136\199\169>\193\225\162~\180,|C\013}\2412E)\021\199\233\183\183\000\011\242Ho\2421\176\185Rk\021`\152\152\152[\246|\187\152\172f\139x\210\172V\135## 1g\238\019\224\019y\194\136\143\161\149\019\017\147\141o\178\163\200`\147A[\168\220r\020\213\180\134>\202\202\164\152&\000\199\160^K(Z\168(\208\132\141%\165\166\166\166\166\166\008'd\253h\006\188\145\028\244\191o\129\009.\241\169\\\203\156$M]\158I\205j\2474\164D\003N\156W/D\0072\020l\187\199\244<\2202\246gz\155\"\001\189\189\174\241\160\215.\225\218\193?\230P\1612\252<\1808\015\245P\195r\0219K2\182\131\133`\170q\006\186\186\143\157\159R\\\\]]]]\244\250'\252|||\228\020'\007VG:\156VGN\207n\131\027\006\153q\009\184d\127c9C\192\151Y\007\213\157\132\1481\207\158\186\148\155\136\140X\176\222\138\211\021\137\234$\016zpbbRRK\247\233\215\"r\137#t\023:\1311)\152\132\132\132\150\150Yw\206h\193\155\199;\009\233\208\191o&\000|\236\022\182\011\191C4<\150\213\001\127\012\178y\232\198\153\"\146\253\016\231Q\174rZ\002\008\254\129\144m`O\213R\160\159\182\146757=\235\246\205\205\025I)\203\214\023\157I\194\216\002\198\170rGa\141\013\013\159\136\140\\\172K\142;\130\177\216f\2290n\018\255\186I'\248iv/O\022S,\217\231<\195\026\229\249\143G\001\1274gV\240}\232\0068s\031\155q)\233\143p<u\240\012MN9\031\245\130\233\239\164\239\189\006\142\159\159\146\018\029v\248\235\226y\135C\170\194\248\167\135\136\006\010\219[\196\133\242y\014\254\135F:\179\252\140\185\217\025\025\025\024`\1439\143\010\137\002\254\135\190\201\189\184\238\228P@L\164\169\183+(\016000:x\197\234\162\171\243m\249\180Se5\229\210\002\226%)\230\226\149\136\183\015\170\193?r\012\230\133Cs\184\227H\135\195\000x\224\180\244\243~Q\007\202K:Z\210U\217\194\176\016\016@G\029VJ\163\237u\154\199\146X)D\157\199\206\029\199\148\239\225;\225\195\225\010T<\228m\254\163kKl\172\201\017\004\128RF\002\023(\145\250\206(\245S\155\170U\213\212R\255\242L%h\230\147\135\173$1\\[\129iiVs6\196\011\011O\202Qv\134\025 ?C\161\003\"\222\021\004XP\248\183\164\130\208\180\136z\1320\135\183\227w<\006\230\230\244a\2258\205\195MV\019\241.\149\212\020\025\1848\185\023\143Jt22!\151\151\024T\230\023 \184\149?\031hJ\220\013\188\029\012$$\"\201\231\183\137%J5\212\201\137\248\231\213>\007\181\214w\150\217\161+R1D\031\215\231Cs\207'\021\001`U0\177\145\210x\205\227\014l\253@\241P-\127\162U\173\026\171\128]fgR\158\138\222\181HDu\246\026\0242,$\180\144\209b;\237\201h+}v\1684\155\241\239\023\021\153\224\132,\254N\174\013\222\221\131M\218\228B\164\164_\194au\215`\022:\\\174\191g(\229\152\015FRi\130\013J\015II\145\164$\127\144\184\127\231\225\001\174\023\179\215\018\018\014K\163\244\1454\167X\189\203\141R4\011l\227\179\181:\179\008\196\251\254\023\185Q\134\148[\185\000\180X\191\134\197Z\155&\030\210\194\024\247\230\187\1719X\175\183\253\220~v\130r(?kW\2370\210X;_\242\004\190X\233+\\\015\228>\201\022\232qZ<)\2399{e\243h\147\187\015~\006\189\225\189\168\241\199q\247\005u)\157\254\229\181\245\245\245\245\235\161\140\231\204\160j4Y>\163+\005\173`\179w\177\015\243\243\243\243\241IIG\015\214\010|f\134i\137[\147y\021\146|4\008s_\230\250s\157\007\019\231\030V\216n\138 \130.\181IV\134@S\199\2257\229\145l\024\200!\127\231d\165\230V\186\155\143S\236N\017\180\174\251h\254\158qH\128\133\241\008\246L\149xY\151\009\136.\163\150\136V\154\127ga\146\016G\152\189\139\214\029\210RS\010}D\245\177\\\236B\190\226\016\144\188\188\189\029\200\029t\030\209\130\234\195U\022\243tt\001\217\217w\227\180yLv {\181d\028\013\196\186\235f\164\013\236\219\188\156fh\149\018u\011\229\019\205\228\181\127ccT\002:\145\136\213\213\213\026N\194\199]>K\224\176B+l}s\157\004\243\014\005{\127.\166\167\233e{m;\022\003\187c\206\028!\151\029JW\144  \227\030\1862+by\027\234\139u6\188\144'S|\220\1286}q\164\030Ke<I\159\0092\211h\201\230\194\209\171\165fc\214\135t\172]\230\"Oz\155pOv\128\206\223\237I\205\158Fc\216\242l\196\001(\184E'\239c\018\012g7\2184z\150\168\230&\019-'[\017\002\128b_'%\245iP\150\136\016J-\019\0192n\138\1288Ilj\175.\217P\228\224.Dj\152\001j\129v\001\001\165CC\154\225\142aH\"$\016\205\206\136\140#\155\232\129\023\192i\157\163%{sn\176A\176\253i\015\184\205y\156\242-I\025\168\150r\182\176I\166\217\136\168\133W\029\013[:\217'z\144\185\224g\235z\164R^\131ao]9\205\205\212\130\192M\229P\190\180\236\251\230\162\024l\149\029r\197\183\010\254\171\254\027D\191\147\238\020;Q\142\218X\221\029\224\160\250\211m\254F[\236\017\195\207$\0297\018\206\134\165\205\018\141\141\141\141\141\028\131\"M1\251\003\151\213\028?\205qp_\170\008F\006\131#c\019\031\200\193\139}\158\204\015\006\155\1625a{\019\176\223\031\195o\193\183\212\192\245\201\198\158\153\1462\240\030R\165\172N\248{yGV\154\185m\179\175impI\128\010\130\173\178\136\136\137\009\009\001^a\155\251\251\220\135\218\209\243o\007\178~\144\021\022s\243V\175t`\014\170\001T\239t\156}\215M\001\211\228\026C\222B\209\028\165\019\133bW\217\236\171P;\166:\144\138\188+\251\143\213\031\199\140'\175{\189]\255{\243\203\247\222f\143\165\186\020z\230\185\188m\219\130\177\252o\000\221\156\140\183?UUU\187\187\187$\193D\147\206\143\248\217\006E\200\245\185\202\146\146\151\195?u\189$\246y\251\208\009\179k\230?/[\177\166P\185\235q\212O\224g'\154m\133\0038\002~\013c\239\209\152\\\010\193U\186/\007\233 \148 GJ\129\024K\197-\196'\010I\191\231\162\164?ppJ\200O\011^\247\176j\178~\162\203.\005\146A}L\016?\005\195\211\2087\016\005\186<\031f\002bb\184^\2474\232\012\166\242\191\207\005\179\214|O\182\173\177\208\189$\255\243\167\146\\\237\216%:\250\250\244\146\009\1748\147\163\217\227\254?\129\139w|\133q\174p\176\191\222z\017\030\139\217\006\243\"\224>\\B@\215\013\237\133\178v\208#o\154\146\022\153\158\251\238\138\007Ks~\018|\236\026\194\221\144 ,\131\154I\204\131\236\243\167\149L\248\147J\135\197\211\239\1327\130\137\009\224\176\000\150\017\244\226lLy\216\199\006\230\137\135\252F\224g\205\1306,\150\234Y\218\207\185S\168\173\213A\213\0293W\197\130z\232\218\001\015\247\2099\222\018\212\138R;\143\218\129\202:\213\217&&\136p\225\215\190\170zm\233\164\130\228E\008\202\186A\159\228\221\223\223\223\226\153t\222\222\222\222\014y\163\1423H\188\151\151\179\186\210\202xf\241\228\017'\129\172\174X\240\011F\008\174b H\196X\1696_Y\132\214-\210\209\197\193;\018\204eF\214[z\133J\208\160\2030\1330\208a-\156\210c\230P\181z\206:\129\129\129\225\2255\180cb\009\197\175\206\179+1\011\210\227\240y\138:A\191\243\008\204\245gN\003u`\184\250D \143\004\228\134\026k46\185DH\187\196*<\244\019\189\207\127\132\252\007T\021\176\129\190\232\141*\175\1835\026c-\182\026\188o\195\138\220N\247<\163y\165\016\172\1337\179\169\209\195\019q\205\192\233\171\198}\158\150\150\145\230TCjd\149}\150\010P3\199\158\158\158j\242\159\171\129\217\176\1327\225\223\001\230*:\244\007\223\218x_\174K\156j\012\175#\136\209\142\205\196\173\158`\\\000{\200\169\021\139E0\028&\162\157\197\217o6ss\216\013\140\238\000\193\139B\017^\\[\197\213\213\004\136\1475\247(i\131$!m\236\000\220\003\249vn\241\249)\029j\252t\139\187\030LcS\131P\018\018\012?\196]\155r\228f\031\151\129=q\028\006\173A%\204\1895\221\017\227k#FU\155\159\159\159\208\138\006L\016\162\192\009\006k#\131\173\242\210<\1720\162\182\233\168R\228\239\0233\134\243\231\155z\212q\230\031\2173~\151=#\201\226\223\019\250zJ\204\2437H\153\138\204[\1881p\251\191\018\011\241\173\169\227\213\213\218\218\216vD?\\\008\173u\201\172\205f\196\150\137 \254\196\138U\031\031\031\028`\2349\254\203\012`\244\023\023\007GGc\140\131\213\244v\134To-\1953.\226\150\243?\191\244\244\163R)UUUUU\225#5\211\165\187\198\238}|\170\233\179g\163*\251q\249\224J\143T\255\128\129\207\210\189\129'\175\201r\214\221]\188;\250\243\220\230\1845L\0064\252\240\185\213q\244\245\246\161\238\170N\169!\163\227\227\227\227\217\0030\160\150ef\135\186\212\150\200\201X\010(\131\146\247*\248\200\158\199\014\208@\166\182\225H\221\230\186\006\012\143\0257;u\2222F\241R\002M\0280\009\147]\191\158\194\128\189\011a\200;\225\026\232\219X\249i\0178D\010w\221\239b\204\243\2343\1774)\0104\179\137\008\027\178O\155T2$\248Wh\151\183i\2273\227\229\132\223_\133\184\004\233\154\154\158\150\157\235\004\182o\231\197\229\132'q\194\182^\167\014\014\239,\020\143\008\197\0314\239>\027\146\009\197x\160\216'\211Tp\027\234h\132\195\195\236\241\024\235\219\031\007\008\177A\131LX\203\195u\233\017\185\128\231\230\180G\207\199#!\149\204d\168U\013v\129\141G`\177\175z**\186\206\245C:\205\196\234jSS<\178\249\211\252u\247\249\246@\220\232\159\028(.\163\231\199\224g\235\233\233\207\132\191:\191\005[~\140h(b\163U\021n%q\197\010\146B\200 \248\017\199\001\012\234d\147.erC6!\007\252h\021\152a@\144\006\024\234l\130\195M5\159\162d\199\\d\015\164\248a\246\249H\141cV\180\179bbbbb{\026\006i\202\216\197D\151f\219\139A\006bF\223\003\004TZl\009TR\010|\237s\205\146\213\160eq\015J\154\017O\008\232BtG\214\228\140\226\168\018L*Bpa\164r\206\172\172\140\140\140zYZ\237\004(3Tf\209GeT1l%]\012\236\028\131\003\003V\004\150\224\177\164\200\241\197\197\198~~\207B\227e\224\147\004\205\131(\175\129\025\020\223\129\005^e\023\206\154V\188\195\188\186\186\152\247 \223\215\213\249\186\233O\163\150\186\144\167\0282x\163Y\171n\2213\019\234\150E\224a\165\226\005\030\242\242!\241O\009[\218\156\028B\196\015\240\150\225\022\173\251\002]t\228<\254\138\13732\159\231\250z\159\132}<\2356\195H\234\248\144\174\031\226\214\138\131\159y\175\141\169\148x\141\005c\024\192\130\183\023/,&\030{\187\019\148XA\171\0309:.Yw\251`8k%\014\130G\202\001{\160O\250\229,{\249t\247qS\007\186\182\138\196J\0036\133\135 `c\141qC9\141\156\226\227\151\161\239\131\029\138\137M\023\200T\244jii\243\253=\177]\198\244ji\"\148\178@\"\192\231H\\\230\219$\142kI\214\186\172\252\252\226\253\212\179\166\221\239\1467\240r'h:\140\229\135\250\150\171\249\153\2146\225\254\206\022\030\022\127\153\145\170\191k\185[\182\167\213\146{S)'7Uv|QiO\192/C\187D\134CE\001}\166\159\160\155\004\132\024\185\193u\143\198\226\012lU\162\148\248\024\21170\176\175!V\159^\002\167mI\2390?\026>\195CD.UZH\204AGR\214^\163\154C6@%2\144J\007\149J\162\140>\128\150af\157\240\251\1933\011\153\197\228\180\195+\00873Y&~\019\199zZ%e\241\170\240~\154\010\025\249-\2333\244\247\0056&\191\157]x\147\171\171\171\240|)\247\239\239\220\220M\161\158\180.L[sVt|\184\154\128'\026KwQ\246\143\164T\140\161m\214\2535\005\029\189\224H\157Q\213\023\185\192\198\230\230\239\170Obl[u\195\195\213n\127v\244\018fw\208\001%\145\031\218\235\249\194\157!\142\192\166\203\148\206T\129\201|\213-\015\194\2439\017\190o)\018\255\194BBB222.H\006\006X\174O{\006Q/\133\167\160aOf\146\006g]\007\187\007=\252\255}Su\139`\172\191\206TE\241_\164B2\245\222]\216\155\144 \0062\011\249\154\207\018\2401\014\175\175\175\175\175\225\225\165\175\022$*\173\161\161\161\161\147\157n\131Z%\226\136\247\030\204\016+6ta\222\140\245d\254bqX\206dOlZL\184\159p\1372\191\177+\008g\186\224\022%\199\168L\013\021\000\197]\159q\028\027\002\130\130AB\164s5x\140\249&\245\016io\192\230\143#\206W\172#Z\135\196>+\172\005\231!\217\253\172\180L\208\028\140Q6\152\029\167=\180\192:6'\141\140(#\149D\009M\188\202\171\231\175\251pFQ\209^S\005\001o\253\013\150W\195V\022\021\\]\255\251\\\234\227t0\154\221\146\188E\192\189\247\018\182uR\232ms\221\0118\194\203\027'\209\230\205c6\172\242\241\135\006\223O;\219\127\231$\009\131\008\243w/\217\23860\016\252\220\1579\022\248\214\219\1293H\230\021n\216*^\016\210w\254/\236\242\195\247pMP\250p9%\0096\225:\201\029\238!\147\022\139\135\148\019\240\149\029D\193\161>\005\024\187#\167\237mnK\227\198:\254\131ge\"oi-\206$Y\028\029\195\186\022e\029\197:\176\020\206\191\162\251\168\2372rrx\208\193\027\146\235\243\154\159pRv\248\006\216s\003j\152z\217\162k\022{\250\214\030\012\020\230\183\030k:7\226g\028_\202H\249\226c\012\172Eq\220\030\251\144\225b\249u\013\250\200\175\199\184\146\139-o\181\027\027EP\205\195\215\233\202\211\187\241\232\232\232g\135{\235\143\162\162\013,|&\230T\132\134E\004\199w\012\244?\142\245[h\146\149n\129k\158sb\198T\218\170-\\=T\161\128\141\167d\189\142{t\189s\131\131\131\135\135\134k\247\018=\141\156D\212\219\002\186\181\242\155[b\252\229g\\0\003\216\021\131\254\181x\020\148\249\013\185\185/f1\1587L\204\197\006\143DV\225n\010\236!\008\134U:R=\15277799X\161\239A\015\230\205;\023u\024\211K\201r\012\157\012:\238\145\247\197\199\022\129\026O/\220\157\253\142\167\175\132\210\013\169/\183\134\148\232\204;\181l\153\197\2236\189`\030\151\243\178j\249\190\132\204\133l!t\209!!+\204\238\197t\155D\157\181>\138\244\160\230o~\162\226~\196!\253\250\020\138E\182\178\204\198\210U\176A\150:ey\2510t\223\134!d\139vL\"1111/k\176l\147\134\138\155\181\242|\153-\209\008\171\198\128\177b\218\156\017r\009\136\136\142\1524\215\145\150T|\218n\253\173>\167\204y\013\218\153\136\216\030K1\173\206\237\165\156xg\215\215\212T\200H\213\010\247\155\022\232\007xr\026\220\169*\198\195\203\205\225\189\231\235\209\028\012\"\151L!\219)\212\177\008\249ur*$\022\017?i\189\147g0\160\002W\163\1962\244NHn\241\175i\147\240\030y\167S\237\183r\031K^\250D\235\006[3\206\140:\154\154\1494\236|(?\025\194A\145Y\015tY~P\182\157P\005\136\211P\248\2208@<\228\239\174N\198\145*\146\146F+NGX\203i\241*\147K\159\187KYa\206,d>\166V\029Y\191\128\239\181\237,\218\021\236\013f\254\177\201\144&\180\004fj(\175\254\128'\154\030\138\147\154\174\188FM\228\1342\244\245$\226\2214\017\2546\181\230}43{\225\001x\247\152T\0249\007\161\171\224\231\196\181'\232\206f\129\162\176\160\157\155b\230<\184^]x7\187\172\171\186\186?\192\169\217Y\151\023\217}\213\229o\246\159\172\244R\1323\208\154\174\150\190\224\0260bO\176&_`\211UK\028\213\218\012c\252\173\003\146\026\2034\190\254\011\145\188\1548\246\013\181>\015\191\222\1455:\210%J\029\210<'\018\131\003\021\129\024\239\028\243ZZ |\211\140:\127\198_\014.\216\227\014\214\013D\161\024\014\001\159\"\162\161\173\127\136\246\008\194\134\127\003\024\233\223\246\178\143\1279GQr~\242l}`oo\183\200\207\1752\217\185\130o\153\137\137\137\137\130\185\193\001\136ib\130efW\149:\011N\171\156\215$\163zC\195A\198[>\009\204\254D\159\201P\233\006\128\154Q\134\206\141\028\160kM\179.\147\158Ec\208\131G.S\212\225\153\153\153\153\160\233\030\221\206\212\192Y44466\130\021ZC\144-X\017\1808\149\138d\210@\029\022\016\001\1747\023\227=^\005V\170~\155\133\154\217\130\001W\026G)S\140\157\180s\021\212\135\008\237T\185\225\140\2270a\1696\004\167\142\236\175\011c\234\131\218.\014\222\175\168ak\025\028jg\025\200\200\0148-\000\186\255q^\188\206\132\140^n\175\023\153MF\006\028\028/\153\195\212C)\240\228\\\027\219\180\141\228X\133\011\140\007\224\174@g'\022\190\0085\024\138+(k\128\159\007\232\027^\029\197\174\005\\\240\000\216\128\237\022l)\131\195;::b\162\142\192,n\143\151EEV\195B\163b\211q\184\008\195\254\128-\006\145\255^fc=\226\176\153\130\198\145#\020\1566\023F\242\159\160\235p{)\177\212\0215\215\022\1785k\031\017\181i[\250E\175\248\131Y\222G)\211\127\254U\142\237t\184:\139w\165\029\142\157\156\227w\147\229H\209\1344\197\157\132\025\163\025\021\007;\030\225K\134\187o\222\132L\031\194S\1676\246\147\161\192\191Si9\014\140d32\201\209P\191,\132\186\176\019\128\1457r\228X\012\1614\030\244\228/\223\238\232Ky\160\143\018\137\186\246~\190\170\190\021G\176\235\226\027\240J\210\1786\029%vT&\194\236B7\190t\013\210\008\202j\029\007\192\150\169c\130\254\017\137\213\132@\201l\248i\130\153\141N\241b\168\012\003\244;g\000y\005H\027\183h\189\246\162.\217\245\2035f\199\1685\183\187Q\185\169\129\182j\006H\149h\009\174\2470\193\181{\237\179d\001N6 >>>7;V\214\214\193\019\196\018a\240\238\215\216\177\005c\233\207\201\231\021z)\251\178m\248\213\219\253n\213NM<\141\231\009\161\216\206#XR\177\160\238Y\159\174\224\231\011\192\233D\149A\017\20598113\028\191\1466\174\201\12755ECC\156K\008\203\204\152\236R\013\161\0186+\236\216F\199Rg\254]_\218\135\197\015\201\234Vi\159\168\149\140xfMe\129\013@{;N\172Z\011\194\131\138^\021\179\016_\181\137\172\217\182w\012u}\024}\197\153\013rN\234\177Ph\165\208^3\165R\205\150I\239\026o\197\213\002\239\155*e\129\031\172 [zz\216\201\217\2220\001\164\189ffhR\209\216\149?\204%\236\004\150\135\006\005\003b\005s\211{\213s\212a\157#Q\140g\022f\191i\158\157\197\230\202\"9e\169\214\239\004\255+\152\144\142d\164\164\142\001\198\137aau=&\146\013\229#\166D\134Tx_g\219\213d\005'\2233\2482skm\142'\027\2377C\233\230I\017\201;\128\031\173PRPPP\156\250\031\219\219\195\214o\203u\194_\237o\239E\"i\129I\025=\154\001\140\162\206oP\236^ea\227\214\146\213\243\242\002A\"v\012 &\206\168\232\232\237\\\"1 \207\207\202\"\222\222\230\230\230\196\206\007\013.x\129\007\011\142\212\216\210\249\019\161/$\216\146\131\219\195'\246\021\252z\173\145\136\1630\246\178\157F\232\191\131\138\191\131\015c!\127\006\188K\166Q\227`|7:vq\011\009\009\009\009T\205=\175\150\161\140\145\153\137&\250\019\239(\160\008\008\008\008$\020\009\232\156,\251\027N\128\209h/#c\145\2184\182j\146\198\021\175\246\145\030\\\166\158\195\179\168\130\2283X\188\007\190\027Q&oNH\142\131\148+(\018\003\022c\244\253\214\168\182\182\182\198\198\022\200X\1771\203Q\156\128S\185\173\161\137o<\\\232-\232)\131\006[#\184\156\\\205\214&\199\236\221\250n\233\002\194\193\133\007\131\011i\156\152\003\180\142\188)\179-~\134\000;\030\166\231\196\013\017\145\144\222\005\159\181=\240\022x\190\031\127))\254\013\020\009\011\011%}\225\213\240B\194k\176\247}a\240\248\189\028\186Z\188\007\153\231\176\175\222^\241\163Q@\160\207Jw&h\239\143a\241\166_\193}\247\134\135\160\012\209\135:\012\229&\012xE{q\013\244\204\129\207(\222\168N#\193p\015\151\194L\185\195\194\127'\166'\133\154\137\254#\169\188n\198\":\"\250u:\192O\004\196CDJ\029\228\145D+\004\217\214\195}\208\224\0171\204\176\176\131\180C\0318\150Q\009\141-\184\023S\220z\229X\1489\216\217W[\029&3\241\136\022\005A\144\222\213\147j\131\233\016\222P1\161TW\168}\013\132\207u\148\127\254\200cK\129\184\239\\\194'\216g\251\184\016\142Z\211\226\186\142\253\152\002\150\132\142\0027\214_n\157\0236*+\235\235\235\204\020\172p\1313\005\2439D\242\158\025\232\240\155\009\217|7\151j\171\022<\205\227\005\168k3\179\182\163\012tG\236T/\020\178\211\000\146\130\159w\197EE\135\178\200~?\252\232\232\233\233\233\233\233\004\\f\191\231\198h\214\127=\140\151\198?X\002\128\023\001\"\161\251\165\143|2}\216\218\025\023\212\173\143\009:d\2326\145L!S7(rS\209a1=\214\150\2271X9E\030=====\205\149\169l$\198\009y\202\015\178\156\150j\188\135d^\024\243\232\005 \010 \127\249\133\194\173{F\222`][\254\2372\202\133\166\133\135_\227\147k\243*\013\137\\\254\210Dd\241\194\221\181Jg\"\"\"\"\027\219Gu\132\211\030\164XSG\154llmmm\139\178\246m\208H\230n\229\139\150\142\230\209\142\132d\246\005\168*\005\241\168\012,\222\240)\178\231\137-f\178\196Z\000\235\189\185E\031\156\168\197\221\235\204H\156\155\199\131\150\254\012D\176\249\231\005\226\219^\156\028\031No\209\031\173\218\235\192\230\243\133\206\015\178\212R\013e\197\197\198\193\234\234\165q\016vj.\002\150\219\236\167\214:~\177\018\226\221ED\148H$\197j\232\250\133\210\025\242\149\009\141\180\195\025\231\135\008\175\003\214\160~]\140|Skb\1469\189Z[\151hP9v\195\1578\255\135\023\240;\190\133\247E\187\007\004+\018\185 b\135p\138H\158w\017\140\144\211\219\165\029Uy\138RRQ\246\192\255\193\013:\216\228\239\021,\159\166\166\190m\013\210\178\221Z\219v\127E\202\007\202?\208[\202{\180(\197O!\152\000\016S\187\213\157X\156r\027\173-\166+-\231\248\203\166\187jh\002\001\026,;\131\191\027\149Cv\010\199X\023\242g \219Gz\179\025|S\236\020U\176QNLC\220\220\134u\195Qf\026F\224Ll\002\162\140\245\011b\243,U\253\223\214\154\151w\180\243)U\252p:sp\007K\171\217\217\236\152g\190k\028&\133\138\213\235\200T] \1784\183\220\183\234\206\154\018t%\143\217\142{\203\190\230\232\1813\222w[\127\216\139\172\238A\229[\147d\165\003\000\007)K\\\214\213\194/~\143\128\155\145?z\212K\020B'sf\245\242P\206d\166\016\144O4RTp}\224\174\151\164x\184\184\171\206\227\008\190\011Z2\192\241f\244!~\011>ZK\144\147*\207C\244a\193I7\214\175#\191`\179\159\185\189\163\162.\147\1802j1\150\240\179_.\206\024\197H\180\010D\147\254\012\194\236\170.\235\228\191\023'(\232\173\156%\155\169\030\189\156{@F\019_\202\192W\195Q\129x\006?;\147r\176\135\245\171]G\203\239\151\219\227\004x\201\148\244\187\198\004^\182dj\221\171y\246c\193\247a\190\212y)\223\234\220a\239\239\239\152)\128((\013\205S\153\247\180VGn\206\027\200V\171b[\217\206\019\007\233\218\022\239)V\242\147{\149=\160\015\241i\190\160P\1482\003\255\162\006K~\137\217HP\136\225\198\190'\171I\031`Yspa\237e4\214\244\208\013\198\011\007\017\016\212\248\227F\223\190\011F\179i\163\030\185J\128\208Q\167f?~=\223U\252\140+H\136\136\136\135\006\167\150\2300\011\173\132#\238\215\135\191t\227\149\029$\1550\134\241\160\133Nq\254\168\132\253$B\214\211Lpssss/\238\218 \202\242\241\184\142S\004p\002_~r\178\229\229\248pV\018\249\238i\228Y\169\031\203q\226=\166\009\173\006\216\030^%F~\206\012\170\211#\249\166\218\235\002(\193x<j\228~\000[\"o\136\179U\238\148gU\016\240\245\244(\215?\000\255\226\154\008\011=\150\022f3\240\143\246\180u\177r\130\201\210d\168\022\217\212\011I\221o\000%\218\018\229\169>\198\183q3\187\201\140\233\196\158O,\218\192\233\188\246\193w\028\239\165\015:\189\210\216\007\023c\138\006\029\229\026.\150[\155\167\133RM4\232\245\141<\021\194q\254\135g\202x.\023^\025\129\219\168w\216\153IsTE\000In\1515U :\208\141\179\189\220\225\159\191n~~\132\160 \247\009%\173\2337nP\187g\004\220\17934\151\009*\014!h\142\012\159\151\150S\163\182\204c\141?\192\1633\178\215\006\025z.Z\236\241\202\170\23518\242\231J\147Y\189\148\135\168\152\206\213\219\233\2359A\022\171\204\157,\135\152N:\017\184\134\013\172X\132(^{\238!\142s+Ms\227\144o?x\213\175\227MfO0\208xHCv\249\209\220d\135g\210i?\138\131\194\205\132;\210\180\150\018z8\254R\216\012\219\031\194\228\205m\247\215N^\222\240HWYF\194F\178\207\128\162\028\028\028C\172\133\1688\029\210\161\217\211AAh\157R8:\175\030e?o\220\251.\187\191[\007\247\129[p[\133\247\1312i\207t\011a\172\134S\199\172\229\218\247U\221B\248\175\175\175\175\175\219*@\151\031\158\166\149\018\190\023p\210\218$;\150\160\1662\221Q\152\205\150W\195F(\217&?y\192]\019j\030\204\022VVVU\159 \196\021q\178Oo\245wt\031\241\229\191\167\250\173vKL\023\154/1\130;\227('\169\165\232u\217\000\000\000\012\189\244H\212~^_x\031`&@W\232\127\168\214\225\161\199k\180,Q\016\164\240\130\168I\222Ns\243\136rM\175\141\142{\203\160\184OY\024<\187[$\194P\252\171\128\224\221XR\002\030b\169\225{9[<\243\242\205<\165\203\1331L\242\242\241\254\225\018\028\026\241\253=\139\203f\149\184\025\143\224\015\195\031\178d\182O\172\"~\1607\004\135\160\166\\\246F\1693\246$\005\250W\226=M\139+FD\141==\028\162~A\255\"\155\030)\160\240\009A\154p-\131\2343\"\028P5\190,\141CRM}\250{\163##\180\011\186\192\145:\224\177\250\194\\\213\162\154U\211\136\173\149\215\137(\195\136>\171\2431\000\000\008\008\008\011S:J\252\203\164\135iiiiE\128(\209\137k\184\146`\226\242!\138\211\250\140o\014srP*\214Z\202\144o\236\164\161\253\216\128\191\175-\236\205K,i\190\235\182\230\184\006\167\227y\213\198Q\194\201\201))'7\017`\180\210\189\197\191\221\237\237\237\237\134\182\232((-l\031\206\1303\248\194\220jQx\253\029C\128\025\154\203qE\024\003WY\255\235%\197\006\198Gb\228\025q\182e\226\214\006\188G\221\138\200\190\171?2\212\166\030\162n\173\005\205\130\009\255\001\210\"\177 \217\173Q?\251W\138B\221\225\220\215uv\180\147\012\220c\197\139\005FE\239`/\152\019\019\022\148\251$l@\215\255\148\249Cg\242\204%\183e\254d\011\221\1474\019\179\165\222[\244\254\191\255L\198\236\157\178K\200.2eW\131\141'e8\251s\014Z\240\155h:M6\156^W\156q\154\143\216\218z\158vO$\250\175\138'\187\132R\012\203\224k\016S\169ry\232\144\144\167?<,q\251\130\247D\135=\223#S\249\223\185\248)\229\137+\133ol\183a*Ok:%5HS\217\232Q\231\248\148\139\002\180\021| O6\1718\177\180\146\019\131\1783>]\155\030\174f\224\165u\000\003\224b\239\014\2018R\008\0139S\190\009\238\023\005Osh%\135~7$\\\2007\145(\235\028J?\228c\249\205\223\231\210\001\164\142\142\150@0k\195G\201\2013\170\170I\196\248\246\127<\149\140\228\182H\235\011\149C\129\018\173g\137\193\142\253:\145\028a\002\175\209)ui\166\165\253\189 \180\181\185\135\1595\028\242\1321\135\226\226\233\207J\138g8T\009?>\216\006F\238E\021o\022|\210\158~\131\147\150\201y{\194v\003My\023@\148\254GNg\198\014\210\179\149!=}\181\220\217/\174\253`\011\161\161\161\161\161P\185\021\162z7\219\186\186\186\186\232\031\236\174\247\174\154\222\164\199\1308\206\1439\186\2193n*H\193\199\179\181~\007\153\232)_\164?v\130\240V**\178\172K\237\186&zI\241\170\139\019$\246s0)%\243\250\254\223\027\128\1557\243H\131[[[E_\207\006\150$\236\247\247\000\200=z\215\1616\145\188\015o\142\021j\202oo\214\010=\188\173\235\171\169.Ke\015\015\015\015\015\005\023\141\171\011.\228\249\227\242\246\020\190&\225\176\197\229_\219O\199\187\216\226\202\000\024\167\207\140\024\160r\157%\170D]\\5\1829z\002\000\210\210\170\247\219\219\173N\166\161\233\022\129p\187\022\203p\023\162\182\131!\200\024gZ}kB\237}3?\235\155\004t\018\135\142\193\193\187\195\163\247\223\251+\018\009-\157\175\137\210\191\209\018\225e\245BEf-\142gg}\025W%\239\023s'\153\1398\177s\147\241BG\187\244\016\148)V\176'\218I\166\171\143*\194\193\187\227\227\1882\196\255\254.\165\006\201\164\009$\177\182)$\225n\2149\186\133\2253\203j!\212b\168\026\220\202\020\0176\202S\154\223W\238^\1540=\0228<\131\247\143\023\207\019\239\008c\184\226\213H\022\197\252||\151U\129 6\008:\223\018\131\239\145U\240b\187\158d\218\205\176\141s\226M\227\1342K\003\011wF\149\231\143\018\235\179\2233\243tB~\197.\017\215\179\156\168}V\147\187~\185\203\224\246>{\011]\203\239\215\229I\\\132\178\160W\145\248\008\162\193\245\009\133\019RQTQ\206\183\199\218\217\238\142\184\009=\163RW\131\143\231\253I\154F\239\011\236\001\235\225\212\192\181l\212)\184\180\209\169\169\159IL\004\016KMs\1622\202\010\195,~p\2395Z6\170^\201\128\172\228\158\187Rc\009\024\142\018\204\147\005t\178q\197k\022\177M\183\009\189V\243>\205;\229\178\000E\221\177\025T\140\016\001\140\254p~\132\132n\132\131\127\006\006\1550XA\016/\179\218\153\200\136\206J\165|WHnM'\019\216\153#\149\226HV\031$\218\004FF\242\241B\184h\161 \141\138t\225\205Z4s\193\168E\128\183\174\253\253\253\237\237\020\180+\233\2408H\234z\017\130\143\005\010\168\187\187\189MMp\227n\196\000\195;\194RSs\134\207\185j\182j\2239\244\198\134#[\140f\254l\162`\012\139}\016\186\249\152=M\162\216\025\171\005\169d\174d\220\010\010rb\204\185[\190s\194\026\026\026\026\218\221\179\150\024\1584\174\024\206\016i\254\177\189TZ\010\136\224)\186\010,\144\209&O\248\003\129\0253\170\201\1357\239\028\139\"'\028\150\002\153?\010>\011\241\206\212\158)\027\240ni9Pez{~\231\167>\222\177\"\165\222\232m\240+4\200\218\\\195\219\136)F\200><\027\183='\027J\145\223$\164\142\178\005\229\229&\141>+#\182\165\206\197$\205\247 \190\026s(}\214\0057\205\210NF\210<rkV\025\150\242\207F6\023\174\189\235G\184\027\219\147\160O\231\174\181\237z\187\221\248\225\239\028U]\255\203\173\151R\180D\029\136\248h\157\226\221\166l\204u\203&\150z\131Ql\215q\018u\149\207[NZ\190\016\194\188\018o\155\155Y\224w\020L\016\008i\179\138\005\243C^5\128\246\1715\190\1669\142w\169\015t\153Pg\021\152e(+5\159DAU\191\232?\169\140\129.\214]3\135\202\227\165\010\018'-W\029\159\202a\147\027\250\018\233\178\157\015:\252_\196\244E\229R\148\242\147VL\200o\247\245Ba\136\134\167\166\183\151\129\243\006\183yM\010&\012\1322\205\2229\224\211N\199\164\243\207.r\199>\236\169\014BA\186\146\161\0137\198\229\145 :6S\146\230f\015\245\250\187\182\251\150_R\129\144\001\225\236\236\236\236\236\245X@@\207\148nA\219\155\019o\139a\021\128\207J\217\176\138\194h/g\023\134~mt~\003=`\212\248y|\130D\1704kon\025\022*@\022\000,\158sP\221\023'\203\241\241\241\241\241^HB\232\148\181\142\193\219\206\002\027}|>\251\251\250zz\168\"\144\245\189}\012h\149\143kS\021\239\212q\243U\150A<\023\157R\134s\141\132\198\1786\206%\024\221\"h\178u\148\182\130@+\006\217\016\131\205\238,/\138\018\245M\157'\197\020\019\211\211\211\162\023\254\165\181\028\012\165\189\004\191\234\193\027\134\253\031f\234l\0001\249\\\194K&\235\151\228\204\142w,g\193L`\157F9\176\154\233#q\0147C/\2020\012\139\010\007\015\"+\175\026[\022G\242\205\"\199\244g\241\206\170T\194Qe\249\140\201\006lZ\141\185;T\157\238$\198J)\215\153vF\214\193*JJ)\003\186lP\179+l\1752\024&V\219O\152\218\214+\152J\231<<i\147\022mO\145\184\1987\197\030Q\003\188F$\024\212\199\003\188>\250p\208\179\202G\210\145\171\019 PQ\178\163P\163\244\201\178S\190\204\235\217\133\031P\172\"\183\147\200\237+t\170iT\008\206\159\159\008\159\003\164\022A\243\009M)\135u\153\173\150\224\212559_\154\198\161kj\026\169\169\169\169\169\169\169\134\147\137\190\161&\135\145v\199\155\012\016\000\008\230j\205\242\242\242\023D\144\181\197\234\240\213\229\205\205\205\201)\151\190\186\206\244Q-\235ghll_Zsd\148\214\183KP\007W\003\003\003\003\0031 {IF\019\141\136\136\136\200\200Q\014\027\169\169\169\161\161\191\001\212\019\218\016\167B\251+v\007\149\245$R=\232\222\148^\008\157\002\253\222\220^\166aC\185nB\254\1422\128\241\142\237\022\1592\144\228o\024\016\016\254%\194\179\227\2314:\148\168\168\168\168\168\216\154\233U\159\147IR\151\002\028\240\127\136.>\174\252\011\203\199\222V\167}\204\216v\205\127\216\137J\020\147\008r\187\016\162-+\129}\242\190X\245Y*\030\213\240WID\219\195V\022\253uW\246\027\251\147F\207&\239MC\208\187f\177\205#JL\145\149+\010w\2493\255\148\213\149\184~\138\174\189\009\199\132\223\021zD\155\250)\240\242-\238\011i\181\254&\009\212\241\208\155\131)\250\129\173\251?n_\245E\218\003\026\1755@c\233t\019X\167\134\162\197\241\220\008\002\182\152\166\149p\"\2142\172\153-\222\187iA\161\183\014\016\013q\1946\191\194\201\000\013\0197j~\138\208;;=i\189\189\207\246\228 \023\252QE\207!\191c\202\203\176\175\205\185\214\201oWg\183\224\249\021\128-\"ZZlV?d\132=o\233Kx\2542-'\165\137\240o\245\143\158\250\145L7\199\031`\136\231\138\189\133O\217\015\149\243\251\175\190\187Fx\252\174\028\133ri\007\240-\016\172h4\170\018?\203\129'\132\196\138\031!\\\0255\180BBB\130\130\194Dd&\020\023\134\2457\233\157\192\204\016\164Nn\234\0201\225\207\1943\017}xNLy\244\159\233\2098^@o\160\184kd\127\203\031\009s\136\016\016\013\187\008d/\212\221 \255\255\255\002\002\226,\011\231\231\175S\211\203\154B\007Y\174\2124\031\175\249dI\018*a=\016{%\222\233\195[x}---\223\206\171\009Jg\224\233\159\019\146zW\246$~\013Q\240y\1661\181\002\002\002\002\006\255olj\002\189\197###\227\2272\134z\137\137\203\203\203$\219\217\207\180.!\011\253\241\193;\202>p\165\178\245'IT\236\000\007\012p\203}\12846P\002r0U\010(|M\201ipy\146\152~\129\003\003\004\142\144W\248\185\128\215R\137\137\137\140\140s\129P\155\250\199k\158\213Q\019\011\2194U\012ET\207\163t\164F\157\208\146\252\253e\132L\204\150\189G\153\153\153\153\155C\240\245\188\141\139,\235\168\161KD\233\220\153\255\168\192\231q\142\150\016\229\217\230\222\216E\197Z\216\216\174\182&\167:/xy\016\201\173\031y\146&\212ke\217\248\127\011\170\248\009IX\168\014\190W\213PK\253k%\\TkJ\212\159\207^\169\031\171\000\025\011\2220w4H$\182\164\168XQYa\176\188\154\239\015\186L\015\141\181j\154\144v]\129\022\188\144T+c\018\235\168\236\130\014\192+\250\181\243\130\213\140\168B\137\254\000\228\229\252\008\149NNJ\174NNN\169S\156\202kF\241\212C\180\221\252\182\243%\170xsV\182\177\235\254\003\137\140\254\162\162\030\158\157\009}\245\2559\015\175\222 X\207\252\235l\1516\165\226\146n&\211\007y\153}\146w\011\252\200\179c\148\213\194\141\160^\001}\239\011\160\133zd\178\233B\201\238\250\236\183_^7El\168\002n\135\189\002\160is\222p\243<\249\249\244\244\244D+\027\014\2485\151\142\001\160^\237\185\199F:\165g\128\245\005\211\249\213?\178\133\251\166\140\016\1327\183<\203\220\135\143\213\029\031\195\2008\151/_\223\223\228\184\179\157\005\210T\009H\179w\217\194\183\144\002\014QG\250e,$\247&p\214\231\016\179&\145\235\179/\251\188\1968\249\169~~~y\249\211\139am\003\163\203\194\196\230\244\144\019I\219[1K\197\238!\193\193\183\251\170\017m\208\015H\166\164k\003\027[\199g\152\183H\142\001\221\015\213n\221,\138\020\190\226J\176\026\166\176\026\026\026\026\026\144\0162\162\207\154\237\023v\200\1335F\149S\193H\190\247_\143S_`wY\007\206\208\201\163\234\203)\132@/\189\137P(\025\232\195\199\248\250\\\182\157#P\191\235\201 \198\012\240)))))-\131\143\016\222\235\208\016\167\251\002\168\247\157\2114AD\191\217\176\151\131\002\192\225]\161N\227L{\220\242\009\221 R\217\178\229J$\213\129A\193B\143xc\215x\167\250\194+S\243X\020;\006LLLL?(u\020\243B\255\193\153\186Y\155...\174\174\029\227\194\178\178\173\156\216\249\201B\161\176\172\145\143y\157\175\177I\236\181u\1290\000T\184po\219\147\237\185zTX\005\007\188\235%:\030\231X+\026T\216\178\155\168Wi\195\193%\173\207\221&\146\249\233\208\253\007\012\027\2533\147\001\171\030W"
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
		T:Toggle(false)
		task["\004\138dG"](6);
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
Groupboxes.MiscFun:AddButton({
	["Text"] = "Death Farm",
	["Tooltip"] = "Execute this in the hotel at a start of run, either use it from here or execute the actual script",
	["Callback"] = function()
		(loadstring(
			game:HttpGet(
				"https://raw.githubusercontent.com/doram44/cheesy/refs/heads/main/stuff/deathfarm.lua"
			)
		))()
	end,
})
Groupboxes.MiscFun:AddToggle(
	"OrbitItems",
	{
		["Text"] = "Orbit Items",
		["Default"] = false,
		["Tooltip"] = "Items that you have dropped will spin around you on the floor",
		["DisabledTooltip"] = "This feature doesn't work in this floor",
	}
)
Groupboxes.MiscFun:AddSlider(
	"OrbitYOffset",
	{
		["Text"] = "Orbit Y Offset",
		["Min"] = 0,
		["Max"] = 2,
		["Default"] = 2,
		["Rounding"] = 1,
		["Tooltip"] = "The Y position of the item orbit",
	}
)
Groupboxes.MiscFun:AddSlider(
	"OrbitSpeed",
	{
		["Text"] = "Orbit Speed",
		["Min"] = 2,
		["Max"] = 5,
		["Default"] = 2,
		["Rounding"] = 1,
		["Tooltip"] = "The speed of the item orbit",
	}
)
OrbitConn = nil
local function startOrbitItems()
	if OrbitConn then
		OrbitConn:Disconnect()
		OrbitConn = nil
	end
	if not p.OrbitItems.Value then
		return
	end
	if not b or not u then
		return
	end
	OrbitConn = i.Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if not p.OrbitItems.Value or not b or not u then
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
				local F = P * l.OrbitSpeed["\030\006\148\194\210"] + ((o / k) * math.pi) * 2
				local A = Vector3.new(math.cos(F) * w, -l.OrbitYOffset.Value, math.sin(F) * w)
				T:PivotTo(CFrame.new(u.Position + A))
			end
		end
	end)
end
p.OrbitItems:OnChanged(startOrbitItems)
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
	if not p.BringItems.Value then
		return
	end
	local o = 0
	BringItemsConn = i.Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if not p.BringItems.Value then
			return
		end
		if CurrentFloor == "Fools" then
			return
		end
		if tick() < (ScrapDroppedItemsHoldUntil or 0) then
			clearBringItemsForces()
			return
		end
		local T = b or a.Character
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
Groupboxes.MiscFun:AddToggle(
	"BringItems",
	{
		["Text"] = "Bring Items",
		["Default"] = false,
		["Tooltip"] = "Floats all dropped items in front of your mouse",
	}
)
p.BringItems:OnChanged(SetupBringItems)
Groupboxes["{\139A,\168\131\151"]:AddToggle(
	"TwerkDance",
	{
		["Text"] = "Twerk",
		["Default"] = false,
		["Tooltip"] = "Plays the mspaint twerking animation (i think)",
	}
)
p.TwerkDance:OnChanged(function(o)
	local T = a.Character
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
Functions =
	{ ["FirePrompt"] = nil, ["GetLibraryCode"] = nil, ["HasItem"] = nil, ["HandleHidingTransparency"] = nil }
Connections = {}
if l.HotelAutoWalkMethod then
	l.HotelAutoWalkMethod:OnChanged(function()
		if not p.HotelAutoWalk or not p.HotelAutoWalk.Value then
			return
		end
		L.HotelAutoWalkActive = false
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
	a.Character
	and (a.Character:FindFirstChild("HumanoidRootPart") and a.Character:FindFirstChild("Collision"))
then
end
Groupboxes.Character = rT.Main:AddLeftGroupbox("Character")
Groupboxes.Other = rT.Main:AddRightGroupbox("Other")
Groupboxes.SpamBuy = rT.Exploits:AddLeftGroupbox("Pre-Run")
Groupboxes.SpamBuy:AddButton({
	["Text"] = "Buy Items",
	["DisabledTooltip"] = "This feature doesn't work in this floor",
	["Callback"] = function()
		task.spawn(function()
			local o = (game:GetService("ReplicatedStorage")).RemotesFolder:FindFirstChild("PreRunShop")
			if not o then
				return
			end
			local T = l.SpamBuyItems.Value
			local k = {}
			if T then
				for o, T in pairs(T) do
					table.insert(k, o)
				end
			end
			if #k > 0 then
				local T = l.SpamBuyCount.Value
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
})
Groupboxes.SpamBuy:AddSlider(
	"SpamBuyCount",
	{
		["Text"] = "Purchase Count",
		["Min"] = 1,
		["Max"] = 6,
		["Default"] = 3,
		["Rounding"] = 0,
		["Compact"] = true,
		["DisabledTooltip"] = "This feature doesn't work in this floor",
	}
)
Groupboxes.SpamBuy:AddDropdown(
	"SpamBuyItems",
	{
		["Text"] = "Items to Buy",
		["Values"] = { "Lockpick", "Lighter", "Flashlight", "Vitamins", "Crucifix", "Skeleton Key" },
		["Multi"] = true,
		["AllowNull"] = true,
		["DisabledTooltip"] = "This feature doesn't work in this floor",
	}
)
Groupboxes.SpamBuy:AddToggle(
	"ShowCrucifix",
	{
		["Text"] = "Show Crucifix",
		["Default"] = false,
		["Tooltip"] = "Shows/hides the crucifix in the item shop",
		["DisabledTooltip"] = "This feature doesn't work in this floor",
	}
)
p.ShowCrucifix:OnChanged(function(o)
	local T = z()
	if T ~= "OldHotel" then
		return
	end
	local k = a
		and (
			a.PlayerGui
			and (
				a.PlayerGui:FindFirstChild("MainUI")
				and (
					a.PlayerGui.MainUI:FindFirstChild("ItemShop")
					and (
						a.PlayerGui.MainUI.ItemShop:FindFirstChild("Items")
						and a.PlayerGui.MainUI.ItemShop.Items:FindFirstChild("ItemShop_Crucifix")
					)
				)
			)
		)
	if k then
		k.Visible = o
	end
end)
Groupboxes.SpamBuy:AddToggle(
	"ShowSkeletonKey",
	{
		["Text"] = "Show Skeleton Key",
		["Default"] = false,
		["Tooltip"] = "Shows/hides the skeleton key in the item shop",
		["DisabledTooltip"] = "This feature doesn't work in this floor",
	}
)
p.ShowSkeletonKey:OnChanged(function(o)
	local T = z()
	if T ~= "OldHotel" then
		return
	end
	local k = a
		and (
			a.PlayerGui
			and (
				a.PlayerGui:FindFirstChild("MainUI")
				and (
					a.PlayerGui.MainUI:FindFirstChild("ItemShop")
					and (
						a.PlayerGui.MainUI.ItemShop:FindFirstChild("Items")
						and a.PlayerGui.MainUI.ItemShop.Items:FindFirstChild("ItemShop_Skeleton Key")
					)
				)
			)
		)
	if k then
		k.Visible = o
	end
end)
Groupboxes.Prompts = rT.Exploits:AddLeftGroupbox("Prompts")
Groupboxes.Prompts:AddToggle(
	"InstantInteract",
	{
		["Text"] = "Instant Interact",
		["Default"] = false,
		["Tooltip"] = "*\142\134B\212\136\164\179\007\251\248\147g`b$\157\0168\029\008\140\000\128\008\173\022\022\169\164R\2196\225\007A\149\\2\250\195\185\224\210]\207\127?`",
	}
)
Groupboxes.Prompts:AddToggle(
	"PromptClip",
	{ ["Text"] = "Prompt Clip", ["Default"] = false, ["Tooltip"] = "Allows you to interact through walls" }
)
Groupboxes.Prompts:AddToggle(
	"PromptReach",
	{
		["Text"] = "Prompt Reach",
		["Default"] = false,
		["Tooltip"] = "Increases the range of all proximity prompts",
	}
)
Groupboxes.Prompts:AddSlider(
	"PromptRange",
	{
		["Text"] = "Prompt Range",
		["Min"] = 1,
		["Max"] = 2,
		["Default"] = 1,
		["Rounding"] = 1,
		["Compact"] = true,
	}
)
_TrackedPrompts = {}
l.PromptRange:OnChanged(function(o)
	if p.PromptReach.Value then
		for T, k in ipairs(_TrackedPrompts) do
			k.MaxActivationDistance = k:GetAttribute("MaxActivationDistance_Old") * o
		end
	end
end)
Groupboxes.Exploits = rT.Exploits:AddLeftGroupbox("Exploits")
Groupboxes.Exploits:AddToggle(
	"InfiniteItemsToggle",
	{
		["Text"] = "Infinite Items",
		["Default"] = false,
		["Tooltip"] = "Allows you to use lockpicks, shears, skeleton keys, and multitools without draining the usage",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
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
		P = b:FindFirstChild(T)
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
				and (
					o["\214\007\180\180\0054"].Parent.Name == "Locker_Small_Locked"
					and o.Name == "ActivateEventPrompt"
				)
			)
		)
	if A then
		if l.AutoInteractIgnoreList.Value.Locks then
			return
		end
		local o = {
			"Key",
			"Generato\204\254\235\168c",
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
			and (not Functions["\223\006T\150\006#\224"]("Shears", true) and not Functions.HasItem(
				"Multitool",
				true
			))
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
	if P and (TableFind(k, P.Name) and (L.UseAnimation and L.UseAnimationBreak)) then
		L.UseAnimation:Stop()
		L.UseAnimationBreak:Stop()
		L.UseAnimationBreak:Play()
		if P.Name == "Shears" then
			((P:WaitForChild("Hand\254\177")):WaitForChild("sound_prompt")):Play()
		end
	end
	local d = b:FindFirstChildOfClass("Tool")
	local C = d and FT[d.Name]
	if
		d
		and (
			C
			and (
				p.InfiniteItemsToggle.Value
				and (
					{ ["Lockpicks"] = true, ["Skeleton Key"] = true, ["Shears"] = true, ["Multitool"] = true }
				)[C]
			)
		)
	then
		((workspace:FindFirstChild("Drops"))).ChildAdded:Once(function(T)
			local k = T:FindFirstChild("ModulePrompt")
			local P = FakePrompts[o]
			Functions.FirePrompt(k)
			Functions.FirePrompt(P)
		end)
		b.ChildAdded:Once(function(o)
			if o.Name == "Shears" then
				((o:WaitForChild("Handle")):WaitForChild("sound_promptend")):Play()
			end
		end)
		Z.DropItem:FireServer(d)
	else
		local T = FakePrompts[o]
		Functions.FirePrompt(T)
	end
end)
Groupboxes.Exploits:AddToggle(
	"InfiniteCrucifix",
	{
		["Text"] = "Infinite Crucifix",
		["Default"] = false,
		["Tooltip"] = "Performs a glitch that doesn't use up your crucifix when used on a rushlike entity (rush, ambush, a60, a120, blitz), however, this is inconsistent",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.Exploits:AddToggle(
	"AutoHeartbeatMinigame",
	{
		["Text"] = "Win Heartbeat Minigame",
		["Default"] = false,
		["Tooltip"] = "Automatically passes the heartbeat minigame when it starts",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.Exploits:AddToggle(
	"CrouchSpoof",
	{
		["Text"] = "Crouch Spoof",
		["Default"] = false,
		["Tooltip"] = "Always makes the game think you are crouching",
		["Disabled"] = not hasHookMeta,
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.Exploits:AddButton({
	["Text"] = "Fake Revive",
	["Tooltip"] = "This doesnt always work, and interacting with a bandage will disable it, and will not be able to enable it back. Sometimes you will not be able to fully finish the run, but you can still go through doors/finish",
	["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	["Callback"] = function()
		task.spawn(function()
			local o = workspace.Gravity
			local k
			local function P()
				local T = a.Character and a.Character:FindFirstChild("Humanoid")
					or a.Character:WaitForChild("Humanoid")
				if k then
					k:Disconnect()
				end
				k = T.Died:Connect(function()
					task.delay(0.5, function()
						workspace.Gravity = 0
						local T = a.Character
						if not T then
							return
						end
						local P = T:FindFirstChild("Humanoid")
						local w = T:FindFirstChild("HumanoidRootPart")
						if not P or not w then
							return
						end
						local F = a:FindFirstChild("PlayerGui")
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
			local w = a:GetAttribute("CurrentRoom")
				or (
					j:FindFirstChild("GameData")
					and (j.GameData:FindFirstChild("LatestRoom") and j.GameData.LatestRoom.Value)
				)
			if w and w >= 1 then
				P()
				a.CharacterAdded:Connect(function()
					P()
				end)
				task.wait(1)
				if Executor.replicatesignal then
					Executor.replicatesignal(a.kill)
				elseif Z and Z:FindFirstChild("Underwater") then
					Z.Underwater:FireServer(true)
				else
					a.Character.Humanoid.Health = 0
				end
				task.wait(1);
				((game:GetService("CoreGui")):FindFirstChild("RobloxGui")).Backpack.Visible = true
				a:SetAttribute("Alive", true)
				a:SetAttribute("FakeDeath", true)
				T:Notify({ ["Title"] = "Pick up a bandage to restore all interactions", ["Time"] = 5 })
			end
		end)
	end,
})
local function configureProximityPrompt(o)
	if not o:GetAttribute("HoldDuration_Old") then
		o:SetAttribute("HoldDuration_Old", o.HoldDuration)
		o:SetAttribute("RequiresLineOfSight_Old", o.RequiresLineOfSight)
		o:SetAttribute("MaxActivationDistance_Old", o.MaxActivationDistance)
	end
	if p.InstantInteract and p.InstantInteract.Value then
		o.HoldDuration = 0
	end
	if p.PromptClip and p.PromptClip.Value then
		o.RequiresLineOfSight = false
	end
	if p.PromptReach and (p.PromptReach.Value and l.PromptRange) then
		o.MaxActivationDistance = o:GetAttribute("MaxActivationDistance_Old") * l.PromptRange.Value
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
	if Executor.fireproximityprompt and (p.InfiniteItemsToggle and p.InfiniteItemsToggle.Value) then
		local T = a:GetAttribute("CurrentFloor") or ""
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
				T:SetAttribute(
					"MaxActivationDistance_Old",
					o:GetAttribute("MaxActivatio\236*\027\232\238q\239\175\177\171\155x\139")
				)
				T.HoldDuration = o.HoldDuration
				T.RequiresLineOfSight = o.RequiresLineOfSight
				T.MaxActivationDistance = o.MaxActivationDistance
				if p.InstantInteract.Value then
					T.HoldDuration = 0
				end
				if p.PromptClip.Value then
					T.RequiresLineOfSight = false
				end
				T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old") * l.PromptRange.Value
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
p.InstantInteract:OnChanged(function()
	for o, T in ipairs(_TrackedPrompts) do
		T.HoldDuration = p.InstantInteract.Value and 0 or T:GetAttribute("HoldDuration_Old")
	end
end)
p.PromptClip:OnChanged(function()
	for o, T in ipairs(_TrackedPrompts) do
		if p.PromptClip.Value then
			T.RequiresLineOfSight = false
		else
			T.RequiresLineOfSight = T:GetAttribute("RequiresLineOfSight_Old")
		end
	end
end)
p.PromptReach:OnChanged(function()
	for o, T in ipairs(_TrackedPrompts) do
		if p.PromptReach.Value then
			T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old") * l.PromptRange.Value
		else
			T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old")
		end
	end
end)
l.PromptRange:OnChanged(function()
	if p.PromptReach.Value then
		for o, T in ipairs(_TrackedPrompts) do
			T.MaxActivationDistance = T:GetAttribute("MaxActivationDistance_Old") * l.PromptRange.Value
		end
	end
end)
Groupboxes.Exploits_BypassBox = rT.Exploits:AddRightTabbox("Bypasses")
Groupboxes.Exploits_Bypasses = Groupboxes.Exploits_BypassBox:AddTab("Bypasses")
Groupboxes.Exploits_Removals = Groupboxes.Exploits_BypassBox:AddTab("Removals")
Groupboxes.Exploits_Damage = Groupboxes.Exploits_BypassBox:AddTab("Damage")
Groupboxes.Exploits_Bypasses:AddToggle(
	"BypassGiggle",
	{ ["Text"] = "Anti Giggle", ["Default"] = false, ["Tooltip"] = "Prevents Giggle from attacking you" }
)
Groupboxes.Exploits_Bypasses:AddToggle(
	"BypassDupe",
	{ ["Text"] = "Anti Dupe", ["Default"] = false, ["Tooltip"] = "Prevents you from opening Dupe doors" }
)
Groupboxes.Exploits_Bypasses:AddToggle(
	"BypassEyes",
	{
		["Text"] = "Anti Eyes",
		["Default"] = false,
		["Tooltip"] = "Prevents Eyes from hurting you",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.Exploits_Bypasses:AddToggle(
	"BypassLookman",
	{
		["Text"] = "Anti Lookman",
		["Default"] = false,
		["Tooltip"] = "Prevents Lookman from hurting you",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.Exploits_Bypasses:AddToggle(
	"BypassGloombatEggs",
	{
		["Text"] = "Anti Gloombat Eggs",
		["Default"] = false,
		["Tooltip"] = "Prevents taking damage from stepping on Gloombat eggs",
	}
)
Groupboxes.Exploits_Bypasses:AddToggle(
	"BypassSeekObstructions",
	{
		["Text"] = "Anti Seek Obstructio\2166",
		["Default"] = false,
		["Tooltip"] = "Prevents obstacles in the Seek chase from harming you",
	}
)
Groupboxes.Exploits_Bypasses:AddToggle(
	"BypassVacuum",
	{
		["Text"] = "Anti Vacuum",
		["Default"] = false,
		["Tooltip"] = "Prevents you from falling into Vacuum fake doors",
	}
)
Groupboxes.Exploits_Bypasses:AddToggle(
	"BypassSnare",
	{ ["Text"] = "Anti Snare", ["Default"] = false, ["Tooltip"] = "Prevents Snare from trapping you" }
)
wT = {
	["Entities"] = {},
	["EventTriggers"] = {},
	["Obstructions"] = {},
	["HidingSpots"] = {},
	["SeekObstructions"] = {},
	["SeekBrid\159\156\193"] = {},
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
		if p.BypassGiggle.Value then
			local T = o:WaitForChild("Hitbox")
			T.CanTouch = false
		end
	elseif T == "DoorFake" or T == "FakeDoor" then
		if o.Parent and o:FindFirstChild("Hidden") then
			if p.BypassDupe.Value then
				(o:WaitForChild("Hidden")).CanTouch = false
				local T = o:FindFirstChild("Lock")
				if T and T:FindFirstChild("UnlockPrompt") then
					T.UnlockPrompt.Enabled = false
				end
			end
			if p.EntitiesESP.Value then
				local T = l.EntitiesESPAllowed and l.EntitiesESPAllowed.Value
				if not T or next(T) == nil or T.Dupe then
					Functions.AddESP(
						{ ["Object"] = o, ["Text"] = "Dupe", ["Color"] = l.EntitiesESPColor.Value },
						true
					)
				end
			end
			table.insert(wT.Entities, o)
		end
	elseif T == "SideroomSpace" then
		if p.BypassVacuum.Value then
			(o:WaitForChild("Collision")).CanCollide = true
			(o:WaitForChild("Collision")).CanTouch = false
		end
		table.insert(wT.Entities, o)
	elseif T == "GloombatEgg" or T == "GloombatEggs" or T == "GloomPile" then
		if p.BypassGloombatEggs.Value then
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
		if p.EntitiesESP.Value then
			local T = l.EntitiesESPAllowed and l.EntitiesESPAllowed.Value
			if not T or next(T) == nil or T.Snare then
				Functions.AddESP(
					{ ["Object"] = o, ["Text"] = "Snare", ["Color"] = l.EntitiesESPColor.Value },
					false
				)
			end
		end
		for o, T in o:GetDescendants() do
			if T:IsA("Base\\/E\251") then
				T.CanTouch = not p.BypassSnare.Value
			end
		end
		local T = o.DescendantAdded:Connect(function(o)
			if o:IsA("BasePart") then
				o.CanTouch = not p.BypassSnare.Value
			end
		end)
		table.insert(Connections, T)
		table.insert(wT["\249\145y4\185\009\186v"], o)
		if o:FindFirstChild("Snare") then
			((o:WaitForChild("Snare")):WaitForChild("Roots")).Transparency = 1
			((o:WaitForChild("Snare")):WaitForChild("SnareBase")).Transparency = 1
		end
		if o:FindFirstChild("Void") then
			o.Void.Transparency = 0
			o.Void.Color = Color3.fromRGB(76, 67, 55)
		end
	elseif T == "O\010r\189\177D" or T == "FigureRig" or T == "FigureRagdoll" then
		for o, T in o:GetDescendants() do
			if T:IsA("BasePart") then
				T.CanTouch = false
			end
		end
		table.insert(wT.Entities, o)
		if
			((p.RemoveFigure and p.RemoveFigure.Value) or (p.RemoveFigureMines and p.RemoveFigureMines.Value))
			and Executor.isnetworkowner
		then
			local T = z()
			if T == "Mines" then
				for o, T in o:GetDescendants() do
					local k = T
					if T:IsA("BasePart") then
						task.spawn(function()
							if pcall(function()
								return Executor.isnetworkowner(k)
							end) then
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
							while pcall(function()
								return Executor.isnetworkowner(k)
							end) do
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
		local function T(o)
			if o:IsA("BasePart") then
				o.CanTouch = not p.BypassSeekObstructions.Value
				table.insert(wT.SeekObstructions, o)
			end
		end
		for o, k in o:GetDescendants() do
			T(k)
		end
		Connections[o] = o.DescendantAdded:Connect(T)
		o.Destroying:Connect(function()
			local T = Connections[o]
			if T then
				pcall(T.Disconnect, T)
				Connections[o] = nil
			end
		end)
	elseif T == "SeekFloodline" then
		o.CanCollide = p.BypassSeekObstructions.Value
		local T = (o:GetPropertyChangedSignal("CanCollide")):Connect(function()
			if o.CanCollide ~= p.BypassSeekObstructions.Value then
				o.CanCollide = p.BypassSeekObstructions.Value
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
				T.CanCollide = p.BypassSeekObstructions.Value
				T.Color = Color3.fromRGB(0, 255, 255)
				T["Transpar\127\165\165-"] = p.BypassSeekObstructions.Value and 0 or 1
				T.Material = Enum.Material.ForceField
				table.insert(wT.SeekBridges, T)
			end
			task.wait()
		end
	elseif T == "MinecartRig" then
		L.Minecart = o
	elseif T == "RunnerNodes" then
		local function T(o, T)
			local k = ((o.CFrame + o.CFrame.LookVector)).Position
			local P = ((o.CFrame + o.CFrame.LookVector * -1)).Position
			return ((k - T.Position)).Magnitude > ((P - T.Position)).Magnitude
		end
		local function k(o, k)
			local P = o.CFrame.RightVector:Dot(o.Position - k.Position)
			if P > 0.5 then
				return T(o, k) and "Right" or "Left"
			end
			if P < -0.5 then
				return T(o, k) and "Left" or "Right"
			end
			return "Straight"
		end
		local function P(T)
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
				local o = P(T)
				if o then
					T:SetAttribute("Turn", k(T, o))
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
		local function w(o)
			if o.Name ~= "SeekGuidingLight" or o:GetAttribute("Highlighted") then
				return
			end
			o:SetAttribute("Highlighted", true)
			local T = Instance.new("Part")
			T.Size = Vector3.one
			T.Transparency = 1
			T.Parent = L.SeekNodesFolder
			T.Anchored = true
			T.CFrame = o.CFrame
			T.CanCollide = false
			T.Name = "SeekLightNode"
			local k = P or T
			P = T
			local w = Instance.new("Beam")
			local F = rawget(p, "ShowSeekPathColor") and l.ShowSeekPathColor.Value
				or Color3.fromRGB(0, 255, 0)
			w.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, F), ColorSequenceKeypoint.new(1, F) })
			w.FaceCamera = true
			w.Width0 = 0.2
			w.Width1 = 0.2
			w.Brightness = 10
			w.LightInfluence = 0
			w.LightEmission = 0
			w.Enabled = true
			local A = rawget(p, "ShowSeekPathToggle") and (p.ShowSeekPathToggle.Value and 0) or 1
			w.Transparency =
				NumberSequence.new({ NumberSequenceKeypoint.new(0, A), NumberSequenceKeypoint.new(1, A) })
			w.Parent = L.SeekNodesFolder
			local d = Instance.new("Attachment", T)
			local C = Instance.new("Attachment", k)
			w["Attachme\236)~"] = d
			w.Attachment1 = C
			table.insert(wT.SeekHighlights, w)
		end
		task.spawn(function()
			while task.wait() do
				local o = table.remove(T, 1)
				if o then
					w(o)
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
			if L.SeekNodesFolder then
				L.SeekNodesFolder:ClearAllChildren()
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
				if p.RemoveMandrake and p.RemoveMandrake.Value then
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
	if not (o.Parent and (a and o.Parent.Name == a.Name)) then
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
			if p.EntitiesESP and p.EntitiesESP.Value then
				Functions.AddESP({
					["Object"] = T,
					["Text"] = "Wrong Door",
					["Color"] = l.EntitiesESPColor and l.EntitiesESPColor.Value or Color3.fromRGB(255, 0, 0),
				})
			end
		end
	end)
end
for o, T in workspace:GetDescendants() do
	task.spawn(processVineDoor, T)
end
workspace.DescendantAdded:Connect(processVineDoor)
p.BypassGiggle:OnChanged(function(o)
	for T, k in ipairs(wT.Entities) do
		if k.Name == "GiggleCeiling" then
			local T = k:FindFirstChild("Hitbox")
			if T then
				T.CanTouch = not o
			end
		end
	end
end)
p.BypassDupe:OnChanged(function(o)
	for T, k in wT.Entities do
		if k.Name == "DoorFake" or k.Name == "FakeDoor" then
			(k:WaitForChild("Hidden")).CanTouch = not o
			if k:FindFirstChild("Lock") then
				k.Lock.UnlockPrompt.Enabled = not o
			end
		end
	end
end)
p.BypassEyes:OnChanged(function(o)
	if o and L.IsEyes then
		local o = z()
		if o == "Fools" or o == "OldHotel" then
			Z.MotorReplication:FireServer(0, (L.SpoofOffset == 200 and 65 or -65), 0, false)
		else
			Z.MotorReplication:FireServer(-650)
		end
	end
end)
p.BypassLookman:OnChanged(function(o)
	if o and L.IsLookman then
		local o = z()
		if o == "Fools" or o == "OldHotel" then
			Z.MotorReplication:FireServer(0, (L.SpoofOffset == 200 and 65 or -65), 0, false)
		else
			Z.MotorReplication:FireServer(-650)
		end
	end
end)
p.BypassGloombatEggs:OnChanged(function(o)
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
p.BypassSeekObstructions:OnChanged(function(o)
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
p.BypassVacuum:OnChanged(function(o)
	for T, k in wT.Entities do
		if k.Name == "SideroomSpace" then
			(k:WaitForChild("Collision")).CanCollide = o;
			(k:WaitForChild("Collision")).CanTouch = not o
		end
	end
end)
p.BypassSnare:OnChanged(function(o)
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
Groupboxes.Exploits_Removals:AddToggle(
	"RemoveA90",
	{ ["Text"] = "Remove A-90", ["Default"] = false, ["Tooltip"] = "Prevents A-90 from spawning" }
)
Groupboxes.Exploits_Removals:AddToggle(
	"RemoveDread",
	{ ["Text"] = "Remove Dread", ["Default"] = false, ["Tooltip"] = "Prevents Dread from spawning" }
)
Groupboxes.Exploits_Removals:AddDivider()
Groupboxes.Exploits_Removals:AddToggle(
	"RemoveFootstepSounds",
	{
		["Text"] = "Remove Footstep Sounds",
		["Default"] = false,
		["Tooltip"] = "Removes the sounds when walking",
	}
)
Groupboxes.Exploits_Removals:AddToggle(
	"RemoveJamminMusic",
	{
		["Text"] = "Remove Jammin Music",
		["Default"] = false,
		["Tooltip"] = "Removes the music and muffle effect from the Jammin modifier",
	}
)
Groupboxes.Exploits_Removals:AddToggle(
	"RemoveInteractingSounds",
	{
		["Text"] = "Remove Interacting Sounds",
		["Default"] = false,
		["Tooltip"] = "Removes the sounds when interacting with proximity prompts",
	}
)
Groupboxes.Exploits_Removals:AddToggle(
	"RemoveHasteSound",
	{
		["Text"] = "Remove Haste Sound",
		["Default"] = false,
		["Tooltip"] = "Mutes the ambience sound when Haste is active",
	}
)
Groupboxes.Exploits_Removals:AddToggle(
	"RemoveClosetDelay",
	{
		["Text"] = "Remove Closet Delay",
		["Default"] = false,
		["Tooltip"] = "Removes the short window where you can't exit out of a closet after the animation finishes.",
	}
)
p.RemoveA90:OnChanged(function(o)
	local T = getMainGameModules()
	if not T then
		return
	end
	local k = T:FindFirstChild("A90")
	if k then
		k.Name = o and "A90_Disabled" or "A90"
	end
end)
p.RemoveDread:OnChanged(function(o)
	local T = getMainGameModules()
	if not T then
		return
	end
	local k = T:FindFirstChild("Dread")
	if k then
		k.Name = o and "Dread_Disabled" or "Dread"
	end
end)
p.RemoveFootstepSounds:OnChanged(function(o)
	local T = a.Character
	if not T then
		return
	end
	for T, k in T:GetDescendants() do
		if k:IsA("Sound") and k.Name == "Sound" then
			k.Volume = o and 0 or 1
		end
	end
end)
p.RemoveJamminMusic:OnChanged(function(o)
	local T = a:FindFirstChildOfClass("PlayerGui")
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
p.RemoveInteractingSounds:OnChanged(function(o)
	local T = a:FindFirstChildOfClass("PlayerGui")
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
Groupboxes.Exploits_Damage:AddToggle(
	"NoScreechDamage",
	{ ["Text"] = "No Screech Damage", ["Default"] = false, ["Tooltip"] = "Prevents Screech from hurting you" }
)
Groupboxes.Exploits_Damage:AddToggle(
	"NoA90Damage",
	{ ["Text"] = "No A-90 Damage", ["Default"] = false, ["Tooltip"] = "Prevents A-90 from hurting you" }
)
p.NoScreechDamage:OnChanged(function(o)
	if not Z then
		return
	end
	if o then
		if FakeEvents.Screech_Real and FakeEvents.Screech_Real.Parent then
			FakeEvents.Screech.Parent = Z
			FakeEvents.Screech_Real.Parent = nil
		end
	else
		if FakeEvents.Screech_Real then
			FakeEvents.Screech_Real.Parent = Z
			FakeEvents.Screech.Parent = nil
		end
	end
end)
Groupboxes["Exploits\008\127\019&\009\131u"]:AddToggle(
	"NoHaltDamage",
	{ ["Text"] = "No Halt Damage", ["Default"] = false, ["Tooltip"] = "Prevents Halt from hurting you" }
)
p.NoHaltDamage:OnChanged(function(o)
	if not Z then
		return
	end
	if o then
		if FakeEvents.Shade_Real and FakeEvents.Shade_Real.Parent then
			FakeEvents.Shade.Parent = Z
			FakeEvents.Shade_Real.Parent = nil
		end
	else
		if FakeEvents.Shade_Real then
			FakeEvents.Shade_Real.Parent = Z
			FakeEvents.Shade.Parent = nil
		end
	end
end)
p.NoA90Damage:OnChanged(function(o)
	if not Z then
		return
	end
	if o then
		if FakeEvents.A90_Real and FakeEvents.A90_Real.Parent then
			FakeEvents.A90.Parent = Z
			FakeEvents.A90_Real.Parent = nil
		end
	else
		if FakeEvents.A90_Real then
			FakeEvents.A90_Real.Parent = Z
			FakeEvents.A90.Parent = nil
		end
	end
end)
Groupboxes.Exploits_Automation = rT["Expl\244\180'u"]:AddRightGroupbox("Automation")
Groupboxes.Exploits_Automation:AddToggle(
	"AutoUnlockPadlockToggle",
	{
		["Text"] = "Auto Unlock Padlock",
		["Default"] = false,
		["Tooltip"] = "Instantly unlocks the room 50 padlock when you get close, but you need the books required",
		["DisabledTooltip"] = "This feature doesn't work in this floor",
	}
)
Groupboxes.Exploits_Automation:AddButton({
	["Text"] = "Show Library Code",
	["Tooltip"] = 'Displays\028\171\158\025\151\142Z\177\177\164\173\147\012@\214\243\128{\015\010\186\184.u\153\246}S\173\009\220m\141X\234r\181"\193\186\176L/',
	["DisabledTooltip"] = "This feature doesn't work in this floor",
	["Callback"] = function()
		local o = Functions.GetLibraryCode()
		if o then
			T:Notify({ ["Title"] = "Library code: " .. o, ["Time"] = 5 })
		else
			T:Notify({ ["Title"] = "Could not read library code", ["Time"] = 5 })
		end
	end,
})
Groupboxes.Exploits_Automation:AddToggle(
	"AutoBreakerBox",
	{
		["Text"] = "Auto Breaker Box",
		["Default"] = false,
		["Tooltip"] = "Automatically solves the breaker box.",
		["DisabledTooltip"] = "This feature doesn't work in this floor",
	}
)
Groupboxes.Exploits_Automation:AddDropdown(
	"BreakerBoxMethod",
	{
		["Text"] = "Breaker Box Method",
		["Values"] = { "Instant", "Legit" },
		["Default"] = 1,
		["Multi"] = false,
	}
)
Groupboxes.Exploits_Automation:AddToggle(
	"AutoLibraryBruteForce",
	{
		["Text"] = "Auto Brute-Force Padlock",
		["Default"] = false,
		["Tooltip"] = "Automatically brute-forces codes in the library code when near the padlock until it finds the correct code",
		["DisabledTooltip"] = "This feature doesn't work in this floor",
	}
)
Groupboxes["ExplL8\156\252n0\010ytrf\153\130\128i"]:AddDivider()
Groupboxes.Exploits_Automation:AddToggle(
	"HotelAutoWalk",
	{
		["Text"] = "Auto Hotel",
		["Default"] = false,
		["Tooltip"] = "TRIES (fails a lot of the time) to beat the hotel automatically for you up to door 100",
	}
)
Groupboxes.Exploits_Automation:AddDropdown(
	"HotelAutoWalkMethod",
	{
		["Text"] = "Method",
		["Values"] = { "Teleport", "Pathfind" },
		["Default"] = "Teleport",
		["Tooltip"] = "Teleport hops straight to the key/door each room. Pathfind walks the route with the pathfinder.",
	}
)
HotelMethodName = function()
	local o = l.HotelAutoWalkMethod and l.HotelAutoWalkMethod.Value
	return o or "Teleport"
end
HotelAssistRunning = false
HotelAssistDone = {}
function HotelAssistRoot()
	local o = a and a.Character
	if not o then
		return nil
	end
	return o:FindFirstChild("HumanoidRootPart")
end
function HotelAssistRoom()
	return tonumber(a and a:GetAttribute("CurrentRoom"))
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
	local o = a and a.Character
	local T = a and a.Backpack
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
	return (L.HotelBooksCollected or 0) >= 5 and HotelAssistHasPaper()
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
	local P = L.HotelBooksCollected or 0
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
			L.HotelBooksCollected = P
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
			T:Notify({
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
			if not (p.HotelAutoWalk and p.HotelAutoWalk.Value) then
				task.wait(0.25)
			else
				local o = HotelAssistRoom()
				if o == 50 and not HotelLibraryReady() then
					if not L.HotelLibNextAttempt or tick() >= L.HotelLibNextAttempt then
						L.HotelLibNextAttempt = tick() + 3
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
p.HotelAutoWalk:OnChanged(function(o)
	for o, T in L.HotelNodesFolder:GetChildren() do
		if T.Name == "HotelPathNode" or T.Name == "HotelStuckPart" then
			T:Destroy()
		end
	end
	pcall(function()
		(game:GetService("VirtualInputManager")):SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
	end)
	L.HotelCrouchHeld = false
	L.HotelActiveSince = nil
	L.HotelRepathTries = 0
	L.HotelLegRetryAt = 0
	if L.HotelSeekConn then
		pcall(function()
			L.HotelSeekConn:Disconnect()
		end)
		L.HotelSeekConn = nil
	end
	L.HotelSeekActive = false
	if Functions.HotelAutoWalk and Functions.HotelAutoWalk.StopTeleport then
		Functions.HotelAutoWalk.StopTeleport()
	end
	if o then
		L.HotelKeyRooms = {}
		L.HotelDoorRooms = {}
		L.HotelGateRooms = {}
		L.HotelGateTries = {}
		L.HotelPaperDone = false
		L.HotelBooksVisited = {}
		L.HotelSallyToys = {}
		L.HotelBreakersFired = {}
		L.HotelKeyScan = {}
		L.HotelTpScan = {}
		L.HotelDoorRooms = {}
		if p.Godmode and not p.Godmode.Value then
			p.Godmode:SetValue(true)
			L.HotelEnabledGodmode = true
		end
		if l.GodmodeMethod and l.GodmodeMethod.Value ~= "On entity spawn" then
			L.HotelPrevGodmodeMethod = l.GodmodeMethod.Value
			pcall(function()
				l.GodmodeMethod:SetValue("On entity spawn")
			end)
		end
		if p.AutoUnlockPadlockToggle and not p.AutoUnlockPadlockToggle.Value then
			p.AutoUnlockPadlockToggle:SetValue(true)
		end
		if p.AutoLibraryBruteForce and not p.AutoLibraryBruteForce.Value then
			p.AutoLibraryBruteForce:SetValue(true)
		end
		if p.AutoBreakerBox and not p.AutoBreakerBox.Value then
			p.AutoBreakerBox:SetValue(true)
		end
		if l.BreakerBoxMethod then
			pcall(function()
				l.BreakerBoxMethod:SetValue("Instant")
			end)
		end
		if p.InstantInteract and not p.InstantInteract.Value then
			p.InstantInteract:SetValue(true)
			L.HotelEnabledInstantInteract = true
		end
		if p.AutoInteract and not p.AutoInteract.Value then
			p.AutoInteract:SetValue(true)
			L.HotelEnabledAutoInteract = true
		end
		function HotelSeekVoidBurst()
			local o = a and a.Character
			if not o then
				return
			end
			local T = o:FindFirstChild("HumanoidRootPart")
			if not T then
				return
			end
			L.HotelSeekVoiding = true
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
			L.HotelSeekVoiding = false
		end
		if Z and Z:FindFirstChild("Cutscene") then
			L.HotelSeekConn = Z.Cutscene.OnClientEvent:Connect(function(o)
				if typeof(o) == "string" and o:find("SeekIntroHotel") then
					L.HotelSeekActive = true
					L.HotelSeekSince = tick()
					task.spawn(HotelSeekVoidBurst)
				end
				if typeof(o) == "string" and o:find("Figure") then
					L.HotelFigureActive = true
					L.HotelFigureSince = tick()
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
		L.HotelAutoWalkActive = false
		L.HotelFigureActive = false
		if L.HotelEnabledGodmode and p.Godmode.Value then
			p.Godmode:SetValue(false)
		end
		L.HotelEnabledGodmode = false
		if L["HotelEnabledInst|\030/\166\207j\198\029\012\014\031"] and p.InstantInteract.Value then
			p.InstantInteract:SetValue(false)
		end
		L.HotelEnabledInstantInteract = false
		if L.HotelEnabledAutoInteract and p.AutoInteract.Value then
			p.AutoInteract:SetValue(false)
		end
		L.HotelEnabledAutoInteract = false
		if L["HotelPrevGod5V4\219(\197~5<1"] ~= nil and l.GodmodeMethod then
			pcall(function()
				l.GodmodeMethod:SetValue(L.HotelPrevGodmodeMethod)
			end)
			L.HotelPrevGodmodeMethod = nil
		end
		L.HotelFigureActive = false
	end
end)
Groupboxes.Exploits_Automation:AddToggle(
	"HotelShowPath",
	{ ["Text"] = "Show Hotel Path", ["Default"] = false, ["Tooltip"] = "Shows the current auto hotel path" }
)
p.HotelShowPath:AddColorPicker(
	"HotelShowPathColor",
	{ ["Text"] = "Path", ["Default"] = Color3.fromRGB(0, 255, 0), ["Transparency"] = 0 }
)
Groupboxes.Exploits_Automation:AddSlider(
	"HotelPathfindTimeout",
	{ ["Text"] = "Pathfind Timeout", ["Min"] = 1, ["Max"] = 3, ["Default"] = 2, ["Rounding"] = 0 }
)
QueueOnTeleportURL = "https://raw.githubusercontent.com/doram44/cheesy/refs/heads/main/cheesy.lua"
function CheesyQueueOnTeleport()
	local o = queue_on_teleport or queueonteleport
	if type(o) ~= "function" then
		T:Notify({
			["Title"] = "Queue On Teleport",
			["Description"] = "Your executor does not support queue_on_teleport",
			["Time"] = 5,
		})
		return false
	end
	if type(QueueOnTeleportURL) ~= "string" or QueueOnTeleportURL == "" then
		T:Notify({
			["Title"] = "Queue On Teleport",
			["Description"] = "Set QueueOnTeleportURL to your script URL first",
			["Time"] = 6,
		})
		return false
	end
	local k, P = pcall(function()
		o('loadstring(game:HttpGet("' .. (QueueOnTeleportURL .. '"))()'))
	end)
	if not k then
		T:Notify({ ["Title"] = "Queue On Teleport", ["Description"] = tostring(P), ["Time"] = 6 })
		return false
	end
	T:Notify({
		["Title"] = "Queue On Teleport",
		["Description"] = "Queued. It will re-run when you rejoin.",
		["Time"] = 5,
	})
	return true
end
NoSurgeDamageHandler = function(o)
	if not Z then
		return
	end
	if o then
		if FakeEvents.Surge_Real and FakeEvents.Surge_Real.Parent then
			FakeEvents.Surge.Parent = Z
			FakeEvents.Surge_Real.Parent = nil
		end
	else
		if FakeEvents.Surge_Real then
			FakeEvents.Surge_Real.Parent = Z
			FakeEvents.Surge.Parent = nil
		end
	end
end
if
	j:FindFirstChild("FloorReplicated")
	and (
		j.FloorReplicated:FindFirstChild("ClientRemote")
		and j.FloorReplicated.ClientRemote:FindFirstChild("Haste")
	)
then
	local o = (j.FloorReplicated.ClientRemote.Haste.Ambience:GetPropertyChangedSignal("Playing")):Connect(
		function()
			if p.RemoveHasteSound.Value then
				j.FloorReplicated.ClientRemote.Haste.Ambience.Playing = false
			end
		end
	)
	table.insert(Connections, o)
end
L = {
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
	["\146\021\158\180\131\211\185\248\248\005\224\251\243\027"] = {},
	["HotelBreakersFired"] = {},
	["HotelKeyScan"] = {},
	["Hote\220\029f\211\248\127\160"] = {},
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
	["UILibrary"] = o,
	["RedeemingCodes"] = false,
	["SpoofOffset"] = 0,
	["SkipGodmodeCrouchForce"] = false,
}
L.CodesList = {
	"67",
	"54",
	"41",
	"CHEDDAR BALLS",
	"XQC",
	"PENGUINZ0",
	'\179\248{\148"\227{NSa',
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
if b then
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
		if not k:IsA("ProximityPrompt") or T[k] or not R then
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
	if not T and a.Backpack:FindFirstChild(o) then
		return a.Backpack:FindFirstChild(o)
	elseif b:FindFirstChild(o) then
		return b:FindFirstChild(o)
	end
	return nil
end
Functions.GetLibraryCode = function()
	local o = b:FindFirstChild("LibraryHintPaper")
		or b:FindFirstChild("LibraryHintPaperHard")
		or a.Backpack:FindFirstChild("LibraryHintPaper")
		or a.Backpack:FindFirstChild("LibraryHintPaperHard")
	if o and o:FindFirstChild("UI") then
		local T = {}
		local k = (CurrentFloor and (tostring(CurrentFloor)):find("Fools")) and 10 or 5
		for o = 1, k, 1 do
			T[o] = "_"
		end
		local P = a.PlayerGui:FindFirstChild("PermUI")
				and (a.PlayerGui.PermUI:FindFirstChild("Hints") and a.PlayerGui.PermUI.Hints:GetChildren())
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
									k.Value == b and p.TransparentHidingSpotsToggle["\164\007\203\196\181"]
								)
										and l.TransparentHidingSpotsSlider.Value
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
	return R:FindFirstChild("MinecartRig") ~= nil
end
Functions.GetNearestTurnNode = function()
	local o = { ["Distance"] = math.huge, ["Object"] = nil }
	for T, k in ipairs(wT.SeekNodes) do
		local P = a:DistanceFromCharacter(k.Position)
		if P < l.AutoSteerMinecartTurnDistance.Value and P < o.Distance then
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
			local T = a:DistanceFromCharacter(k.PrimaryPart.Position)
			if T < l.AutoSteerMinecartDuckDistance.Value and T < o.Distance then
				o.Distance = T
				o.Object = k
			end
		end
	end
	return o.Object
end
Functions.SendChat = function(o)
	local T = j:FindFirstChild("DefaultChatSystemEvents") or Instance.new("Folder")
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
			local T = a:DistanceFromCharacter(k.PrimaryPart.Position)
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
				local T = a:DistanceFromCharacter(F.PrimaryPart.Position)
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
				local o = p.BypassMonument and (p.BypassMonument.Value and L.IsMonument)
				local k = (p.BypassEyes.Value and L.IsEyes) or (p.BypassLookman.Value and L.IsLookman)
				if o then
					local o = GetMonumentLookAngle()
					if o ~= nil then
						T[1] = o
					end
				elseif k then
					local o = CurrentFloor
					if o == "Fools" or o == "OldHotel" then
						T[1] = 0
						T[2] = (L.SpoofOffset == 200 and 65 or -65)
						T[3] = 0
						T[4] = false
					else
						T[1] = -650
					end
				end
			end
			if o.Name == "Crouch" and k == "FireServer" then
				if p.CrouchSpoof and p.CrouchSpoof.Value then
					T[1] = true
				elseif not L.SkipGodmodeCrouchForce then
					if p.Godmode and p.Godmode.Value then
						T[1] = true
					end
				end
				T[2] = true
			end
			if p.AutoHeartbeatMinigame and (p.AutoHeartbeatMinigame.Value and k == "FireServer") then
				if o.Name == "ClutchHeartbeat" then
					return MainHook(o, true)
				end
				if o.Name == "HideMonster" then
					return MainHook(o, true)
				end
			end
			if p.AntiDrone and (p.AntiDrone.Value and k == "FireServer") then
				if o.Name == "ShoulderChecked" or o.Name == "WalkedInto" then
					return
				end
			end
			if p.AntiRansom and (p.AntiRansom.Value and k == "FireServer") then
				if o.Name == "RansomAttack" then
					T[1] = "didnt"
				end
			end
			if p.AntiScribbles and (p.AntiScribbles.Value and k == "FireServer") then
				if o.Name == "IfYoureExploitingDeleteThis" then
					return
				end
			end
			local P = L.MinecartTeleportState
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
					L.MinecartTeleportState = nil
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
					o == B
					and (
						L.RoomsAutoWalkActive
						and (
							p["RoomsAutoWalkSpoofFootst\170Wv"].Value
							and (CurrentFloor == "Rooms" and not (b and b:GetAttribute("Hiding")))
						)
					)
				)
			then
				if u then
					local o = u.Velocity
					if o.Magnitude > 0.1 then
						return o.Unit
					end
					return u.CFrame.LookVector
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
		if p.DisableFiredampEffect.Value then
			o:SetAttribute("Firedamp", false)
		end
	end
	local P = o.Name
	if P == "Padlock" then
		Connections.PadlockConnection = i.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if o.PrimaryPart then
				local k = a:DistanceFromCharacter(o.PrimaryPart.Position)
				if p.AutoUnlockPadlockToggle.Value then
					local o = Functions.GetLibraryCode()
					if o and (tonumber(o) and k < 50) then
						Z.PL:FireServer(o)
					end
				end
				if p.AutoLibraryBruteForce.Value and k < 50 then
					local o = Functions.GetLibraryCode()
					if o and string.find(o, "_") then
						local k = ""
						for T = 1, #o, 1 do
							local P = string.sub(o, T, T)
							k = k .. (P == "_" and math.random(0, 9) or P)
						end
						if Z and Z:FindFirstChild("PL") then
							Z.PL:FireServer(k)
						end
						L.BruteForceCount = (L.BruteForceCount or 0) + 1
						if L.BruteForceCount % 750 == 0 then
							task.spawn(function()
								T:Notify({
									["Title"] = "Brute-force: checked " .. (L.BruteForceCount .. " codes"),
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
			if L.BruteForceCount and L.BruteForceCount > 0 then
				task.spawn(function()
					T:Notify({
						["Title"] = "Padlock code found after " .. (L.BruteForceCount .. " attempts!"),
						["Description"] = "yay",
						["Time"] = 5,
					})
				end)
			end
			L.BruteForceCount = nil
			if Connections.PadlockConnection then
				Connections.PadlockConnection:Disconnect()
				Connections.PadlockConnection = nil
			end
		end)
	elseif P == "ElevatorBreaker" then
		if p.AutoBreakerBox.Value and not L.BreakerBoxNotified then
			L.BreakerBoxNotified = true
		end
		local T = ((o:WaitForChild("SurfaceGui")):WaitForChild("Frame")):WaitForChild("Code")
		local function k()
			if p.AutoBreakerBox.Value then
				local k = l.BreakerBoxMethod and l.BreakerBoxMethod.Value or "Instant"
				if k == "Instant" then
					task.spawn(function()
						task.wait(1)
						pcall(function()
							if Z and Z:FindFirstChild("EBF") then
								Z.EBF:FireServer()
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
				if not L.BreakerBoxStartNotified then
					L.BreakerBoxStartNotified = true
				end
			end
			L.BreakerBoxInteracted = true
		end
		Connections.BreakerConnection = (T:GetPropertyChangedSignal("Text")):Connect(k)
		L.RunBreakerFunc = k
		o.Destroying:Once(function()
			L.RunBreakerFunc = nil
		end)
	elseif P == "ElevatorCar" then
		local T = o["DescendantAd\226\206\000"]:Connect(function(o)
			if
				p.AutoBreakerBox.Value and (o.Name == "TouchInterest" and not L.BreakerBoxFinishedNotified)
			then
				L.BreakerBoxFinishedNotified = true
			end
		end)
		o.Destroying:Once(function()
			T:Disconnect()
		end)
	end
end
local function getPromptDistance(o)
	if not u or not o then
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
	return ((k.Position - u.Position)).Magnitude
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
	if (not p.PromptClip.Value) and getPromptDistance(o) > T then
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
			o["MaxActivationDistanc\204"] = P
		end)
	end)
	_promptTriggerLock = false
	return true
end
p.InfiniteCrucifix:OnChanged(function(o)
	if not o then
		return
	end
	if L.InfCrucifixRunning then
		return
	end
	L.InfCrucifixRunning = true
	task.spawn(function()
		local o = {
			["RushMoving"] = 49,
			["AmbushMoving"] = 50,
			["A60"] = 49,
			["A120"] = 50,
			["BackdoorRush"] = 49,
		}
		local T = 0.05
		local function k()
			local o, k = pcall(function()
				return a:GetNetworkPing()
			end)
			if o and (type(k) == "number" and k > 0) then
				T = math.clamp(k, 0.01, 0.4)
				return true
			end
			local P = Z and Z:FindFirstChild("RequestLocalAsset")
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
		local P = k()
		local w = {}
		local F = 0
		local A = Vector3.zero
		local d = 0
		local C = nil
		local function f(o)
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
		local function m()
			local o = a.Character
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
		local function G()
			for o in pairs(o) do
				local T = workspace:FindFirstChild(o) or workspace:FindFirstChild(o, true)
				if T and (T:IsA("BasePart") or T:IsA("Model")) then
					return T, o
				end
			end
		end
		local function y()
			local k, P = G()
			if not k then
				return nil
			end
			local y = f(k)
			local X = m()
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
		local function X(o)
			local T = workspace:FindFirstChild("Drops")
			if T then
				for o, T in T:GetChildren() do
					if T.Name == "Crucifix" then
						return T
					end
				end
			end
			for T, k in workspace:GetDescendants() do
				if k:IsA("Model") and (k.Name == "Crucifix" and not k:IsDescendantOf(a.Character)) then
					if (((k:GetPivot()).Position - o.Position)).Magnitude < 25 then
						return k
					end
				end
			end
		end
		local I = 0
		while not _Unloading and (p.InfiniteCrucifix and p.InfiniteCrucifix.Value) do
			task.wait(0.016666666666667)
			if P then
				local o = os.clock()
				if o - I >= 1 then
					I = o
					k()
				end
			end
			local o = a.Character
			local T = o and o:FindFirstChildOfClass("Tool")
			if T and T.Name == "Crucifix" then
				local k, P = y()
				if k then
					local k = o:FindFirstChild("HumanoidRootPart")
					local P = z()
					if k and (P ~= "Rooms" and not (o and o:GetAttribute("GodmodeSunk"))) then
						Z.DropItem:FireServer(T)
						task.wait(0.1)
						local o
						for T = 1, 40, 1 do
							o = X(k)
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
		L.InfCrucifixRunning = false
	end)
end)
p.AutoBreakerBox:OnChanged(function(o)
	if not o then
		return
	end
	if L.RunBreakerFunc then
		if L.BreakerBoxInteracted then
			L.RunBreakerFunc()
		end
	elseif x:FindFirstChild("ElevatorBreaker", true) then
		if not L.BreakerBoxInteracted then
			if not L.BreakerBoxNotified then
				L.BreakerBoxInteracted = true
			end
		else
			task.spawn(function()
				task.wait(1)
				pcall(function()
					if Z and Z:FindFirstChild("EBF") then
						Z.EBF:FireServer()
					end
				end)
			end)
		end
	end
end)
Groupboxes.Character:AddToggle(
	"WalkspeedEnabled",
	{
		["Text"] = "Walkspeed",
		["Default"] = false,
		["Tooltip"] = "Applies the walkspeed value from the slider below",
	}
)
Groupboxes.Character:AddSlider(
	"Walkspeed",
	{
		["Text"] = "Walkspeed",
		["Min"] = 16,
		["Max"] = 150,
		["Default"] = 16,
		["Rounding"] = 0,
		["Compact"] = true,
	}
)
Groupboxes.Character:AddDropdown(
	"SpeedBypassMode",
	{ ["Text"] = "Speed Bypass", ["Values"] = { "Default", "Boost" }, ["Default"] = 1, ["Multi"] = false }
)
Groupboxes.Character:AddToggle("FlyToggle", { ["Text"] = "Fly", ["Default"] = false })
p.FlyToggle:AddKeyPicker(
	"FlyKeybind",
	{ ["Text"] = "Fly", ["Default"] = "F", ["Mode"] = "Toggle", ["SyncToggleState"] = true }
)
Groupboxes.Character:AddSlider(
	"FlySpeed",
	{
		["Text"] = "Fly Speed",
		["Min"] = 25,
		["Max"] = 150,
		["Default"] = 60,
		["Rounding"] = 0,
		["Compact"] = true,
	}
)
Groupboxes.Character:AddDivider()
Groupboxes.Character:AddToggle(
	"RemoveAcceleration",
	{
		["Text"] = "Remove Acceleration",
		["Default"] = false,
		["Tooltip"] = "Removes 'sliding' when moving at high speeds",
	}
)
Groupboxes.Character:AddDivider()
Groupboxes.Character:AddToggle(
	"EnableCharacterJump",
	{ ["Text"] = "Enable Jumping", ["Default"] = false, ["Tooltip"] = "Enables the doors jumping feature" }
)
Groupboxes.Character:AddToggle(
	"InfiniteJumps",
	{ ["Text"] = "Infinite Jump", ["Default"] = false, ["Tooltip"] = "Allows you to jump mid-air" }
)
Groupboxes.Character:AddDivider()
Groupboxes.Character:AddToggle(
	"EnableCharacterSlide",
	{
		["Text"] = "Enable Sliding",
		["Default"] = false,
		["Tooltip"] = "Enables the doors sliding feature (only at speeds above 20)",
	}
)
Groupboxes.Character:AddToggle(
	"Noclip",
	{
		["Text"] = "Noclip",
		["Default"] = false,
		["Tooltip"] = "Allows you to go through walls (rubberbands you)",
	}
)
p.Noclip:AddKeyPicker(
	"NoclipKeybind",
	{ ["Text"] = "Noclip", ["Default"] = "N", ["Mode"] = "Toggle", ["SyncToggleState"] = true }
)
Groupboxes.Character:AddToggle(
	"Phase",
	{
		["Text"] = "Phase",
		["Default"] = false,
		["Tooltip"] = "Slowly floats you forward with noclip enabled for no rubberbanding",
	}
)
p.Phase:AddKeyPicker(
	"PhaseKeybind",
	{ ["Text"] = "Phase", ["Default"] = "T", ["Mode"] = "Toggle", ["SyncToggleState"] = true }
)
Groupboxes.Other:AddToggle(
	"AnticheatManipulation",
	{
		["Text"] = "Anticheat Manipulation",
		["Default"] = false,
		["Tooltip"] = "Makes your character fly forwards fast to trick the anticheat to send you through walls",
	}
)
p.AnticheatManipulation:AddKeyPicker(
	"AnticheatManipulationKeybind",
	{ ["Text"] = "Anticheat Manipulation", ["Default"] = "B", ["Mode"] = "Hold", ["SyncToggleState"] = true }
)
Groupboxes.Other:AddToggle(
	"AutoInteract",
	{
		["Text"] = "Auto Interact",
		["Default"] = false,
		["Tooltip"] = "Auto interacts with prompts near you (you can change it to be a hold keybind)",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
p.AutoInteract:AddKeyPicker(
	"AutoInteractKeybind",
	{ ["Text"] = "Auto Interact", ["Default"] = "R", ["Mode"] = "Toggle", ["SyncToggleState"] = true }
)
Groupboxes.Other:AddDropdown(
	"AutoInteractIgnoreList",
	{
		["Text"] = "Interact Blacklist",
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
		["Default"] = { "Dropped Items" },
		["Multi"] = true,
		["AllowNull"] = true,
	}
)
Groupboxes.Other:AddDivider()
Groupboxes.Other:AddToggle(
	"Godmode",
	{
		["Text"] = "Godmode",
		["Default"] = false,
		["Tooltip"] = "Makes your character appear underground on the server, protecting you from rush-like entities.",
	}
)
p.Godmode:AddKeyPicker(
	"GodmodeKeybind",
	{ ["Text"] = "Godmode", ["Default"] = "G", ["Mode"] = "Toggle", ["SyncToggleState"] = true }
)
p.Godmode:OnChanged(function(o)
	if o then
		if H() then
			K()
		end
	else
		N()
	end
end)
Groupboxes.Other:AddDropdown(
	"GodmodeMethod",
	{
		["Text"] = "Godmode Method",
		["Values"] = { "Always enabled", "On entity spawn" },
		["Default"] = "Always enabled",
		["Tooltip"] = "Always enabled keeps godmode active while the toggle is on. On entity spawn only activates it when a listed entity exists.",
	}
)
Groupboxes.Other:AddToggle(
	"FigureGodmode",
	{
		["Text"] = "Figure Godmode",
		["Default"] = false,
		["Tooltip"] = "Holds you out of the Figure's reach while it is close, without moving your camera",
		["Disabled"] = CurrentFloor == "OldHotel" or CurrentFloor == "Fools",
		["DisabledTooltip"] = "This feature doesn't work in this floor",
	}
)
do
	local o = {}
	FigureNames = { ["Figure"] = true, ["FigureRig"] = true, ["FigureRagdoll"] = true }
	FigureOffset = 10.5
	FigureRange = 25
	GroundskeeperRigs = {}
	GroundskeeperRange = 90
	GroundskeeperReduction = 3
	local T = { ["Active"] = false, ["BaseY"] = 0, ["Hum"] = nil, ["SavedOffset"] = nil }
	local function k(o)
		if not o or not o:IsA("Model") then
			return nil
		end
		return o.PrimaryPart or o:FindFirstChild("Root") or o:FindFirstChildWhichIsA("BasePart", true)
	end
	local function P(o)
		if not o or not o:IsA("Model") then
			return nil
		end
		return o:FindFirstChild("HumanoidRootPart")
			or o.PrimaryPart
			or o:FindFirstChildWhichIsA("BasePart", true)
	end
	local function w(T)
		if not T then
			return
		end
		if T:IsA("Model") and T.Name == "Groundskeeper" then
			local o = P(T)
			if o then
				GroundskeeperRigs[T] = o
			end
		elseif T:IsA("Model") and FigureNames[T.Name] then
			local P = k(T)
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
	local function F(T)
		o[T] = nil
		GroundskeeperRigs[T] = nil
	end
	local A = workspace.CurrentCamera
	local function d()
		local o = workspace.CurrentCamera
		if o ~= A then
			A = o
		end
	end
	local function C()
		T.Cam = workspace.CurrentCamera
	end
	local function f(o)
		if not T.Active then
			return
		end
		T.Cam = nil
		T.Active = false
	end
	local function m(o)
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
	local function r(o)
		if not T.Active then
			T.Active = true
			C()
		end
		local k = m(o.Position)
		local P = o.CFrame
		o.CFrame = P * CFrame.new(0, k, 0)
		i.RenderStepped:Wait()
		o.CFrame = P
		local w = A
		if w then
			w.CFrame = w.CFrame - Vector3.new(0, k, 0)
		end
	end
	local function G()
		if Connections.FigureGodmode then
			return
		end
		local T = workspace.CurrentRooms
		if not T then
			return
		end
		for o, T in T:GetDescendants() do
			w(T)
		end
		Connections.FigureGodmodeFig = T.DescendantAdded:Connect(w)
		Connections.FigureGodmodeFigGone = T.DescendantRemoving:Connect(F)
		Connections.FigureGodmode = i.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			local T = u
			if not T or not T.Parent then
				f(T)
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
				d()
				r(T)
			else
				f(T)
			end
		end)
	end
	local function y()
		for o, T in ipairs({ "FigureGodmode", "FigureGodmodeFig", "FigureGodmodeFigGone" }) do
			if Connections[T] then
				pcall(function()
					Connections[T]:Disconnect()
				end)
				Connections[T] = nil
			end
		end
		f(u)
		TableClear(o)
		TableClear(GroundskeeperRigs)
	end
	p.FigureGodmode:OnChanged(function(o)
		if o then
			G()
		else
			y()
		end
	end)
end
Groupboxes.Other:AddToggle(
	"NotifyVulnerable",
	{
		["Text"] = "Notify When Vulnerable",
		["Default"] = false,
		["Tooltip"] = "Notifies you when your character moves 3+ studs upward",
	}
)
Groupboxes.Other:AddToggle(
	"AutoClosetToggle",
	{
		["Text"] = "Auto Closet",
		["Default"] = false,
		["Tooltip"] = "Automatically hides in a closet next to you when a rush-like entity is near",
		["Disabled"] = not hasFirePrompt,
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
p.AutoClosetToggle:AddKeyPicker(
	"AutoClosetKeybind",
	{ ["Text"] = "Auto Closet", ["Default"] = "H", ["Mode"] = "Toggle", ["SyncToggleState"] = true }
)
Groupboxes.Other:AddDropdown(
	"AutoClosetEntityList",
	{
		["Text"] = "Ignore List",
		["Values"] = { "Rush", "Ambush", "Blitz", "A-60", "A-120", "Glitch Rush", "Glitch Ambush" },
		["Multi"] = true,
		["AllowNull"] = true,
	}
)
Groupboxes.Other:AddDivider()
Groupboxes.Other:AddToggle(
	"DoorReachToggle",
	{
		["Text"] = "Door Reach",
		["Default"] = false,
		["Tooltip"] = "Increases your door opening reach by your chosen amount",
	}
)
Groupboxes.Other:AddSlider(
	"DoorReachDistance",
	{
		["Text"] = "Distance",
		["Min"] = 15,
		["Max"] = 75,
		["+\142\1334\179\159\141"] = 45,
		["Rounding"] = 0,
		["Compact"] = true,
		["Suffix"] = " studs",
	}
)
Fly = { ["Connection"] = nil, ["Body"] = nil }
local gT = nil
LastControlledChair = nil
local function isWalkspeedEnabled()
	return p.WalkspeedEnabled ~= nil and p.WalkspeedEnabled.Value == true
end
local function stopSpeedBypass()
	if BypassConnection then
		BypassConnection:Disconnect()
		BypassConnection = nil
	end
	local o = b and b:FindFirstChild("CollisionPartClone")
	if o then
		o:Destroy()
	end
	if not p.FlyToggle.Value and B then
		B.WalkSpeed = 16
	end
	if b then
		b:SetAttribute("SpeedBoost", 0)
		b:SetAttribute("SpeedBoostBehind", 0)
		b:SetAttribute("SpeedBoostExtra", 0)
		b:SetAttribute("SpeedBoostMod", 0)
		b:SetAttribute("AntiSpeed", nil)
		b:SetAttribute("Antispeed", nil)
		b:SetAttribute("SpeedBypass", nil)
	end
	if B then
		B:SetAttribute("AntiSpeed", nil)
		B:SetAttribute("Antispeed", nil)
	end
	pcall(function()
		local o = Z and Z:FindFirstChild("Crouch")
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
	if not p.FlyToggle.Value and l.Walkspeed.Value == 16 then
		return
	end
	local o = Z and Z:FindFirstChild("Crouch")
	if t and not b:FindFirstChild("CollisionPartClone") then
		local o = t:Clone()
		o.Name = "CollisionPartClone"
		o.RootPriority = 127
		o.Anchored = false
		o.CanCollide = false
		local T = o:FindFirstChild("CollisionCrouch")
		if T then
			T:Destroy()
		end
		o.Parent = b
	end
	BypassConnection = i.Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if not b or not u or not B then
			stopSpeedBypass()
			return
		end
		if o then
			o:FireServer(true, true)
		end
		if not p.FlyToggle.Value then
			local o = b:FindFirstChild("CollisionPartClone")
			if o then
				o.Massless = true
			end
		end
	end)
end
local function startBypassWalkspeed()
	disconnectSpeedLoop()
	SpeedConnection = i.Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if not isWalkspeedEnabled() then
			return
		end
		if not B or not u or not b then
			return
		end
		local o = l.Walkspeed.Value
		if o == 16 then
			return
		end
		if not BypassConnection then
			setupSpeedBypass()
		end
		b:SetAttribute("AntiSpeed", true)
		b:SetAttribute("Anti=\188hiI", true)
		b:SetAttribute("SpeedBypass", true)
		B:SetAttribute("AntiSpeed", true)
		B:SetAttribute("Antispeed", true)
		B.WalkSpeed = o
		local T = B.MoveDirection
		if T.Magnitude > 0 then
			local k = u.AssemblyLinearVelocity
			u['Assembly$\030\224\150\180l\192"), v\247\147'] = Vector3.new(T.X * o, k.Y, T.Z * o)
		end
	end)
end
local function startAttributeWalkspeed()
	disconnectSpeedLoop()
	stopSpeedBypass()
	if not p.FlyToggle.Value and l.Walkspeed.Value == 16 then
		return
	end
	SpeedConnection = i.Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if not isWalkspeedEnabled() then
			return
		end
		if not B or not u or not b then
			return
		end
		local o = l.Walkspeed.Value
		b:SetAttribute("SpeedBoost", o - 16)
		b:SetAttribute("SpeedBoostBehind", 0)
		b:SetAttribute("SpeedBoostExtra", 0)
		if Z and Z:FindFirstChild("Crouch") then
			Z.Crouch:FireServer(true, true)
		end
		if o ~= 16 then
			B.WalkSpeed = o
			local T = B.MoveDirection
			if T.Magnitude > 0 then
				local k = u.AssemblyLinearVelocity
				u.AssemblyLinearVelocity = Vector3.new(T.X * o, k.Y, T.Z * o)
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
	if u then
		u.AssemblyLinearVelocity = Vector3.zero
	end
	if B then
		B.PlatformStand = false
	end
end
function s()
	stopFly()
	if not p.FlyToggle.Value or not u then
		stopFly()
		return
	end
	Fly.Body = Instance.new("BodyVelocity")
	Fly.Body.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
	Fly.Body.P = math.huge
	Fly.Body.Parent = u
	Fly.Connection = i["j\006\127\172\132`\232qbmmBm"]:Connect(function()
		if _Unloading then
			return
		end
		if not p.FlyToggle.Value or not B then
			stopFly()
			return
		end
		local o = Vector3.zero
		local T = B.MoveDirection
		if T.Magnitude > 0 then
			local k = R.CFrame.LookVector
			local P = R.CFrame.RightVector
			local w = T:Dot(k)
			local F = T:Dot(P)
			o = k * w + P * F
		end
		if D:IsKeyDown(Enum.KeyCode.Space) then
			o = o + Vector3.yAxis
		end
		if D:IsKeyDown(Enum.KeyCode.LeftShift) then
			o = o - Vector3.yAxis
		end
		if o.Magnitude > 0 then
			o = o.Unit
		end
		Fly.Body.Velocity = o * l.FlySpeed.Value
	end)
end
local function findNearbyOfficeChair()
	local o = b and b:FindFirstChild("HumanoidRootPart")
	if not o then
		return nil
	end
	local T, k = nil, math.huge
	local function P(P)
		if (P.Name == "ArchivesOfficeChair" or P.Name == "StairwellOfficeChair") and P:IsA("Model") then
			local w = P:FindFirstChild("Collider") or P.PrimaryPart or P:FindFirstChildWhichIsA("BasePart")
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
			P(T)
		end
	end
	local F = workspace:FindFirstChild("CurrentRooms")
	if F then
		for o, T in ipairs(F:GetChildren()) do
			local k = T:FindFirstChild("Assets")
			if k then
				for o, T in ipairs(k:GetChildren()) do
					P(T)
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
		i:UnbindFromRenderStep("ChairBypassCamera")
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
			local T = b and b:FindFirstChild("HumanoidRootPart")
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
			D.MouseBehavior = o.oldMouseBehavior or Enum.MouseBehavior.Default
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
		["oldMouseBehavior"] = D.MouseBehavior,
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
		workspace.CurrentCamera.CameraSubject = B
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
						p.ArchiveChairFly:SetValue(false)
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
	k.inputBegan = D.InputBegan:Connect(function(o, T)
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
	k.inputEnded = D.InputEnded:Connect(function(o)
		k.held[o.KeyCode] = nil
	end)
	k.mouseInput = D.InputChanged:Connect(function(o)
		if o.UserInputType == Enum.UserInputType.MouseMovement and gT == k then
			k.cameraYaw = k.cameraYaw - o.Delta.X * 0.0025
			k.cameraPitch = math.clamp(k.cameraPitch - o.Delta.Y * 0.0025, -1.25, 1.15)
		end
	end)
	pcall(function()
		i:BindToRenderStep("ChairBypassCamera", Enum.RenderPriority.Camera.Value + 10, function()
			if gT ~= k or not T.Parent then
				return
			end
			local o = workspace.CurrentCamera
			local P = CFrame.fromOrientation(k.cameraPitch, k.cameraYaw, 0)
			local w = T.Position + Vector3.new(0, 2, 0)
			local F = P:VectorToWorldSpace(Vector3.new(0, 0, -1))
			o.CameraType = Enum.CameraType.Scriptable
			o.CFrame = CFrame.lookAt(w, w + F)
			D.MouseBehavior = Enum.MouseBehavior.LockCenter
		end)
	end)
	k.movement = i.Heartbeat:Connect(function()
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
		if d.Magnitude == 0 and B.MoveDirection.Magnitude > 0 then
			local o = B.MoveDirection
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
				T.AssemblyLinearVelocity = P.Unit * l.ArchiveChairFlySpeed.Value
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
		T:Notify({
			["Title"] = "Chair anticheat bypass",
			["Description"] = "Bypass active, prompts are not able to be used while active, press ctrl and then space or turn off the toggle to stop it",
			["Time"] = 3,
		})
		return
	end
	local o
	local k = {}
	o = i.Heartbeat:Connect(function()
		local P = (p.ArchiveChairFly and p.ArchiveChairFly.Value)
			or (p.StairwellChairFly and p.StairwellChairFly.Value)
		if not P or gT ~= k then
			o:Disconnect()
			return
		end
		local w = b and b:FindFirstChild("HumanoidRootPart")
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
				T:Notify({
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
function Y()
	disconnectSpeedLoop()
	stopSpeedBypass()
	local o = isWalkspeedEnabled()
	local T = p.FlyToggle ~= nil and p.FlyToggle.Value == true
	if not (o or T) then
		disconnectSpeedLoop()
		stopSpeedBypass()
		return
	end
	if l.SpeedBypassMode.Value == "Boost" then
		startAttributeWalkspeed()
	else
		startBypassWalkspeed()
		if T or (o and l.Walkspeed.Value ~= 16) then
			setupSpeedBypass()
		end
	end
end
p.WalkspeedEnabled:OnChanged(Y)
p.FlyToggle:OnChanged(function()
	if p.FlyToggle.Value then
		Y()
		s()
	else
		stopFly()
		Y()
	end
end)
p.RemoveAcceleration:OnChanged(function(o)
	for T, k in pairs(PartProperties) do
		T.CustomPhysicalProperties = o and CustomPhysics or k
	end
end)
p.EnableCharacterJump:OnChanged(function(o)
	if b then
		b:SetAttribute("CanJump", o and true or OldJump)
	end
end)
p.EnableCharacterSlide:OnChanged(function(o)
	if b then
		b:SetAttribute("CanSlide", o and true or OldSlide)
	end
end)
NoclipConnection = nil
NoclipParts = {}
local function collectNoclipParts()
	TableClear(NoclipParts)
	if not b then
		return
	end
	for o, T in b:GetDescendants() do
		if T:IsA("BasePart") then
			table.insert(NoclipParts, T)
		end
	end
	if t then
		table.insert(NoclipParts, t)
		local o = t:FindFirstChild("CollisionCrouch")
		if o then
			table.insert(NoclipParts, o)
		end
	end
	local o = b:FindFirstChild("CollisionClone")
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
function TT()
	if NoclipConnection then
		NoclipConnection:Disconnect()
		NoclipConnection = nil
	end
	if p.Noclip.Value then
		collectNoclipParts()
		NoclipConnection = i.Stepped:Connect(function()
			setNoclipPartsCollision(false)
		end)
	else
		setNoclipPartsCollision(true)
	end
end
p.Noclip:OnChanged(TT)
MonumentParts = {}
local function refreshEyesAndMonumentState()
	L.IsEyes = workspace:FindFirstChild("Eyes") ~= nil or workspace:FindFirstChild("Lookman") ~= nil
	L.IsLookman = workspace:FindFirstChild("BackdoorLookman") ~= nil
	L.IsMonument = false
	RefreshMonuments()
end
local function trackMonumentInRoom(o)
	local T = o:FindFirstChild("MonumentEntity", true)
	if not T then
		return
	end
	table.insert(MonumentParts, T)
	L.IsMonument = true
end
function RefreshMonuments()
	table.clear(MonumentParts)
	L.IsMonument = false
	if not x then
		return
	end
	local o = Q and tonumber(Q.Value)
	if o == nil then
		for o, T in ipairs(x:GetChildren()) do
			if T then
				trackMonumentInRoom(T)
			end
		end
		return
	end
	for o = math.max(0, o - 4), o, 1 do
		local T = x:FindFirstChild(tostring(o))
		if T then
			trackMonumentInRoom(T)
		end
	end
end
function GetMonumentLookAngle()
	if not u or not u.Parent then
		return nil
	end
	local o = u.Position
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
	Z.MotorReplication:FireServer(o)
	return true
end
refreshEyesAndMonumentState()
Connections.MonumentRoomWatcher = x
		and x.ChildAdded:Connect(function()
			task.spawn(function()
				for o = 1, 4, 1 do
					if L.IsMonument then
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
		L.IsEyes = true
	elseif T == "BackdoorLookman" then
		L.IsLookman = true
	end
end)
workspace.ChildRemoved:Connect(function(o)
	local T = o.Name
	if T == "Eyes" or T == "Lookman" then
		L.IsEyes = workspace:FindFirstChild("Eyes") ~= nil or workspace:FindFirstChild("Lookman") ~= nil
	elseif T == "BackdoorLookman" then
		L.IsLookman = workspace:FindFirstChild("BackdoorLookman") ~= nil
	end
end)
local ET = i.RenderStepped:Connect(function()
	if _Unloading then
		return
	end
	if L.InLobby then
		return
	end
	if p.FOVChanger and (p.FOVChanger.Value and l.FieldOfView) then
		R.FieldOfView = l.FieldOfView.Value
	end
	if J and not L.SurgeFrame then
		local o = J:FindFirstChild("SurgeVignette", true)
		if o then
			L.SurgeFrame = o
			if p.RemoveSurge and p.RemoveSurge.Value then
				o.Name = "SurgeVignette_Disabled"
			end
		end
	end
	local o = p.BypassMonument and (p.BypassMonument.Value and L.IsMonument)
	if o then
		fireMonumentLookAngle()
	else
		local o = (p.BypassEyes.Value and L.IsEyes) or (p.BypassLookman.Value and L.IsLookman)
		if o then
			local o = CurrentFloor
			if o == "Fools" or o == "OldHotel" then
				Z.MotorReplication:FireServer(0, (L.SpoofOffset == 200 and 65 or -65), 0, false)
			else
				Z.MotorReplication:FireServer(-650)
			end
		end
	end
end)
TPTranspParts = {}
local function collectThirdPersonParts()
	TableClear(TPTranspParts)
	if not b then
		return
	end
	for o, T in b:GetDescendants() do
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
function kT()
	if CameraConnection then
		CameraConnection:Disconnect()
		CameraConnection = nil
	end
	if _TPCharConn then
		_TPCharConn:Disconnect()
		_TPCharConn = nil
	end
	collectThirdPersonParts()
	if b then
		_TPCharConn = b.ChildAdded:Connect(refreshThirdPersonParts)
	end
	local o = RaycastParams.new()
	o.FilterType = Enum.RaycastFilterType.Exclude
	CameraConnection = i.RenderStepped:Connect(function()
		if _Unloading then
			return
		end
		if not b then
			return
		end
		o.FilterDescendantsInstances = { b }
		if l.ThirdPersonOffsetX and (l.ThirdPersonOffsetY and l.ThirdPersonOffsetZ) then
			local T =
				CFrame.new(l.ThirdPersonOffsetX.Value, l.ThirdPersonOffsetY.Value, l.ThirdPersonOffsetZ.Value)
			if p.ThirdPerson.Value then
				local k = ((R.CFrame * T)).Position - R.CFrame.Position
				local P = workspace:Spherecast(R.CFrame.Position, 0.2, k, o)
				if p.ThirdPersonWallCheck.Value and (P and P.Instance.CanCollide) then
					local o = R.CFrame.Position + k.Unit * P.Distance
					R.CFrame = CFrame.new(o, o + R.CFrame.LookVector)
				else
					R.CFrame = R.CFrame * T
				end
			end
		end
		for o, T in ipairs(TPTranspParts) do
			T.Transparency = p.ThirdPerson.Value and 0 or 1
			T.LocalTransparencyModifier = p.ThirdPerson.Value and 0 or 1
		end
	end)
end
L.LastCrouchFire = 0
local function restoreGodmodeCharacter()
	if not b or not B or not u then
		return
	end
	if b:GetAttribute("GodmodeSunk") and (CurrentFloor ~= "Fools" and CurrentFloor ~= "OldHotel") then
		u.CFrame = u.CFrame + Vector3.new(0, 2.346, 0)
		B.HipHeight = L.OriginalHipHeight or 2.396
		b:SetAttribute("GodmodeSunk", nil)
	end
	local o = b:FindFirstChild("LowerTorso")
	local T = o and o:FindFirstChild("Root")
	if T and L.OriginalC1 then
		T.C1 = L.OriginalC1
	end
	L.SpoofOffset = 0
	L.SkipGodmodeCrouchForce = true
	pcall(function()
		local o = Z and Z:FindFirstChild("Crouch")
		if o then
			o:FireServer(false, false)
		end
		if b then
			b:SetAttribute("Crouching", false)
		end
	end)
	L.SkipGodmodeCrouchForce = false
end
Connections.GodmodeEnforce = i.RenderStepped:Connect(function()
	if _Unloading then
		return
	end
	if not b or not B or not u then
		return
	end
	if not p or not p.Godmode then
		return
	end
	local o = H()
	local T = b:GetAttribute("GodmodeSunk") and true or false
	if o and not T then
		K()
	elseif not o and T then
		N()
	end
	if (o or (p.CrouchSpoof and p.CrouchSpoof.Value)) and (Z and Z:FindFirstChild("Crouch")) then
		Z.Crouch:FireServer(true, true)
	end
	if
		CurrentFloor ~= "Fools"
		and (CurrentFloor ~= "OldHotel" and not (R and R:FindFirstChild("MinecartRig")))
	then
		u.CanCollide = false
	end
	for o, T in b:GetChildren() do
		if T:IsA("BasePart") then
			T.CanCollide = false
		end
	end
	local k = b:FindFirstChild("Collision")
	local P = b:FindFirstChild("CollisionPart")
	local w = b:FindFirstChild("CollisionClone")
	if CurrentFloor == "OldHotel" or CurrentFloor == "Fools" then
		local T = o and (Functions.GetNearestEntity() and 200)
			or p.FigureGodmodeFools and (p.FigureGodmodeFools.Value and (Functions.GetNearestFigure() and 200))
			or 0
		L.SpoofOffset = T
		if k then
			k.Position = u.Position + Vector3.new(0, T, 0)
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
		u.CanCollide = not p.Noclip.Value
	else
		if k then
			k.CanCollide = false
			if k:FindFirstChild("CollisionCrouch") then
				k.CollisionCrouch.CanCollide = false
			end
		end
		if w and w:FindFirstChild("CollisionCrouch") then
			local T = o or Functions.IsCrouching()
			w.CanCollide = not (p.Noclip.Value or T)
			w.CollisionCrouch.CanCollide = not (p.Noclip.Value or not T)
		elseif w then
			w.CanCollide = not (p.Noclip.Value or o or Functions.IsCrouching())
		else
			u.CanCollide = not p.Noclip.Value
		end
		local T = b:FindFirstChild("LowerTorso")
		local F = T and T:FindFirstChild("Root")
		if F and L.OriginalC1 then
			F.C1 = L.OriginalC1 * CFrame.new(0, o and -2.346 or 0, 0)
		end
		local A = o and 2.328 or 0.18
		if k then
			k.Position = u.Position + Vector3.new(0, A, 0)
		end
		if P then
			P.Position = u.Position + Vector3.new(0, A, 0)
		end
		if k and (k:FindFirstChild("CollisionCrouch") and (w and w:FindFirstChild("CollisionCrouch"))) then
			local T = o and 1.328 or -0.982
			k.CollisionCrouch.Position = u["\154\146\1804{\169\214q"] + Vector3.new(0, T, 0)
			w.CollisionCrouch.CollisionGroup = k.CollisionCrouch.CollisionGroup
		end
		if w and w:FindFirstChild("CollisionCrouch") then
			w.CollisionCrouch.Position = u.Position + Vector3.new(0, o and 0.75 or -0.982, 0)
		end
	end
	if w and k then
		w.CollisionGroup = k.CollisionGroup
		w.Position = u.Position + Vector3.new(0, o and 1.75 or 0.18, 0)
	end
	local F = Z and Z:FindFirstChild("Crouch")
	if F and (t and tick() - L.LastCrouchFire > 0.1) then
		local T = o or Functions.IsCrouching()
		if p.CrouchSpoof and p.CrouchSpoof.Value then
			T = true
		end
		F:FireServer(T and true or false, true)
		L.LastCrouchFire = tick()
	end
	local A = o or Functions.IsCrouching()
	if p.CrouchSpoof and p.CrouchSpoof.Value then
		A = true
	end
	if b:GetAttribute("Crouching") ~= A then
		b:SetAttribute("Crouching", A)
	end
end)
VulnerableLastY = nil
VulnerableNotifCooldown = 0
Functions.IsCrouching = function()
	if CurrentFloor == "Fools" or CurrentFloor == "OldHotel" then
		return b:GetAttribute("Crouching")
	end
	return t.CollisionGroup == "PlayerCrouching"
end
ESP_FIGURE_NAMES = { ["FigureRig"] = true, ["FigureRagdoll"] = true, ["Figure"] = true }
Functions.GetNearestFigure = function()
	local o = { ["Distance"] = math.huge, ["Object"] = nil }
	for T, k in wT.Entities do
		if k:IsA("Model") and (k.PrimaryPart and ESP_FIGURE_NAMES[k.Name]) then
			local T = a:DistanceFromCharacter(k.PrimaryPart.Position)
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
	if not b then
		return
	end
	for o, T in b:GetDescendants() do
		if T:IsA("BasePart") then
			table.insert(Phase.Parts, T)
		end
	end
end
function PT()
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
	if p.Phase.Value then
		collectPhaseParts()
		if b then
			Phase.CharConn = b.ChildAdded:Connect(function()
				task.wait()
				collectPhaseParts()
			end)
		end
		Phase.Connection = i.Stepped:Connect(function()
			if not b then
				return
			end
			for o, T in ipairs(Phase.Parts) do
				if T then
					T.CanCollide = false
				end
			end
			if t then
				t.CanCollide = false
				local o = t:FindFirstChild("CollisionCrouch")
				if o then
					o.CanCollide = false
				end
			end
			local o = b:FindFirstChild("CollisionClone")
			if o then
				o.CanCollide = false
				local T = o:FindFirstChild("CollisionCrouch")
				if T then
					T.CanCollide = false
				end
			end
			if u and (B and (R and Phase.Body)) then
				local o = Vector3.zero
				local T = B.MoveDirection
				if T.Magnitude > 0 then
					local k = R.CFrame.LookVector
					local P = R.CFrame.RightVector
					local w = T:Dot(k)
					local F = T:Dot(P)
					o = k * w + P * F
				end
				if D:IsKeyDown(Enum.KeyCode.Space) then
					o = o + Vector3.yAxis
				end
				if D:IsKeyDown(Enum.KeyCode.LeftControl) then
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
		if u then
			Phase.Body.Parent = u
		end
	elseif not p.Noclip.Value then
		collectNoclipParts()
		setNoclipPartsCollision(true)
	end
end
p.Phase:OnChanged(PT)
p.AnticheatManipulation:OnChanged(function(o)
	if AnticheatConnection then
		AnticheatConnection:Disconnect()
		AnticheatConnection = nil
	end
	if o then
		AnticheatConnection = i.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if not b or not u then
				return
			end
			local o = a:GetAttribute("CurrentFloor") or ""
			if o ~= "Fools" and o ~= "OldHotel" then
				b:PivotTo(b:GetPivot() * CFrame.new(0, 0, 750))
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
		["\188\020\176\180)\000\131\252\250\253\001"] = true,
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
	["GrumbleR\012\159"] = true,
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
	["Wardrobe-FOOn:&\172"] = true,
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
		if not l.AutoInteractIgnoreList.Value["Archives Lockers"] then
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
		or o:FindFirstAncestor("Stems" .. a.Name)
	then
		return
	end
	local T = x and (x:FindFirstChild("50") and (x:FindFirstChild("50")):FindFirstChild("Door"))
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
		if l.AutoInteractIgnoreList.Value.Locks then
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
	local P = l.AutoInteractIgnoreList.Value
	if P then
		local T = o.Parent
		for o = 1, 3, 1 do
			if T and (AutoInteractSkipNames[T.Name] and P[T.Name]) then
				return
			end
			T = T and T.Parent
		end
	end
	if o.Parent.Name == "GlitchCube" and l.AutoInteractIgnoreList.Value["Glitch Fragments"] then
		return
	end
	local w = o
	if l.AutoInteractIgnoreList.Value.Mandrake then
		while w do
			local o = w.Name
			if o == "MandrakeLive" or o == "MandrakeHole" or o == "Mandrakes" then
				return
			end
			w = w.Parent
		end
	end
	local F = workspace:FindFirstChild("Drops")
	if F and (o:IsDescendantOf(F) and l.AutoInteractIgnoreList.Value["Dropped Items"]) then
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
	if z() == "OldHotel" then
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
			local T = o["Parem\196"]
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
p.AutoInteract:OnChanged(function(o)
	if Pd.Connection then
		Pd.Connection:Disconnect()
		Pd.Connection = nil
	end
	if o then
		Pd.Connection = i.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			local o = p and (p.AutoInteract and p.AutoInteract.Value)
				or l and (l.AutoInteractKeybind and l.AutoInteractKeybind:GetState())
			if not o then
				return
			end
			local T = tick()
			if T - Pd.LastFire < 0.1 then
				return
			end
			Pd.LastFire = T
			local k = a:GetAttribute("CurrentRoom")
			local P = tonumber(k)
			local w = a.Character
			local F = w and w:FindFirstChildOfClass("Humanoid")
			local A = w and w:FindFirstChild("HumanoidRootPart")
			if not A then
				return
			end
			local d = p.PromptReach and p.PromptReach.Value
			local C = l.PromptRange and l.PromptRange.Value or 1
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
							local d = (T:GetAttribute("MaxActivationDistance_Old") or T.MaxActivationDistance)
								+ 5
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
function oT()
	if InfiniteJumpConnection then
		InfiniteJumpConnection:Disconnect()
		InfiniteJumpConnection = nil
	end
	if not p.InfiniteJumps.Value then
		return
	end
	InfiniteJumpConnection = D.InputBegan:Connect(function(o)
		if o.KeyCode == Enum.KeyCode.Space and B then
			B:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
end
p.InfiniteJumps:OnChanged(oT)
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
	if not q or not o then
		return
	end
	for T, k in ipairs(TRACER_CATEGORIES) do
		local P = k .. "Tracers"
		if p[P] and (p[P].Value and TableFind(ESPCategories[k], o)) then
			q:SetTracersEnabled(o, true)
			break
		end
	end
end
function ForcePurgeESP(o)
	if not o or not q then
		return
	end
	pcall(function()
		for o, T in ipairs(q.ConnectionsTable[o] or {}) do
			if T then
				pcall(function()
					T:Disconnect()
				end)
			end
		end
		q.ConnectionsTable[o] = nil
		local T = q.Highlights and q.Highlights[o]
		if T then
			T:Destroy()
			q.Highlights[o] = nil
		end
		local k = q.Frames and q.Frames[o]
		if k then
			k:Destroy()
			q.Frames[o] = nil
		end
		local P = q.Lines and q.Lines[o]
		if P then
			if P[1] then
				P[1]:Destroy()
			end
			if P[2] then
				P[2]:Destroy()
			end
			q.Lines[o] = nil
		end
		local w = q.ArrowsTable and q.ArrowsTable[o]
		if w then
			w:Destroy()
			q.ArrowsTable[o] = nil
		end
		if q.Labels then
			q.Labels[o] = nil
		end
		if q.ColorTable then
			q.ColorTable[o] = nil
		end
		if q.TextTable then
			q.TextTable[o] = nil
		end
		if q.ElementsEnabled then
			q.ElementsEnabled[o] = nil
		end
		if q["Transparency<\215\199\\\020&\173"] then
			q.TransparencyEnabled[o] = nil
		end
		if q.Objects then
			q.Objects[o] = nil
		end
		if q.TracersEnabled then
			q.TracersEnabled[o] = nil
		end
		for T = #q.TotalObjects, 1, -1 do
			if q.TotalObjects[T] == o then
				table.remove(q.TotalObjects, T)
				break
			end
		end
	end)
	pcall(function()
		q:SetTracersEnabled(o, false)
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
	if not q then
		return
	end
	local o = {}
	for T in pairs(RoomESPMap) do
		o[#o + 1] = T
	end
	local T = tonumber(a:GetAttribute("CurrentRoom"))
	for o, k in ipairs(o) do
		local P = RoomESPMap[k]
		if P then
			if q.ColorTable and q.ColorTable[k] then
				P.Color = q.ColorTable[k]
			end
			local o = tonumber(k:GetAttribute("ParentRoom"))
			if o == T or (ESPDoorSet[k] and o == T + 1) then
				q:AddESP(P)
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
	RoomESPConnection = (a:GetAttributeChangedSignal("CurrentRoom")):Connect(refreshRoomESP)
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
		local T = tonumber(a:GetAttribute("CurrentRoom"))
		local P = tonumber(k:GetAttribute("ParentRoom"))
		if P == T or (ESPDoorSet[k] and P == T + 1) then
			q:AddESP(o)
			enableCategoryTracers(k)
		end
		RoomESPMap[k] = o
		watchRoomForESP()
		k.Destroying:Once(function()
			ForcePurgeESP(k)
		end)
	else
		q:AddESP(o)
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
	if q then
		q:RemoveESP(o)
		q:SetTracersEnabled(o, false)
	end
end
local Cd = {
	["Door"] = true,
	["Ladder"] = true,
	["GoldPile"] = true,
	["StardustPickup"] = true,
	["KeyObtain"] = true,
	["Elec~A\163\236\017\140\154l\128Vi+$\244\019"] = true,
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
	["Backdoor_Wardrob"] = true,
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
	["Green_He&"] = true,
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
	["RiftCandle"] = "L\146\1469\018YEkw#FD;kF\012",
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
	local F = P and p[P]
	if not F or not F.Value then
		return
	end
	local A = w and l[w]
	if not A then
		return
	end
	local d = A.Value
	local C = (p.ESPShowText and p.ESPShowText.Value) and k or ""
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
	if not p.NotifyItems.Value then
		return
	end
	local P = l.ItemList.Value
	if P and (next(P) ~= nil and not P[o]) then
		return
	end
	if rd.ActiveItem >= 6 then
		return
	end
	rd.ActiveItem = rd["ActiveItߩ"] + 1
	rd.PlaySound("ItemNotifySound")
	local w = l.ItemNotifyStyle.Value
	local F = ""
	if k and k.PrimaryPart then
		F = " (" .. (math.floor(a:DistanceFromCharacter(k.PrimaryPart.Position) + 0.5) .. " m)")
	end
	T:Notify({ ["Title"] = "An item has spawned", ["Description"] = o .. F, ["Time"] = 4 })
	if w ~= "Obsidian" then
		task.spawn(function()
			rd.ShowAchievement("An item has spawned", o, F)
		end)
	end
	if p.ItemChatToggle.Value then
		Functions.SendChat(o .. (" " .. l.ItemChatMessage.Value))
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
	["\190\014\214\194e\211\168\129Uxl\164\150\177"] = "Locked Chest",
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
		local A = i.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if o:FindFirstChild("Door") and o:FindFirstChild("ClientOpen") then
				if
					l
					and (
						l.DoorReachDistance
						and (
							a:DistanceFromCharacter(o.Door.Position) < l.DoorReachDistance.Value
							and (tick() - F > 0.1 and (p and (p.DoorReachToggle and p.DoorReachToggle.Value)))
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
			if o:IsDescendantOf(a:WaitForChild("Backpack")) then
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
			if o.PrimaryPart and a:DistanceFromCharacter(o.PrimaryPart.Position) >= 10000 then
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
			if q and q.ObjectMaxDistance then
				q.ObjectMaxDistance[o] = 10000
			end
			if p.EntitiesESP.Value then
				local k = (T == "FigureRig" or T == "FigureRagdoll") and "Figure"
					or (EntityNotifyData[T] and EntityNotifyData[T].Alias or T)
				local P = l.EntitiesESPAllowed and l.EntitiesESPAllowed.Value
				if not P or next(P) == nil or P[k] then
					if T == "NoiseModel" then
						task.wait(7)
						if _Unloading then
							return
						end
						if not o or not o.Parent then
							return
						end
						if not (p.EntitiesESP and p.EntitiesESP.Value) then
							return
						end
						local T = l.EntitiesESPAllowed and l.EntitiesESPAllowed.Value
						if not T or next(T) == nil or T[k] then
							Functions.AddESP(
								{ ["Object"] = o, ["Text"] = k, ["Color"] = l.EntitiesESPColor.Value },
								o:GetAttribute("ParentRoom") ~= nil
							)
						end
					else
						local T = o:GetAttribute("ParentRoom") ~= nil
						Functions.AddESP(
							{ ["Object"] = o, ["Text"] = k, ["Color"] = l.EntitiesESPColor.Value },
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
		if not o:IsDescendantOf(a) and o.Parent.Name ~= "Drops" then
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
	elseif T == "Toolshed\004\011\001\150\204f" then
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
	local k = l[T].Value
	local P = p.ESPShowText.Value
	local w = p[o .. "Tracers"] and p[o .. "Tracers"].Value
	local F = o == "Entities" and (l.EntitiesESPAllowed and l.EntitiesESPAllowed.Value)
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
					q:SetTracersEnabled(T, true)
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
		if not (p.ObjectivesESP and p.ObjectivesESP.Value) then
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
if x then
	for o, T in ipairs(x:GetChildren()) do
		HonchoScanBoxesRoom(T)
	end
	if not HonchoBoxesConn then
		HonchoBoxesConn = x.ChildAdded:Connect(function(o)
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
	Groupboxes.Visuals_ESP:AddToggle(k, { ["Text"] = T, ["Default"] = false })
	p[k]:AddColorPicker(P, { ["Text"] = T, ["Default"] = F[o] })
	p[k]:OnChanged(function(T)
		if T then
			refreshCategoryESP(o)
		else
			removeCategoryESP(o)
		end
	end)
	l[P]:OnChanged(function(T)
		for k, P in ipairs(ESPCategories[o]) do
			local w = GetESPTarget(P, o)
			if q.ColorTable and q.ColorTable[w] then
				q:UpdateObjectColor(w, T)
			end
		end
	end)
end
Groupboxes.Visuals_ESPBox = rT.Visuals:AddLeftTabbox("ESP / Settings")
Groupboxes.Visuals_ESP = Groupboxes.Visuals_ESPBox:AddTab("ESP")
Groupboxes.Visuals_Settings = Groupboxes.Visuals_ESPBox:AddTab("Settings")
setupCategoryESP("Entities", "Entities")
Groupboxes.Visuals_ESP:AddDropdown(
	"EntitiesESPAllowed",
	{
		["Text"] = "Allowed Entities",
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
			"GloombatN\143\197\027\225(",
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
		["AllowNull"] = true,
		["Tooltip"] = "Only show ESP for selected entities (leave empty to show all)",
	}
)
setupCategoryESP("Doors", "Doors")
setupCategoryESP("Objectives", "Objectives")
setupCategoryESP("Items", "Items")
setupCategoryESP("Chests", "Chests")
setupCategoryESP("HidingSpots", "Hiding Spots")
Groupboxes.Visuals_ESP:AddToggle("PlayersESP", { ["Text"] = "Players", ["Default"] = false })
p.PlayersESP:AddColorPicker(
	"PlayersESPColor",
	{ ["Text"] = "Players", ["Default"] = Color3.fromRGB(255, 255, 255) }
)
local id = {}
local function refreshPlayersESP()
	for o, T in ipairs(id) do
		q:RemoveESP(T)
		local k = ESPCleanup[T]
		if k then
			k:Disconnect()
			ESPCleanup[T] = nil
		end
	end
	for o = #id, 1, -1 do
		id[o] = nil
	end
	if not p.PlayersESP.Value then
		return
	end
	for o, T in M:GetPlayers() do
		if T ~= a then
			local o = T.Character
			if o then
				local k = o:FindFirstChild("HumanoidRootPart") or o:FindFirstChildOfClass("BasePart")
				if k then
					local k = o:FindFirstChildOfClass("Humanoid")
					local P = T.Name .. (k and " [" .. (math.floor(k.Health) .. " HP]") or "")
					q:AddESP({ ["Object"] = o, ["Text"] = P, ["Color"] = l.PlayersESPColor.Value })
					local w = o.Destroying:Once(function()
						q:RemoveESP(o)
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
	if o == a then
		return
	end
	local T = o.CharacterAdded:Connect(function(T)
		task.wait(0.5)
		if p.PlayersESP and (p.PlayersESP.Value and T) then
			local k = T:FindFirstChild("HumanoidRootPart") or T:FindFirstChildOfClass("BasePart")
			if k then
				local k = T:FindFirstChildOfClass("Humanoid")
				local P = o.Name .. (k and " [" .. (math.floor(k.Health) .. " HP]") or "")
				q:AddESP({ ["Object"] = T, ["Text"] = P, ["Color"] = l.PlayersESPColor.Value })
				local w = T.Destroying:Once(function()
					q:RemoveESP(T)
					ESPCleanup[T] = nil
				end)
				ESPCleanup[T] = w
				table.insert(id, T)
			end
		end
	end)
	table.insert(Connections, T)
end
p.PlayersESP:OnChanged(function(o)
	if o then
		refreshPlayersESP()
	else
		refreshPlayersESP()
	end
end)
l.PlayersESPColor:OnChanged(function(o)
	for T, k in ipairs(id) do
		q:UpdateObjectColor(k, o)
	end
end)
M.PlayerAdded:Connect(watchPlayerESP)
for o, T in M:GetPlayers() do
	if T ~= a then
		watchPlayerESP(T)
	end
end
refreshPlayersESP()
Groupboxes.Visuals_ESP:AddToggle(
	"ESPFade",
	{
		["Text"] = "ESP Fade",
		["Default"] = false,
		["Tooltip"] = "Enables smooth fading effect on ESP highlights",
	}
)
Groupboxes.Visuals_ESP:AddSlider(
	"ESPFadeTime",
	{
		["Text"] = "Fade Time",
		["Min"] = 0,
		["Max"] = 1,
		["Default"] = 0.25,
		["Rounding"] = 2,
		["Compact"] = true,
		["Suffix"] = "s",
	}
)
Groupboxes.Visuals_ESP:AddToggle(
	"ESPArrowsToggle",
	{
		["Text"] = "Enable Arrows",
		["Default"] = false,
		["Tooltip"] = "Shows arrows that point to off-screen objects",
	}
)
Groupboxes.Visuals_ESP:AddSlider(
	"ESPArrowsRadius",
	{
		["Text"] = "Arrow Radius",
		["Min"] = 100,
		["Max"] = 500,
		["Default"] = 250,
		["Rounding"] = 0,
		["Compact"] = true,
		["Suffix"] = " px",
	}
)
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
	while T and T ~= x do
		if EntityPathContainers[T] or isEntityPathNode(T) then
			return true
		end
		T = T.Parent
	end
	return false
end
function RebuildEntityPath()
	ClearEntityPath()
	if not p.ShowEntityPath or not p.ShowEntityPath.Value then
		return
	end
	if not x then
		return
	end
	for o, T in ipairs(x:GetDescendants()) do
		if isEntityPathNode(T) then
			WatchEntityPathContainer(T)
		elseif T:IsA("BasePart") and InEntityPathContainer(T) then
			ApplyEntityPath(T)
		end
	end
	Connections.EntityPathWatch = x.DescendantAdded:Connect(function(o)
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
Groupboxes.Visuals_ESP:AddToggle("ShowEntityPath", {
	["Text"] = "Show Entity Path",
	["Default"] = false,
	["Tooltip"] = "Shows the pathfind nodes entities follow in each room",
	["Callback"] = function(o)
		RebuildEntityPath()
	end,
})
if p.ShowEntityPath and p.ShowEntityPath.Value then
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
	if LobbyFlyState["FlyK\228\197)s\251\219"] then
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
	local o = b and b:FindFirstChildOfClass("Humanoid")
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
	if not b then
		return
	end
	local o = b:FindFirstChildOfClass("Humanoid")
	if not o then
		return
	end
	local T = o.RootPart or b:FindFirstChild("HumanoidRootPart") or b:FindFirstChildOfClass("Part")
	if not T then
		return
	end
	stopLobbyFly()
	local k = LobbyFlyState
	k.Flying = true
	k.Control = { ["F"] = 0, ["B"] = 0, ["L"] = 0, ["R"] = 0, ["Q"] = 0, ["E"] = 0 }
	k.LastControl = { ["F"] = 0, ["B"] = 0, ["L"] = 0, ["R"] = 0, ["Q"] = 0, ["E"] = 0 }
	k.Speed = 0
	k.SpeedCoeff = (l.LobbyFlySpeed and l.LobbyFlySpeed.Value or 35) / 50
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
	k.FlyKeyDown = D.InputBegan:Connect(function(o, T)
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
	k.FlyKeyUp = D.InputEnded:Connect(function(o, T)
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
	local o = dT:AddTab("LobbyMain", "house")
	Jd.MainTab = o
	Jd.MainButton = d(o)
	local k = C(o)
	if k then
		k.Text = "Main"
	end
	if Jd.MainButton then
		Jd.MainButton.Visible = false
	end
	local P = o:AddLeftGroupbox("Stuff")
	P:AddButton({
		["Text"] = "Free Outdoors",
		["Callback"] = function()
			local o = Z and Z:FindFirstChild("CreateElevator")
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
	})
	P:AddLabel({
		["Text"] = '<font size="14">This puts you into a game of outdoors, but with the admin panel modifier, meaning that it is free, but you can not get any achievements/progress.</font>',
		["DoesWrap"] = true,
	})
	P:AddDivider()
	P:AddToggle(
		"AutoJoinElevator",
		{
			["Text"] = "Auto Join Elevator",
			["Default"] = false,
			["Tooltip"] = "Automatically joins the selected player's elevator.",
		}
	)
	P:AddDropdown(
		"AutoJoinElevatorTarget",
		{
			["Text"] = "Target",
			["SpecialType"] = "Player",
			["ExcludeLocalPlayer"] = true,
			["Searchable"] = true,
		}
	)
	P:AddButton({
		["Text"] = "Redeem All Codes",
		["Callback"] = function()
			if L.RedeemingCodes then
				return
			end
			T:Notify({ ["Title"] = "Redeeming " .. (#L.CodesList .. " codes."), ["Time"] = 5 })
			L.RedeemingCodes = true
			for o, T in ipairs(L.CodesList) do
				local k = Z and Z:FindFirstChild("ShopCode")
				if k then
					k:FireServer(T)
				end
				task.wait(5.1)
			end
			L.RedeemingCodes = false
		end,
	})
	local w = o:AddRightGroupbox("Other stuff")
	w:AddToggle("LobbyNoclip", { ["Text"] = "Noclip", ["Default"] = false })
	p.LobbyNoclip:OnChanged(function(o)
		if Jd.NoclipConn then
			Jd.NoclipConn:Disconnect()
		end
		if o and b then
			for o, T in b:GetDescendants() do
				if T:IsA("BasePart") then
					T.CanCollide = false
				end
			end
			Jd.NoclipConn = b.ChildAdded:Connect(function(o)
				task.wait()
				if o:IsA("BasePart") then
					o.CanCollide = false
				end
			end)
		end
	end)
	w:AddToggle("LobbyFly", { ["Text"] = "Fly", ["Default"] = false })
	p.LobbyFly:OnChanged(function(o)
		if o then
			startLobbyFly()
		else
			stopLobbyFly()
		end
	end)
	w:AddSlider(
		"LobbyFlySpeed",
		{
			["Text"] = "Fly Speed",
			["Min"] = 25,
			["Max"] = 150,
			["Default"] = 35,
			["Rounding"] = 0,
			["Compact"] = true,
		}
	)
	l.LobbyFlySpeed:OnChanged(function()
		LobbyFlyState.SpeedCoeff = (l.LobbyFlySpeed and l.LobbyFlySpeed.Value or 35) / 50
	end)
end
local bd = { "Main", "Visuals", "Exploits", "Miscellaneous", "Mines", "Archives", "Settings" }
local function refreshCurrentFloor()
	local o = z()
	if o == CurrentFloor then
		return
	end
	CurrentFloor = o
	if L.RefreshAddonFloors then
		L.RefreshAddonFloors()
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
		L.InLobby = true
		Jd.MainTab()
		if rT.Home then
			rT.Home:SetVisible(true)
		end
		for o, T in ipairs(bd) do
			local k = rT[T]
			if k then
				k:SetVisible(false)
			end
		end
		if Jd.MainButton then
			Jd.MainButton.Visible = true
		end
		if not f(rT.Home) and not f(Jd.MainTab) then
			rT.Home:Show()
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
			"RemoveSul\159\001",
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
			local k = p[T]
			if k and k.Value then
				k:SetValue(false)
			end
		end
		if not L.LobbyGuardConnection then
			L.LobbyGuardConnection = (game:GetService("RunService")).Heartbeat:Connect(function()
				if _Unloading then
					return
				end
				if not L.InLobby then
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
					local k = p[T]
					if k and k.Value then
						k:SetValue(false)
					end
				end
				if p.AutoJoinElevator and p.AutoJoinElevator.Value then
					local o
					if typeof(l.AutoJoinElevatorTarget.Value) == "Instance" then
						o = l.AutoJoinElevatorTarget.Value.Character
					elseif typeof(l.AutoJoinElevatorTarget.Value) == "string" then
						o = ((game:GetService("Players")):FindFirstChild(l.AutoJoinElevatorTarget.Value)).Character
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
								if Z and Z:FindFirstChild("ElevatorJoin") then
									Z.ElevatorJoin:FireServer(P)
								end
							end
						end
					end
					if not T and (Z and Z:FindFirstChild("ElevatorExit")) then
						Z.ElevatorExit:FireServer()
					end
				end
			end)
		end
		if rT.FoolsHotel then
			rT.FoolsHotel:SetVisible(false)
		end
		if rT.Rooms then
			rT.Rooms:SetVisible(false)
		end
		if rT.Stairwell then
			rT.Stairwell:SetVisible(false)
		end
		return
	end
	L.InLobby = false
	if L.LobbyGuardConnection then
		L.LobbyGuardConnection:Disconnect()
		L.LobbyGuardConnection = nil
	end
	if Jd.MainTab then
		if Jd.MainButton then
			Jd.MainButton.Visible = false
		end
		if p.LobbyNoclip then
			p.LobbyNoclip:SetValue(false)
		end
		if p.LobbyFly then
			p.LobbyFly:SetValue(false)
		end
		if f(Jd.MainTab) then
			rT.Home:Show()
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
	if l.SpamBuyCount then
		pcall(function()
			l.SpamBuyCount:SetDisabled(r)
		end)
	end
	if l.SpamBuyItems then
		pcall(function()
			l.SpamBuyItems:SetDisabled(r)
		end)
	end
	if k and l.SpamBuyItems then
		local o = { "Lockpick", "Lighter", "Flashlight", "Vitamins" }
		if A then
			table.insert(o, "Crucifix")
			table.insert(o, "Skeleton Key")
		end
		pcall(l.SpamBuyItems.SetValues, l.SpamBuyItems, o)
	elseif P and l.SpamBuyItems then
		pcall(
			l.SpamBuyItems.SetValues,
			l.SpamBuyItems,
			{ "Straplight", "Bulklight", "BandagePack", "Lockpick" }
		)
	end
	if p.ShowCrucifix then
		pcall(function()
			p.ShowCrucifix:SetDisabled(not A)
		end)
	end
	if p.ShowSkeletonKey then
		pcall(function()
			p.ShowSkeletonKey:SetDisabled(not A)
		end)
	end
	local G = not (k or (type(o) == "string" and o:find("Fools")))
	if p.AutoUnlockPadlockToggle then
		pcall(function()
			p.AutoUnlockPadlockToggle:SetDisabled(G)
		end)
	end
	if p.AutoBreakerBox then
		pcall(function()
			p.AutoBreakerBox:SetDisabled(G)
		end)
	end
	if p.AutoLibraryBruteForce then
		pcall(function()
			p.AutoLibraryBruteForce:SetDisabled(G)
		end)
	end
	if p.HotelAutoWalk then
		pcall(function()
			p.HotelAutoWalk:SetDisabled(not k)
		end)
	end
	if l.HotelAutoWalkMethod then
		pcall(function()
			l.HotelAutoWalkMethod:SetDisabled(not k)
		end)
	end
	if p.HotelShowPath then
		pcall(function()
			p.HotelShowPath:SetDisabled(not k)
		end)
	end
	if l["HotelPat\245\027\189\159U\253G'\031)/\014"] then
		pcall(function()
			l.HotelPathfindTimeout:SetDisabled(not k)
		end)
	end
	if p.OrbitItems then
		pcall(function()
			p.OrbitItems:SetDisabled(F)
		end)
	end
	if rT.Mines then
		rT.Mines:SetVisible(P)
	end
	for o, T in ipairs(bd) do
		if T ~= "Mines" and T ~= "Archives" then
			local o = rT[T]
			if o then
				o:SetVisible(true)
			end
		end
	end
	if rT.Mines and (not P and f(rT.Mines)) then
		rT.Home:Show()
	end
	if rT.FoolsHotel then
		if F or A then
			rT.FoolsHotel:SetVisible(true)
			if rT.FoolsHotel.TabLabelRef then
				rT.FoolsHotel.TabLabelRef.Text = F and "Fools" or "Hotel-/Fools"
			end
			local o = F
			for T, k in ipairs(Groupboxes.SubfloorsFools.Elements) do
				if T <= 5 then
					k.Holder.Visible = o
				end
			end
		else
			if f(rT.FoolsHotel) then
				rT.Home:Show()
			end
			rT.FoolsHotel:SetVisible(false)
		end
	end
	if rT.Garden then
		if w then
			rT.Garden:SetVisible(true)
		else
			if f(rT.Garden) then
				rT.Home:Show()
			end
			rT.Garden:SetVisible(false)
		end
	end
	if rT.Rooms then
		if d then
			rT.Rooms:SetVisible(true)
		else
			if f(rT.Rooms) then
				rT.Home:Show()
			end
			rT.Rooms:SetVisible(false)
		end
	end
	if rT.Archives then
		if C then
			rT.Archives:SetVisible(true)
		else
			if f(rT.Archives) then
				rT.Home:Show()
			end
			rT.Archives:SetVisible(false)
		end
	end
	if rT.Stairwell then
		if m then
			rT.Stairwell:SetVisible(true)
		else
			if f(rT.Stairwell) then
				rT.Home:Show()
			end
			rT.Stairwell:SetVisible(false)
		end
	end
	if p.LaddersESP and p.LaddersESP.Value then
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
			local k = P:FindFirstChild("\030\021n\175\020#")
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
Groupboxes.ArchivesMain = rT.Archives:AddLeftGroupbox("Archives")
Groupboxes.ArchivesMain:AddToggle(
	"AntiDrone",
	{
		["Text"] = "Anti Drone",
		["Default"] = false,
		["Tooltip"] = "Prevents you from bumping/falling over when walking into (singular) drones",
		["Disabled"] = not hasHookMeta,
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.ArchivesMain:AddToggle(
	"DisableDroneStampede",
	{
		["Text"] = "Disable Drone Stampede (FE)",
		["Default"] = false,
		["Tooltip"] = "Disables the drone stampede from spawning FE",
	}
)
p.DisableDroneStampede:OnChanged(function(o)
	if o and not L.DisableDroneStampedeRunning then
		L.DisableDroneStampedeRunning = true
		task.spawn(function()
			while not _Unloading and (p.DisableDroneStampede and p.DisableDroneStampede.Value) do
				local o = GetLatestClock()
				local T = o and o:FindFirstChild("LookedAtRemote")
				if T then
					pcall(function()
						T:FireServer()
					end)
				end
				task.wait(0.5)
			end
			L.DisableDroneStampedeRunning = false
		end)
	end
end)
Groupboxes.ArchivesMain:AddToggle(
	"DroneTimer",
	{
		["Text"] = "Drone Stampede Timer",
		["Default"] = false,
		["Tooltip"] = "Notifies you 60s and 30s before the 05:00 and 09:00 drone stampede",
	}
)
p.DroneTimer:OnChanged(function(o)
	if o and not L.DroneTimerRunning then
		L.DroneTimerRunning = true
		task.spawn(function()
			local o = {}
			while not _Unloading and (p.DroneTimer and p.DroneTimer.Value) do
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
									T:Notify({
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
									T:Notify({
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
			L.DroneTimerRunning = false
		end)
	end
end)
Groupboxes.ArchivesMain:AddToggle(
	"NoAlmaDamage",
	{
		["Text"] = "Anti Alma",
		["Default"] = false,
		["Tooltip"] = "Prevents alma from ever interacting with you/you can look at her freely",
	}
)
p.NoAlmaDamage:OnChanged(function(o)
	if o and not L.NoAlmaDamageRunning then
		L.NoAlmaDamageRunning = true
		local function o(o)
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
		local function T(T)
			if T:IsA("Model") and T.Name == "Alma" then
				o(T)
			end
		end
		Connections.NoAlmaDamage = workspace["Chil!\140\250f\133\000"]:Connect(T)
		for o, k in ipairs(workspace:GetChildren()) do
			T(k)
		end
	elseif not o then
		L.NoAlmaDamageRunning = false
		if Connections.NoAlmaDamage then
			Connections.NoAlmaDamage:Disconnect()
			Connections.NoAlmaDamage = nil
		end
	end
end)
Groupboxes.ArchivesMain:AddToggle(
	"AntiElectricPuddle",
	{
		["Text"] = "Anti Electric Puddle",
		["Default"] = false,
		["Tooltip"] = "Prevents you from getting damaged from electric puddles",
	}
)
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
	if not p.AntiElectricPuddle or not p.AntiElectricPuddle.Value then
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
p.AntiElectricPuddle:OnChanged(function(o)
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
	local P = tonumber(Q and Q.Value) or 0
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
Groupboxes.ArchivesMain:AddToggle(
	"AntiRansom",
	{
		["Text"] = "Anti Ransom",
		["Default"] = false,
		["Tooltip"] = "Prevents ransom from attacking you even when moving",
		["Disabled"] = not (
				Executor.hookmetamethod and (Executor.newcclosure and Executor.getnamecallmethod)
			),
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.ArchivesMain:AddToggle(
	"AntiScribbles",
	{
		["Text"] = "No Scribbles Damage",
		["Default"] = false,
		["Tooltip"] = "Prevents scribbles from damaging you",
		["Disabled"] = not (
				Executor.hookmetamethod and (Executor.newcclosure and Executor.getnamecallmethod)
			),
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.ArchivesMain:AddToggle(
	"ArchiveChairFly",
	{
		["Text"] = "Chair Anticheat Bypass",
		["Default"] = false,
		["Tooltip"] = "Allows you to bypass the anticheat by flying on a chair, allowing you to noclip and fly freely, drag an office chair, then sit in it and press the 'Start Bypass' button",
	}
)
Groupboxes.ArchivesMain:AddSlider(
	"ArchiveChairFlySpeed",
	{ ["Text"] = "Chair Speed", ["Min"] = 15, ["Max"] = 150, ["Default"] = 55, ["Rounding"] = 0 }
)
Groupboxes.ArchivesMain:AddButton({
	["Text"] = "Start Bypass",
	["Tooltip"] = "Press this AFTER you have dragged the chair and sat in it, shift to go down and ctrl and then space to exit (or just turn off the toggle)",
	["Callback"] = function()
		if not p.ArchiveChairFly.Value then
			p.ArchiveChairFly:SetValue(true)
		end
		startChairFly()
	end,
})
p.ArchiveChairFly:OnChanged(function()
	if not p.ArchiveChairFly.Value then
		StopChairBypass()
	end
end)
local gd = nil
local Wd = false
local pd = {}
local ld = {}
Groupboxes.ArchivesMain:AddToggle(
	"ForgetMeNotSolver",
	{
		["Text"] = "Auto Skip ForgetMeNot",
		["Default"] = false,
		["Tooltip"] = "Automatically skips the ForgetMeNot minigame",
	}
)
p.ForgetMeNotSolver:OnChanged(function(o)
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
	local function k()
		return game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
	end
	local function P(o)
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
	local function w(o)
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
	local function F(o)
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
		w(o)
		local F = P(tonumber(o.Name))
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
				T:Notify({
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
			local o = k()
			if o then
				if d:IsA("BasePart") then
					o:PivotTo(d.CFrame)
				elseif d:IsA("Model") then
					o:PivotTo(d:GetPivot())
				end
			end
			pcall(function()
				A["Clie\213B\224\247\141\206"]:Fire()
			end)
			pcall(function()
				A.ClientOpen:FireServer()
			end)
			task.wait()
		end
		if Wd and A:GetAttribute("Opened") == true then
			local T = k()
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
	local function A()
		if not Q then
			return
		end
		local o = tonumber(Q.Value) or 0
		local T = math.max(0, o - 4)
		for o = T, o, 1 do
			if not Wd then
				return
			end
			local T = workspace:FindFirstChild("CurrentRooms")
			local k = T and T:FindFirstChild(tostring(o))
			if k and not pd[k] then
				task.spawn(F, k)
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
					task.spawn(F, o)
				end
			end)
		end)
	end
	task.spawn(function()
		while Wd do
			A()
			task.wait(2)
		end
	end)
	A()
end)
Groupboxes.StairwellMain = rT.Stairwell:AddLeftGroupbox("Stairwell")
Groupboxes.StairwellMain:AddToggle(
	"StairwellChairFly",
	{
		["Text"] = "Chair Anticheat Bypass",
		["Default"] = false,
		["Tooltip"] = "Allows you to bypass the anticheat by flying on a chair, allowing you to noclip and fly freely, drag an office chair, then sit in it and press the 'Start Bypass' button",
	}
)
Groupboxes.StairwellMain:AddSlider(
	"StairwellChairFlySpeed",
	{ ["Text"] = "Chair Speed", ["Min"] = 15, ["Max"] = 150, ["Default"] = 55, ["Rounding"] = 0 }
)
Groupboxes.StairwellMain:AddButton({
	["Text"] = "Start Bypass",
	["Tooltip"] = "Press this AFTER you have dragged the chair and sat in it, shift to go down and ctrl and then space to exit (or just turn off the toggle)",
	["Callback"] = function()
		if not p.StairwellChairFly.Value then
			p.StairwellChairFly:SetValue(true)
		end
		startChairFly()
	end,
})
p.StairwellChairFly:OnChanged(function()
	if not p.StairwellChairFly.Value then
		StopChairBypass()
	end
end)
Groupboxes.StairwellMain:AddToggle(
	"BreakNoiseTv",
	{
		["Text"] = "Break Noise TV",
		["Default"] = false,
		["Tooltip"] = "Breaks noise's TV when you are holding it (holy tuff)",
	}
)
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
	if o:GetAttribute("LastPusherId") ~= a.UserId then
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
p.BreakNoiseTv:OnChanged(function(o)
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
		while p.BreakNoiseTv and (p.BreakNoiseTv.Value and not _Unloading) do
			ScanNoiseTvStands()
			task.wait(1)
		end
	end)
end)
Groupboxes.StairwellMain:AddToggle(
	"CreakAggressionMeter",
	{
		["Text"] = "Creak Aggression Meter",
		["Default"] = true,
		["Tooltip"] = "Shows in the ESP text the percentage of creaks aggression/before he attacks (you need esp for this)",
	}
)
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
	if not (p.CreakAggressionMeter and p.CreakAggressionMeter.Value) then
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
p.CreakAggressionMeter:OnChanged(function()
	CreakESPLastLabel = nil
end)
task.spawn(function()
	while not _Unloading do
		task.wait(0.5)
		if not (p.EntitiesESP and p.EntitiesESP.Value) then
			continue
		end
		if not (p.ESPShowText and p.ESPShowText.Value) then
			continue
		end
		if not (p.CreakAggressionMeter and p.CreakAggressionMeter.Value) then
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
			q:RemoveESP(o)
		end)
		pcall(function()
			Functions.AddESP(
				{ ["Object"] = o, ["Text"] = T, ["Color"] = l.EntitiesESPColor and l.EntitiesESPColor.Value },
				false
			)
		end)
	end
end)
Groupboxes.StairwellMain:AddToggle(
	"AntiCrusher",
	{
		["Text"] = "Anti Crusher",
		["Default"] = false,
		["Tooltip"] = "Prevents you from getting hurt from crushers",
	}
)
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
p.AntiCrusher:OnChanged(function(o)
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
		while p.AntiCrusher and (p.AntiCrusher.Value and not _Unloading) do
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
	local T = a and (a.Character and a.Character:FindFirstChild("HumanoidRootPart"))
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
		T:Notify({
			["Title"] = "Scrap Dropped Items",
			["Description"] = "No Drops folder found",
			["Time"] = 4,
		})
		return
	end
	local k = ScrapDroppedItemsFindGrinder()
	if not k then
		T:Notify({ ["Title"] = "Scrap Dropped Items", ["Description"] = "No scrapper found", ["Time"] = 4 })
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
	local o = l["ScrapDro\160\173O \214$\163<B\0264\008\249l\130\238"]
	if o and o.Update then
		pcall(function()
			o:Update()
		end)
	end
end
(Groupboxes.StairwellMain:AddButton({
	["Text"] = "Scrap Dropped Items",
	["Tooltip"] = "Puts all of your dropped items into a scrapper",
	["Callback"] = function()
		local o, k = pcall(ScrapDroppedItems)
		if not o then
			T:Notify({ ["Title"] = "Scrap Dropped Items", ["Description"] = tostring(k), ["Time"] = 6 })
		end
	end,
})):AddKeyPicker(
	"ScrapDroppedItemsKeybind",
	{
		["Text"] = "Scrap Dropped Items",
		["Default"] = "P",
		["Mode"] = "Press",
		["SyncToggleState"] = false,
		["VisibleWhen"] = ScrapKeybindVisible,
	}
)
Groupboxes.SubfloorsRooms = rT.Rooms:AddLeftGroupbox("Rooms")
Groupboxes.SubfloorsRooms:AddToggle(
	"RoomsAutoWalk",
	{
		["Text"] = "Auto Rooms",
		["Default"] = false,
		["Tooltip"] = "Automatically moves and hides from entities in The Rooms (stops at A-1000)",
	}
)
Groupboxes.SubfloorsRooms:AddSlider(
	"RoomsAutoWalkPathfindTimeout",
	{ ["Text"] = "Pathfind Timeout", ["Min"] = 0.5, ["Max"] = 3, ["Default"] = 1, ["Rounding"] = 1 }
)
Groupboxes.SubfloorsRooms:AddToggle(
	"RoomsAutoWalkIgnoreA60",
	{
		["Text"] = "Ignore A-60",
		["Default"] = false,
		["Tooltip"] = "Continues to walk if A-60 spawns, enables godmode",
	}
)
Groupboxes.SubfloorsRooms:AddToggle(
	"RoomsAutoWalkShowPathToggle",
	{ ["Text"] = "Show Path", ["Default"] = false, ["Tooltip"] = "Shows the current path of rooms auto-walk" }
)
p.RoomsAutoWalkShowPathToggle:AddColorPicker(
	"RoomsAutoWalkShowPathColor",
	{ ["Text"] = "Path", ["Default"] = Color3.fromRGB(0, 255, 0), ["Transparency"] = 0 }
)
Groupboxes.SubfloorsRooms:AddToggle(
	"RoomsAutoWalkSpoofFootsteps",
	{
		["Text"] = "Spoof Footsteps",
		["Default"] = false,
		["Tooltip"] = "Makes it appear as if your character is walking normally",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.SubfloorsRooms:AddDivider()
Groupboxes.SubfloorsRooms:AddToggle(
	"RoomsPickupStardust",
	{
		["Text"] = "Pickup Stardust",
		["Default"] = false,
		["Tooltip"] = "Automatically pathfinds to stardust in the current room",
	}
)
Groupboxes.SubfloorsRooms:AddToggle(
	"RoomsPickupGold",
	{
		["Text"] = "Pickup Gold",
		["Default"] = false,
		["Tooltip"] = "Automatically pathfinds to gold piles in the current room",
	}
)
local Ld, Od
Groupboxes.SubfloorsOutdoors = rT.Garden:AddLeftGroupbox("Outdoors")
Groupboxes.SubfloorsMonument = rT.Garden:AddLeftGroupbox("Monument")
Groupboxes.SubfloorsMonument:AddToggle(
	"BypassMonument",
	{
		["Text"] = "Anti Monument",
		["Default"] = false,
		["Tooltip"] = "Makes the server think you are looking at the closest monument, without turning your camera",
	}
)
p.BypassMonument:OnChanged(function()
	RefreshMonuments()
	fireMonumentLookAngle()
end)
Groupboxes.SubfloorsOutdoors:AddToggle(
	"NoSurgeDamage",
	{ ["Text"] = "No Surge Damage", ["Default"] = false, ["Tooltip"] = "Prevents Surge from hurting you" }
)
p.NoSurgeDamage:OnChanged(NoSurgeDamageHandler)
Groupboxes.SubfloorsOutdoors:AddToggle(
	"RemoveSurge",
	{ ["Text"] = "Remove Surge", ["Default"] = false, ["Tooltip"] = "Prevents Surge from spawning" }
)
p.RemoveSurge:OnChanged(function(o)
	if L.SurgeFrame then
		L.SurgeFrame.Name = o and "SurgeVignette_Disabled" or "SurgeVignette"
	end
end)
Groupboxes.SubfloorsOutdoors:AddToggle(
	"RemoveMandrake",
	{
		["Text"] = "Disable Mandrake (FE)",
		["Default"] = false,
		["Tooltip"] = "Prevents mandrakes from attacking you, but this is inconsistent",
	}
)
p.RemoveMandrake:OnChanged(function(o)
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
Groupboxes.SubfloorsOutdoors:AddToggle(
	"ShowEyestalkPathToggle",
	{
		["Text"] = "Show Eyestalk Path",
		["Default"] = false,
		["Tooltip"] = "Shows you the correct path in the eyestalk chase",
	}
)
p["ShowEyestalkPathTogg+%"]:AddColorPicker(
	"ShowEyestalkPathColor",
	{ ["Text"] = "Eyestalk Path", ["Default"] = Color3.fromRGB(0, 255, 0), ["Transparency"] = 0 }
)
p.ShowEyestalkPathToggle:OnChanged(function(o)
	Ld(wT.EyestalkHighlights, "ShowEyestalkPathColor", o)
end)
l.ShowEyestalkPathColor:OnChanged(function(o)
	Od(wT.EyestalkHighlights, o)
end)
rT.Garden:SetVisible(false)
L.RoomsNodesFolder = Instance.new("Folder")
L["RoomsNod\031(\172\160\254>\253\174"].Name = "RoomsPathNodes"
L.RoomsNodesFolder.Parent = workspace
L.SeekNodesFolder = Instance.new("Folder")
L.SeekNodesFolder.Name = "SeekPathNodes"
L.SeekNodesFolder.Parent = workspace
L.HotelNodesFolder = Instance.new("Folder")
L.HotelNodesFolder.Name = "HotelPathNodes"
L.HotelNodesFolder.Parent = workspace
p.BypassKillbricks:OnChanged(function(o)
	for T, k in workspace:GetDescendants() do
		if k.Name == "Lava" and k:IsA("BasePart") then
			k.CanTouch = not o
		end
	end
end)
p.BypassSeekingWall:OnChanged(function(o)
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
p.BypassBanana:OnChanged(function(o)
	for T, k in workspace:GetDescendants() do
		if k.Name == "BananaPeel" and k:IsA("BasePart") then
			k.CanTouch = not o
		end
	end
end)
p.BypassJeff:OnChanged(function(o)
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
p.RemoveSeekTrigger:OnChanged(function(o)
	if o and Executor.firetouchinterest then
		for o, T in ipairs(wT.Entities) do
			if T.Name == "TriggerEventCollision" then
				for o, T in T:GetChildren() do
					if T:IsA("BasePart") and u then
						Executor.firetouchinterest(u, T, 0)
						task.wait()
						Executor.firetouchinterest(u, T, 1)
					end
				end
			end
		end
		task.spawn(function()
			while p.RemoveSeekTrigger.Value do
				for o, T in ipairs(wT.Entities) do
					if T.Name == "TriggerEventCollision" and u then
						for o, T in T:GetChildren() do
							if T:IsA("BasePart") then
								Executor.firetouchinterest(u, T, 0)
								task.wait()
								Executor.firetouchinterest(u, T, 1)
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
p.AutoRoomSkip:OnChanged(function(o)
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
								p.Noclip:SetValue(false)
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
							if not p.Noclip.Value then
								p.Noclip:SetValue(true)
							end
							k = true
							local o = game.Players.LocalPlayer.Character
							if o and o:FindFirstChild("HumanoidRootPart") then
								o.HumanoidRootPart.CFrame = o.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10)
							end
							T = 0
						end
					end
					task.wait(0.25)
				until not p.AutoRoomSkip.Value
				if k then
					p.Noclip:SetValue(false)
				end
			end)
		end)
	end
end)
p.RemoveFigure:OnChanged(function(o)
	if o and (Executor.isnetworkowner and workspace:FindFirstChild("Figure")) then
		local o = z()
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
							if pcall(function()
								return Executor.isnetworkowner(k)
							end) then
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
Connections.AutoReviveHandler = (a:GetAttributeChangedSignal("Alive")):Connect(function()
	if a:GetAttribute("Alive") == false and p.AutoRevive.Value then
		local o = z()
		if o == "Fools" or o == "OldHotel" then
			while a:GetAttribute("Alive") ~= true do
				local o = j:FindFirstChild("RemotesFolder")
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
	p[T]:OnChanged(function(o)
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
		if p[T[o.Name]] and p[T[o.Name]].Value then
			o:PivotTo(CFrame.new(-10000, -10000, -10000))
		end
	end
end)
p.RoomsAutoWalkShowPathToggle:OnChanged(function(o)
	for T, k in L.RoomsNodesFolder:GetChildren() do
		if k.Name == "PathNode" then
			k.Transparency = o and 0.5 or 1
		end
	end
end)
l.RoomsAutoWalkShowPathColor:OnChanged(function(o)
	for T, k in L.RoomsNodesFolder:GetChildren() do
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
	if not Q or not x then
		return nil
	end
	return x[tostring(Q.Value)]
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
	if v() then
		return true
	end
	for o in pairs(O.ThreatNames) do
		local T = workspace:FindFirstChild(o)
		if T and (T:IsA("Model") and T.PrimaryPart) then
			local o, k = pcall(function()
				return a:DistanceFromCharacter(T.PrimaryPart.Position)
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
	if L.HotelAmbushHoldRoom ~= o then
		L.HotelAmbushHoldRoom = o
		L.HotelAmbushHoldUntil = tick() + 2
	end
	if isThreatNearby() then
		L.HotelAmbushHoldUntil = tick() + 2
	end
	if tick() < (L.HotelAmbushHoldUntil or 0) then
		return true
	end
	return false
end
local function setHotelCrouchHeld(o)
	o = o and true or false
	if L.HotelCrouchHeld == o then
		return
	end
	L.HotelCrouchHeld = o
	pcall(function()
		(game:GetService("VirtualInputManager")):SendKeyEvent(o, Enum.KeyCode.LeftControl, false, game)
	end)
end
local function clearHotelPathNodes()
	for o, T in L.HotelNodesFolder:GetChildren() do
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
	if not u then
		return
	end
	local function k(o)
		o = Vector3.new(o.X, 0, o.Z)
		if o.Magnitude < 0.01 then
			return nil
		end
		return o.Unit
	end
	local P = k(T - u.Position)
	local w = k(u.CFrame.LookVector)
	local F = false
	for T, k in ipairs({ P, w }) do
		if k then
			local T = u.Position + Vector3.new(0, 2.2, 0)
			local P = u.Position + Vector3.new(0, 0.3, 0)
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
			if a:DistanceFromCharacter(o) < (k.MaxActivationDistance or 12) then
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
	if not x then
		return nil, nil
	end
	local k = (Q and Q.Value) or 0
	for P, w in x:GetChildren() do
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
	if not x then
		return nil
	end
	for o, T in x:GetDescendants() do
		if T.Name == "Seeking" or T.Name == "SeekTrigger" or T.Name == "ChaseStartTrigger" then
			local o = getObjectPosition(T)
			if o and a:DistanceFromCharacter(o) < 80 then
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
	if u and B then
		u.CFrame = CFrame.new(k + Vector3.new(0, 1, 0))
		B:MoveTo(u.Position)
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
	if u then
		local k = T.Position
		local P = Vector3.zero
		local w, F = pcall(function()
			return o:GetPivot()
		end)
		if w and F then
			P = Vector3.new(k.X - F.Position.X, 0, k.Z - F.Position.Z)
		end
		if P.Magnitude < 0.5 and (b and u) then
			P = Vector3.new(k.X - u.Position.X, 0, k.Z - u.Position.Z)
		end
		if P.Magnitude >= 0.5 then
			P = P.Unit * 3
			u.CFrame = CFrame.lookAt(k + P, k + P * 5)
		else
			u.CFrame = CFrame.new(k + Vector3.new(0, 1, 0))
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
	local w = L.HotelTpScan[T]
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
		L.HotelTpScan[T] = w
	end
	local A = u and u.Position
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
	if not p.HotelAutoWalk.Value then
		return
	end
	if CurrentFloor ~= "Hotel" and CurrentFloor ~= "OldHotel" then
		return
	end
	if not b or not B or B.Health <= 0 then
		return
	end
	if v() then
		return
	end
	local o = getCurrentRoom()
	local k = (Q and Q.Value) or 0
	if not o or k <= 0 then
		return
	end
	if HotelAmbushHold(k) then
		return
	end
	if k >= 100 then
		local k = nil
		for o, T in o:GetDescendants() do
			if T.Name == "LiveBreakerPolePickup" and (T.Parent and not L.HotelBreakersFired[T]) then
				k = T
				break
			end
		end
		if k then
			L.HotelBreakersFired[k] = true
			getInteractablePrompt(k)
		else
			T:Notify({
				["Title"] = "Auto Hotel",
				["Description"] = "Every breaker fired. Turning off.",
				["Time"] = 4,
			})
			p.HotelAutoWalk:SetValue(false)
		end
		return
	end
	if L.HotelTpRoom ~= k then
		L.HotelTpRoom = k
		L.HotelKeyTries = 0
		L.HotelToyTries = 0
	end
	local P = findNamedDescendant(o, "SallyToyObtain")
	if P and not L.HotelSallyToys[P] then
		local o = getInteractablePrompt(P)
		if o and not P.Parent then
			L.HotelSallyToys[P] = true
			L.HotelToyTries = 0
		else
			L.HotelToyTries = (L.HotelToyTries or 0) + 1
		end
		if L.HotelToyTries < 5 then
			return
		end
		L.HotelToyTries = 0
	end
	if k ~= 50 then
		if L.HotelPaperDone or next(L.HotelBooksVisited) ~= nil then
			L.HotelPaperDone = false
			L.HotelBooksVisited = {}
		end
		if not L.HotelKeyRooms[k] then
			local T = findNamedDescendant(o, "KeyObtain")
			if T then
				local o = a.Backpack and a.Backpack:FindFirstChild("Key")
					or (a.Character and a.Character:FindFirstChild("Key"))
				if o then
					L.HotelKeyRooms[k] = true
					L.HotelKeyTries = 0
					return
				end
				local P = getInteractablePrompt(T)
				if P and not T.Parent then
					L.HotelKeyRooms[k] = true
					L.HotelKeyTries = 0
					return
				end
				L.HotelKeyTries = (L.HotelKeyTries or 0) + 1
				if L.HotelKeyTries < 5 then
					return
				end
				L.HotelKeyTries = 0
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
			L.HotelTpStage = "key"
		end
	end
end
function Functions.HotelAutoWalk.RunTeleport()
	if L.HotelTeleportThread then
		return
	end
	L.HotelTeleportThread = task.spawn(function()
		while p.HotelAutoWalk.Value and HotelMethodName() == "Teleport" do
			pcall(function()
				Functions.HotelAutoWalk.TeleportStep()
			end)
			task.wait(0.15)
		end
		L.HotelTeleportThread = nil
	end)
end
function Functions.HotelAutoWalk.StopTeleport()
	if L.HotelTeleportThread then
		pcall(function()
			L.HotelTeleportThread:Takeover()
		end)
		L.HotelTeleportThread = nil
	end
	L.HotelTpRoom = nil
	L.HotelTpStage = nil
end
Functions.HotelAutoWalk.GetTarget = function()
	local o = getCurrentRoom()
	if not o or not Q then
		return nil
	end
	local T = Q.Value
	if T ~= 50 and (L.HotelPaperDone or next(L.HotelBooksVisited) ~= nil) then
		L.HotelPaperDone = false
		L.HotelBooksVisited = {}
	end
	for o, T in o:GetDescendants() do
		if T.Name == "SallyToyObtain" and (T.Parent and not L.HotelSallyToys[T]) then
			return T, "sally"
		end
	end
	if T == 50 then
		if not L.HotelPaperDone then
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
			L.HotelPaperDone = true
		end
		local T, k = nil, math.huge
		for o, P in o:GetDescendants() do
			if P.Name == "LiveHintBook" and (P.Parent and not L.HotelBooksVisited[P]) then
				local o = getObjectPosition(P)
				if o then
					local w = a:DistanceFromCharacter(o)
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
	if T == 1 and not L.HotelDoorRooms[T] then
		local o = findNextDoor()
		local T = getObjectPosition(o)
		if o and (T and a:DistanceFromCharacter(T) < 250) then
			return o, "doorscout"
		end
	end
	if not L.HotelKeyRooms[T] then
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
	if not L.HotelGateRooms[T] then
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
	if w and (F and a:DistanceFromCharacter(F) < 250) then
		return w, "door"
	end
	return nil
end
Connections.HotelAutoWalkHandler = (game:GetService("RunService")).Heartbeat:Connect(function()
	if _Unloading then
		return
	end
	if not p.HotelAutoWalk.Value then
		L.HotelAutoWalkActive = false
		return
	end
	if CurrentFloor ~= "Hotel" and CurrentFloor ~= "OldHotel" then
		return
	end
	if HotelMethodName() == "Teleport" then
		L.HotelAutoWalkActive = false
		return
	end
	if L.HotelAutoWalkActive then
		local o = tick() - (L.HotelActiveSince or 0) > 90
		local T = L.HotelSeekActive or L.HotelFigureActive
		if o and not T then
			L.HotelAutoWalkActive = false
		else
			return
		end
	end
	if not t or not B or B.Health <= 0 then
		return
	end
	local o, k = pcall(function()
		return Q and Q.Value
	end)
	if not o or not k then
		return
	end
	if k >= 100 then
		T:Notify({
			["Title"] = "Auto Hotel",
			["Description"] = "Finished (door 100)! Turning off.",
			["Time"] = 5,
		})
		p.HotelAutoWalk:SetValue(false)
		return
	end
	L["Hote^\144X|\191d\135qpFhy\177\023\142"] = true
	L.HotelActiveSince = L.HotelActiveSince or tick()
	if tick() < (L.HotelFailCooldownUntil or 0) then
		L.HotelAutoWalkActive = false
		return
	end
	if HotelAmbushHold(k) then
		return
	end
	if L.HotelSeekActive then
		local o = tick()
		local T = k
		local P = 0
		local w = false
		local F, A = nil, nil
		while
			L.HotelSeekActive
			and (p.HotelAutoWalk.Value and (not L.HotelSeekVoiding and tick() - o < HotelSeekTimeout))
		do
			if not b or not B or not u then
				break
			end
			if
				(b:GetAttribute("InCutscene") == nil or b:GetAttribute("InCutscene") == false)
				and tick() - L.HotelSeekSince > 5
			then
				break
			end
			local o, k = pcall(function()
				return Q and Q.Value
			end)
			local d = (o and k) or 0
			local C = {}
			if x and u then
				for o, T in x:GetChildren() do
					local k = tonumber(T.Name)
					if k and k >= d then
						local o = getRoomDoorPart(T)
						if o then
							table.insert(
								C,
								{
									["Part"] = o,
									["Room"] = k,
									["Dist"] = ((o.Position - u.Position)).Magnitude,
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
							p.Noclip:SetValue(false)
						end)
						w = false
					end
				end
				local o, k = pcall(function()
					return Q and Q.Value
				end)
				b:PivotTo(CFrame.new(f.Part.Position))
				u.AssemblyLinearVelocity = Vector3.zero
				F = f.Part.Position
				A = f.Room
				local d = tick()
				while L.HotelSeekActive and (p.HotelAutoWalk.Value and tick() - d < 8) do
					local o, T = pcall(function()
						return Q and Q.Value
					end)
					if o and (T and T ~= k) then
						break
					end
					task.wait(0.25)
				end
			else
				P = P + 0.25
				if P >= 5 then
					if not p.Noclip.Value then
						pcall(function()
							p.Noclip:SetValue(true)
						end)
					end
					w = true
					if u then
						u.CFrame = u.CFrame * CFrame.new(0, 0, 10)
					end
					P = 0
				end
			end
			task.wait(0.25)
		end
		if w then
			pcall(function()
				p.Noclip:SetValue(false)
			end)
		end
		L.HotelSeekActive = false
		setHotelCrouchHeld(false)
		L.HotelAutoWalkActive = false
		return
	end
	if L.HotelFigureActive then
		if k ~= 50 then
			L.HotelFigureActive = false
		else
			local o = tick()
			while L.HotelFigureActive and (p.HotelAutoWalk.Value and tick() - o < 120) do
				if not b or not B or not u then
					break
				end
				if
					(b:GetAttribute("InCutscene") == nil or b:GetAttribute("InCutscene") == false)
					and tick() - L.HotelFigureSince > 5
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
						if not L.HotelFigureActive or not p.HotelAutoWalk.Value then
							break
						end
						if not b or not u then
							break
						end
						local P = getObjectPosition(k)
						if P and k.Parent then
							b:PivotTo(CFrame.new(P + Vector3.new(0, 3, 0)))
							u.AssemblyLinearVelocity = Vector3.zero
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
			L.HotelFigureActive = false
			setHotelCrouchHeld(false)
			L.HotelAutoWalkActive = false
			return
		end
	end
	if v() then
		L.HotelLegRetryAt = tick() + 0.4
		L.HotelAutoWalkActive = false
		return
	end
	if tick() < (L.HotelLegRetryAt or 0) then
		L.HotelAutoWalkActive = false
		return
	end
	local P, w = Functions.HotelAutoWalk.GetTarget()
	if not P or not P.Parent then
		L.HotelLegRetryAt = tick() + 0.4
		L.HotelAutoWalkActive = false
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
	local d = u.Position
	local C = false
	local f = false
	if not F or a:DistanceFromCharacter(F) >= 750 then
		L.HotelLegRetryAt = tick() + 0.4
		L.HotelAutoWalkActive = false
		return
	end
	local m = RaycastParams.new()
	m.FilterType = Enum.RaycastFilterType.Exclude
	m.FilterDescendantsInstances = { b }
	local r = t.Position
	if t:IsA("BasePart") then
		local o = workspace:Raycast(t.Position, Vector3.new(0, -60, 0), m)
		if o then
			r = Vector3.new(t.Position.X, o.Position.Y, t.Position.Z)
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
			["\154\013\149\189k\211\162{Pyv\170\149"] = true,
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
		L.HotelLegRetryAt = tick() + 0.4
		L.HotelAutoWalkActive = false
		return
	end
	clearHotelPathNodes()
	for o, T in ipairs(I) do
		local k = Instance.new("Part", L.HotelNodesFolder)
		k.Transparency = p.HotelShowPath.Value and 0.5 or 1
		k.Size = Vector3.one
		k.Position = T.Position
		k.Shape = Enum.PartType.Ball
		k.CanCollide = false
		k.Anchored = true
		k.Name = "HotelPathNode"
		k.Color = l.HotelShowPathColor.Value
		k.Material = Enum.Material.Neon
	end
	local V = RaycastParams.new()
	V.FilterType = Enum.RaycastFilterType.Exclude
	V.FilterDescendantsInstances = { b }
	local q = 0
	local M = (l.HotelPathfindTimeout and l.HotelPathfindTimeout.Value) or 2
	for o, T in ipairs(I) do
		if not p.HotelAutoWalk.Value then
			break
		end
		if C then
			break
		end
		local k = false
		local d = tick()
		local m = u.Position
		local r = tick()
		local G = 0
		local y = (game:GetService("RunService")).RenderStepped:Connect(function()
			if _Unloading then
				k = true
				return
			end
			if not p.HotelAutoWalk.Value then
				k = true
				return
			end
			if isThreatNearby() then
				setHotelCrouchHeld(false)
				if B and u then
					B:MoveTo(u.Position)
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
			if ((u.Position - m)).Magnitude > 1.5 then
				m = u.Position
				r = tick()
			elseif tick() - r > 4 and tick() - G > 6 then
				G = tick()
				r = tick()
				pcall(function()
					B:ChangeState(Enum["Humanoid\250\176y.\241\127\244\187\176"].Jumping)
				end)
			end
			if not P.Parent then
				k = true
				return
			end
			if HotelPromptKinds[w] then
				if
					A and (A.Parent and (F and a:DistanceFromCharacter(F) < (A.MaxActivationDistance or 10)))
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
				if a:DistanceFromCharacter(F) < HotelDoorReach then
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
			local o = Vector3.new(T.Position.X, u.Position.Y, T.Position.Z)
			if a:DistanceFromCharacter(o) < 5 then
				k = true
			end
			B:MoveTo(T.Position)
		end)
		while not k do
			if tick() - d > M then
				local o = 0
				local T = nil
				for k, P in L.HotelNodesFolder:GetChildren() do
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
				if e then
					local o = Instance.new("Part", L.HotelNodesFolder)
					o.Transparency = 1
					o.Size = Vector3.one
					o.CFrame = e.CFrame
					o.Shape = Enum.PartType.Ball
					o.CanCollide = false
					o.Anchored = true
					o.Name = "HotelStuckPart"
					local T = Instance.new("PathfindingModifier", o)
					T.Label = "HotelStuckPart"
				end
				if (L.HotelRepathTries or 0) < 4 then
					L.HotelRepathTries = (L.HotelRepathTries or 0) + 1
					C = true
				end
				break
			end
			task.wait()
		end
		y:Disconnect()
		setHotelCrouchHeld(false)
		B:MoveTo(u.Position)
		if C then
			break
		end
	end
	if C then
		L.HotelLegRetryAt = tick() + 0.4
		L.HotelAutoWalkActive = false
		return
	end
	L.HotelRepathTries = 0
	L.HotelActiveSince = tick()
	if w == "doorscout" then
		L.HotelDoorRooms[k] = true
	elseif HotelPromptKinds[w] then
		if q > 0 then
			if w == "key" then
				L.HotelKeyRooms[k] = true
			elseif w == "paper" then
				L.HotelPaperDone = true
			elseif w == "book" then
				L.HotelBooksVisited[P] = true
			elseif w == "sally" then
				L.HotelSallyToys[P] = true
			end
		else
			L.HotelLegRetryAt = tick() + 0.5
			L.HotelAutoWalkActive = false
			return
		end
	end
	if w == "door" then
		local o = tick()
		local T = false
		while p.HotelAutoWalk.Value and tick() - o < HotelRoomWaitTimeout do
			local o, P = pcall(function()
				return Q and Q.Value
			end)
			if o and (P and P ~= k) then
				T = true
				break
			end
			task.wait(0.5)
		end
		if not T and (p.HotelAutoWalk.Value and (b and (B and u))) then
			local o = F - d
			o = Vector3.new(o.X, 0, o.Z)
			if o.Magnitude > 0.5 then
				local T = F + o.Unit * 15
				local P = tick()
				while p.HotelAutoWalk.Value and tick() - P < 8 do
					local o = Vector3.new(T.X, u.Position.Y, T.Z)
					if a:DistanceFromCharacter(o) < 4 then
						break
					end
					B:MoveTo(T)
					local P, w = pcall(function()
						return Q and Q.Value
					end)
					if P and (w and w ~= k) then
						break
					end
					task.wait()
				end
				B:MoveTo(u.Position)
			end
		end
	end
	if w == "gate" then
		local o = L.HotelGateTries[k] or 0
		local T = F and a:DistanceFromCharacter(F) < 10
		if T and (b and (B and u)) then
			local o = nil
			do
				local T = (F or u.Position) - u.Position
				T = Vector3.new(T.X, 0, T.Z)
				if T.Magnitude > 0.01 then
					o = T.Unit
				end
			end
			if not o then
				local T = u.CFrame.LookVector
				T = Vector3.new(T.X, 0, T.Z)
				if T.Magnitude > 0.01 then
					o = T.Unit
				end
			end
			if o then
				local T = p.Noclip and p.Noclip.Value
				if not T then
					pcall(function()
						p.Noclip:SetValue(true)
					end)
				end
				for o, T in b:GetDescendants() do
					if T:IsA("BasePart") then
						T.CanCollide = false
					end
				end
				local k = Instance.new("BodyVelocity")
				k.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
				k.Velocity = o * 2.25
				k.Parent = u
				local P = tick()
				while p.HotelAutoWalk.Value and tick() - P < 3 do
					if not b or not u then
						break
					end
					for o, T in b:GetDescendants() do
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
				if not T and p.Noclip then
					pcall(function()
						p.Noclip:SetValue(false)
					end)
				end
				if not p.Noclip.Value and not (p.Phase and p.Phase.Value) then
					collectNoclipParts()
					setNoclipPartsCollision(true)
				end
			end
		end
		if T or o >= 2 then
			L.HotelGateRooms[k] = true
		else
			L.HotelGateTries[k] = o + 1
		end
	end
	L.HotelAutoWalkActive = false
end)
Functions.RoomsAutoWalk = {}
Functions.RoomsAutoWalk["GetNearestHidingҞ6N"] = function()
	local o = { ["Distance"] = math.huge, ["Object"] = nil }
	for T, k in ipairs(wT.HidingSpots) do
		if k["Prim\228\190\147T\030\192\166"] and k:FindFirstChild("HidePrompt") then
			local T = a:DistanceFromCharacter(k.PrimaryPart.Position)
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
	if not Q or not x then
		return
	end
	local o = x[tostring(Q.Value)]
	if not o then
		return
	end
	for T, k in workspace:GetChildren() do
		if TableFind(RoomsEntityList, k.Name) and k.PrimaryPart then
			local T = k.PrimaryPart.Position.Y
			if T > -10 and T < 150 then
				if k.Name == "A60" and not p.RoomsAutoWalkIgnoreA60.Value or k.Name ~= "A60" then
					return Functions.RoomsAutoWalk.GetNearestHidingSpot() or o:FindFirstChild("RoomExit")
				end
			end
		end
	end
	if p.RoomsAutoWalkIgnoreA60.Value and Functions.GetNearestEntity() then
		return o:FindFirstChild("RoomExit")
	end
	if (p.RoomsPickupStardust.Value or p.RoomsPickupGold.Value) and _RoomsPickupTimeoutRoom ~= Q.Value then
		local T = { ["Distance"] = math.huge, ["Object"] = nil }
		for o, k in o:GetDescendants() do
			if k.Name == "GoldPile" and (k:GetAttribute("GoldValue") and p.RoomsPickupGold.Value) then
				local o = (k:GetPivot()).Position
				local P = a:DistanceFromCharacter(o)
				if P < T.Distance then
					T.Distance = P
					T.Object = k
				end
			elseif k.Name == "StardustPickup" and p.RoomsPickupStardust.Value then
				local o = (k:GetPivot()).Position
				local P = a:DistanceFromCharacter(o)
				if P < T.Distance then
					T["\161\015\216\195\145\223\203\238"] = P
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
p.RoomsAutoWalk:OnChanged(function(o)
	for o, T in L.RoomsNodesFolder:GetChildren() do
		if T.Name == "PathNode" then
			T:Destroy()
		end
	end
	if o and not p.NoA90Damage.Value then
		p.NoA90Damage:SetValue(true)
	end
end)
Connections.RoomsAutoWalkHandler = (game:GetService("RunService")).Heartbeat:Connect(function()
	if _Unloading then
		return
	end
	if not p.RoomsAutoWalk.Value or CurrentFloor ~= "Rooms" or L.RoomsAutoWalkActive or not t then
		return
	end
	local o, T = pcall(function()
		return Q and Q.Value
	end)
	if not o or not T or T >= 1000 then
		return
	end
	L.RoomsAutoWalkActive = true
	local k = (game:GetService("PathfindingService")):CreatePath({
		["AgentCanJump"] = true,
		["AgentCanClimb"] = false,
		["WaypointSpacing"] = 4,
		["AgentRadius"] = 1.5,
		["AgentHeight"] = 1.5,
		["Costs"] = { ["StuckPart"] = 8 },
	})
	if p.RoomsAutoWalkIgnoreA60.Value and not p.Godmode.Value then
		p.Godmode:SetValue(true)
	end
	local P = Functions.RoomsAutoWalk.GetPathfindTarget()
	if not P then
		L.RoomsAutoWalkActive = false
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
	if t.Anchored and not P:FindFirstChild("HidePrompt") then
		b:SetAttribute("Hiding", true)
		Z.CamLock:FireServer()
		b:SetAttribute("Hiding", false)
	end
	if not Q or not x then
		L.RoomsAutoWalkActive = false
		return
	end
	local F = x[tostring(Q.Value)]
	if not F then
		L.RoomsAutoWalkActive = false
		return
	end
	if F:FindFirstChild("Door") then
		F.Door.Door.CanCollide = false
	end
	if not w or a:DistanceFromCharacter(w) >= 750 then
		L.RoomsAutoWalkActive = false
		return
	end
	local A, d = pcall(k.ComputeAsync, k, t.Position, w)
	if d then
		L.RoomsAutoWalkActive = false
		return
	end
	local C = k:GetWaypoints()
	if #C == 0 then
		local o = F:FindFirstChild("\220\021\230\188\022\025\138}")
		if o then
			B:MoveTo(o.Position)
		end
		L.RoomsAutoWalkActive = false
		return
	end
	for o, T in L.RoomsNodesFolder:GetChildren() do
		if T.Name == "PathNode" then
			T:Destroy()
		end
	end
	for o, T in ipairs(C) do
		local k = Instance.new("Part", L.RoomsNodesFolder)
		k.Transparency = p.RoomsAutoWalkShowPathToggle.Value and 0.5 or 1
		k.Size = Vector3.one
		k.Position = T.Position
		k.Shape = Enum.PartType.Ball
		k.CanCollide = false
		k.Anchored = true
		k.Name = "PathNode"
		k.Color = l.RoomsAutoWalkShowPathColor.Value
		k.Material = Enum.Material.Neon
	end
	local f = false
	for o, T in ipairs(C) do
		if f or not p.RoomsAutoWalk.Value then
			break
		end
		local k = false
		local F = tick()
		local A = T
		local d = (game:GetService("RunService")).RenderStepped:Connect(function()
			if _Unloading then
				return
			end
			if f or not p.RoomsAutoWalk.Value then
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
					a:DistanceFromCharacter(w) < o.MaxActivationDistance
					and b:GetAttribute("Hiding") ~= true
				then
					Functions.ForceFirePrompt(o)
				end
			elseif P.Name == "GoldPile" or P.Name == "StardustPickup" then
				local o = P:FindFirstChild("LootPrompt")
				if o and a:DistanceFromCharacter(w) < o.MaxActivationDistance then
					Functions.ForceFirePrompt(o)
				end
			end
			local T = Vector3.new(A.Position.X, u.Position.Y, A.Position.Z)
			if a:DistanceFromCharacter(T) < 5 then
				k = true
			end
			B:MoveTo(A.Position)
		end)
		while not k do
			if tick() - F > l.RoomsAutoWalkPathfindTimeout.Value then
				local o = Instance.new("Part", L.RoomsNodesFolder)
				o.Transparency = 1
				o.Size = Vector3.one
				o.CFrame = e.CFrame
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
				_RoomsPickupTimeoutRoom = Q.Value
				_RoomsPickupStart = 0
				f = true
				break
			end
			task.wait()
		end
		d:Disconnect()
		B:MoveTo(u.Position)
	end
	L.RoomsAutoWalkActive = false
end)
if x then
	Connections.RoomsHandler = x.ChildAdded:Connect(function(o)
		for o, T in L.RoomsNodesFolder:GetChildren() do
			if T.Name == "StuckPart" then
				T:Destroy()
			end
		end
		if o:GetAttribute("RawName") and string.find(o:GetAttribute("RawName"), "Eyestalk") then
			local T
			local function k(o)
				local k = Instance.new("Part")
				k.Size = Vector3.one
				k.Transparency = 1
				k.Parent = L.SeekNodesFolder
				k.Anchored = true
				k.Position = o
				k.CanCollide = false
				k.Name = "SeekLightNode"
				local P = T or k
				T = k
				local w = Instance.new("Beam")
				local F = rawget(p, "ShowEyestalkPathColor") and l.ShowEyestalkPathColor.Value
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
				local A = rawget(p, "ShowEyestalkPathToggle") and (p.ShowEyestalkPathToggle.Value and 0) or 1
				w.Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, A),
					NumberSequenceKeypoint.new(1, A),
				})
				w.Parent = L.SeekNodesFolder
				local d = Instance.new("Attachment", k)
				local C = Instance.new("Attachment", P)
				w.Attachment0 = d
				w.Attachment1 = C
				table.insert(wT.EyestalkHighlights, w)
			end
			o:WaitForChild("RoomEntrance", 9000000000)
			o:WaitForChild("RoomExit", 9000000000)
			while not o:GetAttribute("PathFound") do
				if rawget(p, "ShowEyestalkPathToggle") and p.ShowEyestalkPathToggle.Value then
					local T = (game:GetService("PathfindingService")):CreatePath({
						["AgentCanJump"] = false,
						["AgentCanClimb"] = false,
						["WaypointSpacing"] = 2,
						["AgentRadius"] = 1,
						["AgentHeight"] = 1,
					})
					local P, w = pcall(T.ComputeAsync, T, u.Position, o.RoomExit.Position)
					if w then
						break
					end
					if T.Status == Enum.PathStatus.Success then
						o:SetAttribute("PathFound", true)
						for o, T in T:GetWaypoints() do
							k(T.Position)
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
	local o = j:FindFirstChild("GameData")
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
	T = j.ChildAdded:Connect(function(o)
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
Groupboxes.MinesLadder = rT.Mines:AddLeftGroupbox("Visuals")
Groupboxes.MinesLadder:AddToggle("LaddersESP", { ["Text"] = "Ladders", ["Default"] = false })
p.LaddersESP:AddColorPicker(
	"LaddersESPColor",
	{ ["Text"] = "Ladders", ["Default"] = Color3.fromRGB(255, 255, 0) }
)
Groupboxes.MinesLadder:AddToggle("LaddersTracers", { ["Text"] = "Ladders Tracers", ["Default"] = false })
p.LaddersTracers:OnChanged(function(o)
	if o and not p.LaddersESP.Value then
		p.LaddersTracers:SetValue(false)
		return
	end
	for T, k in ipairs(ESPCategories.Ladders) do
		local P = GetESPTarget(k, "Ladders")
		if P then
			q:SetTracersEnabled(P, o)
		end
	end
end)
p.LaddersESP:OnChanged(function(o)
	if o then
		for o, T in ipairs(ESPCategories.Ladders) do
			addCategoryESP(T, "<\132\129/+Ri", "Ladder")
		end
	else
		removeCategoryESP("Ladders")
	end
end)
l.LaddersESPColor:OnChanged(function(o)
	for T, k in ipairs(ESPCategories.Ladders) do
		q:UpdateObjectColor(GetESPTarget(k, "Ladders"), o)
	end
end)
Groupboxes.MinesLadder:AddToggle(
	"ShowSeekPathToggle",
	{
		["Text"] = "Show Seek Path",
		["Default"] = false,
		["Tooltip"] = "Shows you the correct path in the seek chase",
	}
)
p.ShowSeekPathToggle:AddColorPicker(
	"ShowSeekPathColor",
	{ ["Text"] = "Seek Path", ["Default"] = Color3.fromRGB(0, 255, 0), ["Transparency"] = 0 }
)
p.ShowSeekPathToggle:OnChanged(function(o)
	Ld(wT.SeekHighlights, "ShowSeekPathColor", o)
end)
l.ShowSeekPathColor:OnChanged(function(o)
	Od(wT.SeekHighlights, o)
end)
Groupboxes.MinesAnticheat = rT.Mines:AddLeftGroupbox("Exploits")
Groupboxes.MinesAnticheat:AddToggle(
	"DisableAnticheat",
	{
		["Text"] = "Anticheat Bypass",
		["Default"] = false,
		["Tooltip"] = "Completely disables the anticheat, after interacting with a ladder.",
	}
)
p.DisableAnticheat:OnChanged(function(o)
	if L.AnticheatDisabled == true and not o then
		Z.ClimbLadder:FireServer()
		L.AnticheatDisabled = false
	end
end)
Groupboxes.MinesAnticheat:AddDivider()
Groupboxes.MinesAnticheat:AddToggle(
	"RemoveFigureMines",
	{
		["Text"] = "Delete Figure (FE)",
		["Default"] = false,
		["Tooltip"] = "Removes figure for everyone, however this is inconsistent",
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
p.RemoveFigureMines:OnChanged(function(o)
	if o and (Executor.isnetworkowner and workspace:FindFirstChild("Figure")) then
		local o = z()
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
							if pcall(function()
								return Executor.isnetworkowner(k)
							end) then
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
Groupboxes.MinesAutomation = rT.Mines:AddRightGroupbox("Automation")
Groupboxes.MinesAutomation:AddToggle(
	"AutoSteerMinecart",
	{
		["Text"] = "Auto Minecart",
		["Default"] = false,
		["Tooltip"] = "Automatically completes the minecart section of the seek chase",
		["Disabled"] = isSolara(),
		["DisabledTooltip"] = "Solara sandboxes require(), so the PlayerModule controls hook would land on a dead object :(",
	}
)
Groupboxes.MinesAutomation:AddSlider(
	"AutoSteerMinecartTurnDistance",
	{ ["Text"] = "Turn Distance", ["Min"] = 20, ["Max"] = 40, ["Default"] = 30, ["Rounding"] = 0 }
)
Groupboxes.MinesAutomation:AddSlider(
	"AutoSteerMinecartDuckDistance",
	{ ["Text"] = "Crouch Distance", ["Min"] = 20, ["Max"] = 40, ["Default"] = 30, ["Rounding"] = 0 }
)
Groupboxes.MinesAutomation:AddToggle(
	"AutoSolv\167\246\164\148\249\201\200-",
	{
		["Text"] = "Auto Solve Anchors",
		["Default"] = false,
		["Tooltip"] = "Automatically enters the correct code into anchors when you are near them.",
	}
)
Groupboxes.MinesAutomation:AddToggle(
	"MinecartTeleport",
	{
		["Text"] = "Minecart Teleport",
		["Default"] = false,
		["Tooltip"] = "Teleports your minecart to complete the seek chase, do NOT use on high ping or low fps",
		["Disabled"] = not (hasHookMeta and hasHookFunction),
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
p.MinecartTeleport:OnChanged(function(o)
	if not MainHook then
		return
	end
	if o then
		local o = game:FindFirstChild("MinecartPos", true)
		if not o then
			T:Notify({
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
			["LatestRoom"] = tonumber(tostring(Q.Value)) or 0,
			["LatestRoomConn"] = nil,
			["GetDoor"] = nil,
			["RestoreDecode"] = k,
		}
		pcall(function()
			w.Decode = (require(j.NodeObject.MinecartNodes)).Decode
		end)
		w.GetDoor = function()
			local o = x and x:FindFirstChild(tostring(w.LatestRoom))
			return o and o:FindFirstChild("Door")
		end
		local function F()
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
		w.LatestRoomConn = (Q:GetPropertyChangedSignal("Value")):Connect(function()
			task.wait()
			w.LatestRoom = tonumber(tostring(Q.Value)) or 0
		end)
		pcall(F)
		L.MinecartTeleportState = w
	else
		local o = L.MinecartTeleportState
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
			L.MinecartTeleportState = nil
		end
	end
end)
Groupboxes.MinesAutomation:AddButton({
	["Text"] = "Complete Door 200",
	["Tooltip"] = "Automatically teleports to and interacts with each water pump to complete the Dam Seek",
	["Callback"] = function()
		if CurrentFloor ~= "Mines" then
			return
		end
		if not b then
			T:Notify({ ["Title"] = "Error", ["Description"] = "Character not found", ["Time"] = 3 })
			return
		end
		if Q and Q.Value < 99 then
			T:Notify({
				["Title"] = "Door 200",
				["Description"] = "You haven't reached door 200...",
				["Time"] = 4,
			})
			return
		end
		T:Notify({
			["Title"] = "Door 200",
			["Description"] = "Starting water pump automation...",
			["Time"] = 3,
		})
		local o = b.CFrame
		local k = workspace:FindFirstChild("CurrentRooms")
		if not k then
			T:Notify({ ["Title"] = "Error", ["Description"] = "Could not find CurrentRooms", ["Time"] = 4 })
			return
		end
		local P = k:FindFirstChild(Q and Q.Value or "200")
		if not P then
			T:Notify({
				["Titl"] = "Error",
				["Description"] = "Could not find the current room",
				["Time"] = 4,
			})
			return
		end
		local function w(o)
			for o = 1, (o or 40), 1 do
				if not b then
					return
				end
				if b:GetAttribute("InCutscene") ~= true then
					return
				end
				task.wait(0.25)
			end
		end
		local function F(o, T)
			if not o or not b then
				return
			end
			b:PivotTo(o.CFrame)
			task.wait(0.25)
			local k = o:FindFirstChild(T, true)
			if k then
				Functions.ForceFirePrompt(k)
			end
			task.wait(0.25)
		end
		w()
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
							F(k, "ValvePrompt")
							d = d + 1
						end
					end
				end
				w()
				task.wait(0.5)
			end
		end
		w()
		local C = P:FindFirstChild("MinesGenerator", true)
		if C then
			local o = C:FindFirstChild("Lever", true)
			if o then
				local T = C.PrimaryPart or o
				F(T, "LeverPrompt")
			end
		end
		b:PivotTo(o)
		if d == 0 then
			T:Notify({
				["Title"] = "Door 200",
				["Description"] = "No pumps found, is the dam loaded?",
				["Time"] = 5,
			})
		else
			T:Notify({
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
	if not p.AutoSolveAnchors.Value then
		return
	end
	local o = 0
	AutoSolveAnchorsConnection = i.Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if not p["Auto\229>v\255\019\224z\232\237\244\247\184"].Value or CurrentFloor ~= "Mines" then
			return
		end
		local T = os.clock()
		if T - o < 0.1 then
			return
		end
		o = T
		local k = a:FindFirstChildOfClass("PlayerGui")
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
			if u and (u.Position and ((u.Position - w.Position)).Magnitude <= d) then
				local o = T:FindFirstChild("AnchorRemote")
				if o then
					o:InvokeServer(F.Text)
				end
				break
			end
		end
	end)
end
p.AutoSolveAnchors:OnChanged(setupAutoSolveAnchors)
local function setupAutoMinecart()
	if AutoMinecartConnection then
		AutoMinecartConnection:Disconnect()
		AutoMinecartConnection = nil
	end
	if L.OriginalGetMoveVector then
		pcall(function()
			local o = (require(a.PlayerScripts.PlayerModule)):GetControls()
			o.GetMoveVector = L.OriginalGetMoveVector
		end)
		L.OriginalGetMoveVector = nil
	end
	if not p.AutoSteerMinecart.Value then
		return
	end
	local o = a:FindFirstChildOfClass("PlayerGui")
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
		return (require(a.PlayerScripts.PlayerModule)):GetControls()
	end)
	if A and d then
		F = d
	else
		return
	end
	local C = F.GetMoveVector
	L.OriginalGetMoveVector = C
	F.GetMoveVector = function(...)
		if p.AutoSteerMinecart.Value and CurrentFloor == "Mines" then
			local o = L.NearestTurnNode
			if o and Functions.GetMinecart() then
				local T = o:GetAttribute("Turn")
				return T == "Left" and Vector3.new(-1, 0, 0)
					or T == "Right" and Vector3.new(1, 0, 0)
					or Vector3.zero
			end
		end
		return C(...)
	end
	L.AutoMinecartDucked = false
	L.LastDuck = tick()
	AutoMinecartConnection = i.Heartbeat:Connect(function()
		if _Unloading then
			return
		end
		if not p.AutoSteerMinecart.Value or not Functions.GetMinecart() or tick() - L.LastDuck < 0.1 then
			return
		end
		L.NearestTurnNode = Functions.GetNearestTurnNode()
		if not L.AutoMinecartDucked and Functions.GetNearestDuckBoard() then
			w.crouch(true)
			L.AutoMinecartDucked = true
		elseif not Functions.GetNearestDuckBoard() and L.AutoMinecartDucked then
			w.crouch(false)
			L.AutoMinecartDucked = false
		end
		if p.FOVChanger and (p.FOVChanger.Value and l.FieldOfView) then
			if w then
				w.fovtarget = l.FieldOfView.Value
			else
				R.FieldOfView = l.FieldOfView.Value
			end
		end
		L.LastDuck = tick()
	end)
end
p.AutoSteerMinecart:OnChanged(setupAutoMinecart)
Groupboxes.Visuals_Camera = rT.Visuals:AddRightGroupbox("Camera")
Groupboxes.Visuals_Camera:AddToggle(
	"Fullbright",
	{
		["Text"] = "Fullbright",
		["Default"] = false,
		["Tooltip"] = "Makes your game very bright, and removes shadows",
	}
)
Groupboxes.Visuals_Camera:AddSlider(
	"FullbrightBrightness",
	{
		["Text"] = "Brightness Level",
		["Default"] = 3,
		["Min"] = 1,
		["Max"] = 10,
		["Rounding"] = 1,
		["Compact"] = true,
	}
)
local function applyFullbright()
	local o = l.FullbrightBrightness.Value
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
p.Fullbright:OnChanged(function(o)
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
		_FullbrightConnection = i.Heartbeat:Connect(function()
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
Groupboxes.Visuals_Camera:AddToggle(
	"AmbientToggle",
	{
		["Text"] = "Ambient",
		["Default"] = false,
		["Tooltip"] = "Changes the lighting color to the specified value",
	}
)
p.AmbientToggle:AddColorPicker(
	"AmbientColor",
	{ ["Text"] = "Ambient", ["Default"] = Color3.fromRGB(255, 255, 255), ["Transparency"] = 0 }
)
p.AmbientToggle:OnChanged(function(o)
	local T = x and x:FindFirstChild(tostring(a:GetAttribute("CurrentRoom")))
	local k = T and T:GetAttribute("Ambient");
	(TweenService:Create(
		Lighting,
		TweenInfo.new(0.2, Enum.EasingStyle.Exponential),
		{ ["Ambient"] = o and l.AmbientColor.Value or k or Color3.fromRGB(255, 255, 255) }
	)):Play()
end)
l.AmbientColor:OnChanged(function()
	if p.AmbientToggle and p.AmbientToggle.Value then
		(TweenService:Create(
			Lighting,
			TweenInfo.new(0.2, Enum.EasingStyle.Exponential),
			{ ["Ambient"] = l.AmbientColor.Value }
		)):Play()
	end
end)
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle(
	"FOVChanger",
	{
		["Text"] = "Field of View",
		["Default"] = false,
		["Tooltip"] = "Applies the field of view value from the slider below",
	}
)
Groupboxes.Visuals_Camera:AddSlider(
	"FieldOfView",
	{
		["Text"] = "Field of View",
		["Min"] = 70,
		["Max"] = 120,
		["Default"] = 70,
		["Rounding"] = 0,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Camera:AddToggle(
	"ThirdPerson",
	{
		["Text"] = "Third Person",
		["Default"] = false,
		["Tooltip"] = "Puts your camera in a third person view",
	}
)
p.ThirdPerson:AddKeyPicker(
	"ThirdPersonKeybind",
	{ ["Text"] = "Third Person", ["Default"] = "V", ["Mode"] = "Toggle", ["SyncToggleState"] = true }
)
Groupboxes.Visuals_Camera:AddSlider(
	"ThirdPersonOffsetX",
	{
		["Text"] = "X Offset",
		["Min"] = -10,
		["Max"] = 10,
		["Default"] = 0,
		["Rounding"] = 1,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Camera:AddSlider(
	"ThirdPersonOffsetY",
	{
		["Text"] = "Y Offset",
		["Min"] = -10,
		["Max"] = 10,
		["Default"] = 0.5,
		["Rounding"] = 1,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Camera:AddSlider(
	"ThirdPersonOffsetZ",
	{
		["Text"] = "Z Offset",
		["Min"] = -10,
		["Max"] = 10,
		["Default"] = 7.5,
		["Rounding"] = 1,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Camera:AddToggle(
	"ThirdPersonWallCheck",
	{
		["Text"] = "Wall Check",
		["Default"] = false,
		["Tooltip"] = "Prevents third person camera from going through walls",
	}
)
p.ThirdPerson:OnChanged(kT)
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle(
	"ViewmodelOffsetToggle",
	{
		["Text"] = "Viewmodel Offset",
		["Default"] = false,
		["Tooltip"] = "Changes the offset of your viewmodel while holding an item.",
		["Disabled"] = (not hasRequire) or isSolara(),
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes["f\1395>\003Z\203]A_kC\187\227"]:AddSlider(
	"ViewmodelOffsetX",
	{
		["Text"] = "X Offset",
		["Min"] = -10,
		["Max"] = 10,
		["Default"] = 0,
		["Rounding"] = 1,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Camera:AddSlider(
	"ViewmodelOffsetY",
	{
		["Text"] = "Y Offset",
		["Min"] = -10,
		["Max"] = 10,
		["Default"] = 0,
		["Rounding"] = 1,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Camera:AddSlider(
	"ViewmodelOffsetZ",
	{
		["Text"] = "Z Offset",
		["Min"] = -10,
		["Max"] = 10,
		["Default"] = 0,
		["Rounding"] = 1,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Camera:AddToggle(
	"FreecamToggle",
	{
		["Text"] = "Freecam",
		["Default"] = false,
		["Tooltip"] = "Enables freecam with WASD movement and mouse look",
	}
)
p.FreecamToggle:AddKeyPicker(
	"FreecamKeybind",
	{ ["Text"] = "Freecam", ["Default"] = "Q", ["Mode"] = "Toggle", ["SyncToggleState"] = true }
)
Groupboxes.Visuals_Camera:AddSlider(
	"FreecamSpeed",
	{
		["Text"] = "Freecam Speed",
		["Min"] = 10,
		["Max"] = 300,
		["Default"] = 75,
		["Rounding"] = 0,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle(
	"RemoveCameraBobbing",
	{
		["Text"] = "Remove Camera Bobbing",
		["Default"] = false,
		["Tooltip"] = "Removes camera 'bobbing'",
		["Disabled"] = (not hasRequire) or isSolara(),
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes["Visuals_\010\156+\030\219\158"]:AddToggle(
	"RemoveCameraShake",
	{
		["Text"] = "Remove Camera Shake",
		["Default"] = false,
		["Tooltip"] = "Removes camera shake",
		["Disabled"] = (not hasRequire) or isSolara(),
		["DisabledTooltip"] = "Your executor doesn't support this feature :(",
	}
)
Groupboxes.Visuals_Camera:AddToggle(
	"RemoveCameraFog",
	{ ["Text"] = "Remove Fog", ["Default"] = false, ["Tooltip"] = "Removes camera fog" }
)
Groupboxes.Visuals_Camera:AddToggle(
	"DisableFiredampEffect",
	{
		["Text"] = "Remove Firedamp Effect",
		["Default"] = false,
		["Tooltip"] = "Removes the firedamp fog/effect when inside a room",
	}
)
FreecamConnection = nil
local function stopFreecam()
	local o = workspace:FindFirstChild("FreecamPart")
	if o then
		o:Destroy()
	end
	local T = a.Character and a.Character:FindFirstChild("HumanoidRootPart")
	if T then
		T.Anchored = false
	end
	if a:GetAttribute("fc_om") then
		a.CameraMinZoomDistance = a:GetAttribute("fc_om")
	end
	if a:GetAttribute("fc_ox") then
		a.CameraMaxZoomDistance = a:GetAttribute("fc_ox")
	end
end
p.FreecamToggle:OnChanged(function(o)
	if FreecamConnection then
		FreecamConnection:Disconnect()
	end
	if not o then
		stopFreecam()
	else
		FreecamConnection = i.RenderStepped:Connect(function(o)
			if _Unloading then
				return
			end
			if not p.FreecamToggle.Value then
				return
			end
			local T = a.Character
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
				o.CFrame = R.CFrame
				o.Parent = workspace
				a:SetAttribute("fc_om", a.CameraMinZoomDistance)
				a:SetAttribute("fc_ox", a.CameraMaxZoomDistance)
				a.CameraMinZoomDistance = 0
				a.CameraMaxZoomDistance = 0
				local T, k, P = R.CFrame:ToOrientation()
				a:SetAttribute("fc_p", math.deg(T))
				a:SetAttribute("fc_y", math.deg(k))
			end
			local w = workspace:FindFirstChild("FreecamPart")
			local F = R
			if w and F then
				local T = D:GetMouseDelta()
				local P = D.KeyboardEnabled and 0.3 or 0.6
				local A = (a:GetAttribute("fc_p") or 0) - (T.Y * P)
				local d = (a:GetAttribute("fc_y") or 0) - (T.X * P)
				A = math.max(-80, math.min(80, A))
				a:SetAttribute("fc_p", A)
				a:SetAttribute("fc_y", d)
				w.CFrame = CFrame.new(w.Position) * CFrame.fromOrientation(math.rad(A), math.rad(d), 0)
				F.CFrame = w.CFrame
				F.Focus = F.CFrame * CFrame.new(0, 0, -10)
				if k and k.MoveDirection.Magnitude > 0 then
					local T = l.FreecamSpeed and l.FreecamSpeed.Value or 75
					local P = k.MoveDirection
					local A = F.CFrame:VectorToObjectSpace(P)
					local d = (F.CFrame.RightVector * A.X) + (F.CFrame.LookVector * -A.Z)
					w.Position = w.Position + ((d * T) * o)
				end
			end
		end)
	end
end)
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle(
	"NotifyOxygen",
	{
		["Text"] = "Oxygen Notifications",
		["Default"] = false,
		["Tooltip"] = "Shows a notification when your oxygen level changes",
	}
)
Groupboxes.Visuals_Camera:AddToggle(
	"NotifyHasteTime",
	{
		["Text"] = "Haste/Time Notifications",
		["Default"] = false,
		["Tooltip"] = "Shows a notification of the remaining time before Haste spawns",
	}
)
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle(
	"TransparentHidingSpotsToggle",
	{
		["Text"] = "Transparent Hiding Spots",
		["Default"] = false,
		["Tooltip"] = "Makes a hiding spot transparent when you enter it",
	}
)
Groupboxes.Visuals_Camera:AddSlider(
	"TransparentHidingSpotsSlider",
	{
		["Text"] = "Transparency",
		["Min"] = 0,
		["Max"] = 1,
		["Default"] = 0.5,
		["Rounding"] = 2,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle(
	"DisableJumpscares",
	{
		["Text"] = "Disable Jumpscares",
		["Default"] = false,
		["Tooltip"] = "Removes jumpscares from the chosen entities",
	}
)
Groupboxes.Visuals_Camera:AddDropdown(
	"JumpscaresList",
	{
		["Text"] = "Jumpscares To Disable",
		["Values"] = { "Glitch", "Timothy", "Void", "Rush", "Ambush", "Screech", "Figure", "Seek" },
		["Multi"] = true,
		["AllowNull"] = true,
	}
)
Groupboxes.Visuals_Camera:AddDivider()
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
Groupboxes.Visuals_Camera:AddToggle(
	"RemoveCutscenes",
	{
		["Text"] = "Remove Cutscenes",
		["Default"] = false,
		["Tooltip"] = "Removes cutscenes that aren't needed for progression",
	}
)
p.RemoveCutscenes:OnChanged(function(o)
	local T = a:FindFirstChildOfClass("PlayerGui")
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
				or TableFind(CutsceneNames, k:GetAttribute("OriginalName")) and k:IsA("ModuleScript")
			then
				k.Name = (o and k.Name .. "_Disabled" or k:GetAttribute("OriginalName") or k.Name)
			end
		end
	end
	local d = j:FindFirstChild("FloorReplicated")
	if d then
		for T, k in pairs(d:GetChildren()) do
			if
				TableFind(CutsceneNames, k.Name) and k:IsA("\000\021\184\196\164V\006r\129x\127S")
				or TableFind(CutsceneNames, k:GetAttribute("OriginalName")) and k:IsA("ModuleScript")
			then
				k.Name = (o and k.Name .. "_Disabled" or k:GetAttribute("OriginalName") or k.Name)
			end
		end
	end
end)
Groupboxes.Visuals_Settings:AddToggle("ESPRainbow", { ["Text"] = "Rainbow ESP", ["Default"] = false })
Groupboxes.Visuals_Settings:AddDivider()
TracerCategories = { "Entities", "Doors", "Objectives", "Items", "Chests", "HidingSpots" }
for o, T in ipairs(TracerCategories) do
	local k = T
	local P = k .. "Tracers"
	local w = ESPToggleKeys[k]
	local F = k == "HidingSpots" and "Hiding Spots" or k
	Groupboxes.Visuals_Settings:AddToggle(P, { ["Text"] = F .. " Tracers", ["Default"] = false })
	p[P]:OnChanged(function(o)
		if o and not p[w].Value then
			p[P]:SetValue(false)
			return
		end
		for T, P in ipairs(ESPCategories[k]) do
			local w = GetESPTarget(P, k)
			if w then
				q:SetTracersEnabled(w, o)
			end
		end
	end)
end
Groupboxes.Visuals_Settings:AddDropdown(
	"ESPTracerOrigin",
	{ ["Text"] = "Tracer Origin", ["Values"] = { "Top", "Middle", "Bottom" }, ["Default"] = 3 }
)
Groupboxes.Visuals_Settings:AddToggle("ESPShowText", { ["Text"] = "Show ESP Text", ["Default"] = true })
Groupboxes.Visuals_Settings:AddToggle("ESPShowDistance", { ["Text"] = "Show Distance", ["Default"] = true })
Groupboxes.Visuals_Settings:AddSlider(
	"ESPTextSize",
	{
		["Text"] = "Text Size",
		["Min"] = 8,
		["Max"] = 24,
		["Default"] = 15,
		["Rounding"] = 0,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Settings:AddDropdown(
	"ESPTextFont",
	{
		["Text"] = "Text Font",
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
		["Default"] = 11,
	}
)
Groupboxes.Visuals_Settings:AddSlider(
	"ESPRenderLimit",
	{
		["Text"] = "ESP )\185\171r\193x\020r~*Vs9\143\030",
		["Min"] = 30,
		["Max"] = 240,
		["Default"] = 240,
		["Rounding"] = 0,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Settings:AddSlider(
	"ESPMaxDistance",
	{
		["Text"] = "ESP Distance",
		["Min"] = 50,
		["Max"] = 500,
		["Default"] = 250,
		["Rounding"] = 0,
		["Compact"] = true,
		["Suffix"] = " studs",
	}
)
Groupboxes.Visuals_Settings:AddDivider()
Groupboxes.Visuals_Settings:AddToggle(
	"UseESPOutlineColour",
	{
		["Text"] = "Use ESP Outline (colour)",
		["Default"] = false,
		["Tooltip"] = "Makes the outline of all ESP the same colour as the ESP itself",
	}
)
p.UseESPOutlineColour:AddColorPicker(
	"ESPOutline",
	{ ["Text"] = "ESP Outline", ["Default"] = Color3.fromRGB(255, 255, 255) }
)
Groupboxes.Visuals_Settings:AddSlider(
	"ESPFillTransparency",
	{
		["Text"] = "Fill Transparency",
		["Min"] = 0,
		["Max"] = 1,
		["Default"] = 0.75,
		["Rounding"] = 2,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Settings:AddSlider(
	"ESPOutlineTransparency",
	{
		["Text"] = "Outline Transparency",
		["Min"] = 0,
		["Max"] = 1,
		["Default"] = 0,
		["Rounding"] = 2,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Settings:AddSlider(
	"ESPTextTransparency",
	{
		["Text"] = "Text Transparency",
		["Min"] = 0,
		["Max"] = 1,
		["Default"] = 0,
		["Rounding"] = 2,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Settings:AddSlider(
	"ESPTextOutlineTransparency",
	{
		["Text"] = "Text Outline Transparency",
		["Min"] = 0,
		["Max"] = 1,
		["Default"] = 0,
		["Rounding"] = 2,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Settings:AddSlider(
	"ESPTracerThickness",
	{
		["Text"] = "Tracer Thickness",
		["Min"] = 0.5,
		["Max"] = 2,
		["Default"] = 0.75,
		["Rounding"] = 2,
		["Compact"] = true,
	}
)
Groupboxes.Visuals_Notifs = rT.Visuals:AddLeftGroupbox("Entity Notifications")
Groupboxes.Visuals_Notifs:AddToggle(
	"NotifyEntities",
	{
		["Text"] = "Entity Notifications",
		["Default"] = false,
		["Tooltip"] = "Receive notifications/popups when entities spawn",
	}
)
Groupboxes.Visuals_Notifs:AddDropdown(
	"EntityList",
	{
		["Text"] = "Entity List",
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
		["AllowNull"] = true,
		["Tooltip"] = "Only notify for selected entities (leave empty to notify all)",
	}
)
Groupboxes.Visuals_Notifs:AddDropdown(
	"NotifyStyle",
	{ ["Text"] = "Notification Style", ["Values"] = { "Obsidian", "Achievement" }, ["Default"] = 1 }
)
Groupboxes.Visuals_Notifs:AddDropdown(
	"NotifySound",
	{
		["Text"] = "Notification Sound",
		["Values"] = { "Achievement", "Tone", "Alert", "Windows XP", "GTA Cell" },
		["Default"] = 5,
	}
)
Groupboxes.Visuals_Notifs:AddDivider()
Groupboxes.Visuals_Notifs:AddToggle(
	"EntityChatToggle",
	{
		["Text"] = "Notify Chat",
		["Default"] = false,
		["Tooltip"] = "Sends a message in the chat when an entity spawns",
	}
)
Groupboxes.Visuals_Notifs:AddInput(
	"EntityChatMessage",
	{ ["Text"] = "Message", ["Default"] = "spawned!", ["Numeric"] = false, ["Placeholder"] = "Message" }
)
Groupboxes.Visuals_ItemNotifs = rT.Visuals:AddLeftGroupbox("Item Notifications")
Groupboxes.Visuals_ItemNotifs:AddToggle(
	"NotifyItems",
	{
		["Text"] = "Item Notifications",
		["Default"] = false,
		["Tooltip"] = "Receive notifications/popups when items spawn (shows distance)",
	}
)
Groupboxes.Visuals_ItemNotifs:AddDropdown(
	"ItemList",
	{
		["Text"] = "Item List",
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
		["AllowNull"] = true,
		["Tooltip"] = "Only notify for selected items (leave empty to notify all)",
	}
)
Groupboxes.Visuals_ItemNotifs:AddDropdown(
	"ItemNotifyStyle",
	{ ["Text"] = "Notification Style", ["Values"] = { "Obsidian", "Achievement" }, ["Default"] = 1 }
)
Groupboxes.Visuals_ItemNotifs:AddDropdown(
	"ItemNotifySound",
	{
		["Text"] = "Notification Sound",
		["Values"] = { "Achievement", "Tone", "Alert", "Windows XP", "GTA Cell" },
		["Default"] = 4,
	}
)
Groupboxes.Visuals_ItemNotifs:AddDivider()
Groupboxes.Visuals_ItemNotifs:AddToggle(
	"ItemChatToggle",
	{
		["Text"] = "Notify Chat",
		["Default"] = false,
		["Tooltip"] = "Sends a message in the chat when an item spawns",
	}
)
Groupboxes.Visuals_ItemNotifs:AddInput(
	"ItemChatMessage",
	{ ["Text"] = "Message", ["Default"] = "spawned!", ["Numeric"] = false, ["Placeholder"] = "Message" }
)
p.ESPRainbow:OnChanged(function(o)
	q:SetRainbow(o)
end)
l.ESPTracerOrigin:OnChanged(function(o)
	local T = { ["Top"] = "Top", ["Middle"] = "Center", ["Bottom"] = "Bottom" }
	q:SetTracerOrigin(T[o] or "Bottom")
end)
p.ESPShowText:OnChanged(function(o)
	q.ShowESPText = o
end)
p.ESPShowDistance:OnChanged(function(o)
	q:SetShowDistance(o)
end)
l.ESPTextSize:OnChanged(function(o)
	q:SetTextSize(o)
end)
l.ESPTextFont:OnChanged(function(o)
	q:SetFont(Enum.Font[o])
end)
l.ESPRenderLimit:OnChanged(function(o)
	q:SetRenderLimit(o)
end)
l.ESPMaxDistance:OnChanged(function(o)
	q.MaxDistance = o
end)
l.ESPFillTransparency:OnChanged(function(o)
	q:SetFillTransparency(o)
end)
l.ESPOutlineTransparency:OnChanged(function(o)
	q:SetOutlineTransparency(o)
end)
l.ESPTextTransparency:OnChanged(function(o)
	q:SetTextTransparency(o)
end)
l.ESPTextOutlineTransparency:OnChanged(function(o)
	q:SetTextOutlineTransparency(o)
end)
l.ESPFadeTime:OnChanged(function(o)
	if p.ESPFade.Value then
		q:SetFadeTime(o)
	end
end)
p.ESPFade:OnChanged(function(o)
	q:SetFadeTime(o and l.ESPFadeTime.Value or 0)
end)
p.ESPArrowsToggle:OnChanged(function(o)
	q:SetArrows(o)
end)
l.ESPArrowsRadius:OnChanged(function(o)
	q:SetArrowRadius(o)
end)
l.ESPTracerThickness:OnChanged(function(o)
	q:SetTracerSize(o)
end)
p.UseESPOutlineColour:OnChanged(function(o)
	q:SetMatchColors(o)
end)
l.ESPOutline:OnChanged(function(o)
	q:SetOutlineColor(o)
end)
q:SetMatchColors(p.UseESPOutlineColour.Value)
q:SetOutlineColor(l.ESPOutline.Value)
q:SetShowDistance(true)
q:SetFont(Enum.Font.Code)
q:SetTextSize(15)
q.ShowESPText = true
q:SetRenderLimit(240)
q.MaxDistance = 250
q:SetFillTransparency(0.75)
q:SetOutlineTransparency(0)
q:SetTextTransparency(0)
q:SetTextOutlineTransparency(0)
q:SetFadeTime(p.ESPFade and (p.ESPFade.Value and l.ESPFadeTime.Value) or 0)
q:SetArrows(false)
q:SetArrowRadius(250)
q:SetTracerSize(0.75)
local mu
local ru = j:FindFirstChild("FloorReplicated")
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
			local o = a:FindFirstChildOfClass("PlayerGui")
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
p.RemoveCameraBobbing:OnChanged(function(o)
	local T = requestMinesGenerator()
	if T and T.spring then
		T.spring.Speed = o and 9000000000 or 8
	end
end)
p.RemoveCameraFog:OnChanged(function(o)
	Lighting.FogEnd = o and 10000000 or (L.OldFog or Lighting.FogEnd)
	for T, k in ipairs(L.FogInstances) do
		k.Density = o and 0 or k:GetAttribute("Density_Old")
	end
end)
p["DisableF\208+G\154$83\012--,\218E"]:OnChanged(function(o)
	local T = workspace:FindFirstChild("CurrentRooms")
	if T then
		for T, k in T:GetChildren() do
			if o then
				k:SetAttribute("Firedamp", false)
				for o, T in R:GetChildren() do
					if T.Name == "LiveFiredamp" then
						T:Destroy()
					end
				end
			else
				k:SetAttribute("Firedamp", k:GetAttribute("Firedamp_Old"))
			end
		end
	end
	local k = a:GetAttribute("CurrentRoom")
	a:SetAttribute("CurrentRoom", 0)
	task.wait()
	a:SetAttribute("CurrentRX#~", k)
end)
local function refreshHidingSpotVisibility(o, T)
	for k, P in ipairs(ESPCategories.HidingSpots) do
		local w = false
		for o, T in P:GetDescendants() do
			if T.Name == "HiddenPlayer" and T.Value == b then
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
p.TransparentHidingSpotsToggle:OnChanged(function(o)
	refreshHidingSpotVisibility(o, l.TransparentHidingSpotsSlider.Value)
end)
l.TransparentHidingSpotsSlider:OnChanged(function(o)
	refreshHidingSpotVisibility(p.TransparentHidingSpotsToggle.Value, o)
end)
local function updateJumpscareSettings(o)
	local T = a:FindFirstChildOfClass("PlayerGui")
	local k = T and T:FindFirstChild("MainUI")
	local P = k and k:FindFirstChild("Initiator")
	local w = P and P:FindFirstChild("Main_Game")
	local F = w and w:FindFirstChild("Remo\127\1754j,BU\232\223\236")
	local A = l.JumpscaresList.Value or {}
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
p.DisableJumpscares:OnChanged(updateJumpscareSettings)
l.JumpscaresList:OnChanged(function()
	if p.DisableJumpscares.Value then
		updateJumpscareSettings(true)
	end
end)
do
	local o
	o = i.RenderStepped:Connect(function()
		if _Unloading then
			if o then
				o:Disconnect()
			end
			return
		end
		local T = requestMinesGenerator()
		if T then
			if p.RemoveCameraShake.Value then
				T.csgo = CFrame.new()
			end
			if p.RemoveCameraBobbing.Value and (T.spring and T.spring.Speed ~= 9000000000) then
				T.spring.Speed = 9000000000
			end
			if p["9\139\021@m.\003\228\235\206\229\181\021p'\251\014RZ\019\015"].Value then
				T.tooloffset =
					Vector3.new(l.ViewmodelOffsetX.Value, l.ViewmodelOffsetY.Value, l.ViewmodelOffsetZ.Value)
			else
				T.tooloffset = Vector3.zero
			end
		end
		if p.AmbientToggle and p.AmbientToggle.Value then
			(TweenService:Create(
				Lighting,
				TweenInfo.new(0.2, Enum.EasingStyle.Exponential),
				{ ["Ambient"] = l.AmbientColor.Value }
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
	["Eyes"] = {
		["Alias"] = "Eyes",
		["Text"] = "Eyes has/+\200\150\021\200I&\238\226.\017\180\233\229s1O\1913",
	},
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
	["AR0xg\142EW\228"] = { ["Alias"] = "Glitch Ambush", ["Danger"] = true },
	["GlitchRush"] = { ["Alias"] = "Glitch Rush", ["Danger"] = true },
	["GlitchAmbush"] = { ["Alias"] = "Glitch Ambush", ["Danger"] = true },
	["GiggleCeiling"] = { ["Alias"] = "Giggle" },
	["GrumbleRig"] = { ["Alias"] = "Grumble" },
	["DronesStampede"] = {
		["Alias"] = "Drones",
		["Danger"] = true,
		["Text"] = "Drones are stampeding, hide!",
	},
	["BashMoving"] = { ["Alias"] = "Bash", ["ȶ}r"] = true },
	["Water"] = { ["Alias"] = "Electric Puddle", ["Danger"] = false, ["Text"] = "Electric Puddle nearby!" },
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
		local function T(T, k)
			local P = k:match("%.([a-zA-Z0-9]+)$") or "mp3"
			local w = o .. ("/" .. (T .. ("." .. P)))
			if not isfile(w) then
				writefile(w, game:HttpGet(k))
			end
			return getcustomasset(w)
		end
		rd.SoundAssets.Tone = T(
			"tone",
			"https://raw.githubusercontent.com/doram44/cheesy/main/notif%20sounds/tone%20notification.mp3"
		)
		rd.SoundAssets.Alert = T(
			"alert",
			"https://raw.githubusercontent.com/doram44/cheesy/main/notif%20sounds/alert%20notification.mp3"
		)
		rd.SoundAssets["Windows XP"] = T(
			"xp",
			"https://raw.githubusercontent.com/doram44/cheesy/main/notif%20sounds/windows%20xp%20exclamation.ogg"
		)
		rd.SoundAssets["GTA Cell"] = T(
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
		local T = l[o].Value
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
	local function X(o, T, k, P, w)
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
	X("Title", o, 0, 18, Enum.Font.GothamBold)
	X("Desc", T, 34, 14, Enum.Font.Gotham)
	if k then
		X("Reason", k, 64, 14, Enum.Font.Gotham)
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
	if not a then
		rd.CustomAchievement(o, T, k)
		return
	end
	local w = a:FindFirstChild("PlayerGui")
	local F = w and (w:FindFirstChild("GlobalUI") or w:FindFirstChild("MainUI"))
	local A = F and F:FindFirstChild("AchievementsHolder")
	local d = A and A:FindFirstChild("Achievement")
	if not (F and (A and d)) then
		rd.CustomAchievement(o, T, k)
		return
	end
	local function C(o, T, k)
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
	C(A, "rbxassetid://10469938989", 1)
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
	if not p.NotifyEntities.Value then
		return
	end
	local P = l.EntityList.Value
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
		["3\152\13833?\132\236\241\234"] = true,
		["AmbushMoving"] = true,
		["A60"] = true,
		["BackdoorRush"] = true,
		["RNIUSHCG=="] = true,
		["AR0xMBUSH"] = true,
		["BashMoving"] = true,
	}
	if p.Godmode.Value and F[o.Name] then
		w = k.Alias .. " is coming, but you have godmode enabled so don't worry!"
	end
	if o.Name == "Scribbles" then
		if p.AntiScribbles and p.AntiScribbles.Value then
			w = "Scribbles is coming, but you have no scribbles damage on so don't worry!"
		else
			w = "Scribbles is coming, hide!"
		end
	end
	local A = l.NotifyStyle.Value
	if A == "Obsidian" then
		T:Notify({ ["Title"] = "Entity detected", ["Description"] = w, ["Time"] = 5 })
	else
		task.spawn(function()
			rd.ShowAchievement("Entity detected", w, nil, "Entity '" .. ((k.Alias or "") .. "' has spawned"))
		end)
	end
	if p.EntityChatToggle.Value then
		Functions.SendChat(k.Alias .. (" " .. l.EntityChatMessage.Value))
	end
	task.delay(6, function()
		rd.ActiveEntity = math.max(0, rd.ActiveEntity - 1)
	end)
end
L.ObjectQueue = {}
L.ObjectQueueHead = 1
L.ObjectQueueTail = 0
L["?\008p\1808\1488\002\242\002\242\176\155.\162\159"] = 0
local function queueWorldObject(o)
	if not o then
		return
	end
	L.ObjectQueueTail = L.ObjectQueueTail + 1
	L.ObjectQueue[L.ObjectQueueTail] = o
	L.ObjectQueueCount = L.ObjectQueueCount + 1
end
for o, T in workspace:GetDescendants() do
	queueWorldObject(T)
end
L.OldFog = Lighting.FogEnd
for o, T in Lighting:GetChildren() do
	if T:IsA("Atmosphere") then
		local o = T
		o:SetAttribute("Density_Old", o.Density)
		local k = (o:GetPropertyChangedSignal("Density")):Connect(function()
			if o.Density ~= 0 then
				o:SetAttribute("Density_Old", o.Density)
			end
			if p.RemoveCameraFog.Value then
				o.Density = 0
			end
		end)
		T.Destroying:Once(function()
			k:Disconnect()
		end)
		table.insert(Connections, k)
		table.insert(L.FogInstances, T)
	end
end
local function processWorldObjectQueue()
	if _Unloading then
		return
	end
	local o = L.ObjectQueueCount
	if o <= 0 then
		return
	end
	local T = L.ObjectQueue
	local k = L.ObjectQueueHead
	local P = L.ObjectQueueTail
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
		L.ObjectQueueCount = L.ObjectQueueCount - 1
		if o and o.Parent then
			task.spawn(processESPObject, o)
			task.spawn(trackProximityPrompt, o)
			task.spawn(processRoom, o)
		end
		if (os.clock() - F) * 1000 >= 6 then
			break
		end
	end
	L.ObjectQueueHead = k
	if k > 1024 and (k - 1) > L.ObjectQueueCount then
		local o = {}
		for k = k, P, 1 do
			local P = T[k]
			if P ~= nil then
				o[#o + 1] = P
			end
		end
		L.ObjectQueue = o
		L.ObjectQueueHead = 1
		L.ObjectQueueTail = #o
	end
end
Connections.ObjectQueueDrain = i.RenderStepped:Connect(processWorldObjectQueue)
Connections.ObjectQueueFeed = workspace.DescendantAdded:Connect(queueWorldObject)
LastPromptFix = tick()
i.Heartbeat:Connect(function()
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
			if p and (p.InstantInteract and (p.InstantInteract.Value and T.HoldDuration ~= 0)) then
				T.HoldDuration = 0
			end
			if p and (p.PromptClip and (p.PromptClip.Value and T.RequiresLineOfSight ~= false)) then
				T.RequiresLineOfSight = false
			end
			if p and (p.PromptReach and p.PromptReach.Value) then
				local o = T:GetAttribute("MaxActivationDistance_Old")
				if o then
					local k = l and (l.PromptRange and o * l.PromptRange.Value)
					if k and T.MaxActivationDistance ~= k then
						T.MaxActivationDistance = k
					end
				end
			end
		end
	end
	if p and (p.NotifyVulnerable and (p.NotifyVulnerable.Value and u)) then
		local o = u.Position.Y
		if VulnerableLastY then
			if o - VulnerableLastY >= 3 and tick() - VulnerableNotifCooldown >= 3 then
				T:Notify({
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
p.AutoClosetToggle:OnChanged(function(o)
	if _AutoHideConnection then
		_AutoHideConnection:Disconnect()
		_AutoHideConnection = nil
	end
	if o then
		_AutoHideConnection = i.Heartbeat:Connect(function()
			if _Unloading then
				return
			end
			if not b or not u or not B then
				return
			end
			if tick() - AutoHide.Last <= 0.1 then
				return
			end
			local o = Functions.GetNearestEntity(true, l.AutoClosetEntityList.Value)
			if o then
				local o = Functions.GetNearestHidingSpot()
				if b:GetAttribute("Hiding") ~= true and o then
					Functions.ForceFirePrompt(o.HidePrompt)
				end
			elseif b:GetAttribute("Hiding") == true then
				Z.CamLock:FireServer()
			end
			if
				p.RemoveClosetDelay.Value
				and (
					B.MoveDirection ~= Vector3.zero
					and (
						(t.Anchored or u.Anchored)
						and (b:GetAttribute("AnimatingClient") ~= true and b:GetAttribute("Hiding") == true)
					)
				)
			then
				Z.CamLock:FireServer()
			end
			AutoHide.Last = tick()
		end)
	end
end)
local function watchOxygen()
	if b then
		local o = -1
		local k = { 80, 60, 40, 20 }
		(b:GetAttributeChangedSignal("Oxygen")):Connect(function()
			local P = b:GetAttribute("Oxygen")
			if p.NotifyOxygen and p.NotifyOxygen.Value then
				local w = math.floor(P + 0.5)
				if w ~= o and TableFind(k, w) then
					T:Notify({
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
			if p.NotifyHasteTime and p.NotifyHasteTime.Value then
				local k = ru.DigitalTimer.Value
				local P = { 90, 60, 30, 15 }
				if TableFind(P, k) and k ~= o then
					o = k
					T:Notify({
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
a.CharacterAdded:Connect(function()
	task.wait(1)
	watchOxygen()
end)
Connections.FogHandler = (Lighting:GetPropertyChangedSignal("FogEnd")):Connect(function()
	if Lighting.FogEnd ~= 10000000 then
		L.OldFog = Lighting.FogEnd
	end
	if p.RemoveCameraFog.Value then
		Lighting.FogEnd = 10000000
	end
end)
Connections.FogHandler2 = Lighting.DescendantAdded:Connect(function(o)
	if not o:IsA("Atmosphere") then
		return
	end
	o:SetAttribute("Density_Old", o.Density)
	if p.RemoveCameraFog.Value then
		o.Density = 0
	end
	local T = (o:GetPropertyChangedSignal("Density")):Connect(function()
		if o.Density ~= 0 then
			o:SetAttribute("Density_Old", o.Density)
		end
		if p.RemoveCameraFog.Value then
			o.Density = 0
		end
	end)
	o.Destroying:Once(function()
		T:Disconnect()
	end)
	table.insert(Connections, T)
	table.insert(L.FogInstances, o)
end)
a.CharacterAppearanceLoaded:Connect(function()
	task.wait(1)
	local o = requestMinesGenerator()
	if p.RemoveCameraBobbing.Value and (o and o.spring) then
		o.spring.Speed = 9000000000
	end
end)
a.CharacterAdded:Connect(function()
	task.wait(1)
	mu = nil
	local o = requestMinesGenerator()
	if p.RemoveCameraBobbing.Value and (o and o.spring) then
		o.spring.Speed = 9000000000
	end
	if p.DisableJumpscares.Value then
		updateJumpscareSettings(true)
	end
end)
P:SetFolder("cheesy/Data")
P:SetLibrary(T)
X()
pcall(function()
	if not isfile(P.Folder .. "/themes/default.txt") then
		writefile(P.Folder .. "/themes/default.txt", "cheesy")
	end
end)
k:SetFolder("cheesy/Configs")
k:SetLibrary(T);
(getgenv()).Library = T
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
	local function A(o)
		if typeof(o) ~= "string" then
			return nil
		end
		local T = (o:lower()):gsub("[%s%-_/]", "")
		if T == "" then
			return "\232\152c5V"
		end
		return F[T] or o
	end
	local function d(o, T)
		if o == nil then
			return true
		end
		if typeof(o) == "string" then
			if o == "*" then
				return true
			end
			return A(o) == T
		end
		if typeof(o) == "table" then
			for o, k in ipairs(o) do
				if d(k, T) then
					return true
				end
			end
			return false
		end
		return true
	end
	local function C(o, T)
		if not o then
			return
		end
		pcall(function()
			o:SetVisible(T)
		end)
	end
	local function f(o, T)
		if not o then
			return
		end
		pcall(function()
			o:SetVisible(T)
		end)
	end
	local function m()
		local o = A(z())
		for T, k in pairs(AddonFilters) do
			if k ~= nil then
				local w = d(k, o)
				for o, T in ipairs(AddonTabsByOwner[T] or {}) do
					f(T, w)
				end
				for o, T in ipairs(P[T] or {}) do
					C(T, w)
				end
			end
		end
	end
	local function r(T, k)
		pcall(function()
			o:UpdateWarningBox({ ["Visible"] = true, ["IsNormal"] = true, ["Title"] = T, ["Text"] = k })
		end)
	end
	local function G(o)
		if type(o) == "string" then
			local T = o:lower()
			if T == "right" or T == "2" then
				return "Right"
			end
			if T == "left" or T == "1" then
				return "Left"
			end
		end
		return "Left"
	end
	local function y(o)
		if o then
			table.insert(LoadedAddonGroupboxes, o)
		end
		return o
	end
	local function X(o)
		if o and w then
			if not P[w] then
				P[w] = {}
			end
			table.insert(P[w], o)
		end
		return o
	end
	local function I(T, k, P)
		local w = T or o
		if not w then
			return nil
		end
		local F = G(P)
		local A
		pcall(function()
			if F == "Right" then
				A = w:AddRightGroupbox(k)
			else
				A = w:AddLeftGroupbox(k)
			end
		end)
		return X(y(A))
	end
	local function V(k, P, w)
		local F = tostring(P)
		local A, d, C = F:match("([^%s:]+):(%d+):(.+)")
		local f
		if d then
			f = string.format("Line %d: %s", math.max(tonumber(d) - w, 1), C)
		else
			f = F
		end
		local m = I(o, k .. " Error", "Left")
		if not m then
			return
		end
		local r
		pcall(function()
			r = m:AddLabel({ ["Text"] = f, ["DoesWrap"] = true })
		end)
		if r and r.TextLabel then
			pcall(function()
				r.TextLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
			end)
			pcall(function()
				local o = T.RegistryMap and T.RegistryMap[r.TextLabel]
				if o then
					o.Properties.TextColor3 = "RedColor"
				end
			end)
		end
	end
	local function q()
		local o = {
			["AddonInfo"] = nil,
			["_queue"] = {},
			["Connections"] = {},
			["Groupboxes"] = {},
			["DefaultSide"] = "Left",
		}
		function o.AddTab(P, o, T)
			if type(o) ~= "string" or o == "" then
				return nil
			end
			if k[o] then
				return k[o]
			end
			local F
			pcall(function()
				F = dT:AddTab(o, T)
			end)
			if F then
				k[o] = F
				if w then
					if not AddonTabsByOwner[w] then
						AddonTabsByOwner[w] = {}
					end
					table.insert(AddonTabsByOwner[w], F)
				end
			end
			return F
		end
		function o.AddLeftGroupbox(k, o, T)
			return I(T, o or "Addon", "Left")
		end
		function o.AddRightGroupbox(k, o, T)
			return I(T, o or "Addon", "Right")
		end
		function o.SetGroupboxVisible(k, o, T)
			C(o, T)
		end
		function o.SetTabVisible(k, o, T)
			f(o, T)
		end
		function o.Connect(k, T)
			if T then
				table.insert(o.Connections, T)
				table.insert(AddonConnections, T)
			end
			return T
		end
		function o.Track(T, o)
			if o and typeof(o) == "RBXScriptConnection" then
				T:Connect(o)
			end
			return o
		end
		function o.Notify(o, ...)
			return T:Notify(...)
		end
		local P = {}
		P.__index = function(T, k)
			return function(T, ...)
				local P = { ... }
				for o = 1, #P, 1 do
					if type(P[o]) == "table" and P[o].Func then
						P[o].Callback = P[o].Func
						P[o].Func = nil
						break
					end
				end
				table.insert(o._queue, { ["method"] = k, ["args"] = P })
			end
		end
		o.Groupbox = setmetatable({}, P)
		o.Globals = L
		o.Options = l
		o.Toggles = p
		o.Groupboxes = Groupboxes
		o.Tabs = rT
		o.Window = dT
		o.Library = T
		return o
	end
	local function M()
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
		AddonTabsByOwner = {}
		w = nil
		for o, T in ipairs(LoadedAddonGroupboxes) do
			if T then
				pcall(function()
					T:Destroy()
				end)
				pcall(function()
					if T.Holder then
						T.Holder:Destroy()
					end
				end)
			end
		end
		LoadedAddonGroupboxes = {}
	end
	L.ClearAddonGroupboxes = M
	local function i()
		if not o then
			return
		end
		M()
		if not isfolder or not makefolder or not listfiles or not readfile then
			r("User Addons", "Your executor does not support the required filesystem functions for addons.")
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
			r(
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
			r(
				"User Addons",
				"Your addons folder is currently empty. Insert a .lua file into '"
					.. (AddonFolderPath .. "'.")
			)
			return
		end
		r(
			"User Addons",
			"Share your addons in the discord! Addons that aren't checked or aren't open source could be malicious or untrustworthy. Be careful with what you decide to use."
		)
		for k, F in ipairs(F) do
			local A, d = pcall(readfile, F.path)
			if A and (d and d ~= "") then
				local k = q()
				P[F.name] = {}
				AddonFilters[F.name] = nil
				w = F.name
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
						f(k, T)
					end)
				end
				pcall(function()
					warn = C
				end)
				if not G then
					V(F.name, y, 1)
				elseif k.AddonInfo then
					local T = k.AddonInfo
					AddonFilters[F.name] = T.Floor or T.Game
					local P = T.Title or T.Name or F.name
					local w = I(o, P)
					if w then
						if T.Description and T.Description ~= "" then
							pcall(function()
								w:AddLabel({ ["Text"] = T.Description, ["DoesWrap"] = true })
							end)
						end
						for o, T in ipairs(k._queue) do
							if w[T.method] then
								pcall(w[T.method], w, unpack(T.args))
							end
						end
					end
				elseif #(P[F.name] or {}) == 0 then
					local o = A
					if not o or o == "" then
						o = "the addon finished without erroring but it never built any ui, it probably stopped early or swallowed its own error"
					end
					V(F.name, o, 0)
				end
				if G and (A and A ~= "") then
					V(F.name, A, 0)
				end
				w = nil
			end
		end
		m()
	end
	L.RefreshAddonFloors = m
	RefreshAddons = function()
		i()
		CheesyApplyTranslationsReport("after addons reload")
	end
	rT.UserAddons = dT:AddTab("User Addons", "user-star")
	o = rT.UserAddons
	i()
end
local ju = dT:AddTab("Settings", "palette")
local Du = ju:AddLeftGroupbox("Menu")
Du:AddToggle("ShowCustomCursor", {
	["Text"] = "Custom Cursor",
	["Default"] = false,
	["Callback"] = function(o)
		T.ShowCustomCursor = o
	end,
});
(Du:AddLabel("Menu Keybind")):AddKeyPicker(
	"MenuKeybind",
	{ ["Default"] = "RightShift", ["NoUI"] = true, ["Text"] = "Menu Keybind" }
)
T.ToggleKeybind = l.MenuKeybind
Du:AddDropdown("DPIScale", {
	["Text"] = "DPI Scale",
	["Values"] = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	["Default"] = "100%",
	["Callback"] = function(o)
		local k = tonumber((o:gsub("%%", "")))
		T:SetDPIScale(k or 100)
	end,
})
Du:AddDivider()
Du:AddDropdown("UILibrary", {
	["Text"] = "UI L\174\173\216c\144\148",
	["Values"] = { "Obsidian", "Linoria" },
	["Default"] = o == "Linoria" and 2 or 1,
	["Callback"] = function(k)
		o = k
		r()
		T:Notify({
			["Title"] = "UI Library",
			["Description"] = "Re-execute the script to apply",
			["Time"] = 5,
		})
	end,
})
Du:AddDivider();
(Du:AddButton({
	["Text"] = "Test Notif",
	["Tooltip"] = "Sends a test notification with the selected style and sound settings",
	["Func"] = function()
		rd.PlaySound()
		T:Notify({ ["Title"] = "Test", ["Time"] = 5 })
	end,
})):AddButton({
	["Text"] = "Refresh Addons",
	["Tooltip"] = "Reloads all .lua files from cheesy/addons",
	["Func"] = function()
		if RefreshAddons then
			RefreshAddons()
			T:Notify({ ["Title"] = "Addons", ["Description"] = "Addons reloaded", ["Time"] = 3 })
		end
	end,
})
Du:AddButton({
	["Text"] = "Unload Script",
	["Tooltip"] = "Completely unloads the script and cleans up everything",
	["Func"] = function()
		T:Unload()
	end,
})
Du:AddToggle("CheesyWindowIcon", {
	["Text"] = "Cheesy Icon",
	["Tooltip"] = "Disables/enables the cheesy title logo/icon in obsidian",
	["Default"] = true,
	["Callback"] = function(o)
		local k = setMenuVisibility(o)
		if not k and not CheesyIconWarned then
			CheesyIconWarned = true
			T:Notify({
				["Title"] = "Cheesy Icon",
				["Description"] = "could not find the window icon, it only exists on the Obsidian UI library",
				["Time"] = 4,
			})
		end
	end,
})
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
	o:AddDivider()
	o:AddLabel({ ["Text"] = "Changing the language reloads the UI in the new language", ["DoesWrap"] = true })
	local F = false
	local A
	A = o:AddDropdown("CheesyLanguage", {
		["Text"] = "Language",
		["Values"] = k,
		["Default"] = w,
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
			T:Notify({
				["Title"] = "Language",
				["Description"] = "Re-executing the script to apply the new language",
				["Time"] = 3,
			})
		end,
	})
	o:AddButton({
		["Text"] = "Select Language",
		["Tooltip"] = "Applies the language picked in the dropdown above",
		["Func"] = function()
			local o = A or (T.Options and T.Options.CheesyLanguage)
			local k = o and o.Value
			local w = type(k) == "string" and P[k] or nil
			if not w then
				T:Notify({
					["Title"] = "Language",
					["Description"] = "Pick a language from the dropdown first",
					["Time"] = 3,
				})
				return
			end
			CheesyLanguage = w
			CheesySkipLanguagePrompt = true
			CheesyWriteUserData()
			T:Notify({
				["Title"] = "Language",
				["Description"] = "Re-executing the script to apply " .. tostring(k),
				["Time"] = 3,
			})
		end,
	})
	o:AddDivider()
	o:AddButton({
		["Text"] = "Reset Loading",
		["Tooltip"] = "Clears the saved language so the loading picker shows again",
		["Func"] = function()
			CheesySkipLanguagePrompt = false
			CheesyBumpLanguageVersion()
			T:Notify({
				["Title"] = "Language",
				["Description"] = "The language\249V\217\216B\197\248\235B47w\238\1812C\211\205\153<nX\136\244\163\028\000\147\030Z\186\000\142\166\214\197/\242{\174\005\000\197\128\230\\-\231ui",
				["Time"] = 4,
			})
		end,
	})
	o:AddDivider()
	o:AddToggle(
		"QueueOnTeleport",
		{
			["Text"] = "Queue On Teleport",
			["Default"] = false,
			["Tooltip"] = ' \007"\1758\005qsrcq\014fbe4\208\\"}\246a\160o\007\008\159\184\246d*\207~\020\023H\234\219\137\146\140\156LU\022\223\136\168+\023\182\215\013\195\157\207\150\146\233',
		}
	)
	p.QueueOnTeleport:OnChanged(function(o)
		if o then
			CheesyQueueOnTeleport()
		end
	end)
end
pcall(function()
	P:ApplyToGroupbox(Du)
end)
pcall(function()
	P:LoadDefault()
end)
k:SetIgnoreIndexes({ "MenuKeybind", "UILibrary" })
k:BuildConfigSection(ju)
k:LoadAutoloadConfig()
LangReady = true
CheesyIconOption = l.CheesyWindowIcon
if CheesyIconOption then
	setMenuVisibility(CheesyIconOption.Value ~= false)
end
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
		local k = p[T]
		if k and k.Value then
			k:SetValue(false)
		end
	end
end
ScriptCreatedObjectLists =
	{ ["SeekNodes"] = true, ["SeekHighlights"] = true, ["EyestalkHighlights"] = true, ["PathLights"] = true }
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
		local T = a.Character and a.Character:FindFirstChild("HumanoidRootPart")
		if T then
			T.Anchored = false
		end
		a.CameraMinZoomDistance = a:GetAttribute("fc_om") or 0.5
		a.CameraMaxZoomDistance = a:GetAttribute("fc_ox") or 128
	end
	if CameraConnection then
		CameraConnection:Disconnect()
		CameraConnection = nil
	end
	if _TPCharConn then
		_TPCharConn:Disconnect()
		_TPCharConn = nil
	end
	if R then
		R.CameraType = Enum.CameraType.Custom
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
	if (getgenv()).Library == T then
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
	if L and L.LobbyGuardConnection then
		L.LobbyGuardConnection:Disconnect()
		L.LobbyGuardConnection = nil
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
					T.RequiresLineOfSight = T:GetAttribute("RequiresLineOfSight_Old") or T.RequiresLineOfSight
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
					T.RequiresLineOfSight = T:GetAttribute("RequiresLineOfSight_Old") or T.RequiresLineOfSight
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
	pcall(q.Unload, q)
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
		if p and (p.FOVChanger and p.FOVChanger.SetValue) then
			p.FOVChanger:SetValue(false)
		end
	end)
	pcall(function()
		workspace.Gravity = 196.2
	end)
	pcall(function()
		Lighting.FogEnd = L and L.OldFog or Lighting.FogEnd
	end)
	pcall(function()
		for o, T in ipairs(L.FogInstances or {}) do
			local k = T:GetAttribute("Density_Old")
			if k then
				T.Density = k
			end
		end
	end)
	pcall(function()
		local o = j:FindFirstChild("FloorReplicated")
			and (
				j.FloorReplicated:FindFirstChild("ClientRemote")
				and j.FloorReplicated.ClientRemote:FindFirstChild("Haste")
			)
		if o then
			local T = o:FindFirstChild("Ambience")
			if T then
				T.Playing = true
			end
		end
	end)
	pcall(function()
		local o = a:FindFirstChildOfClass("PlayerGui")
		if o then
			local T = o:FindFirstChild("DisplayInfoLabel", true)
			if T then
				T:Destroy()
			end
		end
	end)
	if L then
		if L.SeekNodesFolder then
			L.SeekNodesFolder:Destroy()
		end
		if L.RoomsNodesFolder then
			L.RoomsNodesFolder:Destroy()
		end
		if L.HotelNodesFolder then
			L.HotelNodesFolder:Destroy()
		end
		pcall(function()
			if p.ForgetMeNotSolver then
				p.ForgetMeNotSolver:SetValue(false)
			end
		end)
		if L.OriginalGetMoveVector then
			pcall(function()
				local o = (require(a.PlayerScripts.PlayerModule)):GetControls()
				o.GetMoveVector = L.OriginalGetMoveVector
			end)
			L.OriginalGetMoveVector = nil
		end
		L.AnticheatDisabled = false
		L.RoomsAutoWalkActive = false
		L.HotelAutoWalkActive = false
		L.HotelSeekActive = false
		L.HotelFigureActive = false
		if L.HotelSeekConn then
			pcall(function()
				L.HotelSeekConn:Disconnect()
			end)
			L.HotelSeekConn = nil
		end
		pcall(function()
			(game:GetService("VirtualInputManager")):SendKeyEvent(
				false,
				Enum.KeyCode.LeftControl,
				false,
				game
			)
		end)
		L.HotelCrouchHeld = false
	end
	pcall(function()
		if L.ClearAddonGroupboxes then
			L.ClearAddonGroupboxes()
		end
	end)
	if AutoMinecartConnection then
		AutoMinecartConnection:Disconnect()
		AutoMinecartConnection = nil
	end
	if b then
		pcall(function()
			b:SetAttribute("CanJump", OldJump or false)
		end)
		pcall(function()
			b:SetAttribute("CanSlide", OldSlide or false)
		end)
		pcall(function()
			b:SetAttribute("SpeedBoost", 0)
		end)
		pcall(function()
			b:SetAttribute("SpeedBoostBehind", 0)
		end)
		pcall(function()
			b:SetAttribute("SpeedBoostExtra", 0)
		end)
		pcall(function()
			b:SetAttribute("SpeedBoostMod", 0)
		end)
		pcall(function()
			b:SetAttribute("AntiSpeed", nil)
		end)
		pcall(function()
			b:SetAttribute("Antispeed", nil)
		end)
		pcall(function()
			b:SetAttribute("SpeedBypass", nil)
		end)
		pcall(function()
			b:SetAttribute("Climbing", nil)
		end)
	end
	pcall(function()
		if p and (p.WalkspeedEnabled and p.WalkspeedEnabled.SetValue) then
			p.WalkspeedEnabled:SetValue(false)
		end
	end)
	if B then
		pcall(function()
			B.JumpPower = 5
		end)
		pcall(function()
			B.HipHeight = 2.367
		end)
		pcall(function()
			B.PlatformStand = false
		end)
		pcall(function()
			B:SetAttribute("AntiSpeed", nil)
		end)
		pcall(function()
			B:SetAttribute("Antispeed", nil)
		end)
	end
	if u then
		u.AssemblyLinearVelocity = Vector3.zero
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
			FakeEvents.Screech_Real.Parent = Z
		end
		if FakeEvents.Shade_Real then
			FakeEvents.Shade_Real.Parent = Z
		end
		if FakeEvents.A90_Real then
			FakeEvents.A90_Real.Parent = Z
		end
		if FakeEvents.Surge_Real then
			FakeEvents.Surge_Real.Parent = Z
		end
		for o, T in pairs(FakeEvents) do
			if type(T) == "Instance" and T:IsA("RemoteEvent") then
				pcall(T.Destroy, T)
			end
		end
	end
	if b then
		local o = b:FindFirstChild("CollisionClone")
		if o then
			o:Destroy()
		end
		local T = b:FindFirstChild("CollisionPartClone")
		if T then
			T:Destroy()
		end
	end
	if a then
		a.CameraMinZoomDistance = 0.5
		a.CameraMaxZoomDistance = 128
		a:SetAttribute("fc_om", nil)
		a:SetAttribute("fc_ox", nil)
		a:SetAttribute("fc_p", nil)
		a:SetAttribute("fc_y", nil)
	end
	if rT.Stairwell then
		rT.Stairwell:SetVisible(false)
	end
	if rT.FoolsHotel then
		rT.FoolsHotel:SetVisible(false)
	end
	if rT.Rooms then
		rT.Rooms:SetVisible(false)
	end
	if rT.UserAddons then
		rT.UserAddons:SetVisible(true)
	end
end
(getgenv()).CheesyUnload = unloadCheesy
T:OnUnload(function()
	_Unloading = true
	unloadCheesy();
	(getgenv()).CheesyUnload = nil
end)
T.ScreenGui.Destroying:Once(function()
	_Unloading = true
	unloadCheesy()
end)
do
	local o = game:GetService("LogService")
	local k
	k = o.MessageOut:Connect(function(o)
		if o == "client teleporting" then
			if L.AnticheatDisabled then
				L.AnticheatDisabled = false
				T:Notify({
					["Title"] = "Anticheat re-enabled",
					["Description"] = "Interact with a ladder for re-disabling",
					["Time"] = 5,
				})
			end
			k:Disconnect()
		end
	end)
end
rT.FoolsHotel:SetVisible(false)
T:Toggle(true)
T:Notify({
	["Title"] = "Loaded cheesy in " .. (math.floor((tick() - LoadStart) * 1000) / 1000 .. " seconds"),
	["Description"] = "discord.gg/CuZJQaCquK",
	["Time"] = 5,
})
CreditText = 'PLEASE READ: This script is ONLY made by one person, and the official discord server is "dsc.gg/cheesyscript" or "discord.gg/CuZJQaCquK", if you hav\153\153\143\025j\022\147\242\164\237\248\132\146\006\148\230\028(\178\242\239\235Nu\202\156\1570\191\2186\143\030\207\133\234.\145\241 \016\162\007\246D7\161\238`wD\181\014;\218)uR\\\000\148\020\160\143\161\168o\188}\202x\238T\151\217\149\029;\176\142\195\129X\162D\203:j\022\193\150\251\226\164\242\223CoI\229R\250E\028\224z\223@\247\159\236,\176\189\170\252\006\141t\\\248\168\018\209\002\224\172Ih\015\015\194o:\236\176\153\150\191[\252\131>\209sr$/\011\241\139\128\139\152s\185}G\235\031\254\188\225\142\018\236%\206\248\223\156\208I\127\203\205{\252\009\213\251\200\204\148\217\147\223\023\193\006\013\030\132\236*=\176DeE\\+\149\249z\028N\243\012T\225x,^\220\020\202\205\221\129f\187\169;\224z\162\252\17239~@\182\237v@a\014\154\1687\148\148<\130\166\206X\246\228\133\251XW^\167\242\186\230\167\220\183J\154\179\1387`\175K'
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
		P.Size = UDim2["Z"](0.85, 0, 0.7, 0)
		P.BackgroundTransparency = 1
		P.Font = Enum.Font.GothamBold
		P.TextScaled = true
		P["Text\145\189\246r\231T\160"] = true
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
		d["BackgroundTransparen\1388"] = 1
		d.Font = Enum.Font.Gotham
		d.TextSize = 18
		d.TextXAlignment = Enum.TextXAlignment["\220\011\235\195\022#"]
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
	pcall(r)
	task.spawn(showCreditSplash)
end
if p.AutoInteract then
	pcall(function()
		p.AutoInteract:SetDisabled(not hasFirePrompt)
	end)
end
if p.InfiniteItemsToggle then
	pcall(function()
		p.InfiniteItemsToggle:SetDisabled(not hasFirePrompt)
	end)
end
if p.InfiniteCrucifix then
	pcall(function()
		p.InfiniteCrucifix:SetDisabled(not hasFirePrompt)
	end)
end
if p.RemoveSeekTrigger then
	pcall(function()
		p.RemoveSeekTrigger:SetDisabled(not hasFireTouch)
	end)
end
if p.RemoveFigure then
	pcall(function()
		p.RemoveFigure:SetDisabled(not hasNetworkOwner)
	end)
end
if p.RemoveFigureMines then
	pcall(function()
		p.RemoveFigureMines:SetDisabled(not hasNetworkOwner)
	end)
end
if p.AutoHeartbeatMinigame then
	pcall(function()
		p.AutoHeartbeatMinigame:SetDisabled(not hasHookMeta)
	end)
end
if p.BypassEyes then
	pcall(function()
		p.BypassEyes:SetDisabled(not hasHookMeta)
	end)
end
if p.BypassLookman then
	pcall(function()
		p.BypassLookman:SetDisabled(not hasHookMeta)
	end)
end
if p.BypassMonument then
	pcall(function()
		p["Bypa\020B]\248\252$ajsy"]:SetDisabled(not hasHookMeta)
	end)
end
if p.RoomsAutoWalkSpoofFootsteps then
	pcall(function()
		p.RoomsAutoWalkSpoofFootsteps:SetDisabled(not hasHookMeta)
	end)
end
pcall(function()
	execName = RootEnv.identifyexecutor()
end)
CheesyApplyTranslationsReport("full ui")
local Ru = hasFirePrompt and (hasFireTouch and (hasReplicateSignal and (hasNetworkOwner and hasHookMeta)))
if Ru then
	T:Notify({
		["Title"] = "Yay",
		["Description"] = "All features should work as all used functions are supported :D ("
			.. (tostring(execName) .. ")"),
		["Time"] = 5,
	})
else
	T:Notify({
		["Title"] = "Uh oh",
		["Description"] = "Some features may not work as not all used functions are supported :( ("
			.. (tostring(execName) .. ")"),
		["Time"] = 5,
	})
end
pcall(function()
	local o = string.lower(tostring(execName))
	if o:find("xeno", 1, true) or o:find("solara", 1, true) then
		T:Notify({
			["Title"] = "Executor not supported",
			["Description"] = "Xeno and Solara are both very unstable and may/most likely will not work with the script, I advise using a better executor",
			["Time"] = 10,
		})
	end
end)
