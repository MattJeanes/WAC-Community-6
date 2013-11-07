if not wac then return end
if SERVER then AddCSLuaFile() end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategory
ENT.PrintName			= "Fw 190A-5 Würger"
ENT.Author				= "Chippy"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

<<<<<<< HEAD
ENT.Model            = "models/chippy/fw190/body.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/chippy/fw190/prop.mdl"
ENT.TopRotorPos        = Vector(121.5,5,25)
=======
ENT.AutomaticFrameAdvance = true // needed for gear anims

ENT.Model            = "models/chippy/fw190/body.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/chippy/fw190/prop.mdl"
ENT.rotorPos        = Vector(121.5,5,25)
>>>>>>> beta
ENT.TopRotorDir        = 1

ENT.EngineForce        = 345
ENT.Weight            = 9130
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul		= 0.0257
ENT.SmokePos        = Vector(110,5,40.1)
<<<<<<< HEAD
ENT.FirePos            = Vector(110,5,40.1)
=======
ENT.FirePos			= Vector(110,5,40.1)
>>>>>>> beta

if CLIENT then
	ENT.thirdPerson = {
		distance = 250
	}
end

<<<<<<< HEAD
ENT.WheelInfo={
=======
ENT.Wheels={
>>>>>>> beta
	{
		mdl="models/chippy/fw190/bwheel.mdl",
		pos=Vector(-151,5,9),
		friction=3,
		mass=900,
	},
	{
		mdl="models/chippy/fw190/fwheel.mdl",
		pos=Vector(71,65,-31),
		friction=0,
		mass=600,
	},
	{
		mdl="models/chippy/fw190/fwheel.mdl",
		pos=Vector(71,-56,-31),
		friction=0,
		mass=600,
	},
}

<<<<<<< HEAD

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(0,3.4,20.3),
            ExitPos=Vector(3.5,60,100),
            NoHud=true,
			wep={[1]=wac.aircraft.getWeapon("M134",{
				Name="MG17",
				Ammo=1500,
				MaxAmmo=1500,
				NextShoot=1,
				LastShot=0,
				Gun=1,
				ShootDelay=0.02,
				func=function(self, t, p)
					if t.NextShoot <= CurTime() then
						if t.Ammo>0 then
							if !t.Shooting then
								t.Shooting=true
								t.SStop:Stop()
								t.SShoot:Play()
							end
							local Positions = { Vector(75,-2,51), Vector(75,-2,51), Vector(75,8,51),Vector(75,8,51), Vector(75,37,17), Vector(75,-29,17) } 
							local ShootPos = table.Random( Positions )

							local bullet={}
							bullet.Num 		= 1
							bullet.Src 		= self:LocalToWorld(ShootPos+Vector(self:GetVelocity():Length()*0.6,0,0))
							bullet.Dir 		= self:GetForward()
							bullet.Spread 	= Vector(0.02,0.02,0)
							bullet.Tracer		= 10
							bullet.Force		= 1000000000000000000000000000
							bullet.Damage	= 150
							bullet.Attacker 	= p
							local effectdata=EffectData()
							effectdata:SetOrigin(self:LocalToWorld(ShootPos))
							effectdata:SetAngles(self:GetAngles())
							effectdata:SetScale(0.7)
							util.Effect("MuzzleEffect", effectdata)
							self.Entity:FireBullets(bullet)
							t.Gun=(t.Gun==1 and 2 or 1)
							t.Ammo=t.Ammo-1
							t.LastShot=CurTime()
							t.NextShoot=t.LastShot+t.ShootDelay
							local ph=self:GetPhysicsObject()
							if ph:IsValid() then
								ph:AddAngleVelocity(Vector(0,0,t.Gun==1 and 3 or -3))
							end
						end
						if t.Ammo<=0 then
							t.StopSounds(self,t,p)
							t.Ammo=t.MaxAmmo
							t.NextShoot=CurTime()+60
						end
					end
				end,
				StopSounds=function(self,t,p)
					if t.Shooting then
						t.SShoot:Stop()
						t.SStop:Play()
						t.Shooting=false
					end
				end,
				Init=function(self,t)
					t.SShoot=CreateSound(self,"wac/fw190/shoot_start.wav")
					t.SStop=CreateSound(self,"wac/fw190/shoot_end.wav")
				end,
				Think=function(self,t,p)
					if t.NextShoot<=CurTime() then
						t.StopSounds(self,t,p)
					end
				end,
				DeSelect=function(self,t,p)
					t.StopSounds(self,t,p)
				end
			}),	
		
			},
		},
	}
end


function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"wac/fw190/Start.wav"),
		Blades=CreateSound(self.Entity,"FW190.External"),
		Engine=CreateSound(self.Entity,"FW190.Internal"),
		MissileAlert=CreateSound(self.Entity,""),
		MissileShoot=CreateSound(self.Entity,""),
		MinorAlarm=CreateSound(self.Entity,""),
		LowHealth=CreateSound(self.Entity,""),
		CrashAlarm=CreateSound(self.Entity,""),
	}
end

function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end
=======
ENT.Seats = {
	{
		pos=Vector(0,3.4,20.3),
		exit=Vector(3.5,60,100),
		weapons={"MG17"},
	},
}

ENT.Weapons = {
	["MG17"] = {
		class = "wac_pod_gatling",
		info = {
			Pods = {
				Vector(75,-2,51),
				Vector(75,8,51),
				Vector(75,37,17),
				Vector(75,-29,17)
			},
			FireRate = 900,
			Ammo = 1500,
			Sequential = true,
			Sounds = {
				shoot = "wac/fw190/shoot_start.wav",
				stop = "wac/fw190/shoot_end.wav",
			},
		}
	}
}

ENT.Sounds = {
	Start="wac/fw190/Start.wav",
	Blades="wac/fw190/external.wav",
	Engine="wac/fw190/internal.wav",
	MissileAlert="",
	MissileShoot="",
	MinorAlarm="",
	LowHealth="",
	CrashAlarm=""
}

function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end
>>>>>>> beta
