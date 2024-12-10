
local hideHUDElements = {
	["DarkRP_HUD"] = true,
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_EntityDisplay"] = true,
	["DarkRP_ZombieInfo"] = true,
	["DarkRP_Hungermod"] = true,
	["DarkRP_Agenda"] = true,
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudSuitPower"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true,
	["CHudVoiceSelfStatus"] = true,
}

hook.Add("HUDShouldDraw", "GubHUDHideDefault", function(name)
	if hideHUDElements[name] then return false end
end)

hook.Add("HUDDrawTargetID", "GubHudDisableID", function()
	return false
end)
