local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

-- Title / Theme

local X = Material.Load({
    Title = "A Universal Time",
    Style = 2,
    SizeX = 330,
    SizeY = 350,
    Theme = "Dark",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(17, 17, 17)
    }
})

-- Variables

local Player = game:GetService("Players").LocalPlayer 
local Character = Player.Character
local HRP = Character and Character:FindFirstChild("HumanoidRootPart")

-- Windows / Pages

local Y = X.New({
    Title = "Autofarm/Bosses"
})

local Z = X.New({
    Title = "Shops/NPCs"
})

local W = X.New({
    Title = "Locations"
})

-- Functions of the Menu / Script

local plr = game.Players.LocalPlayer
local tween = function(Part,Speed)
        local Tween = game:GetService("TweenService"):Create(plr.Character.HumanoidRootPart, TweenInfo.new(Speed, Enum.EasingStyle.Quad), {
            CFrame = Part.CFrame
        })
        return Tween
    end
    local TweenSpeed = 1

local A = Y.Slider({
    Text = "Autofarm Speed",
    Callback = function(Value)
        TweenSpeed = Value
    end,
    Min = 1,
    Max = 200,
    Def = 1
})

getgenv().Autofarm = false
local B = Y.Toggle({
    Text = "Item Autofarm",
    Callback = function(Enabled)
        pcall(function()
            getgenv().Autofarm = Enabled
                while getgenv().Autofarm do wait() do
                    for _,v in pairs(game.Workspace.Items:GetChildren()) do
                        if v:IsA("Tool") then
                            local Dist = (v.Handle.Position - Character.HumanoidRootPart.Position).magnitude
                            tween(v.Handle,Dist/TweenSpeed):Play()
                        end
                    end
                end
            end
        end)
    end,
    Enabled = false
})

local C = Z.Button({
    Text = "Go to Stack Shop",
    Callback = function()
        pcall(function()
        shop = game:GetService("Workspace")["Satan Santa"].UpperTorso
        local Dist = (v.UpperTorso.Position - Character.HumanoidRootPart.Position).magnitude
        tween(shop,1):Play()
        end)
end
})

local D = Z.Button({
    Text = "Open Item Shop",
    Callback = function()
        fireclickdetector(game:GetService("Workspace")["AUT MAP"].Map.NPCS["Akira_Blade"].ClickDetector)
    end
})

local E = Z.Button({
    Text = "Open Black Market",
    Callback = function()
        fireclickdetector(game:GetService("Workspace")["AUT MAP"].Map.NPCS.BlackMarket.ClickDetector)
    end
})

local F = Z.Button({
    Text = "Mystery Man",
    Callback = function()
        fireclickdetector(game:GetService("Workspace")["AUT MAP"].Map.mm.HumanoidRootPart.cd)
    end
})

local G = W.Dropdown({
    Text = "Map Locations",
    Callback = function(Value)
        location = Value
    end,
    Options = {
        "Desert",
        "Italy",
        "Kame Island",
        "Morioh",
        "Cell Arena",
        "Item Island"
    }
})

local H = W.Button({
    Text = "Go To",
    Callback = function()
            if location == "Desert" then
                Player.Character:MoveTo(Vector3.new(-624, 321, -695))
            elseif location == "Italy" then
                Player.Character:MoveTo(Vector3.new(-511, 359, -1558))
            elseif location == "Kame Island" then
                Player.Character:MoveTo(Vector3.new(292, 312, -823))
            elseif location == "Morioh" then
                Player.Character:MoveTo(Vector3.new(377, 305, -120))
            elseif location == "Cell Arena" then
                Player.Character:MoveTo(Vector3.new(1076, 305, -380))
            elseif location == "Item Island" then
                Player.Character:MoveTo(Vector3.new(900, 300, -1189))
            end
end
})

local I = Y.Button({
    Text = "Go to Dawn",
    Callback = function()
        pcall(function()
            Player.Character:MoveTo(Vector3.new(1350, 320, -191))
        end)
    end
})

local J = Y.Button({
    Text = "Go to Dio",
    Callback = function()
        pcall(function()
            HRP.CFrame = game:GetService("Workspace").BossSpawns.dio.CFrame
        end)
    end
})

local K = Y.Button({
    Text = "Go to Dio Brando",
    Callback = function()
        pcall(function()
            HRP.CFrame =  game:GetService("Workspace").BossSpawns.brando.CFrame
        end)
    end
})