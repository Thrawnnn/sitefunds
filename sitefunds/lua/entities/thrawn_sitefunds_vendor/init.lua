AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua") 
AddCSLuaFile("autorun/sv_sitefunds.lua")
AddCSLuaFile("autorun/sh_functions.lua")

include("shared.lua")
include("autorun/sv_sitefunds.lua")

function ENT:Initialize()
    self:SetModel("models/props_lab/reciever_cart.mdl")
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

--[[
    if funding < 4999 then
        return
    elseif funding >= 5000 and funding <= 5999 then
        ply:Give("plutonic_usp")
        ply:Give("plutonic_mcx")
        ply:SetHealth( 110 )
        ply:SetArmor( 25 )
        funding = funding - funding  -- Add setarmor and stuff too so there's more incentive, also change the goddamn weapon to a config.
    elseif funding > 5999 then
        ply:Give("plutonic_zoomar2")
        ply:Give("plutonic_357")
        ply:SetHealth( 125 )
        ply:SetArmor( 50 )
        funding = funding - funding 
    end
]]--

end
