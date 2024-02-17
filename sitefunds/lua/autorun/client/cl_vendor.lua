local PANEL = {}

function PANEL:Init()
    self:SetPos( 720, 350 ) 
    self:SetSize( 800, 500 ) 
    self:SetTitle( "SITE FUNDS REQUISITIONS" ) 
    self:SetVisible( true ) 
    self:SetDraggable( true ) 
    self:ShowCloseButton( true ) 
    self:MakePopup()
    
    self.sheet = vgui.Create( "DColumnSheet", self )
    self.sheet:Dock( FILL )

    local panel1 = vgui.Create( "DPanel", self.sheet )
    panel1:Dock( FILL )
    panel1.Paint = function( self, w, h )  
        draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 100 ) ) 
    end 
    self.sheet:AddSheet( "HME PG", panel1 )

    local lbl = vgui.Create("DLabel", panel1)
    lbl:SetText("SFUND REQUISITIONS SYS")
    lbl:SetTextColor(Color(0,161,255))
    lbl:SetPos(50,-50)
    lbl:SetSize(400,250)
    lbl:SetFont("CombineHUDXL")

    local fnd = vgui.Create("DLabel", panel1)
    fnd:SetText("SELECT A TAB TO BEGIN..")
    fnd:SetTextColor(Color(0,161,255))
    fnd:SetPos(50,0)
    fnd:SetSize(500,250)
    fnd:SetFont("CombineHUDLarge")    


