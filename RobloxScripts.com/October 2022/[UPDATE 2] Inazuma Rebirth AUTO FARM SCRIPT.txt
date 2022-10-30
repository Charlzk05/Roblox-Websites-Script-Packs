game.Players.LocalPlayer.Character.Tackle:Destroy()
while wait(0) do
game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
  prompt.HoldDuration = 0
end)
   game:GetService("UserInputService").InputBegan:Connect(function(i, gpe)
   if not gpe and i.KeyCode == Enum.KeyCode.E then
game:GetService("Players").LocalPlayer.PlayerGui.MoneyAndEXPQuest.MainFrame.Frame.Agree.Visible = true

   end
end)

local N=game:GetService("VirtualInputManager")
wait(0.2)
N:SendKeyEvent(true,"E",false,game)
wait(0.2)
N:SendKeyEvent(true,"E",false,game)
wait(0.25)

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-947.316956, 256.842102, 85.2098312, 0.980475366, 1.1222915e-08, -0.196642071, -3.05220631e-08, 1, -9.51130019e-08, 0.196642071, 9.92578748e-08, 0.980475366)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.855103, 286.169067, -268.457275, -0.780755699, -2.23350827e-09, -0.624836445, 1.36316003e-09, 1, -5.27786659e-09, 0.624836445, -4.97247621e-09, -0.780755699)

end