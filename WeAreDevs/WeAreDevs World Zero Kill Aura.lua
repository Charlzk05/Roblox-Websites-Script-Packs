----------------------------------------------------
---  A redistribution of https://wearedevs.net/  ---
----------------------------------------------------

-- Made by the one and only sexy beast named icee :)
-- Game: https://www.roblox.com/games/2727067538/World-Zero

-- Vars
local Player            = game:GetService("Players").LocalPlayer;
local Combat 	        = require(game:GetService("ReplicatedStorage").Shared.Combat);
local CharProfileCheck 	= game:GetService("ReplicatedStorage"):FindFirstChild("Profiles"):FindFirstChild(Player.Name);
local ClassGUI 			= CharProfileCheck and game:GetService("ReplicatedStorage").Profiles[Player.Name].Class;
local GetEvent          = Combat and Combat:GetAttackEvent();
local MaxDistance       = 50; --> Change to your liking
local Speed             = 0.3; --> Change to liking

-- Support Stuff
if (not getconnections) then return Player:Kick("no getconnections support bye."); end;

-- Only supporting 3 bc why not? ( add more if u want )
local Classes = {
    ["Swordmaster"]     = {"Swordmaster1", "Swordmaster2", "Swordmaster3", "Swordmaster4", "Swordmaster5", "Swordmaster6", "CrescentStrike1", "CrescentStrike2", "CrescentStrike3", "Leap"};
    ["Mage"]            = {"Mage1", "ArcaneBlastAOE", "ArcaneBlast", "ArcaneWave1", "ArcaneWave2", "ArcaneWave3", "ArcaneWave4", "ArcaneWave5", "ArcaneWave6", "ArcaneWave7", "ArcaneWave8", "ArcaneWave9"};
    ["Defender"]        = {"Defender1", "Defender2", "Defender3", "Defender4", "Defender5", "Groundbreaker", "Spin1", "Spin2", "Spin3", "Spin4", "Spin5"};
    ["DualWielder"]     = {"DualWield1", "DualWield2", "DualWield3", "DualWield4", "DualWield5", "DualWield6", "DualWield7", "DualWield8", "DualWield9", "DualWield10", "DashStrike", "CrossSlash1", "CrossSlash2", "CrossSlash3", "CrossSlash4"};
    ["Guardian"]        = {"Guardian1", "Guardian2", "Guardian3", "Guardian4", "SlashFury1", "SlashFury2", "SlashFury3", "SlashFury4", "SlashFury5", "SlashFury6", "SlashFury7", "SlashFury8", "SlashFury9", "SlashFury10", "SlashFury11", "SlashFury12", "SlashFury13", "RockSpikes1", "RockSpikes2", "RockSpikes3"};
    ["IcefireMage"]     = {"IcefireMage1", "IcySpikes1", "IcySpikes2", "IcySpikes3", "IcySpikes4", "IcefireMageFireballBlast", "IcefireMageFireball", "LightningStrike1", "LightningStrike2", "LightningStrike3", "LightningStrike4", "LightningStrike5", "IcefireMageUltimateFrost", "IcefireMageUltimateMeteor1"};
    ["Berserker"]       = {"Berserker1", "Berserker2", "Berserker3", "Berserker4", "Berserker5", "Berserker6", "AggroSlam", "GigaSpin1", "GigaSpin2", "GigaSpin3", "GigaSpin4", "GigaSpin5", "GigaSpin6", "GigaSpin7", "GigaSpin8", "Fissure1", "Fissure2", "FissureErupt1", "FissureErupt2", "FissureErupt3", "FissureErupt4", "FissureErupt5"};
    ["Paladin"]         = {"Paladin1", "Paladin2", "Paladin3", "Paladin4", "LightThrust1", "LightThrust2", "LightPaladin1", "LightPaladin2"};
    ["MageOfLight"]     = {"MageOfLight", "MageOfLightBlast"};
    ["Demon"]           = {"Demon1", "Demon4", "Demon7", "Demon10", "Demon13", "Demon16", "Demon19", "Demon22", "Demon25", "DemonDPS1", "DemonDPS2", "DemonDPS3", "DemonDPS4", "DemonDPS5", "DemonDPS6", "DemonDPS7", "DemonDPS8", "DemonDPS9", "ScytheThrowDPS1", "ScytheThrowDPS2", "ScytheThrowDPS3", "DemonLifeStealDPS", "DemonSoulDPS1", "DemonSoulDPS2", "DemonSoulDPS3"};
};

-- Gets Close Mob
local function getNearestMob()
    if (not game:GetService("Workspace"):FindFirstChild("Mobs")) then return; end;

    local dis, mob = math.huge;

    for i,v in next, Workspace.Mobs:GetChildren() do 
        if (Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and v.PrimaryPart and v:FindFirstChild("HealthProperties") and v.HealthProperties.Health.Value > 0 and (v.PrimaryPart.Position - Player.Character.HumanoidRootPart.Position).magnitude <= MaxDistance) then
            mob = v;
        end;
    end;

    return mob;
end;

-- Bypass
if (GetEvent) then
    for i,v in next, getconnections(GetEvent.OnClientEvent) do
        v:Disable();
    end;
end;

-- Main Loop
while wait(Speed) do
    local mob = getNearestMob();

    if (mob and Player.Character and Player.Character.PrimaryPart) then
        for i,v in next, Classes[ClassGUI.Value] do
            Combat.AttackTargets({"Hi Wally!"}, {mob}, {Player.Character.PrimaryPart.Position}, v);
            game:GetService("RunService").Heartbeat:wait();
        end;
    end;
end;
