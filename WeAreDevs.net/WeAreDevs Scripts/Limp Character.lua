--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Messes with your characters joints so it walks with a limp.

Instruction: Inject this script into any game using a Lua executor like JJSploit. 
]]

character = game:GetService("Players").LocalPlayer.Character
rootJoint = character.HumanoidRootPart.RootJoint

rightLeg = character:FindFirstChild("Right Leg") or character:FindFirstChild("LowerRightLeg")
rootJoint.Part0 = character["Right Leg"]
rootJoint.Part1 = character.HumanoidRootPart