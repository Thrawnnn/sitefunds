include('shared.lua')

SWEP.PrintName = "Site Tablet"
SWEP.Slot = 0
SWEP.SlotPos = 4
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

local WorldModel = ClientsideModel( "models/nirrti/tablet/Tablet_sfm.mdl" )

WorldModel:SetSkin( 1 )
WorldModel:SetNoDraw( true )

--RT Related Variables
local TEX_SIZE_X = 940
local TEX_SIZE_Y = 720
local RTTexture = GetRenderTarget( "OfficeTabletScreen", TEX_SIZE_X, TEX_SIZE_Y )
local matScreen = Material( "models/lt_c/tablet/screen2" )

--App Related Variables
local curAnnounce = "No Active Announcements"
local curTemp = "----"
local mDown = false
local mCooldown = false
local homeMat = Material( "icon16/house.png" )
homeMat:SetInt( "$flags", bit.bor( homeMat:GetInt( "$flags" ), 32768 ) )
local addMat = Material( "icon16/add.png" )
addMat:SetInt( "$flags", bit.bor( addMat:GetInt( "$flags" ), 32768 ) )
local aLMat = Material( "icon16/arrow_left.png" )
aLMat:SetInt( "$flags", bit.bor( aLMat:GetInt( "$flags" ), 32768 ) )
local aRMat = Material( "icon16/arrow_right.png" )
aRMat:SetInt( "$flags", bit.bor( aRMat:GetInt( "$flags" ), 32768 ) )
local cancelMat = Material( "icon16/bin.png" )
cancelMat:SetInt( "$flags", bit.bor( cancelMat:GetInt( "$flags" ), 32768 ) )
local TramOneX = -5.376776
local TramOneY = -3461.445557
local TramTwoX = -6.239170
local TramTwoY = 12923.148438
local mapMainMat = Material( "pprpr_custom/map/map_main.png" )
mapMainMat:SetInt( "$flags", bit.bor( mapMainMat:GetInt( "$flags" ), 32768 ) )
local mapGarageMat = Material( "pprpr_custom/map/map_garage.png" )
mapGarageMat:SetInt( "$flags", bit.bor( mapGarageMat:GetInt( "$flags" ), 32768 ) )
local mapSpaceOneMat = Material( "pprpr_custom/map/map_space_first.png" )
mapSpaceOneMat:SetInt( "$flags", bit.bor( mapSpaceOneMat:GetInt( "$flags" ), 32768 ) )
local mapSpaceTwoMat = Material( "pprpr_custom/map/map_space_second.png" )
mapSpaceTwoMat:SetInt( "$flags", bit.bor( mapSpaceTwoMat:GetInt( "$flags" ), 32768 ) )
local mapUnderMat = Material( "pprpr_custom/map/map_underground.png" )
mapUnderMat:SetInt( "$flags", bit.bor( mapUnderMat:GetInt( "$flags" ), 32768 ) )
local mapWareMat = Material( "pprpr_custom/map/map_warehouse.png" )
mapWareMat:SetInt( "$flags", bit.bor( mapWareMat:GetInt( "$flags" ), 32768 ) )
local MapsCurPos = Vector(0,0,0)
local prevLoc = 0
local curBalance = 0
local curDeptBal = 0
local curDeptRates = 0
local curDeptMins = 0
local curTycInfo = 0
local curTycCats = {}
local curTycStat = 0
local curStoreInfo = 0
local curStoreCats = {}





function SWEP:DrawWorldModel()
	local _Owner = self:GetOwner()

	if ( IsValid( _Owner ) ) then
		-- Specify a good position
		local offsetVec = Vector(6, -4.699, 0)
		local offsetAng = Angle(0, 118.052, -100.04)

		local boneid = _Owner:LookupBone( "ValveBiped.Bip01_R_Hand" ) -- Right Hand
		if !boneid then return end

		local matrix = _Owner:GetBoneMatrix( boneid )
		if !matrix then return end

		local newPos, newAng = LocalToWorld( offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles() )

		WorldModel:SetPos( newPos )
		WorldModel:SetAngles( newAng )
		WorldModel:SetModelScale(0.75)

		WorldModel:SetupBones()
	else
		WorldModel:SetPos( self:GetPos() )
		WorldModel:SetAngles( self:GetAngles() )
	end

	WorldModel:DrawModel()
