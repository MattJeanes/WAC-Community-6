if not wac then return end

ENT.Base = "wac_hc_base"
ENT.Type = "anim"
ENT.Author = Chippy
ENT.Category = wac.aircraft.spawnCategory
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.PrintName		= "AH-1W Super Cobra"

ENT.Model			= "models/chippy/ah1w/body.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/chippy/ah1w/mainrotor.mdl"
ENT.BackRotorModel	= "models/chippy/ah1w/tailrotor.mdl"

ENT.TopRotorPos		= Vector(-29,2,65)
ENT.TopRotorDir		= -1
ENT.BackRotorPos	= Vector(-432.5,-11.06,63)
ENT.BackRotorDir	= -1
ENT.SmokePos		= Vector(-177,0,28)
ENT.FirePos			= Vector(-177,-12,28)
ENT.ThirdPDist		= 500

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(39, 1.2, -1.3),
			ExitPos=Vector(72,70,0),
			wep={
				[1]=wac.aircraft.getWeapon("Hydra 70",{
					ShootPos={
						[1]=Vector(40.25,36.33,-20.93),
						[2]=Vector(40.25,-36.33,-20.93),
					}
				}),
			},
		},
		[2]={
			Pos=Vector(100, 1., -10),
			ExitPos=Vector(120,70,0),
			wep={
				[1]=wac.aircraft.getWeapon("No Weapon"),
				[2]=wac.aircraft.getWeapon("M197",{

		Init=function(self,t)
			self.Sound.GunSound1=CreateSound(self,"utes.wav")
			self.Sound.GunSound2=CreateSound(self,"utes.wav")
			self.Sound.GunSoundSpin=CreateSound(self,"WAC/cannon/viper_cannon_rotate.wav")
			self.Sound.GunSoundSpin:Play()
			self.Sound.GunSoundSpin:ChangePitch(0,0.1)
			self.Sound.GunSoundSpin:ChangeVolume(0,0.1)
		end,

	}),
				[3]=wac.aircraft.getWeapon("Hellfire"),
			},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"ah1w_startup.wav"),
		Blades=CreateSound(self.Entity,"ah1w_external.wav"),--"npc/attack_helicopter/aheli_rotor_loop1.wav"),
		Engine=CreateSound(self.Entity,"ah1w_internal.wav"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"ah1w_lowhealth.wav"),
		LowHealth=CreateSound(self.Entity,"ah1w_lowhealth.wav"),
		CrashAlarm=CreateSound(self.Entity,"ah1w_boom.wav"),
	}
end
