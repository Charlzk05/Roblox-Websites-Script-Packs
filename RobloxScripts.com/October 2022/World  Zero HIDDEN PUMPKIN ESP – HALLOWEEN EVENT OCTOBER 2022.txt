local poo = game.Workspace.EventFinderReward.Models:GetChildren()
--WORLD//ZERO PUMPKIN ESP
for i, v in pairs(poo) do
if v:IsA("Model") then
      Instance.new("Highlight", v).Adornee = v
end
end