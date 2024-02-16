local PANEL = {}
local ButtonSound = "garrysmod/save_load"..math.random(1,4)..".wav"
local HoverSound = "garrysmod/ui_hover.wav"
local SoundPlayed = false

function PANEL:Init()
    self:SetPos( 720, 350 ) 
    self:SetSize( 400, 100 ) 
    self:SetTitle( "SITE DISPENSARY" ) 
    self:SetVisible( true ) 
    self:SetDraggable( true ) 
    self:ShowCloseButton( true ) 
    self:MakePopup()

    
    local Button = vgui.Create("DButton", self)
    Button:SetText( "Health/Armor" )
    Button:SetTextColor( Color(255,255,255) )
    Button:SetPos( 50, 50 )
    Button:SetSize( 100, 30 )
    Button.Paint = function( self, w, h )
    	draw.RoundedBox( 25, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
    end
    Button.DoClick = function()
        surface.PlaySound(ButtonSound)
        net.Start("GiveHealthStuff")
        net.SendToServer()
    end

    local ButtonWep = vgui.Create("DButton", self)
    ButtonWep:SetText( "Weapons" )
    ButtonWep:SetTextColor( Color(255,255,255) )
    ButtonWep:SetPos( 250, 50 )
    ButtonWep:SetSize( 100, 30 )
    ButtonWep.Paint = function( self, w, h )
    	draw.RoundedBox( 24, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
    end
    ButtonWep.DoClick = function(ply)
        surface.PlaySound(ButtonSound)
        net.Start("GiveWeapons")
        net.SendToServer()
    end
end

vgui.Register("basicFrame", PANEL, "DFrame")

-- both concepts of net and vgui are completely new to me, dont judge :)