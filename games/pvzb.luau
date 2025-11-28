local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
Name = "NamelesScript - Gear & Seed Buyer v1.3",
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

-- GEARS TAB
GearTab:CreateParagraph({Title = "Gear Auto Buyer", Content = "Select gears → Toggle AUTO BUY"})

local GearDropdown = GearTab:CreateDropdown({
Name = "Select Gears",
Options = GearList,
CurrentOption = GearList,
MultipleOptions = true,
Flag = "GearDropdown",
Callback = function() end
})

local AutoGearToggle = GearTab:CreateToggle({
Name = "AUTO BUY GEARS",
CurrentValue = false,
Flag = "AutoGear",
Callback = function(Value)
if Value then
spawn(function()
while AutoGearToggle.CurrentValue do
for _, gear in ipairs(GearDropdown.CurrentOption) do
if not AutoGearToggle.CurrentValue then break end
pcall(function()
game:GetService("ReplicatedStorage").Remotes.BuyGear:FireServer(gear, true)
end)
task.wait(0.35)
end
task.wait(0.1)
end
end)
end
end
})

-- SEEDS TAB
SeedTab:CreateParagraph({Title = "Seed Auto Buyer", Content = "Select seeds → Toggle AUTO BUY"})

local SeedDropdown = SeedTab:CreateDropdown({
Name = "Select Seeds",
Options = SeedList,
CurrentOption = {},
MultipleOptions = true,
Flag = "SeedDropdown",
Callback = function() end
})

local AutoSeedToggle = SeedTab:CreateToggle({
Name = "AUTO BUY SEEDS",
CurrentValue = false,
Flag = "AutoSeed",
Callback = function(Value)
if Value then
spawn(function()
while AutoSeedToggle.CurrentValue do
for _, seed in ipairs(SeedDropdown.CurrentOption) do
if not AutoSeedToggle.CurrentValue then break end
pcall(function()
game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer(seed, true)
end)
task.wait(0.35)
end
task.wait(0.1)
end
end)
end
end
})

-- FOOTER
GearTab:CreateParagraph({Title = "NamelesScript v1.3", Content = "Clean • Fast • Undetected"})
SeedTab:CreateParagraph({Title = "NamelesScript v1.3", Content = "Clean • Fast • Undetected"})

Rayfield:Notify({
Title = "NamelesScript",
Content = "Gear & Seed Buyer v1.3 Loaded!",
Duration = 5
})