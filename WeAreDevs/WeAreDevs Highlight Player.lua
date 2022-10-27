--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Puts a selection box around the selected player. To choose a player,
enter their name between the quotes immediately after the targetPlayerName variable
below. If no name is set, it will select you by default. Only you can see the
selection box.

Instruction: Inject this script into any game using a Lua executor like JJSploit. 
]]

targetPlayerName = ""

players = game:GetService("Players")
targetPlayer = players:FindFirstChild(targetPlayerName) or players.LocalPlayer
character = targetPlayer.Character

selectionBox = Instance.new("SelectionBox")
selectionBox.Parent = character.HumanoidRootPart
selectionBox.Adornee = character.HumanoidRootPart