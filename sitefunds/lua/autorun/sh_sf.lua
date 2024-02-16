
if SERVER then
	AddCSLuaFile("skins/appy.lua")
	AddCSLuaFile()

	resource.AddSingleFile("materials/gwenskin/lightred.png")
else
	include("skins/appy.lua")

	hook.Add("ForceDermaSkin", "skinforcehook", function()
		return "lightred"
	end)
end
