-- Sandbox shared by the protected build and the decompiled build.
-- Prints stable EVENT lines. Does not execute remote HttpGet bodies.

local base = getfenv(0)
local real_print = print
local real_error = error
local real_tostring = tostring
local real_typeof = typeof
local real_select = select
local real_string = string
local real_table = table
local real_pcall = pcall
local real_setmetatable = setmetatable
local real_getmetatable = getmetatable
local real_rawequal = rawequal
local real_pairs = pairs
local real_loadstring = loadstring
local real_setfenv = setfenv
local real_getfenv = getfenv

local events = {}
local function emit(line)
	events[#events + 1] = line
end

local function num(n)
	return real_string.format("%.17g", n)
end

local function scalar(v)
	local tv = real_typeof(v)
	if tv == "string" then
		return "string:" .. real_string.format("%q", v)
	elseif tv == "number" then
		return "number:" .. num(v)
	elseif tv == "boolean" then
		return "boolean:" .. real_tostring(v)
	elseif tv == "nil" then
		return "nil"
	elseif tv == "function" then
		return "function"
	end
	return tv
end

local callbacks = {}
local function note_callback(label, fn)
	callbacks[#callbacks + 1] = { label = label, fn = fn }
	emit("callback.saved " .. label)
end

local ids = setmetatable({}, { __mode = "k" })
local next_id = 0
local function id_of(obj)
	local existing = ids[obj]
	if existing then
		return existing
	end
	next_id += 1
	ids[obj] = next_id
	return next_id
end

local function dump_fields(prefix, value, depth, bucket)
	if depth > 4 or real_typeof(value) ~= "table" then
		if real_typeof(value) == "function" then
			note_callback(prefix, value)
		end
		bucket[#bucket + 1] = prefix .. "=" .. scalar(value)
		return
	end
	if ids[value] then
		bucket[#bucket + 1] = prefix .. "=proxy:" .. ids[value]
		return
	end
	local keys = {}
	for k in real_pairs(value) do
		keys[#keys + 1] = k
	end
	real_table.sort(keys, function(a, b)
		return real_tostring(a) < real_tostring(b)
	end)
	if #keys == 0 then
		bucket[#bucket + 1] = prefix .. "=table:{}"
		return
	end
	for _, k in ipairs(keys) do
		local child = prefix .. "." .. real_tostring(k)
		local v = value[k]
		if real_typeof(v) == "table" and not ids[v] then
			dump_fields(child, v, depth + 1, bucket)
		else
			if real_typeof(v) == "function" then
				note_callback(child, v)
			end
			bucket[#bucket + 1] = child .. "=" .. scalar(v)
		end
	end
end

local calls = 0
local function bump()
	calls += 1
	if calls > 6000 then
		real_error("trace limit")
	end
end

local function make_proxy(label)
	local storage = {}
	local self = {}
	local id = id_of(self)
	emit("proxy.new " .. id .. " " .. label)
	local mt = {}
	mt.__index = function(_, k)
		local ks = real_tostring(k)
		emit("index " .. id .. " " .. ks)
		if storage[ks] ~= nil then
			return storage[ks]
		end
		bump()
		local child = make_proxy(label .. "." .. ks)
		storage[ks] = child
		return child
	end
	mt.__newindex = function(_, k, v)
		local ks = real_tostring(k)
		emit("newindex " .. id .. " " .. ks .. " " .. scalar(v))
		storage[ks] = v
		if real_typeof(v) == "function" then
			note_callback("newindex:" .. label .. "." .. ks, v)
		end
	end
	mt.__call = function(_, ...)
		local argc = real_select("#", ...)
		emit("call " .. id .. " " .. label .. " argc=" .. (argc - 1))
		local fields = {}
		for i = 1, argc do
			local v = real_select(i, ...)
			if i == 1 and v == self then
				emit("arg " .. i .. " self")
			elseif real_typeof(v) == "table" and not ids[v] then
				dump_fields("arg" .. i, v, 1, fields)
			else
				emit("arg " .. i .. " " .. (ids[v] and ("proxy:" .. ids[v]) or scalar(v)))
			end
			if real_typeof(v) == "function" then
				note_callback("call:" .. label .. "#fn" .. i, v)
			end
		end
		real_table.sort(fields)
		for _, line in ipairs(fields) do
			emit("field " .. line)
		end
		bump()
		local name = real_string.match(label, "([%w_]+)$") or label
		if name == "GetService" or name == "getService" or name == "FindService" then
			local svc = real_select(2, ...)
			return make_proxy("service:" .. real_tostring(svc))
		end
		if name == "HttpGet" or name == "HttpGetAsync" or name == "GetAsync" or name == "PostAsync" then
			local url
			for i = 1, argc do
				local v = real_select(i, ...)
				if real_typeof(v) == "string" then
					url = v
					break
				end
			end
			emit("httpget " .. real_tostring(url))
			return "return getfenv().__trace_module(" .. real_string.format("%q", url or "") .. ")"
		end
		if name == "JSONDecode" then
			return {}
		end
		if name == "JSONEncode" then
			return "{}"
		end
		if name == "Wait" or name == "wait" then
			return 0.016
		end
		if name == "IsA" then
			return false
		end
		if name == "FindFirstChild" or name == "WaitForChild" or name == "FindFirstChildOfClass" or name == "FindFirstChildWhichIsA" then
			return nil
		end
		if name == "GetChildren" or name == "GetDescendants" or name == "GetPlayers" then
			return {}
		end
		if name == "Connect" or name == "Once" then
			local fn = real_select(2, ...) or real_select(1, ...)
			if real_typeof(fn) == "function" then
				note_callback("connect:" .. label, fn)
			end
			return make_proxy(label .. ":connection")
		end
		return make_proxy(label .. "()")
	end
	mt.__tostring = function()
		return "<" .. label .. "#" .. id .. ">"
	end
	mt.__concat = function(a, b)
		return real_tostring(a) .. real_tostring(b)
	end
	mt.__len = function()
		return 0
	end
	mt.__eq = function(a, b)
		return real_rawequal(a, b)
	end
	mt.__iter = function()
		emit("iter " .. id)
		return function()
			return nil
		end
	end
	return self_with_mt(self, mt)
end

function self_with_mt(self, mt)
	return real_setmetatable(self, mt)
end

local env = {}
local STDLIB = {
	"string", "table", "math", "bit32", "utf8", "buffer", "coroutine", "os", "debug",
	"type", "typeof", "tostring", "tonumber", "pcall", "xpcall", "error", "assert", "select",
	"pairs", "ipairs", "next", "unpack", "getmetatable", "setmetatable", "rawget", "rawset",
	"rawequal", "rawlen", "print", "warn", "require", "newproxy", "collectgarbage", "_VERSION",
}
for _, name in ipairs(STDLIB) do
	if base[name] ~= nil then
		env[name] = base[name]
	end
end

env.print = function(...)
	local parts = {}
	for i = 1, real_select("#", ...) do
		parts[i] = scalar(real_select(i, ...))
	end
	emit("print " .. real_table.concat(parts, " | "))
end
env.warn = function(...)
	emit("warn " .. scalar(real_select(1, ...)))
end
env.error = function(msg, level)
	emit("error " .. scalar(msg))
	return real_error(msg, (level or 1) + 1)
end
env.tick = function()
	return 1700000000
end
env.time = function()
	return 123
end
env.wait = function(t)
	emit("wait " .. scalar(t))
	return t or 0
end
env.delay = function(t, fn)
	emit("delay " .. scalar(t))
	if real_typeof(fn) == "function" then
		note_callback("delay", fn)
	end
end
env.spawn = function(fn)
	emit("spawn")
	if real_typeof(fn) == "function" then
		note_callback("spawn", fn)
	end
end

local function hooked_loadstring(src, chunkname, ...)
	emit("loadstring " .. real_typeof(src) .. " " .. (real_typeof(src) == "string" and #src or -1) .. " " .. scalar(chunkname))
	if real_typeof(src) ~= "string" then
		return nil, "string expected"
	end
	local fn, err = real_loadstring(src, chunkname or "loaded", ...)
	if not fn then
		emit("loadstring.err " .. real_tostring(err))
		return nil, err
	end
	real_setfenv(fn, env)
	return function(...)
		emit("loadstring.invoke argc=" .. real_select("#", ...))
		return fn(...)
	end
end

env.loadstring = hooked_loadstring
env.load = hooked_loadstring
env.game = make_proxy("game")
env.workspace = make_proxy("workspace")
env.script = make_proxy("script")
env.shared = {}
env._G = env
env.getgenv = function()
	emit("getgenv")
	return env
end
env.getrenv = function()
	emit("getrenv")
	return env
end
env.identifyexecutor = function()
	emit("identifyexecutor")
	return "Arena", "1.0"
end
env.getexecutorname = env.identifyexecutor
env.cloneref = function(x)
	emit("cloneref " .. (ids[x] and ("proxy:" .. ids[x]) or scalar(x)))
	return x
end
env.request = function(opts)
	emit("request " .. scalar(opts))
	return { StatusCode = 200, Body = "{}", Success = true, Headers = {} }
end
env.http_request = env.request
env.http = { request = env.request }
env.syn = { request = env.request }
env.writefile = function(path, content)
	emit("writefile " .. scalar(path) .. " " .. scalar(content))
end
env.readfile = function(path)
	emit("readfile " .. scalar(path))
	return ""
end
env.isfile = function(path)
	emit("isfile " .. scalar(path))
	return false
end
env.isfolder = function(path)
	emit("isfolder " .. scalar(path))
	return false
end
env.makefolder = function(path)
	emit("makefolder " .. scalar(path))
end
env.setclipboard = function(s)
	emit("setclipboard " .. scalar(s))
end
env.gethui = function()
	emit("gethui")
	return make_proxy("hui")
end
env.Drawing = {
	new = function(className)
		emit("Drawing.new " .. scalar(className))
		return make_proxy("Drawing")
	end,
}
env.Instance = {
	new = function(className, parent)
		emit("Instance.new " .. scalar(className) .. " " .. scalar(parent))
		return make_proxy("Instance")
	end,
}
env.Enum = make_proxy("Enum")
env.Vector2 = {
	new = function(x, y)
		emit("Vector2.new " .. num(x) .. " " .. num(y))
		return { X = x, Y = y }
	end,
}
env.Vector3 = {
	new = function(x, y, z)
		emit("Vector3.new " .. num(x or 0) .. " " .. num(y or 0) .. " " .. num(z or 0))
		return { X = x, Y = y, Z = z }
	end,
}
env.UDim2 = {
	fromOffset = function(x, y)
		emit("UDim2.fromOffset " .. num(x) .. " " .. num(y))
		return { X = { Scale = 0, Offset = x }, Y = { Scale = 0, Offset = y } }
	end,
	fromScale = function(x, y)
		emit("UDim2.fromScale " .. num(x) .. " " .. num(y))
		return { X = { Scale = x, Offset = 0 }, Y = { Scale = y, Offset = 0 } }
	end,
	new = function(xs, xo, ys, yo)
		emit("UDim2.new " .. num(xs) .. " " .. num(xo) .. " " .. num(ys) .. " " .. num(yo))
		return { X = { Scale = xs, Offset = xo }, Y = { Scale = ys, Offset = yo } }
	end,
}
env.UDim = {
	new = function(s, o)
		emit("UDim.new " .. num(s) .. " " .. num(o))
		return { Scale = s, Offset = o }
	end,
}
env.Color3 = {
	fromRGB = function(r, g, b)
		emit("Color3.fromRGB " .. num(r) .. " " .. num(g) .. " " .. num(b))
		return { R = r, G = g, B = b }
	end,
	new = function(r, g, b)
		emit("Color3.new " .. num(r) .. " " .. num(g) .. " " .. num(b))
		return { R = r, G = g, B = b }
	end,
}
env.task = {
	wait = function(t)
		emit("task.wait " .. scalar(t))
		return t or 0
	end,
	delay = function(t, fn)
		emit("task.delay " .. scalar(t))
		if real_typeof(fn) == "function" then
			note_callback("task.delay", fn)
		end
	end,
	spawn = function(fn)
		emit("task.spawn")
		if real_typeof(fn) == "function" then
			note_callback("task.spawn", fn)
		end
	end,
	defer = function(fn)
		emit("task.defer")
		if real_typeof(fn) == "function" then
			note_callback("task.defer", fn)
		end
	end,
	cancel = function()
		emit("task.cancel")
	end,
}
env.typeof = real_typeof
env.getfenv = function(f)
	if f == nil or f == 0 then
		return env
	end
	local ok, res = real_pcall(real_getfenv, f)
	if ok then
		return res
	end
	return env
end
env.setfenv = function(f, e)
	return real_setfenv(f, e)
end
env.__trace_module = function(url)
	emit("module " .. real_tostring(url))
	return make_proxy("module")
end

real_setmetatable(env, {
	__index = function(_, k)
		emit("missing_global " .. real_tostring(k))
		real_error("missing global " .. real_tostring(k))
	end,
})

local src = [=[
---SCRIPT---
]=]
local chunk, lerr = real_loadstring(src, "subject")
if not chunk then
	emit("compile_fail " .. real_tostring(lerr))
	real_error(lerr)
end
real_setfenv(chunk, env)
emit("run.start")
local ok, result = real_pcall(chunk)
emit("run.done " .. real_tostring(ok) .. " " .. scalar(result))
if not ok then
	emit("run.err " .. real_tostring(result))
end

emit("callbacks " .. #callbacks)
for i, item in ipairs(callbacks) do
	emit("callback.begin " .. i .. " " .. item.label)
	local cok, cerr = real_pcall(item.fn)
	emit("callback.end " .. i .. " " .. real_tostring(cok) .. " " .. scalar(cerr))
end
emit("run.calls " .. calls)

for _, line in ipairs(events) do
	real_print("EVENT|" .. line)
end
