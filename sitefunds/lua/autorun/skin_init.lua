if SERVER then
    AddCSLuaFile("skins/midnight_sea.lua")
else
    include("skins/midnight_sea.lua")
    hook.Add("ForceDermaSkin", "MidnightSea", function()
		return "midnight_sea"
	end)
end
