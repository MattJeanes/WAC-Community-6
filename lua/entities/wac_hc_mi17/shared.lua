if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategory
ENT.PrintName			= "Mil Mi-17 Hip"
ENT.Author				= "SentryGunMan, Dr. Matt"
ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model		= "models/sentry/mi17.mdl"
ENT.EngineForce	= 34
ENT.Weight		= 13000
ENT.SmokePos	= Vector(-84,0,110)
ENT.FirePos		= Vector(-86,0,110)

ENT.TopRotor = {
	dir = -1,
	pos = Vector(-5,0,162),
	model = "models/sentry/mi17_tr.mdl"
}

ENT.BackRotor = {
	dir = -1,
	pos = Vector(-491.3,23,176),
	model = "models/sentry/mi17_br.mdl"
}

ENT.thirdPerson = {
	distance = 660
}

ENT.Wheels={
	{
		mdl="models/sentry/mi17_fw.mdl",
		pos=Vector(119.5,0,8.6),
		friction=60,
		mass=600,
	},
	{
		mdl="models/sentry/mi17_bw_l.mdl",
		pos=Vector(-44.4,89,8.6),
		friction=60,
		mass=600,
	},
	{
		mdl="models/sentry/mi17_bw_r.mdl",
		pos=Vector(-44.4,-89,8.6),
		friction=60,
		mass=600,
	},

}

ENT.Seats = {
	{
		pos=Vector(145,23,60),
		exit=Vector(147.5,120,50),
	},
	{
		pos=Vector(145,-23,60),
		exit=Vector(147.5,-120,50),
	},
	{
		pos=Vector(40,40,44),
		ang=Angle(0,-90,0),
		exit=Vector(-200,-40,10),
	},
	{
		pos=Vector(0,40,44),
		ang=Angle(0,-90,0),
		exit=Vector(-200,40,10),
	},
	{
		pos=Vector(-40,40,44),
		ang=Angle(0,-90,0),
		exit=Vector(-200,-20,10),
	},
	{
		pos=Vector(40,-40,44),
		ang=Angle(0,90,0),
		exit=Vector(-200,0,10),
	},
	{
		pos=Vector(0,-40,44),
		ang=Angle(0,90,0),
		exit=Vector(-200,20,10),
	},
	{
		pos=Vector(-40,-40,44),
		ang=Angle(0,90,0),
		exit=Vector(-240,0,10),
	},
}

ENT.Sounds={
	Start="WAC/mi17/start.wav",
	Blades="WAC/mi17/external.wav",
	Engine="WAC/mi17/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

function ENT:DrawWeaponSelection() end