-- COPYRIGHT:
-- Copyright (c) 2023, Complexity Networks All Rights Reserved.

local config = {}
local val2 = 10
local val1 = 1 -- Place your own value here.

config.DefaultFunds = 5000 -- Required config number
config.Delay = 2 -- number in seconds of the delay between each fund addition
config.Multiplier = val2 / 5 + val1
config.FundIncrement = 20 - config.Multiplier -- Increment per second of the funds
config.HudEnable = true
config.showhud = 1 -- 1 is yes, anything else is no. Requires a restart to change.

    
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


function showHUD()
    if config.showhud == 1 then 
        return true
    else
        return false
    end
end


if showHUD() then 

    hook.Add("HUDPaintBackground", "yes", function() -- hook for the HUD so that we can use the draw library and such, also draws the HUD itself :yawning_face:
    
        surface.SetDrawColor( 35, 35, 35, 255 )
        surface.SetMaterial( DevMat )
        surface.DrawTexturedRect( -70, 20, 560, 170 )
    -- the above code draws the brackets

        surface.SetDrawColor(255,255,255,255)
        surface.SetMaterial( DevMatGrad )
        surface.DrawTexturedRect( 29, 55, 366, 102 )
    -- The above code draws the box background with the text

            if sitefunds < 4999 then 
                alert =  "Code: 92.1C :: SITE FUNDS ARE LOW."
                alertcol = col[1]
            elseif sitefunds >= 5000 and sitefunds <= 5999 then -- Check to make sure that the code shown here isnt shown when there are more than 5999 funds total.
                alert = "Code: 329.D9 :: FUNDS MAINTAINED."
                alertcol = col[5]
            elseif sitefunds > 5999 then
                alert = "CODE: 832.FP :: SITE FUNDS ARE HIGH."
                alertcol = col[4] -- Tables!!!!
            end -- basic if statement because im way too lazy to care :yawning_face:
        surface.SetTextColor(100,100,100,255)
        surface.SetFont( "SCPFundsFontLarge" )
        draw.SimpleText("// SITE FUNDS: "..sitefunds.." //", "SCPFundsFontLarge", 45,55,gray)
        draw.SimpleText("FUNDS O.S :: Vers.C - B.293.d2", "SCPFundsFontSmall", 80, 100, Color(255,0,0,255))
        draw.SimpleText(alert, "SCPFundsFontSmall", 70, 125, alertcol) -- Table  method?

    end)
end
-- overly basic overlay type thing for the site funds indicators. Eventually going to add a warning thing :)

function Money()
    sitefunds = sitefunds + config.FundIncrement
    return sitefunds
end -- Function that basically just adds an integer (1) to the total site funds, used in the timer.

timer.Create( "MoneyAdd", config.Delay * config.Multiplier, config.FundAdditive, Money) -- Timer used to dictate how often funds are added to the total (second # indicates the seconds)

function sitefunding()
    local funding = sitefunds
    return funding
end
