local Player = game:GetService("Players")
local LP = Player.LocalPlayer
local Char = LP.Character

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Rayfield Example Window",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Fuck",
})

local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image

MainTab:CreateSection("Tool Mods")

MainTab:CreateLabel("Launcher")

MainTab:CreateToggle({
    Name = "No Cooldown",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(LauncherCooldown)
        _G.Cooldown = LauncherCooldown
        local Launcher = Char:FindFirstChild("Launcher")
        local LauncherScript = Launcher.Stats
        local require_launcher = require(LauncherScript)
        if _G.Cooldown == true then
            require_launcher.Cooldown = 0
        else
            require_launcher.Cooldown = 1
        end
    end,
})

MainTab:CreateSlider({
    Name = "Rocket Speed",
    Range = {0, 100},
    Increment = 10,
    Suffix = "Rocket Speed",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(RocketSpeed)
        local Launcher = Char:FindFirstChild("Launcher")
        local LauncherScript = Launcher.Stats
        local require_launcher = require(LauncherScript)
        require_launcher.RocketSpeed = RocketSpeed
    end,
 })
