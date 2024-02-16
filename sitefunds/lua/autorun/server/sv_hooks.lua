hook.Add( "PlayerDeath", "Reset", function( v, i, a )
    hasClaimedWeps = false
    hasClaimedHealth = false
end ) -- resets the player's claimed status for each when they die so they can grab the earned stuff after every death