-- =======================================================================================================
    self.panel2 = vgui.Create( "DPanel", self.sheet )
    self.panel2:Dock( FILL )
    self.panel2.Paint = function( self, w, h )
        draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 100 ) )
    end 
    self.sheet:AddSheet( "HP/ARMR", self.panel2 )

    local arm1 = vgui.Create("DModelPanel", self.panel2)
	arm1:SetSize(400, 400)
	arm1:SetPos(25, 25)
	
	arm1:SetModel(Model("models/Items/battery.mdl"))
	arm1:SetFOV(60)
	arm1.Entity:SetPos(Vector(26,0,55))

    local clr = Color(0,255,0,100)
    local txt = "PURCHASE"
    local arm1b = vgui.Create("DButton", arm1)

    arm1b:SetSize(110, 110)
    arm1b:SetPos(25,25)
    arm1b:SetFont("CombineHUDMed")
    arm1b:SetText(txt)
    arm1b:SetTextColor(clr)
    arm1b.Paint = function( self, w, h )
        surface.SetDrawColor(clr)
        surface.DrawOutlinedRect( 0, 0, w + 1, h + 1, 5 )
    end

    arm1b.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")  
        net.Start("GiveArmorStuffMinor")
        net.SendToServer()
        self:Remove()
    end

    local arm1lb = vgui.Create("DLabel",self.panel2)
    arm1lb:SetPos(25,150)
    arm1lb:SetSize(200,50)
    arm1lb:SetFont("CombineHUDMed")
    arm1lb:SetText("LIGHTWEIGHT BODY ARMOR")
    arm1lb:SetTextColor(Color(0,161,255))

    --===================

    local arm2 = vgui.Create("DModelPanel", self.panel2)
	arm2:SetSize(400, 400)
	arm2:SetPos(250, 25)
	
	arm2:SetModel(Model("models/Items/battery.mdl"))
	arm2:SetFOV(60)
	arm2.Entity:SetPos(Vector(26,0,55))

    local clr = Color(0,255,0,100)
    local txt = "PURCHASE"
    local arm2b = vgui.Create("DButton", arm2)

    arm2b:SetSize(110, 110)
    arm2b:SetPos(25,25)
    arm2b:SetFont("CombineHUDMed")
    arm2b:SetText(txt)
    arm2b:SetTextColor(clr)
    arm2b.Paint = function( self, w, h )
        surface.SetDrawColor(clr)
        surface.DrawOutlinedRect( 0, 0, w + 1, h + 1, 5 )
    end

    arm2b.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")  
        net.Start("GiveArmorStuffMajor")
        net.SendToServer()
        self:Remove()
    end

    local arm2lb = vgui.Create("DLabel",self.panel2)
    arm2lb:SetPos(270,150)
    arm2lb:SetSize(200,50)
    arm2lb:SetFont("CombineHUDMed")
    arm2lb:SetText("HEAVY BODY ARMOR")
    arm2lb:SetTextColor(Color(0,161,255))

    --========= Health
    local health = vgui.Create("DModelPanel", self.panel2)

	health:SetSize(400, 400)
	health:SetPos(40, 250)
	
	health:SetModel(Model("models/healthvial.mdl"))
	health:SetFOV(60)
	health.Entity:SetPos(Vector(26,0,55))

    local health1 = vgui.Create("DButton", health)
    health1:SetSize(110, 110)
    health1:SetPos(15,25)
    health1:SetFont("CombineHUDMed")
    health1:SetText(txt)
    health1:SetTextColor(clr)
    health1.Paint = function( self, w, h )
        surface.SetDrawColor(clr)
        surface.DrawOutlinedRect( 0, 0, w + 1, h + 1, 5 )
    end

    health1.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")  
        net.Start("GiveHealthStuffMinor")
        net.SendToServer()
        self:Remove()
    end

    local healthlbl = vgui.Create("DLabel",self.panel2)
    healthlbl:SetPos(60,350)
    healthlbl:SetSize(200, 100)
    healthlbl:SetFont("CombineHUDMed")
    healthlbl:SetText("SMALL HEALTH VIAL")
    healthlbl:SetTextColor(Color(0,161,255))

    local health2 = vgui.Create("DModelPanel", self.panel2)

	health2:SetSize(400, 400)
	health2:SetPos(260, 250)
	
	health2:SetModel(Model("models/healthvial.mdl"))
	health2:SetFOV(60)
	health2.Entity:SetPos(Vector(26,0,55))

    local health2but = vgui.Create("DButton", health2)
    health2but:SetSize(110, 110)
    health2but:SetPos(15,25)
    health2but:SetFont("CombineHUDMed")
    health2but:SetText(txt)
    health2but:SetTextColor(clr)
    health2but.Paint = function( self, w, h )
        surface.SetDrawColor(clr)
        surface.DrawOutlinedRect( 0, 0, w + 1, h + 1, 5 )
    end

    health2but.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")  
        net.Start("GiveHealthStuffMajor")
        net.SendToServer()
        self:Remove()
    end

    local health2lbl = vgui.Create("DLabel",self.panel2)
    health2lbl:SetPos(280,350)
    health2lbl:SetSize(200, 100)
    health2lbl:SetFont("CombineHUDMed")
    health2lbl:SetText("LARGE HEALTH VIAL")
    health2lbl:SetTextColor(Color(0,161,255))


    -- Health and Armor perks

    self.panel3 = vgui.Create( "DPanel", self.sheet )
    self.panel3:Dock( FILL )
    self.panel3.Paint = function( self, w, h )
        draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 100 ) )
    end 
    self.sheet:AddSheet( "WEPS", self.panel3 )

    local wep1 = vgui.Create("DModelPanel", self.panel3)

	wep1:SetSize(400, 400)
	wep1:SetPos(30, -40)
	
	wep1:SetModel(config.ltwepmodels[1])
	wep1:SetFOV(60)
	wep1.Entity:SetPos(Vector(15,0,50))

    function wep1:LayoutEntity(Entity)
        Entity:SetAngles(Angle(-60,180,0))
    end

    -- Wep1 Button 
    local wep1b = vgui.Create("DButton", wep1)

    wep1b:SetSize(110, 110)
    wep1b:SetPos(70,80)
    wep1b:SetFont("CombineHUDMed")
    wep1b:SetText(txt)
    wep1b:SetTextColor(clr)
    wep1b.Paint = function( self, w, h )
        surface.SetDrawColor(clr)
        surface.DrawOutlinedRect( 0, 0, w + 1, h + 1, 5 )
    end

    wep1b.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")  
        net.Start("GiveLTW1")
        net.SendToServer()
        self:Remove()
    end

    local wep1l = vgui.Create("DLabel", self.panel3)
    
    wep1l:SetPos(130,110)
    wep1l:SetSize(200, 100)
    wep1l:SetFont("CombineHUDMed")
    wep1l:SetText(config.ltwepnames[1])
    wep1l:SetTextColor(Color(0,161,255))


    -- wep2 model 

    local wep2 = vgui.Create("DModelPanel", self.panel3)

	wep2:SetSize(400, 400)
	wep2:SetPos(260, -40)
	
	wep2:SetModel(config.ltwepmodels[2])
	wep2:SetFOV(100)
	wep2.Entity:SetPos(Vector(30,0,55))
    function wep2:LayoutEntity(Entity)
        Entity:SetAngles(Angle(0, 90, 0))
    end

    -- Wep2 Button 
    local wep2b = vgui.Create("DButton", wep2)

    wep2b:SetSize(110, 110)
    wep2b:SetPos(70,80)
    wep2b:SetFont("CombineHUDMed")
    wep2b:SetText(txt)
    wep2b:SetTextColor(clr)
    wep2b.Paint = function( self, w, h )
        surface.SetDrawColor(clr)
        surface.DrawOutlinedRect( 0, 0, w + 1, h + 1, 5 )
    end

    wep2b.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")  
        net.Start("GiveLTW2")
        net.SendToServer()
        self:Remove()
    end

    -- wep2 

    local wep2l = vgui.Create("DLabel", self.panel3)
    
    wep2l:SetPos(355,110)
    wep2l:SetSize(200, 100)
    wep2l:SetFont("CombineHUDMed")
    wep2l:SetText(config.ltwepnames[2])
    wep2l:SetTextColor(Color(0,161,255))

    -- Wep 3

    local wep3 = vgui.Create("DModelPanel", self.panel3)

	wep3:SetSize(400, 400)
	wep3:SetPos(30, 200)
	
	wep3:SetModel(config.htwepmodels[2])
	wep3:SetFOV(115)
	wep3.Entity:SetPos(Vector(30,0,73))

    function wep3:LayoutEntity(Entity)
        Entity:SetAngles(Angle(60,0,-35))
    end
    -- wep3 Button 
    local wep3b = vgui.Create("DButton", wep3)

    wep3b:SetSize(110, 110)
    wep3b:SetPos(70,80)
    wep3b:SetFont("CombineHUDMed")
    wep3b:SetText(txt)
    wep3b:SetTextColor(clr)
    wep3b.Paint = function( self, w, h )
        surface.SetDrawColor(clr)
        surface.DrawOutlinedRect( 0, 0, w + 1, h + 1, 5 )
    end

    wep3b.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")  
        net.Start("GiveHTW2")
        net.SendToServer()
        self:Remove()
    end

    local wep3l = vgui.Create("DLabel", self.panel3)
    
    wep3l:SetPos(125,330)
    wep3l:SetSize(150, 150)
    wep3l:SetFont("CombineHUDMed")
    wep3l:SetText(config.htwepnames[2])
    wep3l:SetTextColor(Color(0,161,255))

    -- Wep 4

    
    local wep4 = vgui.Create("DModelPanel", self.panel3)

	wep4:SetSize(400, 400)
	wep4:SetPos(260, 200)
	
	wep4:SetModel(config.htwepmodels[1])
	wep4:SetFOV(78)
	wep4.Entity:SetPos(Vector(25,0,50))

    function wep4:LayoutEntity(Entity)
        Entity:SetAngles(Angle(-60,180,0))
    end

    -- wep4 Button 
    local wep4b = vgui.Create("DButton", wep4)

    wep4b:SetSize(110, 110)
    wep4b:SetPos(70,80)
    wep4b:SetFont("CombineHUDMed")
    wep4b:SetText(txt)
    wep4b:SetTextColor(clr)
    wep4b.Paint = function( self, w, h )
        surface.SetDrawColor(clr)
        surface.DrawOutlinedRect( 0, 0, w + 1, h + 1, 5 )
    end

    wep4b.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")  
        net.Start("GiveHTW1")
        net.SendToServer()
        self:Remove()
    end

    local wep4l = vgui.Create("DLabel", self.panel3)
    
    wep4l:SetPos(345,330)
    wep4l:SetSize(150, 150)
    wep4l:SetFont("CombineHUDMed")
    wep4l:SetText(config.htwepnames[1])
    wep4l:SetTextColor(Color(0,161,255))


    -- Weapon perks    
end


vgui.Register("basicFrame", PANEL, "DFrame")