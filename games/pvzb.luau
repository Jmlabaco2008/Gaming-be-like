local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
Name = "NamelesScript - Gear Buyer v1.2",
LoadingTitle = "NamelesScript Gear Buyer",
LoadingSubtitle = "by NamelesScript",
ConfigurationSaving = {
Enabled = true,
FolderName = "NamelesScriptConfigs",
FileName = "GearBuyerConfig"
},
KeySystem = false
})

local MainTab = Window:CreateTab("Gear Buyer", 4483362458)

local GearList = {
"Water Bucket",
"Frost Grenade",
"Banana Gun",
"Frost Blower",
"Carrot Launcher"
}

local SelectedCountParagraph = MainTab:CreateParagraph({
Title = "Selected Gears",
Content = "Selected Gears: 0"
})

local GearDropdown = MainTab:CreateDropdown({
Name = "Select Gears to Auto-Buy",
Options = GearList,
CurrentOption = GearList,
Flag = "GearDropdown",
MultipleOptions = true,
Callback = function(Option)
SelectedCountParagraph:Set("Selected Gears: " .. #Option .. " | " .. table.concat(Option, ", "))
end
})

local AutoBuyToggle = MainTab:CreateToggle({
Name = "AUTO BUY",
CurrentValue = false,
Flag = "AutoBuyToggle",
Callback = function(Value)
if Value then
Rayfield:Notify({
Title = "NamelesScript",
Content = "AUTO BUY Activated",
Duration = 4
})
spawn(function()
while AutoBuyToggle.CurrentValue do
local selected = GearDropdown.CurrentOption
if #selected > 0 then
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BuyGearRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyGear")
for _, gearName in ipairs(selected) do
if not AutoBuyToggle.CurrentValue then break end
local args = { gearName, true }
pcall(function()
BuyGearRemote:FireServer(unpack(args))
end)
task.wait(0.35)
end
end
task.wait(0.1)
end
end)
else
Rayfield:Notify({
Title = "NamelesScript",
Content = "AUTO BUY Deactivated",
Duration = 4
})
end
end
})

MainTab:CreateParagraph({
Title = "Made with NamelesScript",
Content = "Select gears then toggle AUTO BUY on"
})

Rayfield:Notify({
Title = "NamelesScript",
Content = "Gear Buyer v1.2 Loaded!",
Duration = 5
})