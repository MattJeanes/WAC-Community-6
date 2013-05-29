if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base_u"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.PrintName			= "General Dynamics F-16"
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
	}
}

ENT.Sounds={
	Start="WAC/F16/Start.wav",
	Blades="F16.External",
	Engine="F16.Internal",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

function ENT:DrawWeaponSelection() end