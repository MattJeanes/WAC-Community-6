if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategory
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
	},
	{
		pos=Vector(123, 0, 85),
		exit=Vector(123,100,40),
	},
}

ENT.Sounds={
	Start="WAC/F4/Start.wav",
	Blades="F4.External",
	Engine="F4.Internal",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

function ENT:DrawWeaponSelection() end