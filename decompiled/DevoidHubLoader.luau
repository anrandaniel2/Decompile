-- Devoid Hub Supports Loader
--
-- Recovered from input/DevoidHubLoader.txt. String constants are exact.
-- Other locals are reconstructed. The program always builds this window;
-- each button closes it and loads one remote script.
-- tests/check.py compares this file with the protected build.

-- These reads happen before the window is built. Nothing later uses them.
local MarketplaceService = cloneref(game:GetService("MarketplaceService"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local RunService = cloneref(game:GetService("RunService"))
local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/1.6.65/main.lua"))()

local Window = WindUI:CreateWindow({
	Title = "Devoid Hub Supports Loader",
	Icon = "rbxassetid://732731242066",
	Author = "by Totallynothimplayz",
	Folder = "devoided",
	Size = UDim2.fromOffset(580, 460),
	MinSize = Vector2.new(560, 350),
	MaxSize = Vector2.new(850, 560),
	Transparent = true,
	Theme = "Dark",
	Resizable = true,
	SideBarWidth = 200,
	Background = "rbxassetid://1234",
	BackgroundImageTransparency = 0.42,
	HideSearchBar = false,
	ScrollBarEnabled = true,
	User = {
		Enabled = true,
		Anonymous = true,
		Callback = function()
			print("clicked to the 'user icon'")
		end,
	},
})

local Piggy = Window:Tab({
	Title = "Piggy",
	ShowTabTitle = true,
	TabTitleAlign = "Center",
})

local MurderMystery2 = Window:Tab({
	Title = "Murder Mystery 2",
	ShowTabTitle = true,
	TabTitleAlign = "Center",
})

local SurviveTheKiller = Window:Tab({
	Title = "Survive The Killer",
	ShowTabTitle = true,
	TabTitleAlign = "Center",
})

Piggy:Select()

local function loadSupport(url)
	Window:Destroy()
	task.wait(0.01)
	loadstring(game:HttpGet(url))()
end

Piggy:Button({
	Title = "Load Piggy",
	Callback = function()
		loadSupport("https://vss.pandauth.com/kv/62dcfcad9c9438a6")
	end,
})

MurderMystery2:Button({
	Title = "Load MM2",
	Callback = function()
		loadSupport("https://vss.pandauth.com/kv/5c9cce70aa883f6f")
	end,
})

SurviveTheKiller:Button({
	Title = "Load STK",
	Callback = function()
		loadSupport("https://vss.pandauth.com/kv/ab3e7202a3ac7ae0")
	end,
})
