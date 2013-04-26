if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategory
ENT.PrintName			= "Mil Mi-17 Hip"
ENT.Author				= "SentryGunMan, Dr. Matt"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/sentry/mi17.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/sentry/mi17_tr.mdl"
ENT.BackRotorModel    = "models/sentry/mi17_br.mdl"
ENT.BackRotorDir        = -1
ENT.TopRotorPos        = Vector(-5,0,162)
ENT.BackRotorPos        = Vector(-491.3,23,176)
ENT.RotorWidth		= 190
ENT.EngineForce        = 34
ENT.Weight            = 13000
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 0.012
ENT.SmokePos        = Vector(-84,0,110)
ENT.FirePos            = Vector(-86,0,110)

if CLIENT then
	ENT.thirdPerson = {
		distance = 660
	}
end

ENT.WheelInfo={
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

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(145,23,60),
            ExitPos=Vector(147.5,120,50),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [2]={
            Pos=Vector(145,-23,60),
            ExitPos=Vector(147.5,-120,50),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [3]={
            Pos=Vector(40,40,44),
			Ang=Angle(0,-90,0),
            ExitPos=Vector(-200,-40,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [4]={
            Pos=Vector(0,40,44),
			Ang=Angle(0,-90,0),
            ExitPos=Vector(-200,40,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
		[5]={
            Pos=Vector(-40,40,44),
			Ang=Angle(0,-90,0),
            ExitPos=Vector(-200,-20,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [6]={
            Pos=Vector(40,-40,44),
			Ang=Angle(0,90,0),
            ExitPos=Vector(-200,0,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [7]={
            Pos=Vector(0,-40,44),
			Ang=Angle(0,90,0),
            ExitPos=Vector(-200,20,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
		[8]={
            Pos=Vector(-40,-40,44),
			Ang=Angle(0,90,0),
            ExitPos=Vector(-240,0,10),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },

    }
end

function ENT:AddSounds()
    self.Sound={
        Start=CreateSound(self.Entity,"WAC/MI17/start.wav"),
        Blades=CreateSound(self.Entity,"MI17.External"),
        Engine=CreateSound(self.Entity,"MI17.Internal"),
        MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
        MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
        MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
        LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
        CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
    }
end