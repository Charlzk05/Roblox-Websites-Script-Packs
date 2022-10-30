getgenv().HhahahahahaahAAH = true

  if getgenv().HhahahahahaahAAH == true then
      local folder = game:GetService("Workspace")["Terrain2Camera!"].EasterEggEazy -- you can chacnge this to Eazy, Medium, Hard, Extreme

      for i, Obj in next, folder:GetChildren() do
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Obj.CFrame
      wait(1.2)
  end
end