AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua") 
AddCSLuaFile("autorun/sv_sitefunds.lua")
AddCSLuaFile("autorun/sh_functions.lua")

include("shared.lua")
include("autorun/sv_sitefunds.lua")

function ENT:Initialize()
    self:SetModel(config.vendormodel)
    self:PhysicsInit(SOLID_VPHYSICS) 
    self:SetMoveType(MOVETYPE_VPHYSICS) 
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
       phys:Wake()
    end
end

function ENT:Use(ply,a)
    funding = sitefunding()
    
    net.Start("OpenVendor")
	net.Send(a)

end
