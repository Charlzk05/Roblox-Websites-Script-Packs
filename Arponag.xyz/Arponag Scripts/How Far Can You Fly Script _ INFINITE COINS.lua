local Player = game:GetService('Players').LocalPlayer
local Tiles = workspace.Tiles
local RS = game:GetService("RunService")

RS.Stepped:Connect(function()
   if Player.Character ~= nil and Player.Character:FindFirstChild("Head") then
       local Head = Player.Character.Head

       if Tiles:FindFirstChild("202k") then
           firetouchinterest(Head, Tiles["202k"], 0)
           task.wait()
           firetouchinterest(Head, Tiles["202k"], 1)
       end
   end
end)