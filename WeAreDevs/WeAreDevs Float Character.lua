--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Makes your character float into the air

Instruction: Inject this script into any game using a Lua executor like JJSploit. 
Re-execute to toggle off and on.
]]

player = game:GetService("Players").LocalPlayer

--Remove BodyVelocity to remove float
if player.Character.HumanoidRootPart:FindFirstChild("WRDBodyVelocity") then
    player.Character.HumanoidRootPart.WRDBodyVelocity:Destroy()
--Insert BodyVelocity to add float
else
    local bodyVelocity = Instance.new("BodyVelocity")
    --So we know what specific instance to remove when toggle off
    bodyVelocity.Name = "WRDBodyVelocity"
    bodyVelocity.Parent = player.Character.HumanoidRootPart
end