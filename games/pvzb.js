-- Auto Buy Gear Script
-- Made by Mart Labaco Team

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Auto Buy Gear Hub",
   LoadingTitle = "Mart Labaco Team",
   LoadingSubtitle = "Loading Auto Buyer...",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "MartLabacoAutoBuyGear"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

local Tab = Window:CreateTab("Gears", 4483362458) -- Icon optional

-- Toggles for each gear
local waterToggle = Tab:CreateToggle({
   Name = "Water Bucket",
   CurrentValue = false,
   Flag = "WaterBucket",
   Callback = function(Value)
      -- Optional: print("Water Bucket:", Value)
   end,
})

local frostGrenadeToggle = Tab:CreateToggle({
   Name = "Frost Grenade",
   CurrentValue = false,
   Flag = "FrostGrenade",
   Callback = function(Value)
      -- Optional
   end,
})

local bananaGunToggle = Tab:CreateToggle({
   Name = "Banana Gun",
   CurrentValue = false,
   Flag = "BananaGun",
   Callback = function(Value)
      -- Optional
   end,
})

local frostBlowerToggle = Tab:CreateToggle({
   Name = "Frost Blower",
   CurrentValue = false,
   Flag = "FrostBlower",
   Callback = function(Value)
      -- Optional
   end,
})

local carrotLauncherToggle = Tab:CreateToggle({
   Name = "Carrot Launcher",
   CurrentValue = false,
   Flag = "CarrotLauncher",
   Callback = function(Value)
      -- Optional
   end,
})

-- Buy Button
Tab:CreateButton({
   Name = "Buy All Selected Gears",
   Callback = function()
      local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyGear")
      
      local gears = {
         {flag = "WaterBucket", name = "Water Bucket"},
         {flag = "FrostGrenade", name = "Frost Grenade"},
         {flag = "BananaGun", name = "Banana Gun"},
         {flag = "FrostBlower", name = "Frost Blower"},
         {flag = "CarrotLauncher", name = "Carrot Launcher"}
      }
      
      local bought = 0
      for _, gear in ipairs(gears) do
         if Rayfield.Flags[gear.flag] then
            pcall(function()
               remote:FireServer(gear.name, true)
               bought = bought + 1
            end)
         end
      end
      
      if bought > 0 then
         Rayfield:Notify({
            Title = "Purchase Successful",
            Content = "Bought " .. bought .. " gear(s)!",
            Duration = 3,
            Image = 4483362458
         })
      else
         Rayfield:Notify({
            Title = "No Gears Selected",
            Content = "Please select at least one gear first.",
            Duration = 3,
            Image = 4483362458
         })
      end
   end,
})

-- Optional: Secure Mode (uncomment if needed)
-- Rayfield:SetSecureMode(true)

Rayfield:LoadConfiguration()