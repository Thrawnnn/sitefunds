local PANEL = {}

function PANEL:Init()
    self:SetPos( 720, 350 ) 
    self:SetSize( 800, 500 ) 
    self:SetTitle( "FUNDS HELP" ) 
    self:SetVisible( true ) 
    self:SetDraggable( true ) 
    self:ShowCloseButton( true ) 
    self:MakePopup()

    local lbl = vgui.Create("DLabel", panel1)
    lbl:SetText("FUNDS HELP DESK")
    lbl:SetTextColor(Color(0,161,255))
    lbl:SetPos(50,-50)
    lbl:SetSize(400,250)
    lbl:SetFont("CombineHUDXL")

end

vgui.Register("help", PANEL, "DFrame")

-- both concepts of net and vgui are completely new to me, dont judge :)