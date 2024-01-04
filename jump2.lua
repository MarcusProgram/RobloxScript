-- game https://www.roblox.com/games/9834528893/1-Jump-Every-Second

--
--███╗░░░███╗░█████╗░██████╗░██╗░░░██╗░█████╗░░██████╗
--████╗░████║██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝
--██╔████╔██║███████║██████╔╝██║░░░██║██║░░╚═╝╚█████╗░
--██║╚██╔╝██║██╔══██║██╔══██╗██║░░░██║██║░░██╗░╚═══██╗
--██║░╚═╝░██║██║░░██║██║░░██║╚██████╔╝╚█████╔╝██████╔╝
--╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░░╚════╝░╚═════╝░
for i = 1, 100 do
   print("Created by Marcus")
end
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character.HumanoidRootPart
local Humanoid = Character.Humanoid
local plrs = game.Players
local playerNames = {}
local players = plrs:GetPlayers()

_G.autoFarm == true

function auto_Farm()
   for i = 1, 360, 5 do
      game:GetService("Workspace").marcusov123123.HumanoidRootPart.CFrame = game:GetService("Workspace").marcusov123123.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(i), 0)
      wait(.000001)
      game:GetService("Workspace").marcusov123123.HumanoidRootPart.CFrame = game:GetService("Workspace").WinPaths["Horror Tower"].TouchPart.CFrame
      wait(.000001)
  end
end

for i = 1, 100 do
    print("Created by Marcus")
end
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Created by Marucs",
    Text = "Discord marcusov1",
    Icon = "rbxassetid://4483345998"
})

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
    Name = "Jump Sim by Marcus",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "Configs"
})





local Auto = Window:MakeTab({
   Name = "Auto",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})
Auto:AddSection({
	Name = "Auto:"
})
Auto:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		  _G.autoFarm = Value
        auto_Farm()
	end    
})
local Player = Window:MakeTab({
    Name = "Player",
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
	Max = 3000000000,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JPower",
	Callback = function(Value)
		Humanoid.JumpPower = Value
	end    
})

Player:AddButton({
	Name = "Anti AFK",
	Callback = function()
        repeat wait() until game:IsLoaded()
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualUser"):ClickButton2(Vector2.new())
        end)
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "ANTI AFK",
            Text = "ANTI AFK ON",
            Icon = "rbxassetid://4483345998"
        })
  	end
})

Player:AddButton({
	Name = "Copy Player",
	Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "soon",
            Text = "скрипт делается",
            Icon = "rbxassetid://4483345998"
        })
  	end
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MiscTab:AddSection({
	Name = "Tools:"
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

MiscTab:AddSection({
	Name = "Teleport:"
})

MiscTab:AddDropdown({
    Name = "Players",
    Default = playerNames[1] or "No Players",
    Options = playerNames,
    Callback = function(selectedplrName)
        local targetPlayer = plrs:FindFirstChild(selectedplrName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local localPlayerRoot = plrs.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if localPlayerRoot then
                localPlayerRoot.CFrame = CFrame.new(targetPosition)
            end
        end
        print(selectedplrName)
    end    
})
OrionLib.Init()
