if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.PrintName			= "Mil Mi-17 Hip"
ENT.Author				= "SentryGunMan, Dr. Matt"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model		= "models/sentry/mi17.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel	= "models/sentry/mi17_tr.mdl"
ENT.BackRotorModel    = "models/sentry/mi17_br.mdl"
ENT.BackRotorDir	= -1
ENT.TopRotorPos	= Vector(-5,0,162)
ENT.BackRotorPos	= Vector(-491.3,23,176)
ENT.RotorWidth		= 190
ENT.EngineForce	= 34
ENT.Weight		= 13000
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 0.012
ENT.SmokePos	= Vector(-84,0,110)
ENT.FirePos		= Vector(-86,0,110)

if CLIENT then
	ENT.thirdPerson = {
		distance = 660
	}
end

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
	Start="WAC/MI17/start.wav",
	Blades="MI17.External",
	Engine="MI17.Internal",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

function ENT:DrawWeaponSelection() end