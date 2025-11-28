--// NameLess Project
--// Credits: Mart Labaco
--// Version: v1.3 (UI Fixed)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
Name = "NameLess - Auto Buyer v1.3",
LoadingTitle = "NameLess",
LoadingSubtitle = "By Mart Labaco",
ConfigurationSaving = {
Enabled = true,
FolderName = "NameLessConfigs",
FileName = "AutoBuyerConfig"
},
KeySystem = false
})

--------------------------------------------------------
-- TABS
--------------------------------------------------------

local GearTab = Window:CreateTab("⚙️ Auto Gear")
local SeedTab = Window:CreateTab("🌱 Auto Seeds")

--------------------------------------------------------
-- AUTO BUY GEAR
--------------------------------------------------------

local gearList = {
"Water Bucket",
"Frost Grenade",
"Banana Gun",
"Frost Blower",
"Carrot Launcher"
}

local selectedGear = {} -- holds selected gear

GearTab:CreateSection("Select Gear to Buy")

GearTab:CreateDropdown({
Name = "Choose Gear",
Options = gearList,
CurrentOption = "",
Flag = "ChooseGear",
Callback = function(option)
if not table.find(selectedGear, option) then
table.insert(selectedGear, option)
Rayfield:Notify({
Title = "Gear Added",
Content = "Selected: "..option,
Duration = 2
})
end
end,
})

GearTab:CreateButton({
Name = "Clear Selected Gear",
Callback = function()
selectedGear = {}
Rayfield:Notify({
Title = "Cleared",
Content = "All selected gear removed.",
Duration = 2
})
end,
})

GearTab:CreateToggle({
Name = "Enable Auto Buy Gear",
CurrentValue = false,
Flag = "AutoBuyGear",
Callback = function(state)
getgenv().AutoBuyGear = state

while getgenv().AutoBuyGear do
task.wait(0.5)

for _, gear in ipairs(selectedGear) do
local args = {gear, true}
pcall(function()
game:GetService("ReplicatedStorage")
:WaitForChild("Remotes")
:WaitForChild("BuyGear")
:FireServer(unpack(args))
end)
end
end
end,
})

--------------------------------------------------------
-- AUTO BUY SEEDS
--------------------------------------------------------

local seedList = {
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

local selectedSeeds = {}

SeedTab:CreateSection("Select Seeds to Buy")

SeedTab:CreateDropdown({
Name = "Choose Seed",
Options = seedList,
CurrentOption = "",
Flag = "ChooseSeed",
Callback = function(option)
if not table.find(selectedSeeds, option) then
table.insert(selectedSeeds, option)
Rayfield:Notify({
Title = "Seed Added",
Content = "Selected: "..option,
Duration = 2
})
end
end,
})

SeedTab:CreateButton({
Name = "Clear Selected Seeds",
Callback = function()
selectedSeeds = {}
Rayfield:Notify({
Title = "Cleared",
Content = "All selected seeds removed.",
Duration = 2
})
end,
})

SeedTab:CreateToggle({
Name = "Enable Auto Buy Seeds",
CurrentValue = false,
Flag = "AutoBuySeeds",
Callback = function(state)
getgenv().AutoBuySeeds = state

while getgenv().AutoBuySeeds do
task.wait(0.5)

for _, seed in ipairs(selectedSeeds) do
local args = {seed, true}
pcall(function()
game:GetService("ReplicatedStorage")
:WaitForChild("Remotes")
:WaitForChild("BuyItem")
:FireServer(unpack(args))
end)
end
end
end,
})

print("NameLess v1.3 Loaded | Credits: Mart Labaco")