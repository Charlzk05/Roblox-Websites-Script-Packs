--[[
A distribution of https://wearedevs.net/scripts
Last updated August 2, 2021

Description: Toggles the time of day between night and morning.

Instruction: Inject this script into any game using a Lua executor like JJSploit. 
]]

lighting = game:GetService("Lighting")
if lighting.TimeOfDay == "00:00:00" then
    lighting.TimeOfDay = 11
else 
    lighting.TimeOfDay = 24
end