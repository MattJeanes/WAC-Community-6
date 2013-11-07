if not wac then return end

ENT.Base = "wac_hc_base"
ENT.Type = "anim"
ENT.Author = "Chippy"
ENT.Category = wac.aircraft.spawnCategory
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.PrintName		= "AH-1W Super Cobra"

ENT.Model			= "models/chippy/ah1w/body.mdl"
ENT.SmokePos		= Vector(-177,0,28)
ENT.FirePos			= Vector(-177,-12,28)

ENT.TopRotor = {
	dir = -1,
	pos = Vector(-29,2,65),
	model = "models/chippy/ah1w/mainrotor.mdl"
}

ENT.BackRotor = {
	dir = -1,
	pos = Vector(-432.5,-11.06,63),
	model = "models/chippy/ah1w/tailrotor.mdl"
}

ENT.thirdPerson={
	distance = 700,
	position = Vector(0,0,50)
}

ENT.Seats = {
	{
		pos=Vector(39, 1.2, -1.3),
		exit=Vector(72,70,0),
		weapons = {"Hydra 70"},
	},
	{
		pos=Vector(100, 1, -10),
		exit=Vector(120,70,0),
		weapons = {"Hellfire", "M197"},
	},
}

ENT.Weapons = {
	["Hydra 70"] = {
		class = "wac_pod_hydra",
		info = {
			Sequential = true,
			Pods = {
				Vector(35, 45, -20),
				Vector(35, -45, -20)
			}
		}
	},
	["Hellfire"] = {
		class = "wac_pod_hellfire",
		info = {
			Pods = {
				Vector(50, 60, -20),
				Vector(50, -60, -20),
			}
		}
	},
	["M197"] = {
		class = "wac_pod_aimedgun",
		info = {
			ShootPos = Vector(110, 2, -33),
			ShootOffset = Vector(60, 0, 0),
		}
	},
}

ENT.WeaponAttachments={

	gunMount1 = {
		model = "models/BF2/helicopters/AH-1 Cobra/ah1z_g1.mdl",
		pos = Vector(107.5,0,-30.5),
		restrictPitch=true,
	},
	
	gunMount2 = {
		model = "models/BF2/helicopters/AH-1 Cobra/ah1z_g2.mdl",
		pos = Vector(111,0,-37),
		localTo = "gunMount1",
	},
	
	gun = {
		model = "models/BF2/helicopters/AH-1 Cobra/ah1z_g.mdl",
		pos = Vector(111,0,-37),
		localTo = "gunMount2",
	},
	
	radar1 = {
		model = "models/chippy/ah1w/tgp.mdl",
		pos = Vector(160,0,-15),
		restrictPitch=true
	},
	
}

ENT.Camera = {
	model = "models/props_junk/popcan01a.mdl",
	pos = Vector(160,0,-15),
	offset = Vector(-1,0,0),
	viewPos = Vector(10, 0, 0),
	maxAng = Angle(45, 90, 0),
	minAng = Angle(-2, -90, 0),
	seat = 2
}

ENT.Sounds={
	Start="wac/ah1w/startup.wav",
	Blades="wac/ah1w/external.wav",
	Engine="wac/ah1w/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="wac/ah1w/lowhealth.wav",
	LowHealth="wac/ah1w/lowhealth.wav",
	CrashAlarm="wac/ah1w/explode.wav"
}

function ENT:DrawWeaponSelection() end