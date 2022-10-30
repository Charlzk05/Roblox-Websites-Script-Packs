--[[
© 2020 WeAreDevs
A distribution of https://wearedevs.net/scripts
June 13, 2020

Simply inject this script into any game using a Lua injector like JJSploit
then press e while in game to turn gravity on and off. 
]]

if _G.WRDGravitySwitchStarted == nil then
	_G.WRDGravitySwitchStarted = true
	
	--Gets the player's mouse
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()

	--Waits until the player's mouse is found
	repeat wait() until mouse

	--Toggles
	mouse.KeyDown:connect(function(key)
		if key:lower() == "e" then
			if workspace.Gravity > 0 then
				--Turns off gravity
				workspace.Gravity = 0
				game.StarterGui:SetCore("SendNotification", {Title="Zero Gravity"; Text="WeAreDevs.net"; Duration=1;})
			else 
				--Reset to default
				workspace.Gravity = 196.2
				game.StarterGui:SetCore("SendNotification", {Title="Normal Gravity"; Text="WeAreDevs.net"; Duration=1;})
			end
		end
	end)
end

game.StarterGui:SetCore("SendNotification", {Title="WeAreDevs.net"; Text="The Gravity Switch exploit is ready!\nPress \"e\" to toggle"; Duration=5;})