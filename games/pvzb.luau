-- LOAD RAYFIELD
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- WINDOW
local Window = Rayfield:CreateWindow({
Name = "NamelesScript - Gear & Seed Buyer v1.4",
LoadingTitle = "NamelesScript",
LoadingSubtitle = "by NamelesScript",
ConfigurationSaving = {
Enabled = true,
FolderName = "NamelesScriptConfigs",
FileName = "BuyerConfig"
},
KeySystem = false
})

local GearTab = Window:CreateTab("Gears", 4483362458)
local SeedTab = Window:CreateTab("Seeds", 6035059730)

---------------------------------------------------------------------
-- DATA
---------------------------------------------------------------------

local GearList = {
"Water Bucket",
"Frost Grenade",
"Banana Gun",
"Frost Blower",
"Carrot Launcher"
}

local SeedList = {
"Starfruit Seed",
"King Limone Seed",
"Mango Seed",
"Shroombino Seed",
"Tomatrio Seed",
"Mr Carrot Seed",
"Carnivorous Plant Seed",
"Cocotank Seed",
"Grape Seed",
"Watermelon Seed",
"Eggplant Seed",
"Dragon Fruit Seed",
"Sunflower Seed",
"Pumpkin Seed",
"Strawberry Seed",
"Cactus Seed"
}

-- MAKES DROPDOWN ALWAYS ACCURATE
local SelectedGears = {}
local SelectedSeeds = {}

---------------------------------------------------------------------
-- GEARS TAB
---------------------------------------------------------------------

GearTab:CreateParagraph({Title = "Gear Auto Buyer", Content = "Select gears → Toggle AUTO BUY"})

local SelectedGearParagraph = GearTab:CreateParagraph({
Title = "Selected Gears",
Content = "None"
})

local GearDropdown = GearTab:CreateDropdown({
Name = "Select Gears",
Options = GearList,
CurrentOption = {},
MultipleOptions = true,
Flag = "GearDropdown",
Callback = function(option)
SelectedGears = option
SelectedGearParagraph:Set("Selected Gears: " .. (#SelectedGears > 0 and table.concat(SelectedGears, ", ") or "None"))
end
})

local AutoGearToggle = GearTab:CreateToggle({
Name = "AUTO BUY GEARS",
CurrentValue = false,
Flag = "AutoGear",
Callback = function(state)
if state then
if #SelectedGears == 0 then
AutoGearToggle:Set(false)
Rayfield:Notify({
Title = "NamelesScript",
Content = "Select at least one gear first!",
Duration = 4
})
return
end

task.spawn(function()
local Remotes = game:GetService("ReplicatedStorage").Remotes
local BuyGear = Remotes:WaitForChild("BuyGear")

while AutoGearToggle.CurrentValue do
for _, gear in ipairs(SelectedGears) do
if not AutoGearToggle.CurrentValue then break end
pcall(function()
BuyGear:FireServer(gear, true)
end)
task.wait(0.35)
end
task.wait(0.1)
end
end)
end
end
})

---------------------------------------------------------------------
-- SEEDS TAB
---------------------------------------------------------------------

SeedTab:CreateParagraph({Title = "Seed Auto Buyer", Content = "Select seeds → Toggle AUTO BUY"})

local SelectedSeedParagraph = SeedTab:CreateParagraph({
Title = "Selected Seeds",
Content = "None"
})

local SeedDropdown = SeedTab:CreateDropdown({
Name = "Select Seeds",
Options = SeedList,
CurrentOption = {},
MultipleOptions = true,
Flag = "SeedDropdown",
Callback = function(option)
SelectedSeeds = option
SelectedSeedParagraph:Set("Selected Seeds: " .. (#SelectedSeeds > 0 and table.concat(SelectedSeeds, ", ") or "None"))
end
})

local AutoSeedToggle = SeedTab:CreateToggle({
Name = "AUTO BUY SEEDS",
CurrentValue = false,
Flag = "AutoSeed",
Callback = function(state)
if state then
if #SelectedSeeds == 0 then
AutoSeedToggle:Set(false)
Rayfield:Notify({
Title = "NamelesScript",
Content = "Select at least one seed first!",
Duration = 4
})
return
end

task.spawn(function()
local Remotes = game:GetService("ReplicatedStorage").Remotes
local BuyItem = Remotes:WaitForChild("BuyItem")

while AutoSeedToggle.CurrentValue do
for _, seed in ipairs(SelectedSeeds) do
if not AutoSeedToggle.CurrentValue then break end
pcall(function()
BuyItem:FireServer(seed, true)
end)
task.wait(0.35)
end
task.wait(0.1)
end
end)
end
end
})

---------------------------------------------------------------------
-- FOOTER
---------------------------------------------------------------------

GearTab:CreateParagraph({Title = "NamelesScript v1.4", Content = "Clean • Fast • Undetected"})
SeedTab:CreateParagraph({Title = "NamelesScript v1.4", Content = "Clean • Fast • Undetected"})

Rayfield:Notify({
Title = "NamelesScript",
Content = "Gear & Seed Buyer v1.4 Loaded Successfully!",
Duration = 5
})