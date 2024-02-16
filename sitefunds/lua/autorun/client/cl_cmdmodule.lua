local PANEL = {}

function PANEL:Init()
    self:SetPos( 720, 350 ) 
    self:SetSize( 800, 500 ) 
    self:SetTitle( "COMMAND MODULE" ) 
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
    lbl:SetText("FUNDS O.S. V0.3.5")
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
    self.sheet:AddSheet( "RMVL", self.panel2 )

    local b1 = vgui.Create("DButton", self.panel2)
    b1:SetText("Remove All Funds")
    b1:SetTextColor( Color(0,0,0) )
    b1:SetPos(175,400)
    b1:SetSize(150,25)
    b1.Paint = function(s,w,h)
        draw.RoundedBox(50, 0, 0, w, h, Color( 255, 0, 0, 100 ))
    end
    b1.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
        Derma_Query(
            "Are you sure you want to remove all site funds?",

            ".::WARNING::.",

            "Yes",

            function()     
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")   
                LocalPlayer():ConCommand("removefunds")
            end,

	        "No",
	        function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
            end)
    end

    

    local b3 = vgui.Create("DButton", self.panel2)
    b3:SetText("Mark Test Unsuccessful (-1000 Funds)")
    b3:SetTextColor(Color(0,0,0))
    b3:SetPos(200,50)
    b3:SetSize(300,25)
    b3.Paint = function(s,w,h)
        draw.RoundedBox(50,0,0,w,h,Color(255,0,0,100))
    end

    b3.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
        Derma_Query(
            "This will REMOVE **1000 SF**, are you sure you want to do this?",

                ".::WARNING::.",
                "Yes",

                function()
                    surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")
                    LocalPlayer():ConCommand("testfail")
                end,

                "No",
                function()
                    surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
                    return
                end)
            end


    local selRemove = vgui.Create("DComboBox", self.panel2)
    selRemove:SetPos(250,100)
    selRemove:SetSize(210,25)
    selRemove:SetTextColor(Color(0,0,0))
    selRemove:SetValue("Select Other Amount to Remove")
    selRemove:AddChoice("2000")
    selRemove:AddChoice("3000")
    selRemove:AddChoice("4000")
    selRemove:AddChoice("5000")
    selRemove.Paint = function(s,w,h)
        draw.RoundedBox(50,0,0,w,h,Color(255,0,0,100))
    end
    selRemove.OnSelect = function( self, index, value )
        Derma_Query(
            "This will REMOVE **"..value.." SF**, are you sure you want to do this?",

            ".::WARNING::.",

            "Yes",

            function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")     
                LocalPlayer():ConCommand("removeFundsAmount "..value)
            end,

	        "No",
	        function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
                return
            end)
    end


    local custRemove = vgui.Create("DTextEntry", self.panel2)
    custRemove:SetPos(375,400)
    custRemove:SetSize(190,25)
    custRemove:SetTextColor(Color(0,0,0))
    custRemove:SetPlaceholderText( "Enter a custom amount here: " )
    custRemove.OnEnter = function( self )
        Derma_Query(
            "This will REMOVE **"..self:GetValue().." SF**, are you sure you want to do this?",

            ".::WARNING::.",

            "Yes",

            function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")     
                LocalPlayer():ConCommand("removeFundsAmount "..self:GetValue())
            end,

	        "No",
	        function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
                return
            end)
    end

    self.panel3 = vgui.Create( "DPanel", self.sheet )
    self.panel3:Dock( FILL )
    self.panel3.Paint = function( self, w, h )
        draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 100 ) )
    end 
    self.sheet:AddSheet( "ADDT", self.panel3 )

    local sel = vgui.Create("DComboBox", self.panel3)
    sel:SetPos(250,100)
    sel:SetSize(190,25)
    sel:SetTextColor(Color(0,0,0))
    sel:SetValue("Select Other Amount to Add")
    sel:AddChoice("2000")
    sel:AddChoice("3000")
    sel:AddChoice("4000")
    sel:AddChoice("5000")
    sel.Paint = function(s,w,h)
        draw.RoundedBox(50,0,0,w,h,Color(0,255,0,100))
    end
    sel.OnSelect = function( self, index, value )
        Derma_Query(
            "This will ADD **"..value.." SF**, are you sure you want to do this?",

            ".::WARNING::.",

            "Yes",

            function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")     
                LocalPlayer():ConCommand("addFundsAmount "..value)
            end,

	        "No",
	        function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
                return
            end)
    end

    local custAdd = vgui.Create("DTextEntry", self.panel3)
    custAdd:SetPos(375,400)
    custAdd:SetSize(190,25)
    custAdd:SetTextColor(Color(0,0,0))
    custAdd:SetPlaceholderText( "Enter a custom amount here: " )
    custAdd.OnEnter = function( self )
        Derma_Query(
            "This will ADD **"..self:GetValue().." SF**, are you sure you want to do this?",

            ".::WARNING::.",

            "Yes",

            function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")     
                LocalPlayer():ConCommand("addFundsAmount "..self:GetValue())
            end,

	        "No",
	        function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
                return
            end)
    end

    local b2 = vgui.Create("DButton", self.panel3)
    b2:SetText("Mark Test Successful (+1000 Funds)")
    b2:SetTextColor(Color(0,0,0))
    b2:SetPos(200,50)
    b2:SetSize(300,25)
    b2.Paint = function(s,w,h)
        draw.RoundedBox(50,0,0,w,h,Color(0,255,0,100))
    end

    b2.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")
        Derma_Query(
            "This will ADD **1000 SF**, are you sure you want to do this?",

            ".::WARNING::.",

            "Yes",

            function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")     
                LocalPlayer():ConCommand("addfunds")
            end,

	        "No",
	        function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
                return
            end)
    end

    local doubleFunds = vgui.Create("DButton", self.panel3)
    doubleFunds:SetText("Double the Current Funds")
    doubleFunds:SetTextColor(Color(0,0,0))
    doubleFunds:SetPos(150,400)
    doubleFunds:SetSize(200,25)
    doubleFunds.Paint = function(s,w,h)
        draw.RoundedBox(50,0,0,w,h,Color(0,255,0,100))
    end

    doubleFunds.DoClick = function()
        surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")
        Derma_Query(
            "This will DOUBLE the current Site Funds, are you sure you want to do this?",

            ".::WARNING::.",

            "Yes",

            function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_01.wav")     
                LocalPlayer():ConCommand("doubleFunds")
            end,

	        "No",
	        function()
                surface.PlaySound("horizons_fx/combine_machines_crafting_ui_select_denied_01.wav")
                return
            end)
        end

        local help = vgui.Create( "DPanel", self.sheet )
        help:Dock( FILL )
        help.Paint = function( self, w, h )  
            draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 100 ) ) 
        end 
        
        self.sheet:AddSheet( "HELP", help )

        local l = vgui.Create("DLabel", help)
        l:SetText("COMMANDS:")
        l:SetTextColor(Color(0,161,255))
        l:SetPos(50,-50)
        l:SetSize(700,250)
        l:SetFont("CombineHUDXL")    
        
        local l1 = vgui.Create("DLabel", help)
        l1:SetText([[/funds - Check the amount of funds the site has.
/addfunds - Adds **1000** funds (AL)
/removefunds - Removes **ALL** funds (AL)

Configuration can be done in the Code (e.g - Devs Only)]])
        l1:SetTextColor(Color(0,161,255))
        l1:SetPos(50,50)
        l1:SetSize(500,250)
        l1:SetFont("FundsFontSmall")   
end

vgui.Register("CmdModule", PANEL, "DFrame")
