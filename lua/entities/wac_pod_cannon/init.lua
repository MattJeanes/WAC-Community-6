
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")


ENT.Sound = "WAC/P39/37mm.wav"

function ENT:Initialize()
	self:base("wac_pod_base").Initialize(self)
end


function ENT:fireBullet(pos)
	if !self:takeAmmo(1) then return end
	if not self.seat then return end
	local pos2=self.aircraft:LocalToWorld(pos+Vector(self.aircraft:GetVelocity():Length()*0.6,0,0))
	local ang=self.aircraft:GetAngles()
	print(pos,pos2,ang)
	local b=ents.Create("wac_hc_hebullet")
	b:SetPos(pos2)
	b:SetAngles(ang)
	b.col=Color(255,200,20)
	b.Speed=700
	b.Size=30
	b.Width=1
	b.Damage=250
	b.Radius=130
	util.SpriteTrail(b, 0, Color(255,255,0), false, 5, 0, 0.05, 1/(15+1)*0.5, "trails/laser.vmt")
	b:Spawn()
	b.Owner=self.seat
	self:EmitSound(self.Sound)
	local effectdata=EffectData()
	effectdata:SetOrigin(self:LocalToWorld(pos))
	effectdata:SetAngles(ang)
	effectdata:SetScale(2.5)
	util.Effect("MuzzleEffect", effectdata)
end


function ENT:fire()
	for _, v in pairs(self.Pods) do
		self:fireBullet(v)
	end
	self:SetNextShot(self:GetLastShot() + 60/self.FireRate)
end
