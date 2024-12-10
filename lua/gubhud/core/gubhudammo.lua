local wep, total, clip, wepname

local theme = gubhudconfig.theme

local gubhudammo = {}

function gubhudammo:Init()
    local ply = LocalPlayer()
    if !IsValid(ply:GetActiveWeapon()) then return end
    wep = ply:GetActiveWeapon()
    clip = wep:Clip1()
    total = ply:GetAmmoCount(wep:GetPrimaryAmmoType())


    ammobg = vgui.Create("Panel")
    ammobg:SetSize(100, 100)
    ammobg:AlignBottom(10)
    ammobg:AlignRight(-10)
    -- ammobg:SetPos(ScrW() + 10, ScrH() - 49)
    ammobg:SetVisible(true)
    ammobg.Paint = function(self, w, h)
        local x = (ammobg:GetWide() / 2)
        local y = (ammobg:GetTall() / 2)

        local scalex = ammobg:GetWide() / 3
        local scaley = ammobg:GetWide() / 3

        local gubhudtri = {


            {x = x + 15, y = y - 30},
        
            { x = x + 30, y = y },
            { x = x + 15, y = y + 30 },
            { x = x - 15, y = y + 30 },
        
            {x = x - 30, y = y},
        
            {x = x - 15, y = y - 30},
        }

        local gubhudtrii = {


            {x = x + 15 - 3, y = y - 30 + 3},
        
            { x = x + 30 - 4, y = y },
            { x = x + 15 - 3, y = y + 30 - 3 },
            { x = x - 15 + 3, y = y + 30 - 3 },
        
            {x = x - 30 + 4, y = y},
        
            {x = x - 15 + 3, y = y - 30  + 3},
        
        }

        surface.SetDrawColor( theme.secondarycolor )
        draw.NoTexture()
        surface.DrawPoly( gubhudtri )
        surface.SetDrawColor( theme.primarycolor )
        surface.DrawPoly( gubhudtrii )

        surface.SetDrawColor(theme.secondarycolor)
        surface.DrawLine(x - 30, y, x + 29, y)

        draw.SimpleText(total, "gubfont_primary_20", x, y + 10, theme.primarytextcol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText(clip, "gubfont_primary_20", x, y - 10, theme.primarytextcol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    end

    hook.Add("Tick", "gubHudTick", function()

        if LocalPlayer():Alive() and IsValid(LocalPlayer():GetActiveWeapon()) then
            
            local pPlayer = LocalPlayer()
            local pWep = pPlayer:GetActiveWeapon()
            local pTotal = pPlayer:GetAmmoCount(pWep:GetPrimaryAmmoType())
            local pClip = pWep:Clip1()

            if (pClip == -1) or (pClip == nil) or (pWep:GetClass() == "weapon_physcannon") then
                clip = "∞"
            else
                clip = pClip
            end

            if (pTotal == nil) or (pWep:GetClass() == "weapon_physcannon") or (pTotal == -1) then
                total = "∞"
            elseif pTotal ~= -1 then
                total = pTotal
            end
        end

        surface.SetFont("gubfont_primary_20")

        local clipX, clipY = surface.GetTextSize(clip)
        local totalX, totalY = surface.GetTextSize(total)

    end)



    
    -- hook.Add("Tick", "gubHudTick", function()

        
    --     if LocalPlayer():Alive() and IsValid(LocalPlayer():GetActiveWeapon()) then

    --         local ply2 = LocalPlayer()
    --         local wep2 = ply2:GetActiveWeapon()
    --         local total2 = ply2:GetAmmoCount(wep2:GetPrimaryAmmoType())
    --         local clip2 = wep2:Clip1()
    --         local wepname2 = wep2:GetPrintName()

    --         wepname = LocalPlayer():GetActiveWeapon():GetPrintName()
            
    --         if LocalPlayer():GetActiveWeapon():Clip1() == -1 then
    --             clip = "∞"
    --         else
    --             clip = LocalPlayer():GetActiveWeapon():Clip1()
    --         end

    --         if (ply2:GetAmmoCount(wep2:GetPrimaryAmmoType()) == nil) or (wep2:GetClass() == "weapon_physcannon") then
    --             total = "∞"
    --         elseif ply2:GetAmmoCount(wep2:GetPrimaryAmmoType()) ~= -1 then
    --             total = ply2:GetAmmoCount(wep2:GetPrimaryAmmoType())
    --         end

    --         -- if ply2:GetAmmoCount(wep2:GetPrimaryAmmoType()) ~= -1 then
    --         --     total = ply2:GetAmmoCount(wep2:GetPrimaryAmmoType())
    --         -- elseif (ply2:GetAmmoCount(wep2:GetPrimaryAmmoType()) == nil) or (wep2:GetClass() == "weapon_physcannon") then
    --         --     total = "∞"
    --         -- end

    --         -- if LocalPlayer():GetAmmoCount()(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()) == -1 then
    --         --     total = "∞"
    --         -- else
    --         --     total = LocalPlayer():GetAmmoCount()(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType())
    --         -- end
    --     else
    --         wepname = "N/A"
    --     end

    --     surface.SetFont("gubfont_primary_20")
        
    --     local clipx, clipy = surface.GetTextSize(clip)
    --     local wepnamex, wepnamey = surface.GetTextSize(wepname)
    --     local totalx, totaly = surface.GetTextSize(" / " .. total)


    --     if not LocalPlayer():Alive() then
    --         ammobg:MoveTo(ScrW() + 10, ScrH() - 49, 0.5, 0, 0.1)
    --         return
    --     end
    --     ammobg:MoveTo(ScrW() - ammobg:GetWide(), ScrH() - 49, 0.5, 0, 0.1)

    -- end)




    

    

    

end
    -- ply = LocalPlayer()
    -- if !IsValid(ply:GetActiveWeapon()) then return end
    -- wep = ply:GetActiveWeapon()
    -- total = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
    -- clip = wep:Clip1()
    -- wepname = wep:GetPrintName()

    -- if clip < 0 or wep:GetClass() == "weapon_physcannon" then return end

    -- draw.RoundedBoxEx(125, ScrW() - 210, ScrH() - 79, 210, 68, gubhudconfig.primarycolor, false, false, true, false)

    -- draw.SimpleText(clip, "gubfont_20", ScrW() - 160, ScrH() - 75, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    -- draw.SimpleText("/", "gubfont_20", ScrW() - 120, ScrH() - 75, Color(255, 255, 255), TEXT_ALIGN_CENTER)

    -- if total > gubhudconfig.maxammodisplay then
    --     draw.SimpleText(gubhudconfig.maxammodisplay .. "+", "gubfont_20", ScrW() - 60, ScrH() - 75, Color(255, 255, 255), TEXT_ALIGN_CENTER)
	-- else
    -- 	draw.SimpleText(total, "gubfont_20", ScrW() - 60, ScrH() - 75, Color(255, 255, 255), TEXT_ALIGN_CENTER)
	-- end

    -- draw.SimpleText("Clip", "gubfont_20", ScrW() - 160, ScrH() - 32, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    -- draw.SimpleText("Reserved", "gubfont_20", ScrW() - 60, ScrH() - 32, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    
    -- draw.RoundedBoxEx(125, ScrW() - 210, ScrH() - 95, 210, 20, gubhudconfig.secondarycolor, true, false, false, false)
    -- draw.SimpleText(wepname, "gubfont_20", ScrW() - 110, ScrH() - 95, Color(255, 255, 255), TEXT_ALIGN_CENTER)


-- hook.Add("HUDPaint", "GubHUDAmmo", Ammo)


vgui.Register("HUDAmmo", gubhudammo, "Panel")
