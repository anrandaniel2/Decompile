--!nocheck
--[[
    roblox_shim.luau -- dynamic-analysis harness for obfuscated Roblox/Luau payloads.

    This file is not run directly: tools/harness/build_runner.py prepends a payload
    constant (`__PAYLOAD`) plus a small "instrumented payload" and then concatenates
    this file.  Everything the harness learns is printed to stdout as tab separated
    lines prefixed with `@@`, which the Python driver parses back into JSON:

        @@EVENT <kind> <fields...>
        @@FUNC  <table-tag> <field-name> <function-identity>
        @@API   <api-name> <function-identity-chain>
        @@STR   <origin> <escaped-string>
        @@CODE  <origin> <length> <sha-ish-head> <escaped-head>
        @@ERROR <phase> <message>
        @@DONE

    The harness emulates just enough of the Roblox / executor API surface for
    loaders and key-systems to reach their interesting code paths, and it
    instruments every API boundary so that obfuscated function identities can be
    mapped back to the behaviour they perform.
]]

local esc do
    local gsub = string.gsub
    esc = function(s)
        s = tostring(s)
        s = gsub(s, "\\", "\\\\")
        s = gsub(s, "\n", "\\n")
        s = gsub(s, "\r", "\\r")
        s = gsub(s, "\t", "\\t")
        s = gsub(s, "\0", "\\0")
        return s
    end
end

-- luacheck: globals print
local function emit(...)
    local n = select("#", ...)
    local parts = table.create(n)
    for i = 1, n do
        parts[i] = esc((select(i, ...)))
    end
    print(table.concat(parts, "\t"))
end

local stats = {api = 0, str = 0, func = 0}

local function pack(...) return {n = select("#", ...), ...} end

local function ident(v)
    if type(v) == "function" then
        return tostring(v):gsub("^function: ", "")
    end
    return "?"
end

