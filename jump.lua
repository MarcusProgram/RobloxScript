for i = 1, 100 do
    print("Created by Marcus")
end

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Created by Marucs",
    Text = "Every second you get +1 jump power",
    Icon = "rbxassetid://4483345998"
})

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
    Name = "Jump Sim by Marcus",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "Configs"
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character.HumanoidRootPart
local Humanoid = Character.Humanoid

_G.autoFarm = false

function auto_Farm()
    while _G.autoFarm == true do
        game:GetService("Workspace").Wins.World14.CFrame = HumanoidRootPart.CFrame
        wait(.00001)
    end
end

local Auto = Window:MakeTab({
    Name = "Auto",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local AutoFarm = Auto:AddSection({
	Name = "Auto Farm"
})

Auto:AddToggle({
	Name = "AutoFarm",
	Default = false,
	Callback = function(Value)
		_G.autoFarm = Value
        auto_Farm()
	end    
})


local TPTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local worldCFrameMap = {
    World1 = game:GetService("Workspace").World1.BaseEarth.CFrame,
    World2 = game:GetService("Workspace").World2.BaseMoonZone.CFrame,
    World3 = game:GetService("Workspace").World3.BaseLavaZone.CFrame,
    World4 = game:GetService("Workspace").World4.BaseIceZone.CFrame,
    World5 = game:GetService("Workspace").World5.BaseFlowerZone.CFrame,
    World6 = game:GetService("Workspace").World6.BaseSnowZone.CFrame,
    World7 = game:GetService("Workspace").World7.BaseDarkZone.CFrame,
    World8 = game:GetService("Workspace").World8.BaseVoidZone.CFrame,
    World9 = game:GetService("Workspace").World9.BaseDesertZone.CFrame,
    World10 = game:GetService("Workspace").World10.BaseForestZone.CFrame,
    World11 = game:GetService("Workspace").World11.BaseCandyZone.CFrame,
    World12 = game:GetService("Workspace").World12.BaseSteampunkZone.CFrame,
    World13 = game:GetService("Workspace").World13.BaseBeachZone.CFrame,
    World14 = game:GetService("Workspace").World14.BaseHeavenZone.CFrame,
}

local dropdownOptions = {
    "World1", "World2", "World3", "World4", "World5", "World6", "World7", "World8", "World9", "World10", "World11", "World12", "World13", "World14"
}

TPTab:AddDropdown({
    Name = "Worlds",
    Default = "World1",
    Options = dropdownOptions,
    Callback = function(value)
        local selectedWorldCFrame = worldCFrameMap[value]
        if selectedWorldCFrame then
            HumanoidRootPart.CFrame = selectedWorldCFrame
        end
    end
})


local Player = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Player:AddSlider({
	Name = "Walk Speed",
	Min = 16,
	Max = 300,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		Humanoid.WalkSpeed = Value
	end    
})

Player:AddSlider({
	Name = "Jump Power",
	Min = 0,
	Max = 30000000,
	Default = 30,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JPower",
	Callback = function(Value)
		Humanoid.JumpPower = Value
	end    
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
MiscTab:AddButton({
	Name = "Dark Dex",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
  	end    
})

MiscTab:AddButton({
	Name = "Infinite Yield",
	Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
  	end    
})

MiscTab:AddButton({
	Name = "Remote Spy",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
  	end    
})

MiscTab:AddButton({
	Name = "Anti AFK",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/sDXcYFhR",true))()
  	end    
})
OrionLib.Init()




