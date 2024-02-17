local PANEL = {}

function PANEL:Init()
    self:SetPos( 720, 350 ) 
    self:SetSize( 800, 500 ) 
    self:SetTitle( "SITE FUNDS HELP DESK & INQUIRIES" ) 
    self:SetVisible( true ) 
    self:SetDraggable( true ) 
    self:ShowCloseButton( true ) 
    self:MakePopup()
    

    local help = vgui.Create( "DPanel", self )
    help:Dock( FILL )
    help.Paint = function( self, w, h )  
        draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 100 ) ) 
    end 

    local l = vgui.Create("DLabel", help)
    l:SetText("COMMANDS:")
    l:SetTextColor(Color(0,161,255))
    l:SetPos(50,-50)
    l:SetSize(700,250)
    l:SetFont("CombineHUDXL")    
    
    local l1 = vgui.Create("DLabel", help)
    l1:SetText([[/funds - Check the amount of funds the site has.
/addfunds - Adds **1000** funds (ADMIN ONLY)
/removefunds - Removes **ALL** funds (ADMIN ONLY)

Configuration can be done in the Code (e.g - Devs Only)]])

    l1:SetTextColor(Color(0,161,255))
    l1:SetPos(50,50)
    l1:SetSize(500,250)
    l1:SetFont("FundsFontSmall")   

    local l2 = vgui.Create("DLabel", help)
    l2:SetText("UTILITIES:")
    l2:SetTextColor(Color(0,161,255))
    l2:SetPos(50,150)
    l2:SetSize(700,250)
    l2:SetFont("CombineHUDXL")    
    
    local l3 = vgui.Create("DLabel", help)
    l3:SetTextColor(Color(0,161,255))
    l3:SetPos(50,220)
    l3:SetSize(900,250)
    l3:SetFont("FundsFontSmall")   
    l3:SetText([[> Command members and superadmins can use the 'Command Module', this allows them to 
add or subtract funds from the total site funds. 

> Anyone can use the vendor however it subtracts site funds and you can get into trouble
for wasting them.]])
    

end

vgui.Register("HelpDesk", PANEL, "DFrame")