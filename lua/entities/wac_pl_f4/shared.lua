if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategoryC
ENT.PrintName			= "F-4 Phantom II"
ENT.Author				= "SentryGunMan"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/sentry/f4.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/props_junk/PopCan01a.mdl"

ENT.rotorPos        = Vector(0,0,74)
ENT.TopRotorDir        = 1.0
ENT.AutomaticFrameAdvance = true
ENT.EngineForce        = 500
ENT.Weight            = 18825
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 0.02
ENT.SmokePos        = Vector(-155,24,65)
ENT.FirePos            = Vector(-155,24,65)

if CLIENT then
	ENT.thirdPerson = {
		distance = 550
	}
end

ENT.Agility = {
	Thrust = 10
}

ENT.Wheels={
	{
		mdl="models/sentry/f4_bw.mdl",
		pos=Vector(-43,96,14),
		friction=10,
		mass=600,
	},
	{
		mdl="models/sentry/f4_bw.mdl",
		pos=Vector(-43,-96,14),
		friction=10,
		mass=600,
	},
	{
		mdl="models/sentry/f4_fw.mdl",
		pos=Vector(217.25,0,12),
		friction=10,
		mass=1200,
	},
}

ENT.Seats = {
	{
		pos=Vector(178,0,75.5),
		exit=Vector(178,100,40),
		weapons={"M61 Vulcan"},
	},
	{
		pos=Vector(123, 0, 85),
		exit=Vector(123,100,40),
		weapons={"Bomb"}
	},
}

ENT.Weapons = {
	["M61 Vulcan"] = {
		class = "wac_pod_gatling",
		info = {
			Pods = {
				Vector(107,0,35),
				Vector(107,0,35),
			},
			Sounds = {
				shoot = "WAC/f4/gun.wav",
				stop = "WAC/f4/gun_stop.wav"
			}
		}
	},
	["Bomb"] = {
		class = "wac_pod_bomb",
		info = {
			Pods = {
				Vector(40,75,20),
				Vector(40,-75,20),
				Vector(40,60,40),
				Vector(40,90,40),
				Vector(40,-60,40),
				Vector(40,-90,40),
			},
			model="models/props_phx/ww2bomb.mdl",
		}
	}
}

ENT.Sounds={
	Start="WAC/f4/Start.wav",
	Blades="WAC/f4/external.wav",
	Engine="WAC/f4/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

// heatwave
if CLIENT then
	local cureffect=0
	function ENT:Think()
		self:base("wac_pl_base").Think(self)
		local throttle = self:GetNWFloat("up", 0)
		local active = self:GetNWBool("active", false)
		local ent=LocalPlayer():GetVehicle():GetNWEntity("wac_aircraft")
		if ent==self and active and throttle > 0.2 and CurTime()>cureffect then
			cureffect=CurTime()+0.02
			local ed=EffectData()
			ed:SetEntity(self)
			ed:SetOrigin(Vector(-155,0,65)) // offset
			ed:SetMagnitude(throttle)
			ed:SetRadius(30)
			util.Effect("wac_heatwave", ed)
		end
	end
end

//function ENT:DrawWeaponSelection() end