util.AddNetworkString("OpenVendor")
util.AddNetworkString("OpenCmdModule")
util.AddNetworkString("OpenHelpDesk")
util.AddNetworkString("OpenWarning")
util.AddNetworkString("GiveHealthStuff")
util.AddNetworkString("GiveWeapons")

net.Receive("GiveWeapons", function(len, ply)
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

net.Receive("GiveHealthStuff", function(len, ply)
    funding = sitefunding()

    if hasClaimedHealth == false then
        if funding < 4999 then
            ply:ChatPrint("There are not enough Funds to get any equipment!")
            return 
        elseif funding >= 5000 and funding <= 5999 then
            ply:SetHealth(config.Health[1])
            ply:SetArmor(config.Armor[1])
            ply:ChatPrint("You have claimed your equipment.")
        elseif funding > 5999 then
            ply:SetHealth( config.Health[2] )
            ply:SetArmor( config.Armor[2] )
            ply:ChatPrint("You have claimed your equipment.")
        end
        hasClaimedHealth = true
    else
        ply:ChatPrint("You have already claimed your Health/Armor!")
        timer.Simple(30, function() 
            hasClaimedHealth = false
        end)
    end
    
end)