-- Walk the current call stack and return "id>id>id..." for the calling frames.
local function stackchain(start)
    local out = {}
    for level = start or 2, (start or 2) + 14 do
        local ok, f = pcall(debug.info, level, "f")
        if not ok or f == nil then break end
        local s, l = debug.info(level, "sl")
        out[#out + 1] = ident(f) .. "@" .. tostring(s) .. ":" .. tostring(l)
    end
    return table.concat(out, ">")
end

---------------------------------------------------------------------------
-- recorder helpers
---------------------------------------------------------------------------
local seenStr = {}
local strOrder = {}

local function recordString(origin, s)
    if type(s) ~= "string" then return end
    if #s == 0 or #s > 20000 then return end
    -- only keep strings that look like real data (not pure binary noise)
    local printable = 0
    for i = 1, #s do
        local b = string.byte(s, i)
        if b >= 32 and b < 127 then printable += 1 end
    end
    if printable / #s < 0.75 then return end
    local key = origin .. "\0" .. s
    if seenStr[key] then return end
    seenStr[key] = true
    strOrder[#strOrder + 1] = key
    stats.str += 1
    emit("@@STR", origin, s)
end

local function recordApi(name, detail)
    stats.api += 1
    emit("@@API", name, detail or "", stackchain(3))
end

---------------------------------------------------------------------------
-- budget abort machinery
--
-- The payload runs inside its own `pcall`s (and inside coroutines).  A plain
-- `error()` therefore gets swallowed and the Lua-implemented VM keeps spinning
-- forever.  The sandbox hands the payload guarded versions of `pcall`,`xpcall`
-- and `coroutine.resume` that re-raise the abort sentinel, so a run always
-- terminates exactly when the harness snapshots its results.
---------------------------------------------------------------------------
local ABORT = setmetatable({}, { __tostring = function() return "\0ARENA_ABORT" end })

local function isAbort(e)
    if e == ABORT then return true end
    if type(e) == "string" and string.find(e, "ARENA_ABORT", 1, true) then return true end
    return false
end

local realPcall, realXpcall = pcall, xpcall
local function guardedPcall(f, ...)
    local res = pack(realPcall(f, ...))
    if not res[1] and isAbort(res[2]) then error(ABORT, 0) end
    return table.unpack(res, 1, res.n)
end
local function guardedXpcall(f, handler, ...)
    local res = pack(realXpcall(f, handler, ...))
    if not res[1] and isAbort(res[2]) then error(ABORT, 0) end
    return table.unpack(res, 1, res.n)
end

---------------------------------------------------------------------------
-- emulated Roblox world
---------------------------------------------------------------------------
local Services = {}
local Signal = {}
Signal.__index = Signal
function Signal.new()
    return setmetatable({handlers = {}}, Signal)
end
function Signal:Connect(fn)
    self.handlers[#self.handlers + 1] = fn
    return {Disconnect = function() end, Connected = true}
end
Signal.connect = Signal.Connect
function Signal:Wait() return nil end
function Signal:Once(fn) return self:Connect(fn) end

local function makeInstance(className, props)
    local inst = {}
    local mt
    local function getter(k)
        local v = props[k]
        if v ~= nil then return v end
        if k == "ClassName" then return className end
        local name = tostring(k)
        if name:sub(1, 3) == "Get" and name:sub(-6) ~= "Signal" then
            return function(_, ...) recordApi(className .. ":" .. name, ""); return nil end
        end
        if name:match("Changed$") then return Signal.new() end
        -- common property defaults
        local defaults = {
            Position = {X = 0, Y = 0, Z = 0}, Size = {X = 0, Y = 0}, Transparency = 0,
            Visible = true, Text = "", Value = 0, Name = "Instance", Parent = nil,
            AbsoluteSize = {X = 0, Y = 0}, AbsolutePosition = {X = 0, Y = 0},
            BackgroundTransparency = 0, ZIndex = 1, Enabled = true,
        }
        if defaults[k] ~= nil then return defaults[k] end
        return nil
    end
    mt = {
        __index = function(t, k)
            local v = getter(k)
            if v ~= nil then return v end
            local name = tostring(k)
            if name:match("Changed$") then return Signal.new() end
            return nil
        end,
        __newindex = function(t, k, v) props[k] = v end,
        __tostring = function() return className end,
    }
    return setmetatable(inst, mt)
end

local Players = {
    LocalPlayer = makeInstance("Player", {
        UserId = 987654321, Name = "ArenaTester", DisplayName = "ArenaTester",
        Character = false, AccountAge = 1234, MembershipType = "None",
    }),
    GetPlayers = function() recordApi("Players:GetPlayers"); return {} end,
    PlayerAdded = Signal.new(),
    PlayerRemoving = Signal.new(),
}
Players.LocalPlayer.Kick = function(_, msg)
    recordApi("LocalPlayer:Kick", tostring(msg))
    recordString("LocalPlayer:Kick", tostring(msg))
end
Players.LocalPlayer.GetRankInGroup = function() return 0 end
Players.LocalPlayer.IsInGroup = function() return false end

local HttpService = {
    JSONDecode = function(_, s)
        recordApi("HttpService:JSONDecode", #tostring(s))
        recordString("HttpService:JSONDecode", s)
        -- tiny JSON emulation: enough for {"success":true,"data":{...}} style checks
        local ok, res = pcall(function()
            -- extremely small JSON parser (objects/arrays/strings/numbers/bools)
            local pos = 1
            local function skip() while pos <= #s and s:sub(pos, pos):match("%s") do pos += 1 end end
            local parseValue
            local function parseString()
                local out = {}
                pos += 1
                while pos <= #s do
                    local c = s:sub(pos, pos)
                    if c == '"' then pos += 1; break end
                    if c == "\\" then
                        local n = s:sub(pos + 1, pos + 1)
                        local map = {n = "\n", t = "\t", r = "\r", ['"'] = '"', ["\\"] = "\\", ["/"] = "/", b = "\b", f = "\f"}
                        out[#out + 1] = map[n] or n
                        pos += 2
                    else
                        out[#out + 1] = c; pos += 1
                    end
                end
                return table.concat(out)
            end
            local function parseNumber()
                local st = pos
                while pos <= #s and s:sub(pos, pos):match("[%d%+%-%eE%.]") do pos += 1 end
                return tonumber(s:sub(st, pos - 1))
            end
            parseValue = function()
                skip()
                local c = s:sub(pos, pos)
                if c == "{" then
                    local obj = {}
                    pos += 1; skip()
                    if s:sub(pos, pos) == "}" then pos += 1; return obj end
                    while true do
                        skip(); local k = parseString(); skip()
                        if s:sub(pos, pos) == ":" then pos += 1 end
                        obj[k] = parseValue(); skip()
                        local d = s:sub(pos, pos); pos += 1; skip()
                        if d == "}" then break end
                    end
                    return obj
                elseif c == "[" then
                    local arr = {}
                    pos += 1; skip()
                    if s:sub(pos, pos) == "]" then pos += 1; return arr end
                    while true do
                        arr[#arr + 1] = parseValue(); skip()
                        local d = s:sub(pos, pos); pos += 1; skip()
                        if d == "]" then break end
                    end
                    return arr
                elseif c == '"' then return parseString()
                elseif s:sub(pos, pos + 3) == "true" then pos += 4; return true
                elseif s:sub(pos, pos + 4) == "false" then pos += 5; return false
                elseif s:sub(pos, pos + 3) == "null" then pos += 4; return nil
                else return parseNumber() end
            end
            local ok2, v = pcall(parseValue)
            if not ok2 then return nil end
            return v
        end)
        if ok and type(res) == "table" then return res end
        return nil
    end,
    JSONEncode = function(_, t) recordApi("HttpService:JSONEncode"); return "{}" end,
    UrlEncode = function(_, s) recordString("HttpService:UrlEncode", s); return tostring(s) end,
    GenerateGUID = function() return "{11111111-2222-3333-4444-555555555555}" end,
    GetAsync = function(_, url) recordApi("HttpService:GetAsync", tostring(url)); return "" end,
    PostAsync = function(_, url) recordApi("HttpService:PostAsync", tostring(url)); return "" end,
}
Services.HttpService = HttpService
Services.Players = Players
Services.RbxAnalyticsService = {
    GetClientId = function() recordApi("RbxAnalyticsService:GetClientId"); return "abcdef01-2345-6789-abcd-ef0123456789" end,
}
Services.RunService = {
    IsStudio = function() return true end, Heartbeat = Signal.new(), RenderStepped = Signal.new(),
    IsClient = function() return true end, IsServer = function() return false end,
}
Services.UserInputService = {InputBegan = Signal.new(), InputEnded = Signal.new(), GetMouseLocation = function() return {X = 0, Y = 0} end}
Services.TweenService = {Create = function() recordApi("TweenService:Create"); return {Play = function() end, Cancel = function() end, Completed = Signal.new()} end}
Services.StarterGui = {SetCore = function() recordApi("StarterGui:SetCore") end, SetCoreGuiEnabled = function() end}
Services.VirtualUser = {GetPlayers = function() return {} end}
Services.MarketplaceService = {GetProductInfo = function() return {} end, PromptGamePassPurchase = function() end}
Services.CoreGui = makeInstance("CoreGui")
Services.Workspace = makeInstance("Workspace", {CurrentCamera = makeInstance("Camera")})
Services.Lighting = makeInstance("Lighting")

local game = setmetatable({
    GetService = function(_, name)
        recordApi("game:GetService", tostring(name))
        recordString("game:GetService", tostring(name))
        if Services[name] then return Services[name] end
        Services[name] = makeInstance(tostring(name))
        return Services[name]
    end,
    FindService = function(_, name) return Services[name] end,
    HttpGet = function(_, url)
        recordApi("game:HttpGet", tostring(url))
        recordString("game:HttpGet", tostring(url))
        return ""
    end,
    HttpPost = function(_, url) recordApi("game:HttpPost", tostring(url)); return "" end,
    PlaceId = 4712345678,
    GameId = 4712345678,
    JobId = "arena-job-id",
    CreatorId = 1,
    CreatorType = "User",
    Workspace = Services.Workspace,
    Players = Players,
    IsLoaded = function() return true end,
    Loaded = Signal.new(),
}, {
    __index = function(_, k)
        local n = tostring(k)
        if n:sub(1, 3) == "Get" then
            return function(_, ...) recordApi("game:" .. n); return nil end
        end
        if n:match("Changed$") then return Signal.new() end
        return nil
    end,
})

-- executor / tooling surface -------------------------------------------------
local function exec(name, ret)
    return function(...)
        local a = pack(...)
        local parts = table.create(a.n)
        for i = 1, a.n do parts[i] = tostring(a[i]) end
        recordApi(name, table.concat(parts, ","))
        for i = 1, a.n do
            if type(a[i]) == "string" then recordString(name, a[i]) end
        end
        if ret ~= nil then return ret end
        return ""
    end
end

local function passthrough(v) return v end

local resumeOnce = function(fn, ...)
    if type(fn) ~= "function" then return end
    local co = coroutine.create(fn)
    local ok, err = coroutine.resume(co, ...)
    if not ok then emit("@@ERROR", "spawn", tostring(err)) end
    return co
end

local task = {
    spawn = function(fn, ...)
        recordApi("task.spawn")
        return resumeOnce(fn, ...)
    end,
    defer = function(fn, ...)
        recordApi("task.defer")
        return resumeOnce(fn, ...)
    end,
    delay = function(_, fn, ...)
        recordApi("task.delay")
        return resumeOnce(fn, ...)
    end,
    wait = function(x)
        recordApi("task.wait", tostring(x))
        -- cooperative yield: spawned watcher loops must not block the harness
        snapshotAll("wait")
        if coroutine.isyieldable() then coroutine.yield(x or 0) end
        return x or 0
    end,
    cancel = function() recordApi("task.cancel") end,
    synchronize = function() recordApi("task.synchronize") end,
    desynchronize = function() recordApi("task.desynchronize") end,
}

local env = {}
local wrapLoadstring = function(orig)
    return function(code, name)
        if type(code) == "string" then
            emit("@@CODE", "loadstring", #code, tostring(name), code:sub(1, 4000))
            recordString("loadstring", code)
        end
        local f, err = orig(code, name)
        return f, err
    end
end

env.print = function(...)
    local p = {}
    for i = 1, select("#", ...) do p[#p + 1] = tostring((select(i, ...))) end
    emit("@@OUTPUT", table.concat(p, " "))
end
env.warn = function(...)
    local p = {}
    for i = 1, select("#", ...) do p[#p + 1] = tostring((select(i, ...))) end
    emit("@@WARN", table.concat(p, " "))
end
env.game = game
env.workspace = Services.Workspace
env.Workspace = Services.Workspace
env.script = makeInstance("LocalScript", {Name = "Key", Parent = makeInstance("PlayerGui")})
env.plugin = nil
env.shared = {}
env.task = task
env.wait = function(x)
    recordApi("wait", tostring(x))
    if coroutine.isyieldable() then coroutine.yield(x or 0) end
    return x or 0
end
env.spawn = function(fn, ...)
    recordApi("spawn")
    return resumeOnce(fn, ...)
end
env.delay = function(_, fn, ...) recordApi("delay"); return resumeOnce(fn, ...) end
env.tick = function() return os.clock() end
env.time = function() return os.time() end
env.elapsedTime = function() return os.clock() end
env.typeof = function(x) return type(x) end
env.type = type
env.getgenv = function() return env end
env.getfenv = function() return env end
env.setfenv = function(t) return t end
env.getrenv = function() return env end
env.identifyexecutor = function() recordApi("identifyexecutor"); return "ArenaHarness", "1.0.0" end
env.getexecutorname = function() recordApi("getexecutorname"); return "ArenaHarness" end
env.gethwid = function() recordApi("gethwid"); return "arena-hwid-0001" end
env.getfingerprintid = function() recordApi("getfingerprintid"); return "arena-fingerprint-0001" end
env.getdeviceid = function() recordApi("getdeviceid"); return "arena-device-0001" end
env.readfile = exec("readfile", "")
env.writefile = exec("writefile")
env.appendfile = exec("appendfile")
env.isfile = function(p) recordApi("isfile", tostring(p)); return false end
env.isfolder = function(p) recordApi("isfolder", tostring(p)); return false end
env.makefolder = exec("makefolder")
env.delfile = exec("delfile")
env.listfiles = function() recordApi("listfiles"); return {} end
env.setclipboard = exec("setclipboard")
env.toclipboard = exec("toclipboard")
env.request = function(o)
    local url = type(o) == "table" and (o.Url or o.URL or o.url) or tostring(o)
    recordApi("request", tostring(url))
    recordString("request", tostring(url))
    if type(o) == "table" then
        if type(o.Body) == "string" then recordString("request.body", o.Body) end
        if type(o.Headers) == "table" then
            for k, v in pairs(o.Headers) do recordString("request.header." .. tostring(k), tostring(v)) end
        end
    end
    return {Success = false, StatusCode = 0, StatusMessage = "", Body = "", Headers = {}}
end
env.http_request = env.request
env.syn = {request = env.request, protect_gui = exec("protect_gui")}
env.http = {request = env.request}
env.fluxus = env.syn
env.Drawing = setmetatable({}, {__index = function(_, k)
    return function() recordApi("Drawing.new", tostring(k)); return makeInstance("Drawing" .. tostring(k)) end
end})
env.Instance = {
    new = function(cls, parent)
        recordApi("Instance.new", tostring(cls))
        recordString("Instance.new", tostring(cls))
        return makeInstance(tostring(cls), {Parent = parent})
    end,
}
env.Vector3 = {new = function(x, y, z) return {X = x or 0, Y = y or 0, Z = z or 0, Unit = {X = 0, Y = 0, Z = 0}, Magnitude = 0} end}
env.Vector2 = {
    new = function(x, y) return {X = x or 0, Y = y or 0} end,
}
env.Color3 = {
    new = function(r, g, b) return {R = r or 0, G = g or 0, B = b or 0} end,
    fromRGB = function(r, g, b) return {R = (r or 0) / 255, G = (g or 0) / 255, B = (b or 0) / 255} end,
    fromHSV = function() return {R = 0, G = 0, B = 0} end,
}
env.UDim2 = {
    new = function() return {X = {Scale = 0, Offset = 0}, Y = {Scale = 0, Offset = 0}} end,
    fromScale = function() return {X = {Scale = 0, Offset = 0}, Y = {Scale = 0, Offset = 0}} end,
    fromOffset = function() return {X = {Scale = 0, Offset = 0}, Y = {Scale = 0, Offset = 0}} end,
}
env.UDim = {new = function(s, o) return {Scale = s or 0, Offset = o or 0} end}
env.CFrame = {new = function() return makeInstance("CFrame") end, Angle = function() return makeInstance("CFrame") end,
    fromEulerAnglesXYZ = function() return makeInstance("CFrame") end, lookAt = function() return makeInstance("CFrame") end}
env.TweenInfo = {new = function() return {} end}
env.Rect = {new = function() return {} end}
env.NumberRange = {new = function(a, b) return {Min = a or 0, Max = b or a or 0} end}
env.NumberSequence = {new = function() return {} end}
env.ColorSequence = {new = function() return {} end}
env.Random = {new = function() return {NextInteger = function(_, a, b) return a or 0 end, NextNumber = function() return 0 end} end}
env.Enum = setmetatable({}, {__index = function(_, k)
    return setmetatable({}, {__index = function(_, k2)
        return {Name = tostring(k2), Value = 0, EnumType = tostring(k)}
    end, __tostring = function() return "Enum." .. tostring(k) end})
end})
-- additional datatypes commonly used by UI libraries
local mockClass = function(name)
    return setmetatable({}, {
        __index = function(_, k)
            return function(...) recordApi(name .. "." .. tostring(k)); return setmetatable({}, {__index = function() return 0 end}) end
        end,
        __call = function(...) return setmetatable({}, {__index = function() return 0 end}) end,
        __tostring = function() return name end,
    })
end
for _, name in { "Path2D", "Ray", "Region3", "BrickColor", "Faces", "Axes", "RaycastParams",
                 "OverlapParams", "PhysicalProperties", "RotationCurveKey", "PathWaypoint",
                 "CatalogSearchParams", "FloatCurveKey", "Secret", "DateTime", "_RenderStep" } do
    if env[name] == nil then env[name] = mockClass(name) end
end
env.ColorSequenceKeypoint = {new = function(t, c) return {Time = t, Value = c} end}
env.NumberSequenceKeypoint = {new = function(t, v) return {Time = t, Value = v} end}
env.NumberRange = env.NumberRange or {new = function(a, b) return {Min = a or 0, Max = b or a or 0} end}
env.Vector3int16 = {new = function() return {X = 0, Y = 0, Z = 0} end}
env.Vector2int16 = {new = function() return {X = 0, Y = 0} end}
env.DateTime = {now = function() return setmetatable({}, {__index = function() return function() return 0 end end}) end}

-- last-resort fallback: record (once) and return a permissive mock
do
    local missing = {}
    local universal
    universal = setmetatable({}, {
        __index = function(_, k)
            if k == "new" or k == "fromScale" or k == "fromOffset" or k == "fromRGB" then
                return function() return universal end
            end
            return universal
        end,
        __call = function() return universal end,
        __tostring = function() return "mock" end,
        __add = function() return universal end, __sub = function() return universal end,
        __mul = function() return universal end, __div = function() return universal end,
        __unm = function() return universal end, __concat = function() return "" end,
        __eq = function() return false end, __lt = function() return false end, __le = function() return false end,
    })
    setmetatable(env, {
        __index = function(_, k)
            local n = tostring(k)
            if not missing[n] then
                missing[n] = true
                emit("@@MISSING", n, stackchain(2))
            end
            return universal
        end,
    })
end

env.debug = debug
env.os = os
env.utf8 = utf8
env.String = string
env.bit32 = bit32
env.table = table
env.string = string
env.math = math
env.select = select
env.pcall = guardedPcall
env.xpcall = guardedXpcall
local guardedResume = function(co, ...)
    local res = pack(coroutine.resume(co, ...))
    if not res[1] and isAbort(res[2]) then error(ABORT, 0) end
    return table.unpack(res, 1, res.n)
end
env.coroutine = setmetatable({}, {
    __index = function(_, k)
        if k == "resume" then return guardedResume end
        return coroutine[k]
    end,
})
env.error = error
env.assert = assert
env.unpack = table.unpack
env.pairs = pairs
env.ipairs = ipairs
env.next = next
env.rawget = rawget
env.rawset = rawset
env.rawequal = rawequal
env.rawlen = rawlen
env.setmetatable = setmetatable
env.getmetatable = getmetatable
env.tostring = tostring
env.tonumber = tonumber
env.newproxy = newproxy
env.loadstring = wrapLoadstring(loadstring)
env.load = env.loadstring
env.require = function() recordApi("require"); return {} end
env.getrawmetatable = function(v) recordApi("getrawmetatable"); return getmetatable(v) or {} end
env.setreadonly = function() recordApi("setreadonly") end
env.isreadonly = function() return false end
env.hookfunction = function(a, b) recordApi("hookfunction"); return a end
env.hookmetamethod = function() recordApi("hookmetamethod"); return function() end end
env.getconnections = function() recordApi("getconnections"); return {} end
env.getnamecallmethod = function() return "GetChildren" end
env.checkcaller = function() return true end
env.cloneref = passthrough
env.setthreadidentity = exec("setthreadidentity")
env.getthreadidentity = function() return 8 end
env.iscclosure = function() return false end
env.islclosure = function() return true end
env.isexecutorclosure = function() return false end
env.fireclickdetector = exec("fireclickdetector")
env.firetouchinterest = exec("firetouchinterest")
env.setfpscap = exec("setfpscap")
env.queue_on_teleport = exec("queue_on_teleport")
env.messagebox = exec("messagebox")
env.setthreadcontext = exec("setthreadcontext")
env.getobjects = function() recordApi("getobjects"); return {} end
env.getnilinstances = function() return {} end
env.gethui = function() return makeInstance("CoreGui") end
env.sethiddenproperty = function() recordApi("sethiddenproperty") end
env.gethiddenproperty = function() return 0 end
env.compareinstances = function() return true end
env.iskindof = function() return false end
env.toclipboard = exec("toclipboard")
env.isnetworkowner = function() return true end
env.getcustomasset = function() return "" end

-- ---------------------------------------------------------------------------
-- buffer instrumentation
--
-- The Luraph stage keeps its decrypted constant pool / bytecode inside `buffer`
-- objects, so every buffer that is created is tracked.  A snapshot is taken
-- whenever the instruction budget or the wall-clock budget is exceeded, which
-- is how the decrypted pool is captured even when the VM interpreter itself
-- never terminates (a Lua-implemented bytecode VM is ~1000x slower than the
-- real thing).
-- ---------------------------------------------------------------------------
local CFG = __CFG or {}
local dumpHandlerProfile  -- forward declaration (defined with the VM handler wrapper)

local realBuffer = buffer
local tracked = {}
local bufCalls = 0
local readstringCount = 0
local DUMP_AT_READSTRING = tonumber(CFG.dumpAtReadstring) or 0
local startClock = os.clock()
local BUDGET_SECONDS = tonumber(CFG.budget) or 20
local BUDGET_CALLS = tonumber(CFG.callBudget) or 60000000
local dumped = false

local function hexof(s)
    return (string.gsub(s, ".", function(c) return string.format("%02x", string.byte(c)) end))
end

-- stdio to a pipe is block buffered and the Luau CLI cannot flush on demand, so
-- a run ends with a >=64 KiB block of padding: the tail of the report is pushed
-- out of the buffer, and the driver stops reading at the @@END marker.
local function finish()
    for _ = 1, 400 do
        print("@@PAD\t" .. string.rep("x", 200))
    end
    print("@@END")
    -- trailing padding keeps @@END itself inside a flushed stdio block
    for _ = 1, 200 do
        print("@@PAD\t" .. string.rep("y", 200))
    end
end

local function snapshotAll(reason)
    if dumped then return end
    dumped = true
    emit("@@SNAP", reason, tostring(#tracked), tostring(bufCalls), tostring(os.clock() - startClock))
    for idx, b in ipairs(tracked) do
        local ok, len = pcall(realBuffer.len, b)
        if ok and len and len > 0 then
            local ok2, str = pcall(realBuffer.tostring, b)
            if ok2 and type(str) == "string" then
                emit("@@BUF", tostring(idx), tostring(len), hexof(str))
            end
        end
    end
    if dumpHandlerProfile then dumpHandlerProfile() end
    emit("@@TRACE", debug.traceback())
    emit("@@DONE")
    finish()
    error(ABORT, 0)
end

local function budgetCheck()
    bufCalls += 1
    if bufCalls % 4096 == 0 then
        if (os.clock() - startClock) > BUDGET_SECONDS or bufCalls > BUDGET_CALLS then
            snapshotAll("budget")
        end
    end
end

local bufferProxy = {}
for k, v in pairs(realBuffer) do bufferProxy[k] = v end
bufferProxy.create = function(n)
    local b = realBuffer.create(n)
    tracked[#tracked + 1] = b
    emit("@@BUFNEW", "create", tostring(n), tostring(#tracked))
    return b
end
bufferProxy.fromstring = function(s)
    local b = realBuffer.fromstring(s)
    tracked[#tracked + 1] = b
    emit("@@BUFNEW", "fromstring", tostring(#s), tostring(#tracked))
    return b
end
do
    local names = {"readu8", "readi8", "readu16", "readi16", "readu32", "readi32", "readf32", "readf64",
                   "writeu8", "writei8", "writeu16", "writei16", "writeu32", "writei32", "writef32", "writef64",
                   "copy", "fill", "len", "readstring", "writestring"}
    for _, name in ipairs(names) do
        local orig = realBuffer[name]
        if orig then
            if name == "readstring" then
                bufferProxy[name] = function(b, off, count)
                    budgetCheck()
                    local s = orig(b, off, count)
                    if type(s) == "string" then
                        readstringCount += 1
                        emit("@@RDS", tostring(readstringCount), tostring(off), tostring(count), s)
                        recordString("buffer.readstring", s)
                        if DUMP_AT_READSTRING > 0 and readstringCount == DUMP_AT_READSTRING then
                            snapshotAll("readstring-" .. tostring(readstringCount))
                        end
                    end
                    return s
                end
            elseif name == "writestring" then
                bufferProxy[name] = function(b, off, s, count)
                    budgetCheck()
                    if type(s) == "string" then recordString("buffer.writestring", s) end
                    return orig(b, off, s, count)
                end
            else
                bufferProxy[name] = function(...)
                    budgetCheck()
                    return orig(...)
                end
            end
        end
    end
    bufferProxy.tostring = function(b)
        budgetCheck()
        local s = realBuffer.tostring(b)
        if type(s) == "string" then recordString("buffer.tostring", s) end
        return s
    end
end
env.buffer = bufferProxy
env._G = env
env.__arena = {recordApi = recordApi, recordString = recordString, emit = emit, ident = ident, signal = Signal, instance = makeInstance}

-- ---------------------------------------------------------------------------
-- VM handler instrumentation
--
-- Both Luraph stages are a table of a few hundred tiny "handler" functions that
-- the VM dispatches through `self:<name>(...)`.  Wrapping every entry lets the
-- harness profile the interpreter: call counts per handler, the argument shapes
-- each handler receives, and a progress signal that keeps the run bounded even
-- though the devirtualised program never terminates on its own.
-- ---------------------------------------------------------------------------
local handlerCalls = {}
local handlerOrder = {}
local WRAPPED = {}

local function wrapTable(tbl, tag)
    if type(tbl) ~= "table" then return tbl end
    if WRAPPED[tbl] then return tbl end
    WRAPPED[tbl] = true
    for name, v in pairs(tbl) do
        if type(v) == "function" then
            stats.func += 1
            local key = tostring(tag) .. "." .. tostring(name)
            handlerCalls[key] = 0
            handlerOrder[#handlerOrder + 1] = key
            emit("@@FUNC", tostring(tag), tostring(name), ident(v))
            tbl[name] = function(...)
                local n = handlerCalls[key] + 1
                handlerCalls[key] = n
                if n == 1 or n == 1000 then
                    local a = pack(...)
                    local shape = {}
                    for i = 1, math.min(a.n, 6) do
                        local t = type(a[i])
                        if t == "number" then shape[i] = "n:" .. tostring(a[i])
                        elseif t == "table" then shape[i] = "t#" .. tostring(#a[i])
                        elseif t == "string" then shape[i] = "s:" .. string.sub(a[i], 1, 40)
                        else shape[i] = t end
                    end
                    emit("@@HCALL", key, tostring(n), tostring(a.n), table.concat(shape, "|"))
                end
                if n % 997 == 0 then budgetCheck() end
                return v(...)
            end
        elseif type(v) == "table" then
            emit("@@FUNCTBL", tostring(tag), tostring(name))
        end
    end
    return tbl
end
function dumpHandlerProfile()
    for _, key in ipairs(handlerOrder) do
        emit("@@HPROF", key, tostring(handlerCalls[key]))
    end
end
env.__handlerProfile = dumpHandlerProfile
-- identity table for well known library functions: lets the harness report
-- which numeric slot of the obfuscator's "lib" table holds which stdlib entry.
local known = {}
do
    local libs = {string = string, table = table, math = math, bit32 = bit32,
                  buffer = realBuffer, coroutine = coroutine, utf8 = utf8, os = os, debug = debug}
    for libName, lib in pairs(libs) do
        local ok = pcall(function()
            for k, v in pairs(lib) do
                if type(v) == "function" and known[v] == nil then known[v] = libName .. "." .. tostring(k) end
            end
        end)
        if not ok then end
    end
    -- the sandbox replaces a few functions; record those identities too so the
    -- probe can say "this slot is the harness' own wrapper" instead of "unknown"
    known[guardedPcall] = "_G.pcall (sandbox wrapper)"
    known[guardedXpcall] = "_G.xpcall (sandbox wrapper)"
    known[guardedResume] = "coroutine.resume (sandbox wrapper)"
    local okB = pcall(function()
        for k, v in pairs(bufferProxy) do
            if type(v) == "function" and known[v] == nil then known[v] = "buffer." .. tostring(k) .. " (instrumented)" end
        end
    end)
    if not okB then end
    for _, name in ipairs({"print", "warn", "type", "typeof", "tostring", "tonumber", "pcall", "xpcall",
                           "error", "assert", "select", "unpack", "next", "pairs", "ipairs", "rawget",
                           "rawset", "rawequal", "rawlen", "setmetatable", "getmetatable", "newproxy",
                           "loadstring", "getfenv", "setfenv", "collectgarbage", "require", "wait",
                           "spawn", "delay", "tick", "time", "getgenv", "getrenv"}) do
        local f = rawget(env, name)
        if type(f) == "function" and known[f] == nil then known[f] = "_G." .. name end
    end
end

local knownCount = 0
for _ in pairs(known) do knownCount += 1 end
local probed = {}
local function probeTable(t, tag)
    local tt = type(t)
    emit("@@PROBE", tostring(tag), "type", tt)
    if tt ~= "table" then return t end
    if probed[tag] then return t end
    probed[tag] = true
    local numeric, named = {}, {}
    for k, v in pairs(t) do
        if type(k) == "number" then
            numeric[#numeric + 1] = {k, v}
        else
            named[#named + 1] = {tostring(k), v}
        end
    end
    table.sort(numeric, function(a, b) return a[1] < b[1] end)
    table.sort(named, function(a, b) return a[1] < b[1] end)
    for _, kv in ipairs(numeric) do
        local v = kv[2]
        emit("@@PROBE", tostring(tag), tostring(kv[1]), type(v), known[v] or tostring(v))
    end
    for _, kv in ipairs(named) do
        local v = kv[2]
        emit("@@PROBE", tostring(tag), "named:" .. kv[1], type(v), known[v] or tostring(v))
    end
    return t
end
env.__probe = probeTable
env.__wrap1 = function(t) return wrapTable(t, "A") end
env.__wrap2 = function(t) return wrapTable(t, "B") end

---------------------------------------------------------------------------
-- run the payload
---------------------------------------------------------------------------
emit("@@EVENT", "start", tostring(#__PAYLOAD))
local fn, perr = loadstring(__PAYLOAD, "@Key.luau")
if not fn then
    emit("@@ERROR", "parse", tostring(perr))
    emit("@@DONE")
    return
end
emit("@@EVENT", "parsed")
local ok, err = xpcall(function()
    if setfenv then setfenv(fn, env) end
    return fn()
end, function(e) return tostring(e) .. "\n" .. debug.traceback() end)
emit("@@EVENT", "ran", tostring(ok))
if not ok then emit("@@ERROR", "run", tostring(err)) end
if dumpHandlerProfile then dumpHandlerProfile() end
emit("@@STATS", stats.api, stats.str, stats.func)
emit("@@DONE")
finish()
