--// NameLess Project
--// Credits: Mart Labaco
--// Version: v1.3

--// Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
Name = "NameLess - Auto Buyer v1.3",
LoadingTitle = "NameLess Project",
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

local GearTab = Window:CreateTab("⚙️ Auto Gear Buyer")
local SeedTab = Window:CreateTab("🌱 Auto Seed Buyer")

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

local selectedGear = {}

GearTab:CreateSection("Gear Options")

local GearMulti = GearTab:CreateMultiDropdown({
Name = "Select Gear to Auto Buy",
Options = gearList,
CurrentOption = {},
MultipleOptions = true,
Callback = function(Value)
selectedGear = Value
end,
})

GearTab:CreateToggle({
Name = "Enable Auto Buy Gear",
CurrentValue = false,
Flag = "AutoBuyGearFlag",
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
-- AUTO BUY SEEDS (NEW v1.3 FEATURE)
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

SeedTab:CreateSection("Seed Options")

local SeedMulti = SeedTab:CreateMultiDropdown({
Name = "Select Seeds to Auto Buy",
Options = seedList,
CurrentOption = {},
MultipleOptions = true,
Callback = function(Value)
selectedSeeds = Value
end,
})

SeedTab:CreateToggle({
Name = "Enable Auto Buy Seeds",
CurrentValue = false,
Flag = "AutoBuySeedFlag",
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

--------------------------------------------------------
-- END OF SCRIPT
print("NameLess v1.3 Loaded | Credits: Mart Labaco")