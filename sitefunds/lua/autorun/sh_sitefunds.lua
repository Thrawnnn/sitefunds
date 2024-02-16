-- COPYRIGHT:
-- Copyright (c) 2023, Complexity Networks All Rights Reserved.
config = {}

config.DefaultFunds = 5000 -- Required config number
config.FundIncrement = 1 -- Increment per second of the funds
config.HudEnable = false
config.showhud = false -- 1 is yes, anything else is no. Requires a restart to change.
config.LowTierWeapons = {"plutonic_usp", "plutonic_mcx"} -- choose the weapons you want when there are less funds
config.HighTierWeapons = {"plutonic_zoomar2", "plutonic_357"} -- choose the weapons you want for when there are more funds
config.Health = {110, 125} -- First value is low tier when there are less funds, second value is high tier when there are more funds
config.Armor = {15, 25} -- First value is low tier when there are less funds, second value is high tier when there are more funds
hasClaimedWeps = false
hasClaimedHealth = false
    
-- End configuration.

--[[
DONT TOUCH ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING.
]]--

sitefunds = config.DefaultFunds or 2500 -- If the config value exists then the site funds will be that value on startup, otherwise it'll be 2500.

local red = Color(255,0,0,255)
local black = Color(0,0,0,255)
local blue = Color(0,0,255,255)
local green = Color(0,255,0,255)
local orange = Color(255, 165, 0, 255)
local gray = Color(100,100,100,255)
local white = Color(255,255,255,255)
local col = {red,black,blue,green,orange} -- Make color values and place them in a Table
local DevMat = Material( "mrp/avatar_frames/cornered.png" )
local DevMatGrad = Material("mrp/menu_stuff/bg.png") 
config.FundAdditive = 99999 -- Don't touch


function perfHud()
    if config.HudEnable or config.showhud then 
        return true
    else
        return false
    end
end

if sitefunds < 4999 then 
    alert =  "Low."
    alertcol = col[1]
elseif sitefunds >= 5000 and sitefunds <= 5999 then -- Check to make sure that the code shown here isnt shown when there are more than 5999 funds total.
    alert = "Maintained."
    alertcol = col[5]
elseif sitefunds > 5999 then
    alert = "High."
    alertcol = col[4] -- Tables!!!!
end -- basic if statement because im way too lazy to care :yawning_face:

if perfHud() then 

    hook.Add("HUDPaintBackground", "yes", function() -- hook for the HUD so that we can use the draw library and such, also draws the HUD itself :yawning_face:

        draw.SimpleText("SITE FUNDS: "..sitefunds, "SCPFundsFontLarge", 800,55,alertcol)
        draw.SimpleText(alert, "SCPFundsFontSmall", 790, 105, alertcol) -- Table  method?

    end)
end
-- overly basic overlay type thing for the site funds indicators. Eventually going to add a warning thing :)

hook.Add("PlayerSay","GetFunding",
function(ply, txt)
    if (string.lower(txt) == "/funds") then
        PrintMessage(HUD_PRINTTALK, "The Current Site Funds are: ".. sitefunds)
        PrintMessage(HUD_PRINTTALK, "Funds are ".. alert)
    end
end)

function Money()
    sitefunds = sitefunds + config.FundIncrement
    return sitefunds
end -- Function that basically just adds an integer (1) to the total site funds, used in the timer.

timer.Create( "MoneyAdd", 1, config.FundAdditive, Money) -- Timer used to dictate how often funds are added to the total (second # indicates the seconds)

function sitefunding()
    local funding = sitefunds
    return funding -- used in the init.lua DONT REMOVE
end

