local gubhudbase = {}

local theme = gubhudconfig.theme

function gubhudbase:Init()


    local micicon = theme.mic
    local micmute = theme.micmute

    local heart = theme.heart
    local shield = theme.shield
    local gunl = theme.gunlicense
    local wanted = theme.wanted

    
    local pPlayer = LocalPlayer()
    local humod = not DarkRP.disabledDefaults["modules"]["hungermod"]


    -- local basebg = vgui.Create("DPanel")
    -- basebg:SetSize(ScrW(), (ScrH() * 0.04) + 6)
    -- basebg:AlignBottom(7)
    -- basebg.Paint = function(self2, w, h)
    --     draw.RoundedBox(0, 0, 0, w, h, theme.secondarycolor)
    -- end

    -- local base = vgui.Create("DPanel")
    -- base:SetSize(ScrW(), ScrH() * 0.04)
    -- base:AlignBottom(10)
    -- base.Paint = function(self2, w, h)
    --     draw.RoundedBox(0, 0, 0, w, h, theme.primarycolor)
    -- end
    
    
    -- local main = vgui.Create("Panel", base)
    -- main:Dock(LEFT)
    -- main:SetWide(70)
    --  main.Paint = function(self, w, h)
    --      draw.RoundedBox(0, 0, 0, w, h, theme.primarycolor)
    -- end

    -- local avback = vgui.Create("Panel")
    -- avback:SetSize(100, 100)
    -- avback:AlignBottom(110)
    -- avback:AlignLeft(-10)
    -- avback.Paint = function(self, w, h)
    --     -- draw.RoundedBox(0, 0, 0, w, h, theme.secondarycolor)
    --     local x = (avback:GetWide() / 2)
    --     local y = (avback:GetTall() / 2)

    --     local scalex = avback:GetWide() / 3
    --     local scaley = avback:GetWide() / 3

    --     local gubhudtri = {


    --         {x = x + 15, y = y - 30},
        
    --         { x = x + 30, y = y },
    --         { x = x + 15, y = y + 30 },
    --         { x = x - 15, y = y + 30 },
        
    --         {x = x - 30, y = y},
        
    --         {x = x - 15, y = y - 30},
        
    --     }

    --     local gubhudtrii = {


    --         {x = x + 15 - 3, y = y - 30 + 3},
        
    --         { x = x + 30 - 4, y = y },
    --         { x = x + 15 - 3, y = y + 30 - 3 },
    --         { x = x - 15 + 3, y = y + 30 - 3 },
        
    --         {x = x - 30 + 4, y = y},
        
    --         {x = x - 15 + 3, y = y - 30  + 3},
        
    --     }

    --     local hp2 = 0

    --     local hp = pPlayer:Health() or 0
    --     hp2 = Lerp(10 * FrameTime(), hp2, hp)

    --     local tri = gubhudtri
    --     surface.SetDrawColor( theme.secondarycolor )
    --     draw.NoTexture()
    --     surface.DrawPoly( gubhudtri )
    --     surface.SetDrawColor( theme.primarycolor )
    --     surface.DrawPoly( gubhudtrii )

    --     surface.SetMaterial(heart)
    --     surface.SetDrawColor( Color(55 + 2 * hp, 0, 0) )

    --     surface.DrawTexturedRect(x - 16, y - 16, 32, 32)

    -- end

    -- local avback2 = vgui.Create("Panel")
    -- avback2:SetSize(100, 100)
    -- avback2:AlignBottom(30)
    -- avback2:AlignLeft(-10)
    -- avback2.Paint = function(self, w, h)
    --     -- draw.RoundedBox(0, 0, 0, w, h, theme.secondarycolor)
    --     local x = (avback2:GetWide() / 2) + 1
    --     local y = 30

    --     local scalex = avback2:GetWide() / 3
    --     local scaley = avback2:GetWide() / 3

    --     local gubhudtri = {


    --         {x = x + 15, y = y - 30},
        
    --         { x = x + 30, y = y },
    --         { x = x + 15, y = y + 30 },
    --         { x = x - 15, y = y + 30 },
        
    --         {x = x - 30, y = y},
        
    --         {x = x - 15, y = y - 30},
        
    --     }

    --     local gubhudtrii = {


    --         {x = x + 15 - 3, y = y - 30 + 3},
        
    --         { x = x + 30 - 4, y = y },
    --         { x = x + 15 - 3, y = y + 30 - 3 },
    --         { x = x - 15 + 3, y = y + 30 - 3 },
        
    --         {x = x - 30 + 4, y = y},
        
    --         {x = x - 15 + 3, y = y - 30  + 3},
        
    --     }
    --     local ap2 = 0

    --     local ap = pPlayer:Armor() or 0
    --     ap2 = Lerp(10 * FrameTime(), ap2, ap)

    --     local tri = gubhudtri
    --     surface.SetDrawColor(theme.secondarycolor)
    --     draw.NoTexture()
    --     surface.DrawPoly( gubhudtri )
    --     surface.SetDrawColor( theme.primarycolor )
    --     surface.DrawPoly( gubhudtrii )

    --     surface.SetMaterial(shield)
    --     surface.SetDrawColor( Color(0, 0, 55 + 2 * ap) )

    --     surface.DrawTexturedRect(x - 16, y - 16, 32, 32)

    -- end

    -- local avback3 = vgui.Create("Panel")
    -- avback3:SetSize(100, 100)
    -- avback3:AlignBottom(10)
    -- avback3:AlignLeft(-10)
    -- avback3.Paint = function(self, w, h)
    --     -- draw.RoundedBox(0, 0, 0, w, h, theme.secondarycolor)
    --     local x = (avback3:GetWide() / 2) + 1
    --     local y = (avback3:GetTall() / 2) + 20

    --     local scalex = avback3:GetWide() / 3
    --     local scaley = avback3:GetWide() / 3

    --     local gubhudtri = {


    --         {x = x + 15, y = y - 30},
        
    --         { x = x + 30, y = y },
    --         { x = x + 15, y = y + 30 },
    --         { x = x - 15, y = y + 30 },
        
    --         {x = x - 30, y = y},
        
    --         {x = x - 15, y = y - 30},
        
    --     }

    --     local gubhudtrii = {


    --         {x = x + 15 - 3, y = y - 30 + 3},
        
    --         { x = x + 30 - 4, y = y },
    --         { x = x + 15 - 3, y = y + 30 - 3 },
    --         { x = x - 15 + 3, y = y + 30 - 3 },
        
    --         {x = x - 30 + 4, y = y},
        
    --         {x = x - 15 + 3, y = y - 30  + 3},
        
    --     }

    --     local tri = gubhudtri
    --     surface.SetDrawColor( theme.secondarycolor )
    --     draw.NoTexture()
    --     surface.DrawPoly( gubhudtri )
    --     surface.SetDrawColor( theme.primarycolor )
    --     surface.DrawPoly( gubhudtrii )

    --     if LocalPlayer():IsSpeaking() then
    --         surface.SetMaterial(micicon)
    --     else
    --         surface.SetMaterial(micmute)
    --     end
    --     surface.SetDrawColor(theme.white)

    --     surface.DrawTexturedRect(x - 16, y - 16, 32, 32)

    -- end


    -- local avback4 = vgui.Create("Panel")
    -- avback4:SetSize(100, 100)
    -- avback4:AlignBottom(70)
    -- avback4:AlignLeft(50)
    -- avback4.Paint = function(self, w, h)
    --     -- draw.RoundedBox(0, 0, 0, w, h, theme.secondarycolor)
    --     local x = (avback4:GetWide() / 2) - 15
    --     local y = (avback4:GetTall() / 2) - 10

    --     local scalex = avback4:GetWide() / 3
    --     local scaley = avback4:GetWide() / 3

    --     local gubhudtri = {


    --         {x = x + 15, y = y - 30},
        
    --         { x = x + 30, y = y },
    --         { x = x + 15, y = y + 30 },
    --         { x = x - 15, y = y + 30 },
        
    --         {x = x - 30, y = y},
        
    --         {x = x - 15, y = y - 30},
        
    --     }

    --     local gubhudtrii = {


    --         {x = x + 15 - 3, y = y - 30 + 3},
        
    --         { x = x + 30 - 4, y = y },
    --         { x = x + 15 - 3, y = y + 30 - 3 },
    --         { x = x - 15 + 3, y = y + 30 - 3 },
        
    --         {x = x - 30 + 4, y = y},
        
    --         {x = x - 15 + 3, y = y - 30  + 3},
        
    --     }



    --     local tri = gubhudtri
    --     surface.SetDrawColor( theme.secondarycolor )
    --     draw.NoTexture()
    --     surface.DrawPoly( gubhudtri )
    --     surface.SetDrawColor( theme.primarycolor )
    --     surface.DrawPoly( gubhudtrii )

    --     surface.SetMaterial(gunl)

    --     if LocalPlayer():getDarkRPVar("HasGunlicense") == true then
    --         surface.SetDrawColor(theme.white)
    --     else
    --         surface.SetDrawColor(Color(100, 100, 100))
    --     end
    --     surface.DrawTexturedRect(x - 16, y - 16, 32, 32)

    -- end

    -- local avback5 = vgui.Create("Panel")
    -- avback5:SetSize(100, 100)
    -- avback5:AlignBottom(10)
    -- avback5:AlignLeft(50)
    -- avback5.Paint = function(self, w, h)
    --     -- draw.RoundedBox(0, 0, 0, w, h, theme.secondarycolor)
    --     local x = (avback5:GetWide() / 2) - 15
    --     local y = (avback5:GetTall() / 2) - 10

    --     local scalex = avback5:GetWide() / 3
    --     local scaley = avback5:GetWide() / 3

    --     local gubhudtri = {


    --         {x = x + 15, y = y - 30},
        
    --         { x = x + 30, y = y },
    --         { x = x + 15, y = y + 30 },
    --         { x = x - 15, y = y + 30 },
        
    --         {x = x - 30, y = y},
        
    --         {x = x - 15, y = y - 30},
        
    --     }

    --     local gubhudtrii = {


    --         {x = x + 15 - 3, y = y - 30 + 3},
        
    --         { x = x + 30 - 4, y = y },
    --         { x = x + 15 - 3, y = y + 30 - 3 },
    --         { x = x - 15 + 3, y = y + 30 - 3 },
        
    --         {x = x - 30 + 4, y = y},
        
    --         {x = x - 15 + 3, y = y - 30  + 3},
        
    --     }



    --     local tri = gubhudtri
    --     surface.SetDrawColor( theme.secondarycolor )
    --     draw.NoTexture()
    --     surface.DrawPoly( gubhudtri )
    --     surface.SetDrawColor( theme.primarycolor )
    --     surface.DrawPoly( gubhudtrii )

    --     surface.SetMaterial(wanted)

    --     if LocalPlayer():getDarkRPVar("wanted") == true then
    --         surface.SetDrawColor(theme.white)
    --     else
    --         surface.SetDrawColor(Color(100, 100, 100))
    --     end
    --     surface.DrawTexturedRect(x - 16, y - 16, 32, 32)

    -- end

    -- local av = vgui.Create("AvatarImage", avback)
    -- av:SetPlayer(LocalPlayer(), 64)
    -- av:Dock(TOP)
    -- av:DockMargin(3, 3, 3, 0)
    -- av:SetSize(64, 64)

    -- local stats = vgui.Create("Panel", base)
    -- stats:Dock(LEFT)
    -- stats:DockMargin(0, 0, 0, 0)
    -- stats:SetSize(320, 0)
    -- stats.Paint = function(self, w, h)
    --     draw.RoundedBox(0, 0, 0, w, h, Color(190, 190, 190))
    -- end

    -- local hptext = vgui.Create("DPanel", base)
    -- local healthtext = pPlayer:Health() .. "/" .. pPlayer:GetMaxHealth()
    -- surface.SetFont("gubfont_secondary_20")
    -- local hptextx, hptexty = surface.GetTextSize(healthtext)
    -- hptext:Dock(LEFT)
    -- hptext:SetSize(hptextx + 5, hptexty)
    -- hptext.Paint = function(s, w, h)

    --     local hptxt = pPlayer:Health() .. "/" .. pPlayer:GetMaxHealth()

    --     draw.SimpleText(hptxt, "gubfont_secondary_20", 1, base:GetTall() / 2, theme.primarytextcol, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

       
        
    -- end
    
    local hpBar = vgui.Create("Panel")
    hpBar:SetSize(ScrW() * 0.0085, 100)
    hpBar:AlignBottom(10)
    hpBar:AlignLeft(10)

    local pHp = 0

    hpBar.Paint = function(s, w, h)

        local pulse = math.abs(math.sin(CurTime() * 2)) * 150

        local hpCol
        local hp = pPlayer:Health() or 0
        pHp = Lerp(10 * FrameTime(), pHp, hp)

        if hp <= 50 then
            hpCol = Color(55 + 2 *  (100 - hp), 55 + 2 * hp, 50, 70 + pulse)
        else
            hpCol = Color(55 + 2 *  (100 - hp), 55 + 2 * hp, 50, 255)
        end

        draw.RoundedBox(360, 0, 0, ScrW() * 0.0085, math.Clamp(pHp, 0, 100), hpCol)
    end

    local apBar = vgui.Create("Panel")
    apBar:SetSize(ScrW() * 0.0085, 100)
    apBar:AlignBottom(10)
    apBar:AlignLeft(((ScrW() * 0.00085) + (ScrW() * 0.00085)) + 30)

    local pAp = 0

    apBar.Paint = function(s, w, h)

        local ap = pPlayer:Armor() or 0
        pAp = Lerp(10 * FrameTime(), pAp, ap)

        draw.RoundedBox(360, 0, 0, ScrW() * 0.0085, math.Clamp(pAp, 0, 100), Color(0, 0, 55 + 2 * ap))
    end
    -- local hpbar = vgui.Create("Panel", base)
    -- hpbar:SetSize(120, 88)
    -- hpbar:Dock(LEFT)
    -- hpbar:DockPadding(9, 9, 0, 9)
    -- local hp2 = 0

    -- hpbar.Paint = function(self, w, h)


    --     local hp = pPlayer:Health() or 0
    --     hp2 = Lerp(10 * FrameTime(), hp2, hp)

    --     draw.SimpleTextOutlined("Health", "gubfont_20", hpbar:GetWide() / 2, 7, theme.white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, theme.secondarycolor)

        
    --     draw.RoundedBox(0, 0, base:GetTall() / 2, 119, base:GetTall() / 2, Color(64, 64, 64))
        
    --     draw.RoundedBox(0, 0, base:GetTall() / 2, math.Clamp(hp2, 0, 100) * 1.2, base:GetTall() / 2, Color(55 + 2 *  (100 - hp), 55 + 2 * hp, 50, 150))

    -- end

    -- local seg1 = vgui.Create("Panel", base)
    -- seg1:Dock(LEFT)
    -- seg1:SetWide(3)
    -- seg1.Paint = function(self, w, h)
    --     draw.RoundedBox(0, 0, 0, w, h, theme.secondarycolor)
    -- end

    -- local aptext = vgui.Create("DPanel", base)
    -- local armortext = "100/" .. pPlayer:GetMaxArmor()
    -- surface.SetFont("gubfont_secondary_20")
    -- local aptextx, aptexty = surface.GetTextSize(armortext)
    -- aptext:Dock(LEFT)
    -- aptext:SetSize(aptextx + 5, aptexty)
    -- aptext.Paint = function(s, w, h)

    --     local aptxt = pPlayer:Armor() .. "/" .. pPlayer:GetMaxArmor()

    --     draw.SimpleText(aptxt, "gubfont_secondary_20", 1, base:GetTall() / 2, theme.primarytextcol, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

       
        
    -- end

    -- local apbar = vgui.Create("Panel", base)
    -- apbar:SetSize(120, 88)
    -- apbar:Dock(LEFT)
    -- apbar:DockPadding(9, 9, 0, 9)
    -- local ap2 = 0

    -- apbar.Paint = function(self, w, h)


    --     local ap = pPlayer:Armor() or 0
    --     ap2 = Lerp(10 * FrameTime(), ap2, ap)

    --     draw.SimpleTextOutlined("Armor", "gubfont_20", apbar:GetWide() / 2, 7, theme.white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, theme.secondarycolor)

        
    --     draw.RoundedBox(0, 0, base:GetTall() / 2, 119, base:GetTall() / 2, Color(64, 64, 64))

    --     draw.RoundedBox(0, 0, base:GetTall() / 2, math.Clamp(ap2, 0, 100) * 1.2, base:GetTall() / 2, Color(55 + 2 *  (100 - ap), 50, 55 + 2 * ap, 150))

    -- end

    -- if humod then
    --     local hubar = vgui.Create("Panel", base)
    --     hubar:SetSize(120, 88)
    --     hubar:Dock(LEFT)
    --     hubar:DockPadding(9, 9, 0, 9)
    --     local hu2 = 0

    --     hubar.Paint = function(self, w, h)


    --         local hu = pPlayer:Armor() or 0
    --         hu2 = Lerp(10 * FrameTime(), hu2, hu)

    --         draw.SimpleTextOutlined("Armor", "gubfont_primary_20", hubar:GetWide() / 2, 7, theme.white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, theme.secondarycolor)

            
    --         draw.RoundedBox(0, 0, base:GetTall() / 2, 119, base:GetTall() / 2, Color(64, 64, 64))

    --         draw.RoundedBox(0, 0, base:GetTall() / 2, math.Clamp(hu2, 0, 100) * 1.2, base:GetTall() / 2, Color(50, 55 + 2 *  (100 - hu), 55 + 2 * hu, 150))
    --     end

    --     local seghu = vgui.Create("Panel", base)
    --     seghu:Dock(LEFT)
    --     seghu:SetWide(3)
    --     seghu.Paint = function(self, w, h)
    --         draw.RoundedBox(0, 0, 0, w, h, secondarycolor)
    --     end

    -- end
    

    -- local pPlayerinfo = vgui.Create("Panel")
    -- pPlayerinfo:AlignBottom(50)
    -- pPlayerinfo:SetX(72)
    -- pPlayerinfo:SetWide(ScrW(), 20)
    -- pPlayerinfo.Paint = function(self, w, h)
    --     local nick = pPlayer:getDarkRPVar("rpname")
    --     local job = pPlayer:getDarkRPVar("job")
    --     local salary = pPlayer:getDarkRPVar("salary")

    --     draw.SimpleTextOutlined(nick .. " | " .. job .. " (" .. DarkRP.formatMoney(math.Round(salary)) .. ")", "gubfont_primary_20", 0, 0, theme.white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 1, theme.secondarycolor)
    
    --     if LocalPlayer():IsSpeaking() then
    --         surface.SetMaterial(micicon)
    --     else
    --         surface.SetMaterial(micmute)
    --     end

    --     local infox, infoy = surface.GetTextSize(nick .. " | " .. job .. " (" .. DarkRP.formatMoney(math.Round(salary)) .. ")")


    --     surface.DrawTexturedRect(infox + 20, 0, 20, 20)
    -- end

    



    -- local pPlayernick = vgui.Create("DLabel", pPlayerinfo)
    -- //pPlayernick:Dock(LEFT)

    -- pPlayernick:Dock(LEFT)
    -- pPlayernick:DockMargin(72, 0, 0, 0)
    -- pPlayernick:AlignBottom(50)
    -- pPlayernick:SetText(pPlayer:Nick() .. " | " .. pPlayer:getDarkRPVar("job") .. " (" .. DarkRP.formatMoney(math.Round(pPlayer:getDarkRPVar("salary"))) .. ")")
    -- pPlayernick:SetFont("gubfont_20")
    -- pPlayernick:SetExpensiveShadow(1, gubhudconfig.primarycolor)
    -- pPlayernick:SetTextColor(Color(255, 255, 255))
    -- pPlayernick:DockMargin(0, 0, 5, 0)


    -- local seg2 = vgui.Create("Panel", base)
    -- seg2:Dock(LEFT)
    -- seg2:SetWide(3)
    -- seg2.Paint = function(self, w, h)
    --     draw.RoundedBox(0, 0, 0, w, h, theme.secondarycolor)
    -- end

    -- local pPlayercash2 = 0


    -- local cashbg = vgui.Create("DPanel", base)
    -- cashbg:Dock(LEFT)
    -- //cashbg:SetSize(pPlayercashx, 0)
    -- cashbg.Paint = function(self, w, h)

    --     local pPlayercash = pPlayer:getDarkRPVar("money") or 0
    --     local pPlayercashx, pPlayercashy = surface.GetTextSize(DarkRP.formatMoney(math.Round(pPlayercash)))
    --     pPlayercash2 = Lerp(10 * FrameTime(), pPlayercash2, pPlayercash)
    --     cashbg:SetWide(pPlayercashx + 5)
        
        
    --     draw.SimpleTextOutlined("Cash", "gubfont_primary_20", cashbg:GetWide() / 2, 7, theme.white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, theme.secondarycolor)

    --     -- draw.RoundedBox(0, 0, base:GetTall() / 2, w, h, gubhudconfig.secondarycolor)
        
    --     draw.SimpleTextOutlined(DarkRP.formatMoney(math.Round(pPlayercash)), "gubfont_secondary_20", 1, base:GetTall() * 0.7, theme.white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, theme.secondarycolor)
    -- end


    -- local seg3 = vgui.Create("Panel", base)
    -- seg3:Dock(LEFT)
    -- seg3:SetWide(3)
    -- seg3.Paint = function(self, w, h)
    --     draw.RoundedBox(0, 0, 0, w, h, theme.secondarycolor)
    --     base:SetWide(main:GetWide() + hptext:GetWide() + seg1:GetWide() + aptext:GetWide() + seg2:GetWide() + cashbg:GetWide() + seg3:GetWide())
    --     basebg:SetWide(base:GetWide() + 1)
    -- end


end

-- hook.Add("HUDPaint", "gubhudmain", Base)



vgui.Register("HUDBase", gubhudbase, "Panel")