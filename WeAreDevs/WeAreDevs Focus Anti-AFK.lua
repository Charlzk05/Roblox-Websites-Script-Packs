----------------------------------------------------
---  A redistribution of https://wearedevs.net/  ---
----------------------------------------------------

assert(firesignal, "Your exploit does not support firesignal.")
local UserInputService: UserInputService = game:GetService("UserInputService")
local RunService: RunService = game:GetService("RunService")
UserInputService.WindowFocusReleased:Connect(function()
   RunService.Stepped:Wait()
   pcall(firesignal, UserInputService.WindowFocused)
end)