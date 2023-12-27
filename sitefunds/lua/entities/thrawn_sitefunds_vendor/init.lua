AddCSLuaFile("cl_init.lua") 
AddCSLuaFile("shared.lua") 
AddCSLuaFile("autorun/sv_sitefunds.lua")
AddCSLuaFile("autorun/sh_functions.lua")

include("shared.lua")
include("autorun/sv_sitefunds.lua")
include("autorun/sh_functions.lua")

function ENT:Initialize()
    self:SetModel("models/props_lab/reciever_cart.mdl")
    self:PhysicsInit(SOLID_VPHYSICS) 
    self:SetMoveType(MOVETYPE_VPHYSICS) 
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
       phys:Wake()
    end
end

function ENT:Use(c,a)
    funding = sitefunding()
    
    if funding < 4999 and canBuy() then
        c:Give("tfa_ins2_fn")
    elseif funding >= 5000 and funding <= 5999 and canBuy() then
        c:Give("tfa_eft_mpx")
        c:Give("tfa_ins2_usp_match")
        c:SetHealth( 110 )
        c:SetArmor( 25 )
    elseif funding > 5999 and canBuy() then
        c:Give("tfa_ins2_m4a1")
        c:Give("tfa_ins2_deagle")
        c:SetHealth( 125 )
        c:SetArmor( 50 )
    end 
end
