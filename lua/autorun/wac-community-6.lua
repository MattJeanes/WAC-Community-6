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

wac.aircraft.spawnCategoryU = "WAC Unbreakable"

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