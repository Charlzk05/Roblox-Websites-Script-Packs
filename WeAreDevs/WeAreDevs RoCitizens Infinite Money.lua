----------------------------------------------------
---  A redistribution of https://wearedevs.net/  ---
----------------------------------------------------

-- Made by: Mein Fraulein
-- Game: https://www.roblox.com/games/137877687/RoCitizens-Summer

while wait() do
workspace.CommunicationRelays.Transaction.CollectBonus:InvokeServer(tick() - workspace.CommunicationRelays.DataManagement.GetOSTime:InvokeServer())
workspace.CommunicationRelays.Transaction.CollectBonus:InvokeServer(tick(), workspace.CommunicationRelays.DataManagement.GetOSTime:InvokeServer())
end