--[[instructions:

1. make sure you have at least one externally mounted (externally visible) weapon
such as a bomb, rocket or torpedo (the thing mountable on certain ww2 planes)
keep in mind you can't equip internal (bomb bay) weapons that you cant see
2. execute the script after you deployed
3. that's it! sometimes it may fail or only work with one weapon type and i
dont know how to fix that...

]]

local plane = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Model")
local typeoweapn = "aaaa"
print("plane: "..plane.Name)

--Shtip, Macedonia
local function determinetypeofweapon(japan)
   local guidansu = "idk guidance"
   if string.match(japan.Name, "T") then
       typeoweapn = "torpedo"
   elseif string.match(japan.Name,"B") then
       typeoweapn = "bomb"
   elseif string.match(japan.Name,"R") then
       typeoweapn = "rocket"
   end
       
   if japan:FindFirstChild("Guidance") then
       guidansu = "guided "
   else guidansu = "unguided "
   end
   print("the "..japan.Name.." as named in-game, or the "..japan.ProductName.Value.." is a(n) "..guidansu..typeoweapn)
end

--Shtipokawa, Japan
for _,v in pairs(plane:GetDescendants())do
   if v.Name == "WarheadMass" and not v.Parent:FindFirstChild("FuelCap") then
       local shtip = v.Parent
       determinetypeofweapon(shtip)
       shtip.Changed:Connect(function()
           if string.match(shtip.Name,"D") then
               shtip.Name = string.gsub(shtip.Name,"D","")
           end
       end)
       print("infinite "..typeoweapn.."s commenced for: "..v.Parent.Name.." also known as "..v.Parent.ProductName.Value)
   end
end


--[[ does not replicate, your projectiles are invisible to your enemies
    or maybe it does, idk, i didnt test it ]]
workspace.Junk.ChildAdded:Connect(function(poop)
   if poop.Name == game:GetService("Players").LocalPlayer.Name.."'s Projectile" then
       poop.Transparency = 0
   end
end)