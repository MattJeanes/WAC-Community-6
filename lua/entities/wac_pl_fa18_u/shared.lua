if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base_u"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.PrintName			= "Boeing F/A-18F"
ENT.Author				= "SentryGunMan"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/sentry/fa18f.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"

ENT.TopRotorPos        = Vector(0,0,74)
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

ENT.WheelInfo={
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
function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(167,0,95),
            ExitPos=Vector(170,100,40),
            NoHud=true,
			wep={[1]=wac.aircraft.getWeapon("M134",{
				Name="M61 Vulcan",
				Ammo=578,
				MaxAmmo=578,
				NextShoot=1,
				LastShot=0,
				Gun=1,
				ShootDelay=0.013,
				func=function(self, t, p)
					if t.NextShoot <= CurTime() then
						t.Reload:Stop()
						if t.Ammo>0 then
						local ShootPos = Vector(297,0,98)

							if !t.Shooting then
								t.Shooting=true
								t.SStop:Stop()
								t.SShoot:Play()
							end

							local bullet={}
							bullet.Num 		= 1
							bullet.Src 		= self:LocalToWorld(ShootPos+Vector(self:GetVelocity():Length()*0.6,0,0))
							bullet.Dir 		= self:GetForward()
							bullet.Spread 	= Vector(0.023,0.023,0)
							bullet.Tracer		= 0
							bullet.Force		= 80
							bullet.Damage	= 200
							bullet.Attacker 	= p
							local effectdata=EffectData()
							effectdata:SetOrigin(self:LocalToWorld(ShootPos))
							effectdata:SetAngles(self:GetAngles())
							effectdata:SetScale(2.5)
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
							t.Reload:Play()
							t.Ammo=t.MaxAmmo
							t.NextShoot=CurTime()+5
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
					t.SShoot=CreateSound(self,"WAC/FA18/gun.wav")
					t.SStop=CreateSound(self,"WAC/FA18/gun_stop.wav")
					t.Reload=CreateSound(self,"WAC/FA18/reload.wav")
				end,
				Think=function(self,t,p)
					if t.NextShoot<=CurTime() then
						t.StopSounds(self,t,p)
					end
				end,
				DeSelect=function(self,t,p)
					t.StopSounds(self,t,p)
				end
			}),},
		},
        [2]={
            Pos=Vector(108,0,105),
            ExitPos=Vector(110,100,40),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
		}
	}
end
function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/FA18/Start.wav"),
		Blades=CreateSound(self.Entity,"FA18.External"),
		Engine=CreateSound(self.Entity,"FA18.Internal"),
		MissileAlert=CreateSound(self.Entity,""),
		MissileShoot=CreateSound(self.Entity,""),
		MinorAlarm=CreateSound(self.Entity,""),
		LowHealth=CreateSound(self.Entity,""),
		CrashAlarm=CreateSound(self.Entity,""),
	}
end



local function DrawLine(v1,v2)
	surface.DrawLine(v1.y,v1.z,v2.y,v2.z)
end

local mHorizon0=Material("WeltEnSTurm/WAC/Helicopter/hud_line_0")
local HudCol=Color(70,199,50,150)
local Black=Color(0,0,0,200)

mat={
	Material("WeltEnSTurm/WAC/Helicopter/hud_line_0"),
	Material("WeltEnSTurm/WAC/Helicopter/hud_line_high"),
	Material("WeltEnSTurm/WAC/Helicopter/hud_line_low"),
}

local function getspaces(n)
	if n<10 then
		n="      "..n
	elseif n<100 then
		n="    "..n
	elseif n<1000 then
		n="  "..n
	end
	return n
end

function ENT:DrawPilotHud()
	local pos = self:GetPos()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(self:GetRight(), 90)
	ang:RotateAroundAxis(self:GetForward(), 90)
	
	local uptm = self.SmoothVal
	local upm = self.SmoothUp
	local spos=self.SeatsT[1].Pos

	cam.Start3D2D(self:LocalToWorld(Vector(22,3.75,37.75)+spos), ang,0.015)
	surface.SetDrawColor(HudCol)
	surface.DrawRect(234, 247, 10, 4)
	surface.DrawRect(254, 247, 10, 4)
	surface.DrawRect(247, 234, 4, 10)
	surface.DrawRect(247, 254, 4, 10)
	
	local a=self:GetAngles()
	a.y=0
	local up=a:Up()
	up.x=0
	up=up:GetNormal()
	
	local size=180
	local dist=10
	local step=12
	for p=-180,180,step do
		if a.p+p>-size/dist and a.p+p<size/dist then
			if p==0 then
				surface.SetMaterial(mat[1])
			elseif p>0 then
				surface.SetMaterial(mat[2])
			else
				surface.SetMaterial(mat[3])
			end
			surface.DrawTexturedRectRotated(250+up.y*(a.p+p)*dist,250-up.z*(a.p+p)*dist,300,300,a.r)
		end
	end
	
	surface.SetTextColor(HudCol)
	surface.SetFont("wac_heli_small")
	
	surface.SetTextPos(80, 390) 
	surface.DrawText("SPD  "..math.floor(self:GetVelocity():Length()*0.1) .."kn")
	surface.SetTextPos(80, 425)
	local tr=util.QuickTrace(pos+self:GetUp()*10,Vector(0,0,-999999),self.Entity)
	surface.DrawText("ALT  "..math.ceil((pos.z-tr.HitPos.z)*0.01905).."m")
	
	surface.SetTextPos(260,425)
	local n=self:GetNWInt("seat_1_1_ammo")
	if n==14 and self:GetNWFloat("seat_1_1_nextshot")>CurTime() then
		n=0
	end
	surface.DrawText("M61 Vulcan"..getspaces(n))
	
	cam.End3D2D()
end

function ENT:DrawWeaponSelection() end

