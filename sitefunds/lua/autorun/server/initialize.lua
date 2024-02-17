local msg = "This server is running the Site Funds addon, if you have questions on how to use this, please type '/help'."

local function SiteFundsMessage(ply)
    if IsValid(ply) and ply:IsPlayer() then
        ply:ChatPrint(msg)
    end
end

hook.Add("PlayerInitialSpawn", "SiteFundsMessage", SiteFundsMessage)
