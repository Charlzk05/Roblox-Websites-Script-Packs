local player = game.Players.LocalPlayer
local character = player.Character
local woo = true

while woo == true do
wait(1)
local a = character.Head.Voice
local b = game:GetService("ReplicatedStorage").Voices.Annihilator.Whoo.AnniCheer_3
local c = "Annihilator"

game:GetService("ReplicatedStorage").Events.PlayVoice:FireServer(a, b, c)
end