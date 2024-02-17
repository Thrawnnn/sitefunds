util.AddNetworkString("OpenVendor")
util.AddNetworkString("OpenCmdModule")
util.AddNetworkString("OpenHelpDesk")
util.AddNetworkString("OpenWarning")
util.AddNetworkString("GiveHealthStuffAll")
util.AddNetworkString("GiveHealthStuffMinor")
util.AddNetworkString("GiveHealthStuffMajor")
util.AddNetworkString("GiveArmorStuffMinor")
util.AddNetworkString("GiveArmorStuffMajor")
util.AddNetworkString("GiveAllWeapons")
util.AddNetworkString("GiveLTW1")
util.AddNetworkString("GiveLTW2")
util.AddNetworkString("GiveHTW1")
util.AddNetworkString("GiveHTW2")

net.Receive("GiveLTW1", function(len,ply)
    funding = sitefunding()
    if config.claimedlow[1] == false then
        if funding >= 5000 then
            ply:Give(config.LowTierWeapons[1])
            ply:ChatPrint("You've purchased the "..config.ltwepnames[1].." for "..config.ltwepprice[1].. " SF.")
            funding = funding - config.ltwepprice[1]
            config.claimedlow[1] = true 
        else
            ply:ChatPrint("There are not enough Funds to get any equipment!") 
        end
    else
        ply:ChatPrint("You've already claimed your weapon for this bracket!")
    end
end)

net.Receive("GiveLTW2", function(len,ply)
    funding = sitefunding()
    if config.claimedlow[2] == false then
        if funding >= 5000 then
            ply:Give(config.LowTierWeapons[2])
            ply:ChatPrint("You've purchased the "..config.ltwepnames[2].." for "..config.ltwepprice[2].. " SF.")
            funding = funding - config.ltwepprice[2]
            config.claimedlow[2] = true 
        else
            ply:ChatPrint("There are not enough Funds to get any equipment!") 
        end
    else
        ply:ChatPrint("You've already claimed your weapon for this bracket!")
    end
end)

net.Receive("GiveHTW1", function(len,ply)
    funding = sitefunding()

    if config.claimedhigh[1] == false then
        if funding >= 6000 then
            ply:Give(config.HighTierWeapons[1])
            ply:ChatPrint("You've purchased the "..config.htwepnames[1].." for "..config.htwepprice[1].. " SF.")
            funding = funding - config.htwepprice[1]
            config.claimedlow[1] = true 
        else
            ply:ChatPrint("There are not enough Funds to get any equipment!") 
        end
    else
        ply:ChatPrint("You've already claimed your weapon for this bracket!")
    end
end)

net.Receive("GiveHTW2", function(len,ply)
    funding = sitefunding()

    if config.claimedhigh[2] == false then
        if funding >= 6000 then
            ply:Give(config.HighTierWeapons[2])
            ply:ChatPrint("You've purchased the "..config.htwepnames[2].." for "..config.htwepprice[2].. " SF.")
            funding = funding - config.htwepprice[2]
            config.claimedlow[2] = true 
        else
            ply:ChatPrint("There are not enough Funds to get any equipment!") 
        end
    else
        ply:ChatPrint("You've already claimed your weapon for this bracket!")
    end
end)

net.Receive("GiveAllWeapons", function(len, ply)
    funding = sitefunding()

    if hasClaimedWeps == false then
        if funding < 4999 then
            ply:ChatPrint("There are not enough Funds to get any equipment!")
            return
        elseif funding >= 5000 and funding <= 5999 then
            ply:Give(config.LowTierWeapons[1])
            ply:Give(config.LowTierWeapons[2])
            ply:ChatPrint("You have claimed your weapons.")
        elseif funding > 5999 then
            ply:Give(config.HighTierWeapons[1])
            ply:Give(config.HighTierWeapons[2])
            ply:ChatPrint("You have claimed your weapons.")
        end
        hasClaimedWeps = true
    else
        ply:ChatPrint("You have already claimed your Items!")
        timer.Simple(180, function() 
            hasClaimedWeps = false
        end)
    end

end)

net.Receive("GiveHealthStuffAll", function(len, ply)
    funding = sitefunding()

    if hasClaimedHealth == false then
        if funding < 4999 then
            ply:ChatPrint("There are not enough Funds to get any equipment!")
            return 
        elseif funding >= 5000 and funding <= 5999 then
            ply:SetHealth(config.Health[1])
            ply:SetArmor(config.Armor[1])
            ply:ChatPrint("You have claimed your equipment.")
            
            sitefunds = sitefunds - 150
        elseif funding > 5999 then
            ply:SetHealth( config.Health[2] )
            ply:SetArmor( config.Armor[2] )
            ply:ChatPrint("You have claimed your equipment.")
            
            sitefunds = sitefunds - 300
        end
        hasClaimedHealth = true
    else
        ply:ChatPrint("You have already claimed your Health/Armor!")
        timer.Simple(30, function() 
            hasClaimedHealth = false
        end)
    end
    
end)

net.Receive("GiveHealthStuffMinor", function(len, ply)
    funding = sitefunding()

    if hasClaimedHealth == false then
        if funding < 4999 then
            ply:ChatPrint("There are not enough Funds to get any equipment!")
            return 
        elseif funding >= 5000 then
            ply:SetHealth(config.Health[1])
            ply:ChatPrint("You have claimed your equipment.")
            
            sitefunds = sitefunds - 100
        end
        hasClaimedHealth = true
    else
        ply:ChatPrint("You have already claimed your Health!")
        timer.Simple(30, function() 
            hasClaimedHealth = false
        end)
    end
    
end)

net.Receive("GiveHealthStuffMajor", function(len, ply)
    funding = sitefunding()

    if hasClaimedHealth == false then
        if funding < 4999 then
            ply:ChatPrint("There are not enough Funds to get any equipment!")
            return 
        elseif funding > 5999 then
            ply:SetHealth( config.Health[2] )
            ply:ChatPrint("You have claimed your equipment.")
            
            sitefunds = sitefunds - 125
        end
        hasClaimedHealth = true
    else
        ply:ChatPrint("You have already claimed your Health!")
        timer.Simple(30, function() 
            hasClaimedHealth = false
        end)
    end
    
end)

net.Receive("GiveArmorStuffMinor", function(len, ply)
    funding = sitefunding()

    if hasClaimedArmor == false then
        if funding < 4999 then
            ply:ChatPrint("There are not enough Funds to get any equipment!")
            return 
        elseif funding >= 5000 then
            ply:SetArmor(config.Armor[1])
            ply:ChatPrint("You have claimed your equipment.")
            
            sitefunds = sitefunds - 100
        end
        hasClaimedArmor = true
    else
        ply:ChatPrint("You have already claimed your Armor!")
        timer.Simple(30, function() 
            hasClaimedArmor = false
        end)
    end
    
end)

net.Receive("GiveArmorStuffMajor", function(len, ply)
    funding = sitefunding()

    if hasClaimedArmor == false then
        if funding < 5999 then
            ply:ChatPrint("There are not enough Funds to get any equipment!")
            return 
        elseif funding > 5999 then
            ply:SetArmor( config.Armor[2] )
            ply:ChatPrint("You have claimed your equipment.")
            
            sitefunds = sitefunds - 125
        end
        hasClaimedArmor = true
    else
        ply:ChatPrint("You have already claimed your Armor!")
        timer.Simple(30, function() 
            hasClaimedArmor = false
        end)
    end
    
end)