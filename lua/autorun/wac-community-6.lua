if SERVER then AddCSLuaFile() end

local found=false
local f=file.Find('wac/*.lua', "LUA")
for k,v in pairs(f) do
	if v=="aircraft.lua" then
		include('wac/aircraft.lua')
		found=true
	end
end

timer.Simple(5,function()
	if not found and not WACFrame then
		if CLIENT then
			WACFrame=vgui.Create('DFrame')
			WACFrame:SetTitle("WAC is not installed")
			WACFrame:SetSize(ScrW()*0.95, ScrH()*0.95)
			WACFrame:SetPos((ScrW() - WACFrame:GetWide()) / 2, (ScrH() - WACFrame:GetTall()) / 2)
			WACFrame:MakePopup()
			
			local h=vgui.Create('DHTML')
			h:SetParent(WACFrame)
			h:SetPos(WACFrame:GetWide()*0.005, WACFrame:GetTall()*0.03)
			local x,y = WACFrame:GetSize()
			h:SetSize(x*0.99,y*0.96)
			h:SetAllowLua(true)
			h:OpenURL('http://mattjeanes.com/abyss/wac-warning.html')
		elseif SERVER then
			timer.Create("WAC-NotInstalled", 10, 0, function() print("WAC Aircraft is not installed!") end)
		end
	end
end)

if not found then return end

<<<<<<< HEAD
if wac and wac.aircraft then wac.aircraft.spawnCategoryU = "WAC Unbreakable" end

sound.Add(
{
	name = "F4.External",
	channel = CHAN_STATIC,
	soundlevel = 180,
	sound = "WAC/F4/external.wav"
})

sound.Add(
{
	name = "F4.Internal",
	channel = CHAN_STATIC,
	soundlevel = 100,
	sound = "WAC/F4/internal.wav"
})

sound.Add(
{
	name = "F16.External",
	channel = CHAN_STATIC,
	soundlevel = 180,
	sound = "WAC/F16/external.wav"
})

sound.Add(
{
	name = "F16.Internal",
	channel = CHAN_STATIC,
	soundlevel = 100,
	sound = "WAC/F16/internal.wav"
})

sound.Add(
{
	name = "MI17.External",
	channel = CHAN_STATIC,
	soundlevel = 180,
	sound = "WAC/MI17/external.wav"
})

sound.Add(
{
	name = "MI17.Internal",
	channel = CHAN_STATIC,
	soundlevel = 100,
	sound = "WAC/MI17/internal.wav"
})

sound.Add(
{
	name = "FA18.External",
	channel = CHAN_STATIC,
	soundlevel = 180,
	sound = "WAC/FA18/external.wav"
})

sound.Add(
{
	name = "FA18.Internal",
	channel = CHAN_STATIC,
	soundlevel = 100,
	sound = "WAC/FA18/internal.wav"
})

sound.Add(
{
	name = "AH1W.External",
	channel = CHAN_STATIC,
	soundlevel = 180,
	sound = "WAC/ah1w/ah1w_external.wav"
})

sound.Add(
{
	name = "AH1W.Internal",
	channel = CHAN_STATIC,
	soundlevel = 100,
	sound = "WAC/ah1w/ah1w_internal.wav"
})

sound.Add(
{
	name = "FW190.External",
	channel = CHAN_STATIC,
	soundlevel = 110,
	sound = "WAC/fw190/external.wav"
})

sound.Add(
{
	name = "FW190.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/fw190/internal.wav"
})
=======
wac.aircraft.spawnCategoryU = "WAC Unbreakable"
>>>>>>> beta
