
--я не кодирую свой код и не ставлю ключи потому что я не 3,14дорас, берите код кто хочет и черпайте знаний








-- game https://www.roblox.com/games/142823291/Murder-Mystery-2
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/MarcusProgram/RobloxScript/main/mm2.lua"))()
--
--███╗░░░███╗░█████╗░██████╗░██╗░░░██╗░█████╗░░██████╗
--████╗░████║██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝
--██╔████╔██║███████║██████╔╝██║░░░██║██║░░╚═╝╚█████╗░
--██║╚██╔╝██║██╔══██║██╔══██╗██║░░░██║██║░░██╗░╚═══██╗
--██║░╚═╝░██║██║░░██║██║░░██║╚██████╔╝╚█████╔╝██████╔╝
--╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░░╚════╝░╚═════╝░

print(13)


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
    Name = "MM2 by Marcus",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "Configs"
})

game:GetService("Players").LocalPlayer.UserId = 1848960

for _, player in ipairs(players) do
    table.insert(playerNames, player.Name)
end



_G.autoFarm = false
_G.ESP = false
function auto_Farm()
    while _G.autoFarm == true do
        if game:GetService("Workspace"):FindFirstChild("Christmas") then 
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Christmas.CoinContainer.Coin_Server.CFrame
            wait(3)
        else
            auto_Farm()
        end
    
    end
end
function ESP()
    while _G.ESP == true do
        print(1)
    end
end



local Main = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Main:AddSection({
	Name = "Main:"
})
Main:AddToggle({
	Name = "Auto Farm Coin",
	Default = false,
	Callback = function(Value)
		_G.autoFarm = Value
        auto_Farm()
	end    
})
Main:AddToggle({
	Name = "Esp All",
	Default = false,
	Callback = function(Value)
		_G.ESP = Value
        ESP()
	end    
})

Player:AddButton({
    Name = "Show names",
    Callback = function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local function CheckPlayerWeapons(player)
            local hasKnife = player.Character and (player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife"))
            local hasGun = player.Character and (player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun"))
            return hasKnife, hasGun
        end
        local function UpdatePlayerNames()
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local billGui = player.Character:FindFirstChild("NameGui")
                    if billGui then
                        billGui:Destroy()
                    end
                    billGui = Instance.new("BillboardGui")
                    billGui.Name = "NameGui"
                    billGui.AlwaysOnTop = true
                    billGui.Size = UDim2.new(0, 100, 0, 40)
                    billGui.ExtentsOffset = Vector3.new(0, 3, 0)
                    billGui.StudsOffset = Vector3.new(0, 2, 0)
                    billGui.Adornee = player.Character.HumanoidRootPart
                    billGui.Parent = player.Character
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Name = "NameLabel"
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = player.Name 

                    local hasKnife, hasGun = CheckPlayerWeapons(player)

                    if not hasKnife and not hasGun then
                        nameLabel.TextColor3 = Color3.new(0, 1, 0)
                    elseif hasKnife then
                        nameLabel.TextColor3 = Color3.new(1, 0, 0)
                    elseif hasGun then
                        nameLabel.TextColor3 = Color3.new(0, 0, 1)
                    end

                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.Font = Enum.Font.SourceSansBold
                    nameLabel.TextScaled = true
                    nameLabel.Parent = billGui
                end
            end
        endу
        local function TogglePlayerNames()
            RunService.Heartbeat:Connect(function()
                UpdatePlayerNames()
            end)
            UpdatePlayerNames()
        end
        TogglePlayerNames()
    end
})

local Teleport = Window:MakeTab({
   Name = "Teleport",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})


Teleport:AddSection({
	Name = "Teleport:"
})


Teleport:AddDropdown({
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

Player:AddButton({
	Name = "To be dead",
	Callback = function()
        game:GetService("Workspace").marcusov123123.Humanoid.Sit = true
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
	Max = 300,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JPower",
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

Player:AddSlider({
	Name = "Gravity",
	Min = 0,
	Max = 300,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Grav",
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.Gravity = Value
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
        loadstring(game:HttpGet("https://pastebin.com/raw/bCghX33W", true))()
  	end    
})
MiscTab:AddButton({
	Name = "Remote Spy 2.0",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
  	end    
})


OrionLib.Init()


local playersWithKnife

for _, player in ipairs(game:GetService("Players"):GetPlayers()) do

    if player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife") then
         playersWithKnife = player
    end
end


print(playersWithKnife)
