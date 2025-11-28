local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Mart Labaco Team - Gear Buyer v1.1",
    LoadingTitle = "Mart Labaco Gear Buyer",
    LoadingSubtitle = "by Mart Labaco Team",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MartLabacoConfigs",
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

local SelectedGears = {}

for _, gearName in ipairs(GearList) do
    MainTab:CreateToggle({
        Name = gearName,
        CurrentValue = false,
        Flag = "Toggle_" .. gearName,
        Callback = function(Value)
            if Value then
                table.insert(SelectedGears, gearName)
            else
                for i, v in ipairs(SelectedGears) do
                    if v == gearName then
                        table.remove(SelectedGears, i)
                        break
                    end
                end
            end
            SelectedCountParagraph:Set("Selected Gears: " .. #SelectedGears .. " | " .. table.concat(SelectedGears, ", "))
        end
    })
end

local SelectedCountParagraph = MainTab:CreateParagraph({
    Title = "Selected Gears",
    Content = "Selected Gears: 0"
})

MainTab:CreateButton({
    Name = "Buy All Selected Gears",
    Callback = function()
        if #SelectedGears == 0 then
            Rayfield:Notify({
                Title = "Mart Labaco Team",
                Content = "No gears selected!",
                Duration = 4
            })
            return
        end

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local BuyGearRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyGear")

        local successCount = 0
        for _, gearName in ipairs(SelectedGears) do
            local args = { gearName, true }
            local success, err = pcall(function()
                BuyGearRemote:FireServer(unpack(args))
            end)
            if success then
                successCount += 1
            else
                warn("Failed to buy: " .. gearName .. " | Error: " .. tostring(err))
            end
            task.wait(0.3)
        end

        Rayfield:Notify({
            Title = "Mart Labaco Team",
            Content = "Successfully bought " .. successCount .. "/" .. #SelectedGears .. " selected gears!",
            Duration = 6
        })
    end
})

MainTab:CreateButton({
    Name = "Select All Gears",
    Callback = function()
        for _, gearName in ipairs(GearList) do
            if not table.find(SelectedGears, gearName) then
                table.insert(SelectedGears, gearName)
                Rayfield.Flags["Toggle_" .. gearName]:Set(true)
            end
        end
        SelectedCountParagraph:Set("Selected Gears: " .. #SelectedGears .. " | All Selected")
    end
})

MainTab:CreateButton({
    Name = "Clear Selection",
    Callback = function()
        for _, gearName in ipairs(SelectedGears) do
            Rayfield.Flags["Toggle_" .. gearName]:Set(false)
        end
        SelectedGears = {}
        SelectedCountParagraph:Set("Selected Gears: 0")
    end
})

MainTab:CreateParagraph({
    Title = "Made with 💜 by Mart Labaco Team",
    Content = "Enjoy unlimited gears! Stay safe & have fun."
})

Rayfield:Notify({
    Title = "Mart Labaco Team",
    Content = "Gear Buyer Loaded Successfully!",
    Duration = 6
})