function canBuy()
--[[
    //////////////////////////////
   / PLEASE WRITE A CONFIG HERE./
  //////////////////////////////
]]--
    return true
end

-- Console Commands

concommand.Add( "removefunds", function( ply, cmd, args )
    if not ply:IsSuperAdmin() then 
        return
    else 
        sitefunds = sitefunds - sitefunds
        PrintMessage(HUD_PRINTTALK, "Removed All site funds.")
        return sitefunds
    end
end )


concommand.Add( "addfunds", function( ply, cmd, args )
    if not ply:IsSuperAdmin() then 
        return
    else 
        sitefunds = sitefunds + 1000
        PrintMessage(HUD_PRINTTALK, "Added 1000 funds to the site funds.")
        return sitefunds
    end
end )

concommand.Add( "testfail", function( ply, cmd, args )
    if not ply:IsSuperAdmin() then 
        return
    else 
        sitefunds = sitefunds - 1000
        PrintMessage(HUD_PRINTTALK, "Removed 1000 funds from the site funds.")
        return sitefunds
    end
end )

concommand.Add("addFundsAmount", function(ply, cmd, args)
    local value = tonumber(args[1]) 
    if value then
        sitefunds = sitefunds + value
        PrintMessage(HUD_PRINTTALK, "Added "..value.." to the Site Funds.")
    else
        PrintMessage(HUD_PRINTTALK, "Invalid argument. Please provide an integer value.")
        print("Invalid argument. Please provide an integer value.")
    end
end)

concommand.Add("removeFundsAmount", function(ply, cmd, args)
    local value = tonumber(args[1]) 
    if value then
        sitefunds = sitefunds - value
        PrintMessage(HUD_PRINTTALK, "Removed "..value.." to the Site Funds.")
    else
        PrintMessage(HUD_PRINTTALK, "Invalid argument. Please provide an integer value.")
        print("Invalid argument. Please provide an integer value.")
    end
end)

concommand.Add("doubleFunds", function(ply, cmd, args)
    sitefunds = sitefunds * 2
    oldFunds = sitefunds / 2
    PrintMessage(HUD_PRINTTALK, "Doubled the Site Funds ("..oldFunds.." -> "..sitefunds..")")
end)


-- Chat commands

hook.Add("PlayerSay","RemoveFunds",
function(ply, txt)
    if not ply:IsSuperAdmin() then 
        return
    else 
        if (string.lower(txt) == "/removefunds") then
            sitefunds = sitefunds - sitefunds
            PrintMessage(HUD_PRINTTALK, "Removed All site funds.")
        end
    end
end)

hook.Add("PlayerSay","HelpFunds",
function(ply, txt)
    if not ply:IsSuperAdmin() then 
        return
    else 
        if (string.lower(txt) == "/help") then
            net.Start("OpenHelpDesk")
            net.Send(ply)
        end
    end
end)


hook.Add("PlayerSay","AddFunds",
function(ply, txt)
    if not ply:IsSuperAdmin() then 
        return
    else 
        if (string.lower(txt) == "/addfunds") then
            sitefunds = sitefunds + 1000
            PrintMessage(HUD_PRINTTALK, "Added 1000 funds to the site funds.")    
        end
    end
end)