
-- local active = {}

-- local theme = gubhudconfig.theme

-- local icontypes = {}
-- icontypes[ 0 ] = { icon = Material("gubhud/os_ui_hint.png"), color = nil }
-- icontypes[ 1 ] = { icon = Material("gubhud/os_ui_error.png"), color = nil }
-- icontypes[ 2 ] = { icon = Material("gubhud/os_ui_undo.png"), color = nil }
-- icontypes[ 3 ] = { icon = Material("gubhud/os_ui_generic.png"), color = nil }
-- icontypes[ 4 ] = { icon = Material("gubhud/os_ui_cleanup.png"), color = nil }

-- function notification.AddLegacy(text, type, time)
--     gubhud.PrepareNotification(text, type, time)
-- end

-- function gubhud.PrepareNotification(text, type, time)
--     local scrw, scrh = ScrW(), ScrH()
--     surface.SetFont("gubfont_20")
--     local width, height = surface.GetTextSize( text )

--     local panel_w, panel_h = 13.44 + width, 37.8
--     local notification = vgui.Create("DPanel")
--     notification:SetSize(panel_w, panel_h)
--     local start = scrw - notification:GetWide() - 3
--     notification:SetPos(scrw * 1 + panel_w, scrh * 0.8 - (#active - 1) * 40)
--     notification:MoveTo(start, scrh * 0.8 - (#active - 1) * 40, 0.1, 0, 1)

--     timer.Simple(time, function()
--         local anim_dur = 2
--         local  me = notification
--         local x, y = me:GetPos()
--         table.RemoveByValue(active, me)
--         me:MoveTo(scrw + (panel_w * 2), y, 0.1, 0, anim_dir)
--         for k, v in pairs(active) do
--             if IsValid(v) then
--                 local x, y = v:GetPos()
--                 v:MoveTo(x, scrh * 0.8 - (50 * (k - 1)), 0.1, 0, anim_dur)
--             end
--         end
--         timer.Simple(anim_dur, function() me:Remove() end)
--     end)

--     notification.Time = CurTime() + time
--     notification.Lerp = notification:GetWide() - 32
--     notification.Paint = function(me, w, h)
--         local icon = icontypes[type] or icontypes[1]
--         icon.color = icon.color or Color(255, 255, 255)
--         local barsize = (w - 32) / time * math.Round(notification.Time - CurTime())
--         notification.Lerp = Lerp(10 * FrameTime(), notification.Lerp, barsize)
--         draw.RoundedBox(0, 0, 0, w, h, Color(82, 82, 82))
--         //draw.RoundedBox(6, 0, 0, 32,  h, theme.secondarycolor)
--         draw.RoundedBox(0, 0, h - (h*0.1), notification.Lerp, h * 0.1, theme.secondarycolor)
--         draw.SimpleText(text, "gubfont_20", scrw * 0.004, h / 2 - height / 2 - 2, Color(255, 255, 255), TEXT_ALIGN_LEFT)
--         -- surface.SetMaterial(icon.icon)
--         -- surface.SetDrawColor(icon.color)
--         -- surface.DrawTexturedRect(32 / 2 - 24 / 2 + 1, h / 2 - 24 / 2, 24, 24)
--     end

--     notification:SetVisible(true)

--     table.insert(active, notification)
-- end


local theme = gubhudconfig.theme

local screenpos = ScrH() - 800 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)) - (12 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)))



local icons = {}
icons[ 0 ] = Material("gubhud/os_ui_hint.png")
icons[ 1 ] = Material("gubhud/os_ui_error.png")
icons[ 2 ] = Material("gubhud/os_ui_undo.png")
icons[ 3 ] = Material("gubhud/os_ui_generic.png")
icons[ 4 ] = Material("gubhud/os_ui_cleanup.png")

local notifications = {}

local scrw, scrh = ScrW(), ScrH()

