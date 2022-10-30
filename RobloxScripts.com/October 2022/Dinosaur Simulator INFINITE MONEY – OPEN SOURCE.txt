--Variables
plr = game.Players.LocalPlayer.Character
AttackRemote = game:GetService("ReplicatedStorage").RemoteEvents.AttackRemoteEvent

--Script
plr.HumanoidRootPart.CFrame = game.workspace.Monsters["Monster_01"].Food.Apple.RootPart.CFrame
task.wait(.2)
AttackRemote:FireServer("AttackStaticFood",workspace.Monsters.Monster_01.Food.Apple,99999999,"Dinosaur1_3_1")