----------------------------------------------------
---  A redistribution of https://wearedevs.net/  ---
----------------------------------------------------

----------------------------------------------------
---    Map Radar ( made by sexy beast icee )     ---
----------------------------------------------------

--game: https://www.roblox.com/games/863266079/Apocalypse-Rising-2-Alpha

-- Vars
local Players               = game:GetService("Players");
local Player                = Players.LocalPlayer;
local Framework 			= game:GetService("ReplicatedFirst"):WaitForChild("Framework");
local FrameworkRequire 		= Framework and require(Framework);
local Resources             = FrameworkRequire.require("Libraries", "Resources");
local Interface             = FrameworkRequire.require("Libraries", "Interface");
local MapGUI                = Interface:GetGui("Map");
local Marker                = Resources:FindFrom(MapGUI, "ClipBin.DragBin.LocalMarker");
local MarkerClone;

-- Apoc2 Function
local function CalculateLocation(p1)
    local v21 	= Vector3.new(-6789.4, 100, -6208.31);
    local u1 	= CFrame.new(v21, v21 + Vector3.new(0, 0, 1));
    local u2 	= v21 - Vector3.new(7956.2, 100, 7111.69);
    local v25 	= u1:pointToObjectSpace(p1) / u2;
    
    return Vector2.new(v25.X, v25.Z);
end;

-- Main Loop
while wait() do
    for i,v in next, Players:GetPlayers() do
        if (v.Name ~= Player.Name and v.Character and v.Character.PrimaryPart) then
            local v34 = CalculateLocation(v.Character.PrimaryPart.Position);

            if (not Marker.Parent:FindFirstChild(v.Name)) then
                -- clones marker
                MarkerClone                 = Marker:Clone();

                MarkerClone.Parent          = Marker.Parent;
                MarkerClone.Name            = (v.Name);
                MarkerClone.Position        = UDim2.fromScale(v34.X, v34.Y);
                
                if (MarkerClone.MarkerCenter:FindFirstChild("Tooltip")) then
                    -- makes it look sexy
                    MarkerClone.MarkerCenter.Tooltip.TextLabel.Text = v.Name;
                    MarkerClone.MarkerCenter.Tooltip.Visible        = true;
                end;
            elseif (MarkerClone) then
                -- updates position
                MarkerClone.Position = UDim2.fromScale(v34.X, v34.Y);
            end;
        end;
    end;
end;