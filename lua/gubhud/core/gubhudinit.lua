CustomHUD = {}

local function InitHUD()
	CustomHUD.Main = vgui.Create('HUDBase')

	CustomHUD.Ammo = vgui.Create('HUDAmmo')
	-- CustomHUD.Ammo:AlignRight(32)
	-- CustomHUD.Ammo:AlignBottom(24)
end

hook.Add("Think", "GubHUD", function()
    local ply = LocalPlayer()
    if IsValid(ply) then
        InitHUD()
        hook.Remove("Think", "GubHUD")
    end
end)