-- game https://www.roblox.com/games/11063612131/Every-Second-You-Get-1-Jump-Power

--
--███╗░░░███╗░█████╗░██████╗░██╗░░░██╗░█████╗░░██████╗
--████╗░████║██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝
--██╔████╔██║███████║██████╔╝██║░░░██║██║░░╚═╝╚█████╗░
--██║╚██╔╝██║██╔══██║██╔══██╗██║░░░██║██║░░██╗░╚═══██╗
--██║░╚═╝░██║██║░░██║██║░░██║╚██████╔╝╚█████╔╝██████╔╝
--╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░░╚════╝░╚═════╝░


local LocalPlayer = Players.LocalPlayer
LocalPlayer.UserId = 5404476025
LocalPlayer.DisplayName = "marcusov123123"

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

local Players = game:GetService("Players")

local Character = LocalPlayer.Character
local HumanoidRootPart = Character.HumanoidRootPart
local Humanoid = Character.Humanoid

local plrs = game.Players

local playerNames = {}
local players = plrs:GetPlayers()

for _, player in ipairs(players) do
    table.insert(playerNames, player.Name)
end

_G.autoFarm = false
_G.autoReb = false
_G.autoOpen = false
_G.autoCraftA = false


function autoCraft()
    while _G.autoCraftA == true do
        local args = {
            [1] = "MaxCraft",
            [2] = false
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("PetActionRequest"):InvokeServer(unpack(args))
        wait(5)
    end
end
function autoFarmEggs(value)
    while _G.autoOpen == true do
    local args = {
        [1] = value,
        [2] = "Single"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpened"):InvokeServer(unpack(args))    
end
end
function autoRebirth()
    while _G.autoReb == true do
        game:GetService("ReplicatedStorage"):WaitForChild("RebirthEvent"):FireServer()
        wait(.0001)
    end
 end

function auto_Farm()
    while _G.autoFarm == true do
        for i = 1, 360, 5 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(i), 0)
            wait(.000001)
            game:GetService("Workspace").Wins.World14.CFrame = HumanoidRootPart.CFrame
            wait(.000001)
        end
        
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

Auto:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		_G.autoReb = Value
        autoRebirth()
	end 
})


Auto:AddDropdown({
    Name = "Open Eggs",
    Default = "NO EGG",
    Options = {"NO EGG","Noob","Starter","Rare","Pro","Epic","Legendary","Mythical","Godly","Dark","Void","Desert","Forest","Candy","Steampunk","Beach","Heaven"},
    Callback = function(value)
        if value == "NO EGG" then
            _G.autoOpen = false
        else
            _G.autoOpen = true
            autoFarmEggs(value)
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "WARNING",
                Text = "YOU HAVE TO STAND NEXT TO THE EGG",
                Icon = "rbxassetid://4483345998"
            })
        end
    end
})




local gam = Auto:AddSection({
	Name = "Game:"
})
Auto:AddButton({
	Name = "Collect All Gifts",
	Callback = function()
        for i = 1,8 do
            local args = {
                [1] = "TimeGift",
                [2] = i
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Recv"):InvokeServer(unpack(args))
            wait(0.5)
        end
  	end    
})
Auto:AddToggle({
	Name = "Craft All",
	Default = false,
	Callback = function(Value)
		_G.autoCraftA = Value
        autoCraft()
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

TPTab:AddButton({
	Name = "Shop",
	Callback = function()
        HumanoidRootPart.CFrame = game:GetService("Workspace").Shop.Part.CFrame
  	end    
})

TPTab:AddButton({
	Name = "Trails",
	Callback = function()
        HumanoidRootPart.CFrame = game:GetService("Workspace").Trails.Part.CFrame
  	end    
})

TPTab:AddButton({
	Name = "Wheel",
	Callback = function()
        HumanoidRootPart.CFrame = game:GetService("Workspace").WheelPart.CFrame
  	end    
})


TPTab:AddButton({
	Name = "Secret",
	Callback = function()
        HumanoidRootPart.CFrame = game:GetService("Workspace").Secret.Teleport.CFrame
  	end    
})

local Race = TPTab:AddSection({
	Name = "Race"
})

TPTab:AddButton({
	Name = "Start Part",
	Callback = function()
        HumanoidRootPart.CFrame = game:GetService("Workspace").RaceModel.StartPart.CFrame
  	end    
})

TPTab:AddButton({
	Name = "Winner Part",
	Callback = function()
        HumanoidRootPart.CFrame = game:GetService("Workspace").RaceModel.WinnerPart.CFrame
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Invooker11/Outfit/main/OutfitCopier.lua", true))()
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
