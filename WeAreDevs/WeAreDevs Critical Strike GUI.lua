----------------------------------------------------
---  A redistribution of https://wearedevs.net/  ---
----------------------------------------------------

-- Made by the one and only hot beast named icee :)
-- Game: https://www.roblox.com/games/111311599/CRITICAL-STRIKE-v5-7-5

-- Var
local Player            = game:GetService("Players").LocalPlayer;
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local PlayerGui         = Player.PlayerGui;
local setupvalue        = setupvalue or debug.setupvalue;

-- UILib
local Library           = loadstring(game:HttpGet("https://raw.githubusercontent.com/ICEEDev/Utilites/main/uilib.lua"))();
local MainWindow        = Library:CreateWindow("Main");
local CombatFolder      = MainWindow:AddFolder("Combat");
local KillAuraTog, GodModeTog, NocoolTog; -- ik aids but this ui lib bad so /shrug

-- Kill Aura
do
    -- Creation
    CombatFolder:AddToggle({
        text        = "KillAura";
        flag        = nil;
        state       = false;
        callback    = function(state)
            KillAuraTog = state;

            while KillAuraTog do
                for i,v in next, game:GetService("Players"):GetPlayers() do
                    if (v ~= Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).magnitude <= 50 and PlayerGui:FindFirstChild("ClassGui") and getsenv(PlayerGui.ClassGui.Main).pass) then
                        ReplicatedStorage.Remotes.Damage:InvokeServer(getsenv(PlayerGui.ClassGui.Main).pass(), Workspace.RealTime.Value, v.Character, 200);
                    end;
                end;
                wait();
            end;
        end;
    });
end;

-- God Mode
do
    -- Creation
    CombatFolder:AddToggle({
        text        = "GodMode";
        flag        = nil;
        state       = false;
        callback    = function(state)
            GodModeTog = state;

            while GodModeTog do
                if (Player.Character and PlayerGui:FindFirstChild("ClassGui") and getsenv(PlayerGui.ClassGui.Main).pass) then
                    ReplicatedStorage.Remotes.Heal:InvokeServer(getsenv(PlayerGui.ClassGui.Main).pass(), Player.Character, 200, "True");
                end;
                wait();
            end;
        end;
    });
end;

-- No Cooldown
do
    -- Creation
    CombatFolder:AddToggle({
        text        = "NoCooldown";
        flag        = nil;
        state       = false;
        callback    = function(state)
            NocoolTog = state;

            while NocoolTog do
                if (Player.Character and PlayerGui:FindFirstChild("ClassGui") and getsenv(PlayerGui.ClassGui.Main).pass) then
                    local ScriptEnv = getsenv(PlayerGui.ClassGui.Main);

                    setupvalue(ScriptEnv.criticalcoolingdown, 2, 0);
                    setupvalue(ScriptEnv.ability1coolingdown, 2, 0);
                    setupvalue(ScriptEnv.ability2coolingdown, 2, 0);
                    setupvalue(ScriptEnv.attackcoolingdown, 2, 0);
                end;
                wait();
            end;
        end;
    });
end;

-- UI Creations
do
    -- OneShot Kill
    CombatFolder:AddToggle({
        text        = "OneShot";
        flag        = "OneShot";
        state       = false;
    });

    -- NoVoid Dmg
    CombatFolder:AddToggle({
        text        = "NoVoidDamage";
        flag        = "NoVoid";
        state       = false;
    });
end;

-- Hook
do
    -- Creation
    local meta      = debug.getmetatable(game);
    local oldName   = meta.__namecall;
    setreadonly(meta, false);

    meta.__namecall = newcclosure(function(self, ...)
        local args = {...};

        if (Library.flags.OneShot and tostring(self) == "Damage" and args[4] ~= "Void") then
            args[4] = 200;
        elseif (Library.flags.NoVoid and tostring(self) == "Damage" and args[4] == "Void") then
            return; --  kicks when enabled off ( idc tho )
        end;

        return oldName(self, unpack(args));
    end);

    setreadonly(meta, true);
end;

-- Inits Lib
Library:Init();