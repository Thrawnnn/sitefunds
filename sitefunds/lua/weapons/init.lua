AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" ) 
include( "shared.lua" ) 

util.AddNetworkString( "PPRP_TABLET_CHANGEOPENSTATE" )
util.AddNetworkString( "PPRP_TABLET_INFOUPDATE" )

local curAnnounce = "No Active Announcements"

PPRP = PPRP || {}
PPRP.Internal = PPRP.Internal || {}
PPRP.Tablet = PPRP.Tablet || {}

function SWEP:Initialize()
	self:SendWeaponAnim(ACT_VM_PULLBACK)
	self.TabletOpen = false
	self.PullDown = CurTime()
	self.TabletStarted = false
end

function SWEP:Deploy()
	self:SendWeaponAnim(ACT_VM_PULLBACK)
end

function SWEP:PrimaryAttack() end

function SWEP:SecondaryAttack()
	if(not self.TabletOpen) then
		if self.PullDown <= CurTime() then
			self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
			self.TabletOpen = true
			if not self.TabletStarted then
				self.PullDown = CurTime() + 1.25
				self.TabletStarted = true
			else
				self.PullDown = CurTime() + 0.5
			end
			net.Start("PPRP_TABLET_CHANGEOPENSTATE")
				net.WriteBool(self.TabletOpen)
			net.Send( self:GetOwner() )
		end
	else
		if self.PullDown <= CurTime() then
			self:SendWeaponAnim(ACT_VM_PULLBACK)
			self.TabletOpen = false
			self.PullDown = CurTime() + 0.5
			net.Start("PPRP_TABLET_CHANGEOPENSTATE")
				net.WriteBool(self.TabletOpen)
			net.Send( self:GetOwner() )
		end
	end
end

hook.Add("PlayerSwitchWeapon","PPRP_TABLET_SERV_HOLSTERCHECK",function(ply, oldWeapon, newWeapon)
	if IsValid(oldWeapon) then
		if oldWeapon.SendWeaponAnim ~= nil then
			oldWeapon:SendWeaponAnim(ACT_VM_PULLBACK)
		end
		oldWeapon.TabletOpen = false
		oldWeapon.PullDown = CurTime() + 0.5
		net.Start("PPRP_TABLET_CHANGEOPENSTATE")
			net.WriteBool(oldWeapon.TabletOpen)
		net.Send( oldWeapon:GetOwner() )
	end
end)

function PPRP.Tablet.GetCurrAn()
	return curAnnounce
end

function PPRP.Tablet.BroadcastAn(newAn)
	curAnnounce = newAn
	net.Start("PPRP_TABLET_INFOUPDATE")
		net.WriteInt(2, 4)
		net.WriteString(curAnnounce)
	net.Broadcast( )
end

timer.Create("PPRP_TABLET_SERV_UPDATETEMP", 30, 0, function()
	if PPRP.Internal.CurTemp then
		net.Start("PPRP_TABLET_INFOUPDATE")
			net.WriteInt(1, 4)
			net.WriteString(tostring(PPRP.Internal.CurTemp))
		net.Broadcast( )
	end
end)

local function updateTram()
	net.Start("PPRP_TABLET_INFOUPDATE")
		net.WriteInt(3, 4)
		local tram = ents.FindByName("Tram")[1]:GetPos()
		local tramtwo = ents.FindByName("Tram2")[1]:GetPos()
		net.WriteDouble(tram.x)
		net.WriteDouble(tram.y)
		net.WriteDouble(tramtwo.x)
		net.WriteDouble(tramtwo.y)
	net.Broadcast( )
end

timer.Create("PPRP_TABLET_SERV_UPDATETRAM", 5, 0, function()
	updateTram()
end)

net.Receive( "PPRP_TABLET_INFOUPDATE", function( len, ply )
	local UType = net.ReadInt(4)
	if UType == 1 then
		net.Start("PPRP_TABLET_INFOUPDATE")
			net.WriteInt(1, 4)
			net.WriteString(tostring(PPRP.Internal.CurTemp))
		net.Send( ply )
	elseif UType == 2 then
		net.Start("PPRP_TABLET_INFOUPDATE")
			net.WriteInt(2, 4)
			net.WriteString(curAnnounce)
		net.Send( ply )
	elseif UType == 3 then
		net.Start("PPRP_TABLET_INFOUPDATE")
			net.WriteInt(3, 4)
			local tram = ents.FindByName("Tram")[1]:GetPos()
			local tramtwo = ents.FindByName("Tram2")[1]:GetPos()
			net.WriteDouble(tram.x)
			net.WriteDouble(tram.y)
			net.WriteDouble(tramtwo.x)
			net.WriteDouble(tramtwo.y)
		net.Send( ply )
	end
end )

hook.Add("PostCleanupMap","PPRP_TABLET_SERV_POSTCLEANIP",function()
	PPRP.Tablet.BroadcastAn("No Active Announcements")
	updateTram()
end)