local Chest = game:GetService("Workspace").EquipmentChest
local origin = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local originalpos = origin.CFrame
origin.CFrame = Chest.CFrame
wait(0.5)
origin.CFrame = originalpos