include("shared.lua")

function ENT:Draw()

	self:DrawModel()

	if (LocalPlayer():GetPos():DistToSqr(self:GetPos()) < 300000) then
		local Pos = self:GetPos() + Vector(0,0,45) - self:GetRight()*4
		Pos = Pos + Vector(0,0,math.abs(math.sin(CurTime()) * 5))
		local Ang = Angle(0, LocalPlayer():EyeAngles().y - 90, 90)
		cam.Start3D2D(Pos, Ang, 0.1)
			surface.DisableClipping( true )
			draw.DrawText("SITE DISPENSARY", "SCPFundsFontTiny", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		cam.End3D2D()
	end
end
