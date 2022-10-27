----------------------------------------------------
---  A redistribution of https://wearedevs.net/  ---
----------------------------------------------------

local instances = {
	"Busy";
	"Ragdoll";
	"Down";
	"Stun";
	"Combat";
	"Aggro";
	"Health";
	"Stamina";
};
local runService = game:GetService("RunService");
local inputService = game:GetService("UserInputService");
local replicatedStorage = game:GetService("ReplicatedStorage");
local coreGui = game:GetService("CoreGui");

local localPlayer = game:GetService("Players").LocalPlayer;
local character = localPlayer.Character; 
character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0,0,5)

local breathing = localPlayer.Breathing;

if executed then warn("Already executed script!") return end
getgenv().executed = true

_G.steppedConnection = nil;
_G.check = false;
_G.trinketToggle = false;
if _G.canTeleport == nil then 
	_G.canTeleport = false
end;
_G.inputBeganConnection = nil;
_G.childAddedConnection = nil; 

_G.keyForSpam = "N"; --Change key to your liking (optional)
_G.keyForEsp = "V"; -- Change key to your liking (optional)
_G.trinketKey = "P" -- Change key to your liking (optional)

_G.cooldown = .45 

local bindable = game:GetService("CoreGui"):FindFirstChild("teleporter") or Instance.new("BindableFunction") bindable.Name = "teleporter" bindable.Parent = game:GetService("CoreGui")

if _G.isLoaded == nil then --load check cuz of anti teleport 
	_G.isLoaded = false 

	delay(2, function()
		_G.isLoaded = true
	end)    
end

local function spamBreathing()
	replicatedStorage.Remotes.Async:FireServer("Character", "Breath", true)
end;
local function haltBreathing()
	replicatedStorage.Remotes.Async:FireServer("Character", "Breath", false)
end;

local function createEspConnection()
	_G.childAddedConnection = workspace.ChildAdded:Connect(function(child)
		if child:FindFirstChild("Humanoid") and child:FindFirstChild("Head") then 
			if child:FindFirstChild("MouseHit") == nil then
				createEsp(child)
			end 
		end 
	end)
end 

local function notify(title, message, duration)
	game.StarterGui:SetCore("SendNotification", {
		Title = title, 
		Text = message, 
		Duration = duration
	});
end;

local function createEsp(mob)
	local key = mob.Name.."Key"

	if mob then 
		local espFolder = Instance.new("Folder")
		espFolder.Name = key
		espFolder.Parent = coreGui

		local BillboardGui = Instance.new("BillboardGui")
		local TextLabel = Instance.new("TextLabel")

		BillboardGui.Adornee = mob.Head
		BillboardGui.Name = mob.Name
		BillboardGui.Size = UDim2.new(0, 100, 0, 150)
		BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.Parent = espFolder

		TextLabel.BackgroundTransparency = 1
		TextLabel.Position = UDim2.new(0, 0, 0, -50)
		TextLabel.Size = UDim2.new(0, 100, 0, 100)
		TextLabel.Font = Enum.Font.SourceSansSemibold
		TextLabel.TextSize = 20
		TextLabel.TextColor3 = Color3.new(1, 1, 1)
		TextLabel.TextStrokeTransparency = 0
		TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
		TextLabel.Text = 'Name: '..mob.Name
		TextLabel.ZIndex = 10
		TextLabel.Parent = BillboardGui

	end 
end

bindable.OnInvoke = function()
	if _G.canTeleport == false then 
		_G.canTeleport = true
		game:GetService("ReplicatedStorage").Remotes.Sync:InvokeServer("Player", "SpawnCharacter")

		delay(8, function()
			_G.canTeleport = false
		end)

		return wait(2.5)
	else 
		return wait(1.25)
	end
end

local connection = nil 
local disableNoclip = false 

local function farmTrinkets() -- slower than normal cuz of anti 
	if _G.isLoaded == false then return end 

	if connection == nil then
		disableNoclip = false 
		print("Yep boy ")
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			localPlayer.Character.Humanoid:ChangeState(11)

			if disableNoclip then
				connection:Disconnect()
				connection = nil 
			end
		end)
	end 

	for i,v in pairs(workspace:GetChildren()) do
		if _G.trinketToggle == false then return end 
		if v:FindFirstChild("PickableItem") and v:FindFirstChild("Part") then
			bindable:Invoke()

			character.HumanoidRootPart.CFrame = v:FindFirstChild("Part").CFrame

			local count = 0;
			while count < 0.55 do
				count = count + runService.RenderStepped:Wait()
			end  

			game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Interaction",  v:FindFirstChild("Part"))
			wait()
		end
	end
end 

local function removeEsp(mob)
	for _,object in pairs(coreGui:GetChildren()) do 
		if string.find(string.lower(object.Name), "key") then 
			object:Destroy()
		end 
	end 
end 

local isBreathing = false

coroutine.wrap(function()
	while true do
		if breathing.Value >= 95 and _G.check == false then
			isBreathing = false
			haltBreathing()
		elseif _G.check == true and isBreathing == false then
			isBreathing = true 
			spamBreathing()
		end 
		wait(_G.cooldown)
	end
end)();


coroutine.wrap(function()
	while true do 
		for _,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do 
			if v:IsA("BillboardGui") then
				v:Destroy()
			end
		end 
		wait(4)
	end 
end)();

coroutine.wrap(function()
	while true do
		if _G.trinketToggle then 
			pcall(farmTrinkets)
		end 
		wait()
	end
end)()

_G.steppedConnection = runService.Stepped:Connect(function()
	for _, object in next, character:GetChildren() do 
		if table.find(instances, object.Name) or string.lower(object.Name):find("cooldown") or string.lower(object.Name):find("activate") then 
			object:Destroy()
		end 
	end 
end);

_G.inputBeganConnection = inputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end

	if input.KeyCode == Enum.KeyCode[_G.keyForSpam] then
		if _G.check == false then 
			_G.check = true
			notify("Infinite breathing", "Infinite breathing was enabled!", 2.4)
		else 
			_G.check = false
			notify("Infinite breathing", "Infinite breathing was disabled!", 2.4)
		end 

	elseif input.KeyCode == Enum.KeyCode[_G.keyForEsp] then 
		if _G.childAddedConnection == nil then
			createEspConnection()

			local players = {}

			for _,v in pairs(game:GetService("Players"):GetPlayers()) do 
				table.insert(players, v.Name)
			end

			for _, mob in pairs(game.workspace:GetChildren()) do 
				if mob:FindFirstChildOfClass("Humanoid") and mob:FindFirstChild("Head") then
					if not table.find(players, mob.Name) then 
						createEsp(mob)
					end 
				end 
			end
			notify("ESP", "Mobs ESP was Enabled!", 1.5) 
		else 
			_G.childAddedConnection:Disconnect()
			_G.childAddedConnection = nil
			removeEsp()
			notify("ESP", "Mobs ESP was disabled!", 1.5) 
		end
	elseif input.KeyCode == Enum.KeyCode[_G.trinketKey] then
		if _G.trinketToggle == false then 
			_G.trinketToggle = true 
			notify("Trinket farm", "enabled! wait for it to load it will go fast dont worry. Risk of losing items if you leave!", 2.5) 
		else
			_G.trinketToggle = false 
			disableNoclip = true 
			notify("Trinket farm", "disabled!", 1.5) 
		end 
	end 
end);

character.ChildAdded:Connect(function(child)
	if child.Name == "Executing" then 
		local args = {
			[1] = "Katana",
			[2] = "Server"
		}

		game:GetService("ReplicatedStorage").Remotes.Async:FireServer(unpack(args))
	end 
end)

breathing.Changed:Connect(function(newValue)
	if newValue < 100 and newValue > 85 then
		_G.cooldown = .5    
	elseif newValue < 80 then 
		_G.cooldown = 0.005  
	end
end)

--Anti fall damage
local old
old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
	local args = {...}

	local method = getnamecallmethod()

	if method == "FireServer" then 
		if args[2] == "FallDamageServer" then 
			return wait(9e9)
		end 
	end 

	return old(self, ...)
end))

notify("Creator: Legend0#0001", _G.keyForEsp.." to enable mobs esp, ".._G.trinketKey.." to enable trinket farm, ".._G.keyForSpam.." to enable infinite breathing. Infinite cooldown, god mode and more anti debuffs are automatic. Enjoy!", 14)