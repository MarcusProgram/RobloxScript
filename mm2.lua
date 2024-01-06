print(36)

-- я не кодирую свой код и не ставлю ключи потому что я не 3,14дорас, берите код кто хочет и черпайте знаний








-- game https://www.roblox.com/games/142823291/Murder-Mystery-2
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/MarcusProgram/RobloxScript/main/mm2.lua"))()
--
--███╗░░░███╗░█████╗░██████╗░██╗░░░██╗░█████╗░░██████╗
--████╗░████║██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝
--██╔████╔██║███████║██████╔╝██║░░░██║██║░░╚═╝╚█████╗░
--██║╚██╔╝██║██╔══██║██╔══██╗██║░░░██║██║░░██╗░╚═══██╗
--██║░╚═╝░██║██║░░██║██║░░██║╚██████╔╝╚█████╔╝██████╔╝
--╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░░╚════╝░╚═════╝░


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


local Murderer, Sheriff = nil, nil;

function GetMurderer()
    for i,v in pairs(Players:GetChildren()) do 
        if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") and v.Name == "Tool" then
            return v.Name;
        end;
    end;
    return nil;
end;

function GetSheriff()
    for i,v in pairs(Players:GetChildren()) do 
        if v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") and v.Name == "Tool" then
            return v.Name;
        end;
        return nil;
    end;
end;

_G.autoFarm = false
_G.autoFarmXP = false
function auto_Farm()
    while _G.autoFarm == true do
        if game:GetService("Workspace"):FindFirstChild("Christmas") then 
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Christmas.CoinContainer.Coin_Server.CFrame
            wait(3)
        else
            wait(5)
            auto_Farm()
        end
    
    end
end

function auto_Farm_XP()
    while _G.autoFarmXP == true do
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-99.3635483, 162.194336, 39.1691856, -0.087949343, 8.68945591e-08, -0.996124923, 9.88126914e-10, 1, 8.71453523e-08, 0.996124923, 6.68007871e-09, -0.087949343)
    wait(1)
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
	Name = "Auto Farm XP",
	Default = false,
	Callback = function(Value)
		_G.autoFarmXP = Value
        auto_Farm_XP()
	end    
})
Main:AddButton({
    Name = "Show names",
    Callback = function()
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local billGui = Instance.new("BillboardGui")
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
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.Font = Enum.Font.SourceSansBold
                nameLabel.TextColor3 = Color3.new(1, 1, 1)
                nameLabel.TextScaled = true
                nameLabel.Parent = billGui
            end
        end
    end
})
_G.up = false
function UpdateChams()
    while _G.up == true do
    local function CheckItems(player)
        local character = player.Character
        local chamsColor = BrickColor.new("White")
        local hasKnife = character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife")
        local hasGun = character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun")

        if hasKnife then
            chamsColor = BrickColor.new("Really red")
        elseif hasGun then
            chamsColor = BrickColor.new("Bright blue")
        end

        if character:FindFirstChild("Chams") then
            character.Chams.BrickColor = chamsColor
        else
            local chams = Instance.new("BoxHandleAdornment")
            chams.Name = "Chams"
            chams.Size = character:GetExtentsSize()
            chams.AlwaysOnTop = true
            chams.ZIndex = 10
            chams.Color3 = chamsColor.Color
            chams.Transparency = 0.5
            chams.Adornee = character
            chams.Parent = character
        end
    end
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player.Character then
            CheckItems(player)
        end
    end
end
end


Main:AddToggle({
    Name = "Chams Update",
    Default = false,
    Callback = function(Value)
		_G.up = Value
        UpdateChams()
	end    
})




