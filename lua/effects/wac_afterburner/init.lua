function EFFECT:Init( data )
	local Ent = data:GetEntity()
	local Pos = data:GetOrigin()
	local Power = data:GetMagnitude()
	
	local emitter = ParticleEmitter( Pos )
	
	for i = 1,Power*100 do

		local particle = emitter:Add( "particles/fire_glow", Ent:LocalToWorld(Pos+ Vector( math.random(-3,8),math.random(-27,-25),math.random(-3,0))))
		 
		if particle == nil then particle = emitter:Add( "particles/fire_glow", Pos + Vector(   math.random(-3,8),math.random(-27,-25),math.random(-3,0) ) ) end
		
		if (particle) then
			particle:SetVelocity(Ent:GetVelocity()+Ent:GetForward()*(-500))
			particle:SetLifeTime(0) 
			particle:SetDieTime(0.2) 
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(30) 
			particle:SetEndSize(10)
			particle:SetAngles( Angle(0,0,0) )
			particle:SetAngleVelocity( Angle(1,-20,30) ) 
			particle:SetRoll(math.Rand( 0, 360 ))
			particle:SetColor(math.random(85,255),math.random(6,222),math.random(6,57),math.random(255,255))
			particle:SetAirResistance(0)
			particle:SetCollide(false)
			particle:SetBounce(0)
		end
	end

	emitter:Finish()
		
end

function EFFECT:Think()		
	return false
end

function EFFECT:Render()
end