local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GiveItem = ReplicatedStorage.Remotes.DataChange_Item

for Name, _ in next, getupvalue(require(ReplicatedStorage.Itemdata).GetItem, 1) do
    GiveItem:FireServer("update", Name, "Surplus", 99)
end