end

local function ReqInfo(num)
	net.Start("PPRP_TABLET_INFOUPDATE")
		net.WriteInt(num, 4)
	net.SendToServer()
end

function SWEP:Initialize()
	self.NetTabletOpen = false
	self.TabletOpen = false
	self.TabletStarted = false
	self.PullDown = CurTime()
	self.CursorPos = {x = 457, y = 260}
	mDown = false
	mCooldown = false
	self.curApp = 1
	prevLoc = 0
	MapsCurPos = LocalPlayer():GetPos()
	if timer.Exists( "PPRPR_TAB_CLIENT_MAPUP" ) then
		timer.Remove( "PPRPR_TAB_CLIENT_MAPUP" )
	end
	timer.Create( "PPRPR_TAB_CLIENT_MAPUP", 3, 0, function()
		MapsCurPos = LocalPlayer():GetPos()
	end)
end

function SWEP:PrimaryAttack() end
function SWEP:SecondaryAttack() end

function SWEP:Think()
	if(not self.TabletOpen) then
		if(self.NetTabletOpen) then
			if self.PullDown <= CurTime() then
				self:SetHoldType( "slam" )
				if(not self.TabletStarted) then
					self:EmitSound(self.startupSound)
					self.PullDown = CurTime() + 1.25
					timer.Simple( 1, function() 
						self.TabletStarted = true 
						self.TabletOpen = true 
					end )
					ReqInfo(1)
					ReqInfo(2)
					ReqInfo(3)
					net.Start("PPRP_FFUNDS_UPDATE")
					net.SendToServer()
					net.Start("PPRP_TTYCOON_UPDATE")
					net.SendToServer()
					net.Start("PPRP_TALERTS_UPDATE")
					net.SendToServer()
					net.Start("PPRP_TSTORE_UPDATE")
					net.SendToServer()
					net.Start("PPRP_INTERCOM_UPDATE")
					net.SendToServer()
				else
					self.PullDown = CurTime() + 0.5
					timer.Simple( 0.12, function() 
						self.TabletOpen = true 
					end )
				end
			end
		end
	else
		if(not self.NetTabletOpen) then
			if self.PullDown <= CurTime() then
				self.TabletOpen = false
				self:SetHoldType( "slam" )
				self.PullDown = CurTime() + 0.5
			end
		else
			--whatever needs to happen while tablet out
		end
	end
	
	if input.IsMouseDown( MOUSE_LEFT ) && mDown == false && mCooldown == false && self.TabletOpen then
		mDown = true
		timer.Create("PPRPR_TABLET_COOLDOWN_CLICK",0.025,1,function()
			if input.IsMouseDown( MOUSE_LEFT ) && mDown == true && mCooldown == false then
				mDown = false
				mCooldown = true
			end
		end)
	elseif not input.IsMouseDown( MOUSE_LEFT ) && mCooldown == true then 
		mCooldown = false
	end
end





-- Screen & App Shared Functionality 
local TEX_SIZE_X_ADJ = TEX_SIZE_X-13-13
local TEX_OFF_X_ADJ = 13
local TEX_SIZE_Y_ADJ = TEX_SIZE_Y-99-101
local TEX_OFF_Y_ADJ = 101

local TEX_SIZE_APP_X_ADJ = TEX_SIZE_X_ADJ
local TEX_OFF_APP_X_ADJ = TEX_OFF_X_ADJ
local TEX_SIZE_APP_Y_ADJ = TEX_SIZE_Y_ADJ-32
local TEX_OFF_APP_Y_ADJ = TEX_OFF_Y_ADJ+32

local function DrawScrollingText( text, y, texwide )
	local w, h = surface.GetTextSize( text )
	w = w + 64
	y = y - h / 2
	local x = RealTime() * 250 % w * -1

	while ( x < texwide ) do
		surface.SetTextColor( 0, 0, 0, 255 )
		surface.SetTextPos( x + 3, y + 3 )
		surface.DrawText( text )

		surface.SetTextColor( 255, 255, 255, 255 )
		surface.SetTextPos( x, y )
		surface.DrawText( text )
		
		x = x + w
	end
end

