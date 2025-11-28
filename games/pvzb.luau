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
Discord = {
Enabled = false
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
Name = "Gears to Buy",
Options = GearList,
CurrentOption = {},
Flag = "GearDropdown",
MultipleOptions = true,
Callback = function(Option)
SelectedCountParagraph:Set("Selected Gears: " .. #Option .. " | " .. table.concat(Option, ", "))
end
})

MainTab:CreateButton({
Name = "Auto Buy Selected",
Callback = function()
local selected = GearDropdown.CurrentOption
if #selected == 0 then
Rayfield:Notify({
Title = "NamelesScript",
Content = "No gears selected!",
Duration = 4
})
return
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BuyGearRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyGear")

local successCount = 0
for _, gearName in ipairs(selected) do
local args = { gearName, true }
local success, err = pcall(function()
BuyGearRemote:FireServer(unpack(args))
end)
if success then
successCount += 1
end
task.wait(0.3)
end

Rayfield:Notify({
Title = "NamelesScript",
Content = "Bought " .. successCount .. "/" .. #selected .. " gears!",
Duration = 6
})
end
})

MainTab:CreateButton({
Name = "Select All",
Callback = function()
GearDropdown:Set(GearList)
end
})

MainTab:CreateButton({
Name = "Clear Selection",
Callback = function()
GearDropdown:Set({})
end
})

MainTab:CreateParagraph({
Title = "Made with 💜 by NamelesScript",
Content = "Enjoy unlimited gears! Stay safe & have fun."
})

Rayfield:Notify({
Title = "NamelesScript",
Content = "Gear Buyer v1.2 Loaded Successfully!",
Duration = 6
})