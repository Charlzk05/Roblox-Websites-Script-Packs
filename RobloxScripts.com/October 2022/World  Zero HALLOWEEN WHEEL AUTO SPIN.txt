getgenv().spin = false

while spin == true do
    task.wait(1.5)
    local args = {[1] = game:GetService("Players").LocalPlayer}
    game:GetService("ReplicatedStorage").Shared.EventSpinner.JoinQueue:FireServer(unpack(args))
end