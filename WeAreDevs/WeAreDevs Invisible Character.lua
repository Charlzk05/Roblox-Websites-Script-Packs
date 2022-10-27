--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Makes all of your body parts invisible. Only you can see this effect.

Instruction: Inject this script into any game using a Lua executor like JJSploit. 

I wrote this while off the boof and realized at the end that I'm a goof for not 
simply looping through for BaseParts... 
]]

character = game:GetService("Players").LocalPlayer.Character

character.Head.Transparency = 1

--R6 Rigs
torso = character:FindFirstChild("Torso")
if torso then torso.Transparency = 1 end

leftArm = character:FindFirstChild("Left Arm")
if leftArm then leftArm.Transparency = 1 end
rightArm = character:FindFirstChild("Right Arm")
if rightArm then rightArm.Transparency = 1 end

leftLeg = character:FindFirstChild("Left Leg")
if leftLeg then leftLeg.Transparency = 1 end
rightLeg = character:FindFirstChild("Right Leg")
if rightLeg then rightLeg.Transparency = 1 end

--R15 Rigs
upperTorso = character:FindFirstChild("UpperTorso")
if upperTorso then upperTorso.Transparency = 1 end
lowerTorso = character:FindFirstChild("LowerTorso")
if lowerTorso then lowerTorso.Transparency = 1 end

leftUpperArm = character:FindFirstChild("LeftUpperArm")
if leftUpperArm then leftUpperArm.Transparency = 1 end
leftLowerArm = character:FindFirstChild("LeftLowerArm")
if leftLowerArm then leftLowerArm.Transparency = 1 end
leftFoot = character:FindFirstChild("LeftFoot")
if leftFoot then leftFoot.Transparency = 1 end
rightUpperArm = character:FindFirstChild("RightUpperArm")
if rightUpperArm then rightUpperArm.Transparency = 1 end
rightLowerArm = character:FindFirstChild("RightLowerArm")
if rightLowerArm then rightLowerArm.Transparency = 1 end
rightFoot = character:FindFirstChild("RightFoot")
if rightFoot then rightFoot.Transparency = 1 end

leftUpperLeg = character:FindFirstChild("LeftUpperLeg")
if leftUpperLeg then leftUpperLeg.Transparency = 1 end
leftLowerLeg = character:FindFirstChild("LeftLowerLeg")
if leftLowerLeg then leftLowerLeg.Transparency = 1 end
leftFoot = character:FindFirstChild("LeftFoot")
if leftFoot then leftFoot.Transparency = 1 end
rightUpperLeg = character:FindFirstChild("RightUpperLeg")
if rightUpperLeg then rightUpperLeg.Transparency = 1 end
rightLowerLeg = character:FindFirstChild("RightLowerLeg")
if rightLowerLeg then rightLowerLeg.Transparency = 1 end
rightFoot = character:FindFirstChild("RightFoot")
if rightFoot then rightFoot.Transparency = 1 end