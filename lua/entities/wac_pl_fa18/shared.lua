if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategory
ENT.PrintName			= "Boeing F/A-18F"
ENT.Author				= "SentryGunMan"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/sentry/fa18f.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/props_junk/PopCan01a.mdl"

ENT.rotorPos        = Vector(0,0,74)
ENT.TopRotorDir        = 1.0
ENT.AutomaticFrameAdvance = true
ENT.EngineForce        = 800
ENT.Weight            = 23120
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 0.05
ENT.SmokePos        = Vector(-330,21,85)
ENT.FirePos            = Vector(-330,21,85)

if CLIENT then
	ENT.thirdPerson = {
		distance = 550
	}
end

ENT.Wheels={
	{
		mdl="models/sentry/fa18br.mdl",
		pos=Vector(-106.5,-64.5,24),
		friction=70,
		mass=1200,
	},
	{
		mdl="models/sentry/fa18bl.mdl",
		pos=Vector(-106.5,64.5,24),
		friction=70,
		mass=1200,
	},
	{
		mdl="models/sentry/fa18fw.mdl",
		pos=Vector(133,0,18),
		friction=70,
		mass=1200,
	},
}

ENT.Seats = {
	{
		pos=Vector(167,0,95),
		exit=Vector(170,100,40),
	},
	{
		pos=Vector(108,0,105),
		exit=Vector(110,100,40),
	}
}

ENT.Sounds={
	Start="WAC/FA18/Start.wav",
	Blades="FA18.External",
	Engine="FA18.Internal",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

function ENT:DrawWeaponSelection() end