function notification.AddLegacy(text, type, time)
    surface.SetFont("gubfont_primary_20")

    local w = select(1, surface.GetTextSize(text)) + 64 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2))
    local h = 42 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2))
    local x = 20
    local y = screenpos

    table.insert(notifications, 1, {
        x = x,
        y = y,
        w = w,
        h = h,

        text = text,
        col = theme.secondarycolor,
        icon = icons[type],
        time = CurTime() + time,
        progress = nil,
    })
end

notification.AddProgress = function(id, text, frac)
    for k, v in ipairs(notifications) do
        if v.id == id then
            v.text = text
            v.progress = frac

            return
        end
    end

    surface.SetFont("gubfont_primary_20")

    local w = surface.GetTextSize(text) + 64 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2))
    local h = 42 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2))
    local x = ScrW()
    local y = screenpos

    table.insert(notifications, 1, {
        x = x,
        y = y,
        w = w,
        h = h,

        id = id,
        text = text,
        col = Color(56, 122, 66),
        icon = icons[3],
        time = math.huge,

        progress = math.Clamp(frac or 0, 0, 1),
    })
end

notification.Kill = function(id)
    for k, v in ipairs(notifications) do
        if v.id == id then
            v.time = 0
        end
    end
end

local function DrawNotification(x, y, w, h, text, icon, col, progress)

    draw.RoundedBox(0, x -100, y, w, h, theme.secondarycolor)
    draw.RoundedBox(0, x + 3 - 100 , y + 3, w - 6, h - 6, theme.primarycolor)

    local triangle1 = {
        { x = x + w - 102, y = y + h },

        { x = x + w - 102, y = y },
        { x = x + (w + 32) - 102, y = y },
    }

    surface.SetDrawColor( theme.secondarycolor )
	draw.NoTexture()
	surface.DrawPoly( triangle1 )

    local triangle2 = {
        { x = x + w - 104, y = y + h - 3 },

        { x = x + w - 104, y = 3 + y },
        { x = x + (w + 32) - 104 - 6, y = y + 3 },
    }

    surface.SetDrawColor( theme.secondarycolor )
	draw.NoTexture()
	surface.DrawPoly( triangle1 )

    surface.SetDrawColor( theme.primarycolor )
	draw.NoTexture()
	surface.DrawPoly( triangle2 )

    surface.SetFont("gubfont_primary_20")
    draw.SimpleText(text, "gubfont_primary_20", x - 100 + 52 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)), y + 18 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)), theme.white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

    surface.SetDrawColor(col)
    surface.SetMaterial(icon)

    if progress then
        surface.DrawTexturedRectRotated( x - 100 + 21 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)), y + h / 2, 26 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)), 26 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)), -CurTime() * 360 % 360 )
	else
		surface.DrawTexturedRect( x - 100 + 8 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)), y + 8 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)), 26 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)), 26 * (math.Round(ScrH() * 0.00085 * 20 * 0.05, 2)) )
	end
end

hook.Add("HUDPaint", "GubHUD:Notify", function()
    for k, v in ipairs(notifications) do
        DrawNotification(math.floor(v.x), math.floor(v.y), v.w, v.h, v.text, v.icon, v.col, v.progress)

        v.x = Lerp(10 * FrameTime(), v.x, v.time > CurTime() and ScrW() * 0.075 + (math.Round( ScrW() * 0.00085 * 20 * 0.05, 2)) or -v.w - 10)
        v.y = Lerp(10 * FrameTime(), v.y, screenpos - (k - 1) * (v.h + 5))
    end

    for k, v in ipairs(notifications) do
        if v.x >= ScrW() and v.time < CurTime() then
            table.remove(notifications, k)
        end
    end
end)
hook.Add("GubHUD:Reload", "GubHUD:UnloadNotifications", function()
	hook.Remove("HUDPaint", "GubHUD:Notify")
end)

timer.Simple(0, function( )
	local function DisplayNotify(msg)
		local txt = msg:ReadString()

		GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong())
		surface.PlaySound("buttons/lightswitch2.wav")

		MsgC(Color(255, 20, 20, 255), "[DarkRP] ", Color(200, 200, 200, 255), txt, "\n")
	end

	usermessage.Hook("_Notify", DisplayNotify)
end)


    