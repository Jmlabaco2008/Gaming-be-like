-- SCRIPT FINDER KEYLESS by JMLABACO

-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

-- Get player name safely
local playerName = game.Players.LocalPlayer and game.Players.LocalPlayer.Name or "Player"

-- Create main window
local Window = Rayfield:CreateWindow({
Name = "SCRIPT FINDER KEYLESS",
LoadingTitle = "Welcome",
LoadingSubtitle = "by JMLABACO",
ConfigurationSaving = {
Enabled = false,
},
KeySystem = false,
})

-- Create main tab
local Tab = Window:CreateTab("Main")

-- Section & label
Tab:CreateSection("Hello!")
Tab:CreateLabel("Welcome, " .. playerName .. "!")

-- RUN SCRIPT button
Tab:CreateButton({
Name = "RUN SCRIPT",
Callback = function()
-- Create popup disclaimer
Rayfield:Notify({
Title = "Disclaimer",
Content = "I don't own the script. It belongs to the rightful owner.",
Duration = 6,
Image = 4483362458, -- Rayfield default icon
})

task.wait(6) -- wait for popup to end

-- Destroy the UI
Rayfield:Destroy()

-- Run requested script
loadstring(game:HttpGet("https://raw.githubusercontent.com/XVCHub/Games/main/PlantsVsBrainrots"))()
end,
})