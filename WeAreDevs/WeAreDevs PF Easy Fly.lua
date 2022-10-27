----------------------------------------------------
---  A redistribution of https://wearedevs.net/  ---
----------------------------------------------------

-- Made by gamermanaway
-- Game: https://www.roblox.com/games/292439477/Phantom-Forces

--[[
Controls:

F - Toggle On/Off
LeftShift - Faster/Slower
W - Forward
A - Left
S -Backward
D - Right
LeftControl - Down
Space - Up
]]--

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local CurrentCamera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer

local Boolean = false
local Speed = 50
local MovementTable = {
	0,
	0,
	0,
	0,
	0,
	0
}
local KeyCodeTable = {
	[Enum.KeyCode.W] = 1,
	[Enum.KeyCode.A] = 2,
	[Enum.KeyCode.S] = 3,
	[Enum.KeyCode.D] = 4,
	[Enum.KeyCode.LeftControl] = 5,
	[Enum.KeyCode.Space] = 6
}

UserInputService.InputBegan:Connect(function(Input, ...)
	if Input.KeyCode == Enum.KeyCode.F then
		if Boolean then
			Boolean = false
		else
			Boolean = true
		end
	elseif Input.KeyCode == Enum.KeyCode.LeftShift then
		Speed = 100
	elseif KeyCodeTable[Input.KeyCode] then
		MovementTable[KeyCodeTable[Input.KeyCode]] = 1
	end
end)

UserInputService.InputEnded:Connect(function(Input, ...)
	if Input.KeyCode == Enum.KeyCode.LeftShift then
		Speed = 50
	elseif KeyCodeTable[Input.KeyCode] then
		MovementTable[KeyCodeTable[Input.KeyCode]] = 0
	end
end)

local GetMass = function(Model)
	local Mass = 0
	for _, Value in pairs(Model:GetDescendants()) do
		if Value:IsA("BasePart") then
			Mass = Mass + Value:GetMass()
		end
	end
	return Mass * workspace.Gravity
end

RunService.RenderStepped:Connect(function(...)
	local Character = LocalPlayer.Character
	if Character then
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		local Mass = GetMass(Character)
		if HumanoidRootPart then
			local BodyVelocity = HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
			if BodyVelocity then
				if Boolean then
					BodyVelocity.MaxForce = Vector3.new(Mass * Speed, Mass * Speed, Mass * Speed)
					BodyVelocity.Velocity = CurrentCamera.CFrame.LookVector * Speed * (MovementTable[1] - MovementTable[3]) + CurrentCamera.CFrame.RightVector * Speed * (MovementTable[4] - MovementTable[2]) + CurrentCamera.CFrame.UpVector * Speed * (MovementTable[6] - MovementTable[5])
				else
					BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
					BodyVelocity.Velocity = Vector3.new(0, 2, 0)
				end
			end
		end
	end
end)