local Teleport = Window:MakeTab({
   Name = "Teleport",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
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

Player:AddButton({
	Name = "Fly",
	Callback = function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/TSjdP9mj'),true))()
  	end
})

Player:AddButton({
	Name = "Noclip",
	Callback = function()
        local Workspace = game:GetService("Workspace")
        local CoreGui = game:GetService("CoreGui")
        local Players = game:GetService("Players")
        local Noclip = Instance.new("ScreenGui")
        local BG = Instance.new("Frame")
        local Title = Instance.new("TextLabel")
        local Toggle = Instance.new("TextButton")
        local StatusPF = Instance.new("TextLabel")
        local Status = Instance.new("TextLabel")
        local Plr = Players.LocalPlayer
        local Clipon = false

        Noclip.Name = "Noclip"
        Noclip.Parent = game.CoreGui

        BG.Name = "BG"
        BG.Parent = Noclip
        BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
        BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
        BG.BorderSizePixel = 2
        BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
        BG.Size = UDim2.new(0, 210, 0, 127)
        BG.Active = true
        BG.Draggable = true

        Title.Name = "Title"
        Title.Parent = BG
        Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
        Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
        Title.BorderSizePixel = 2
        Title.Size = UDim2.new(0, 210, 0, 33)
        Title.Font = Enum.Font.Highway
        Title.Text = "Noclip"
        Title.TextColor3 = Color3.new(1, 1, 1)
        Title.FontSize = Enum.FontSize.Size32
        Title.TextSize = 30
        Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
        Title.TextStrokeTransparency = 0

        Toggle.Parent = BG
        Toggle.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
        Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
        Toggle.BorderSizePixel = 2
        Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
        Toggle.Size = UDim2.new(0, 146, 0, 36)
        Toggle.Font = Enum.Font.Highway
        Toggle.FontSize = Enum.FontSize.Size28
        Toggle.Text = "Toggle"
        Toggle.TextColor3 = Color3.new(1, 1, 1)
        Toggle.TextSize = 25
        Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
        Toggle.TextStrokeTransparency = 0

        StatusPF.Name = "StatusPF"
        StatusPF.Parent = BG
        StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
        StatusPF.BackgroundTransparency = 1
        StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
        StatusPF.Size = UDim2.new(0, 56, 0, 20)
        StatusPF.Font = Enum.Font.Highway
        StatusPF.FontSize = Enum.FontSize.Size24
        StatusPF.Text = "Status:"
        StatusPF.TextColor3 = Color3.new(1, 1, 1)
        StatusPF.TextSize = 20
        StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
        StatusPF.TextStrokeTransparency = 0
        StatusPF.TextWrapped = true

        Status.Name = "Status"
        Status.Parent = BG
        Status.BackgroundColor3 = Color3.new(1, 1, 1)
        Status.BackgroundTransparency = 1
        Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
        Status.Size = UDim2.new(0, 56, 0, 20)
        Status.Font = Enum.Font.Highway
        Status.FontSize = Enum.FontSize.Size14
        Status.Text = "off"
        Status.TextColor3 = Color3.new(0.666667, 0, 0)
        Status.TextScaled = true
        Status.TextSize = 14
        Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
        Status.TextWrapped = true
        Status.TextXAlignment = Enum.TextXAlignment.Left


        Toggle.MouseButton1Click:connect(function()
            if Status.Text == "off" then
                Clipon = true
                Status.Text = "on"
                Status.TextColor3 = Color3.new(0,185,0)
                Stepped = game:GetService("RunService").Stepped:Connect(function()
                    if not Clipon == false then
                        for a, b in pairs(Workspace:GetChildren()) do
                        if b.Name == Plr.Name then
                        for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                        if v:IsA("BasePart") then
                        v.CanCollide = false
                        end end end end
                    else
                        Stepped:Disconnect()
                    end
                end)
            elseif Status.Text == "on" then
                Clipon = false
                Status.Text = "off"
                Status.TextColor3 = Color3.new(170,0,0)
            end
        end)
  	end
})

Player:AddButton({
	Name = "Inf Jump",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Q0F1njnh"))()
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
	Max = 500,
	Default = 196,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
		game:GetService("Workspace").Gravity = Value
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







