--[[
A distribution of https://wearedevs.net/scripts
Last updated August 3, 2021

Description: Unlocks all bricks in the game so you can use btools on them.

Instruction: Simply execute the script and the effect takes place.
]]

function Traverse(instance)
	for i,v in pairs (instance:GetChildren()) do
		--Unlocks if its a brick
		if v:IsA("BasePart") then
			v.Locked = false
		end
		--So we can traverse through all children
		if #v:GetChildren() > 0 then
			Traverse(v)
		end
	end
end

Traverse(workspace)