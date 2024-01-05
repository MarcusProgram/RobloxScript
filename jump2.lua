-- game  https://www.roblox.com/games/9834528893/1-Jump-Every-Second
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/MarcusProgram/RobloxScript/main/jump2.lua"))()
--
--███╗░░░███╗░█████╗░██████╗░██╗░░░██╗░█████╗░░██████╗
--████╗░████║██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝
--██╔████╔██║███████║██████╔╝██║░░░██║██║░░╚═╝╚█████╗░
--██║╚██╔╝██║██╔══██║██╔══██╗██║░░░██║██║░░██╗░╚═══██╗
--██║░╚═╝░██║██║░░██║██║░░██║╚██████╔╝╚█████╔╝██████╔╝
--╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░░╚════╝░╚═════╝░


--game:GetService("Players").LocalPlayer.Character.Humanoid:TakeDamage(1000)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character.HumanoidRootPart
local Humanoid = Character.Humanoid

local plrs = game.Players

local playerNames = {}
local players = plrs:GetPlayers()

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

for _, player in ipairs(players) do
    table.insert(playerNames, player.Name)
end

_G.autoFarm = false


function auto_Farm()
    while _G.autoFarm == true do
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WinPaths["Horror Tower"].TouchPart.CFrame
      wait(2)
    end
end


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

local Teleport = Window:MakeTab({
   Name = "Teleport",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})



local Player = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})



Player:AddButton({
	Name = "Enable Player List",
	Callback = function()
      game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
  	end
})

Player:AddSection({
	Name = "_______________"
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
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
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
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})


Player:AddSection({
	Name = "Health:"
})

Player:AddSlider({
	Name = "Max Health",
	Min = 0,
	Max = 1000,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Mhealth",
	Callback = function(Value)
		   game:GetService("Players").LocalPlayer.Character.Humanoid.MaxHealth = Value
	end    
})
Player:AddSlider({
	Name = "Health",
	Min = 0,
	Max = 1000,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Health",
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.Health = Value
	end    
})


Player:AddSection({
	Name = "_______________"
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

local Fun = Window:MakeTab({
   Name = "Fun",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})
Fun:AddButton({
	Name = "Party Health Bar",
	Callback = function()
      game:GetService("Players").LocalPlayer.Character.Humanoid.MaxHealth = 1000
      while wait(.01) do 
         local random = Random.new()
         game:GetService("Players").LocalPlayer.Character.Humanoid.Health = random:NextNumber(100, 1000)
      end
  	end    
})

OrionLib.Init()

