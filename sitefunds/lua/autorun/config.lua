local config = {}
local val2 = 10
local val1 = 1 -- Place your own value here.

config.DefaultFunds = 5000 -- Required config number
config.Delay = 2 -- number in seconds of the delay between each fund addition
config.Multiplier = val2 / 5 + val1
config.FundIncrement = 20 - config.Multiplier -- Increment per second of the funds
config.HudEnable = true
config.showhud = 1 -- 1 is yes, anything else is no. Requires a restart to change.