-- Screen Functionality

function SWEP:RenderScreen()
	if(self.TabletStarted) then
		matScreen:SetTexture( "$basetexture", RTTexture )
		render.PushRenderTarget( RTTexture )
		
		--adjusted sizes and offsets because screen2 textures runs outside of visible space
		-- final size 914 x 520
		
		cam.Start2D()

			--base background
			surface.SetDrawColor( 0, 0, 0, 255 )
			surface.DrawRect( TEX_OFF_X_ADJ, TEX_OFF_Y_ADJ, TEX_SIZE_X_ADJ, TEX_SIZE_Y_ADJ )
			
			--status bar over everything, app after
			surface.SetTextColor( 225, 225, 225, 255 )
			surface.SetTextPos( 300, 200 )
			surface.SetFont( "SCPFundsFontTiny" )
			DrawScrollingText( "COMPLEXITY NETWORKS: SCPRP", TEX_OFF_Y_ADJ+15, TEX_SIZE_X_ADJ )
			surface.SetDrawColor( 0, 0, 0, 255 )
			surface.DrawRect( TEX_OFF_X_ADJ + TEX_SIZE_X_ADJ-200, TEX_OFF_Y_ADJ, 200, 30 )

			local DispX,DispY = self.GetCursorPos()
			if DispX > TEX_OFF_X_ADJ && DispX < TEX_OFF_X_ADJ+30 && DispY > TEX_OFF_Y_ADJ && DispY < TEX_OFF_Y_ADJ + 30 then
				if (self.WasMousePressed( MOUSE_LEFT )) then
					surface.PlaySound( "buttons/button15.wav" )
					self.curApp = 1
				else
					surface.SetDrawColor( 30, 30, 30, 255 )
				end
			end
			surface.DrawRect( TEX_OFF_X_ADJ, TEX_OFF_Y_ADJ, 30, 30 )
			surface.SetDrawColor( 200, 200, 200, 255 )
			surface.SetMaterial(homeMat)
			surface.DrawTexturedRect(TEX_OFF_X_ADJ+7, TEX_OFF_Y_ADJ+7, 16, 16) 
			
			surface.SetTextColor( 225, 225, 225, 255 )
			surface.SetDrawColor( 0, 0, 0, 255 )
			surface.DrawRect( TEX_OFF_X_ADJ+30, TEX_OFF_Y_ADJ, 170, 30 )
			surface.SetTextPos( TEX_OFF_X_ADJ+35, TEX_OFF_Y_ADJ )
			
			
			surface.SetDrawColor( 155, 155, 155, 255 )
			--temp x status separation bar
			surface.DrawRect( TEX_OFF_X_ADJ+TEX_SIZE_X_ADJ-200, TEX_OFF_Y_ADJ, 3, 30 )
			surface.DrawRect( TEX_OFF_X_ADJ+30, TEX_OFF_Y_ADJ, 3, 30 )
			surface.DrawRect( TEX_OFF_X_ADJ+200, TEX_OFF_Y_ADJ, 3, 200 )
			--status bar bottom divider
			surface.DrawLine(TEX_OFF_X_ADJ, TEX_OFF_Y_ADJ+30, TEX_OFF_X_ADJ+TEX_SIZE_X_ADJ, TEX_OFF_Y_ADJ+30)
			surface.DrawRect( TEX_OFF_X_ADJ, TEX_OFF_Y_ADJ+30, TEX_SIZE_X_ADJ, 2 )
			
			--Cursor after everything
			surface.SetDrawColor( 220, 220, 220, 255 )
			local DispX,DispY = self.GetCursorPos() -- raw function works for displaying cursor
			surface.DrawRect( DispX-5, DispY-5, 10, 10 )

		cam.End2D()
		render.PopRenderTarget()
	else
		matScreen:SetTexture( "$basetexture", RTTexture )
		render.PushRenderTarget( RTTexture )
		
		cam.Start2D()

			--base background
			surface.SetDrawColor( 0, 0, 0, 255 )
			surface.DrawRect( TEX_OFF_X_ADJ, TEX_OFF_Y_ADJ, TEX_SIZE_X_ADJ, TEX_SIZE_Y_ADJ )
			
		cam.End2D()
		render.PopRenderTarget()
	end
end