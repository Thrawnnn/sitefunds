SWEP.Author = "Thrawn"
SWEP.Contact = "Thrawn9999"
SWEP.Purpose = ""
SWEP.Instructions = "Right click to toggle tablet focus."

SWEP.Category = "COMPLEXITY NETWORKS: SCPRP"

SWEP.Spawnable = true;
SWEP.AdminOnly = false

SWEP.ViewModel = "models/nirrti/tablet/c_Tablet_sfm.mdl"
SWEP.WorldModel = "models/nirrti/tablet/Tablet_sfm.mdl"
SWEP.startupSound = "weapons/pprptab/startup.wav"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.FiresUnderwater = true 

SWEP.RunArmOffset 		= Vector (-2.6657, 0, 3.5)
SWEP.RunArmAngle 		= Vector (-20.0824, -20.5693, 0)

SWEP.WElements = {
	["mainmodel"] = { type = "Model", model = "models/nirrti/tablet/Tablet_sfm.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.714, 3.635, -1.558), angle = Angle(162.468, -54.936, 87.662), size = Vector(0.56, 0.56, 0.56), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.ShouldDropOnDie = true

SWEP.HoldType = "slam"
SWEP.ViewModelFOV = 45
SWEP.ViewModelFlip = false
SWEP.UseHands = true

SWEP.AutoSwitchTo 	= false
SWEP.AutoSwitchFrom = true

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {}