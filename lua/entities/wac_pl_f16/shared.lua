if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategoryC
ENT.PrintName			= "F-16C Falcon"
ENT.Author				= "SentryGunMan"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model	    = "models/sentry/f16.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/props_junk/PopCan01a.mdl"

ENT.rotorPos	= Vector(0,0,74)
ENT.TopRotorDir	= 1.0
ENT.AutomaticFrameAdvance = true
ENT.EngineForce	= 600
ENT.Weight	    = 12000
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 0.02
ENT.SmokePos	= Vector(-235,0,68)
ENT.FirePos	    = Vector(-235,0,68)

if CLIENT then
	ENT.thirdPerson = {
		distance = 550
	}
end

ENT.Agility = {
	Thrust = 15
}

ENT.Wheels={
	{
		mdl="models/sentry/f16_bw.mdl",
		pos=Vector(-66,45.3,12),
		friction=10,
		mass=600,
	},
	{
		mdl="models/sentry/f16_bw.mdl",
		pos=Vector(-66,-45.3,12),
		friction=10,
		mass=600,
	},
	{
		mdl="models/sentry/f16_fw.mdl",
		pos=Vector(86.2,0,10.9),
		friction=10,
		mass=1200,
	},
}

ENT.Seats = {
	{
		pos=Vector(130,0,70),
		exit=Vector(130,70,20),
		weapons={"M61 Vulcan", "Hydra 70"}
	}
}

ENT.Weapons = {
	["M61 Vulcan"] = {
		class = "wac_pod_gatling",
		info = {
			Pods = {
				Vector(100,40,80.75),
				Vector(100,-40,80.75)
			},
			Sounds = {
				shoot = "WAC/f16/gun.wav",
				stop = "WAC/f16/gun_stop.wav"
			}
		}
	},
	
	["Hydra 70"] = {
		class = "wac_pod_hydra",
		info = {
			Sequential = true,
			Pods = {
				Vector(-31.54,155.64,56.31),
				Vector(-31.54,-155.64,56.31)
			}
		}
	},
}

ENT.Sounds={
	Start="WAC/f16/Start.wav",
	Blades="WAC/f16/external.wav",
	Engine="WAC/f16/internal.wav",
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
			ed:SetOrigin(Vector(-270,0,68)) // offset
			ed:SetMagnitude(throttle)
			ed:SetRadius(25)
			util.Effect("wac_heatwave", ed)
		end
	end
end

function ENT:DrawWeaponSelection() end