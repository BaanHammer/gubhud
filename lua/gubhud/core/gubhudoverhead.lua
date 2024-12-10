-- if CLIENT then
	
--     local ang, pos, offset, alpha, trace, ent, group, group_color, job_min
--     local Alpha = 255
--     local function Overhead(ply)
--         if !IsValid(ply) or ply == LocalPlayer() or !ply:Alive() then return end
--         if ply:GetNoDraw() or ply:GetColor().a != 255 then return end
        
--         trace = LocalPlayer():GetEyeTrace()
--         ent = trace.Entity
        
--         offset = Vector(0, 0, 85)
--         ang = LocalPlayer():EyeAngles()
--         pos= ply:GetPos() + offset + ang:Up()
        
--         dis = LocalPlayer():GetPos():Distance(ply:GetPos())
        
--         ang:RotateAroundAxis(ang:Forward(), 90)
--         ang:RotateAroundAxis(ang:Right(), 90)
        
--         if dis > 200 or trace.HitPos:Distance(LocalPlayer():GetShootPos()) > 250 then
--             alpha = 0
-- 		else
--             alpha = 255
-- 		end
        
--         Alpha = Lerp(2* FrameTime(), Alpha, alpha)
        
--         cam.Start3D2D(pos, Angle(0, ang.y, 90), 0.050)
--         job_min = 0
        
--         // Draw job
--         surface.SetDrawColor(255, 255, 255, Alpha)
--         surface.SetMaterial(Job2Material)
--         surface.DrawTexturedRect(210, 470, 128, 128)
        
--         draw.SimpleText(ply:getDarkRPVar("job"), "gubfont_20", 320, 535, Color(255, 255, 255, Alpha), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
--         // Draw name
--         surface.SetDrawColor(255, 255, 255, Alpha)
--         surface.SetMaterial(Id2Material)
--         surface.DrawTexturedRect(210, 400, 128, 128)
        
--         // Draw health
--         surface.SetDrawColor(255, 255, 255, Alpha)
--         surface.SetMaterial(Heart2Material)
--         surface.DrawTexturedRect(210, 540, 128, 128)
        
--         draw.SimpleText(ply:GetName(), "gubfont_20", 320, 465, Color(255, 255, 255, Alpha), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
--         draw.SimpleText(ply:Health(), "gubfont_20", 320, 605, Color(255, 255, 255, Alpha), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        
--         cam.End3D2D()
--     end
        
    
--     hook.Add("PostPlayerDraw", "GubHUDOverhead", Overhead)

-- end

local theme = gubhudconfig.theme

local micicon = theme.mic
local micmute = theme.micmute

if gubhudconfig.showoverhead then
    timer.Create("GubHUD:UpdatePlayerOverhead",0.5,0,function(  )


        --Reset playersToRender.
        playersToRender = {}

        --Get all players.
        local players = player.GetAll()

        local ply = LocalPlayer()

        --Loop through all players.
        for k, v in pairs(players) do

            --Make sure the player is valid.
            if !IsValid(v) then continue end


            --Dont draw ourselves.
            if v == ply then continue end

            --Check so the player is close enough.
            if ply:GetPos():DistToSqr( v:GetPos() ) < 300^2 or v:IsSpeaking() then
                table.insert(playersToRender,v)
            end

        end

    end)

    hook.Add("PostDrawTranslucentRenderables", "GubHUDOverhead", function()

        local ply = LocalPlayer()

        for k, v in pairs(playersToRender) do
            
            if !IsValid(v) then continue end

            if !v:Alive() then continue end

            if v:IsDormant() then continue end

            if v:GetColor().a == "0" or v:GetNoDraw() then continue end


            local name = v:Name()
            local job = v:getDarkRPVar("job")
            local hp = v:Health()
            local maxhp = v:GetMaxHealth()
            local haslicense = v:getDarkRPVar("HasGunlicense")

            surface.SetFont("gubfont_primary_30")
            local namew, nameh = surface.GetTextSize(name)
            
            surface.SetFont("gubfont_primary_20")
            local jobw, jobh = surface.GetTextSize(job)

            local offset = Vector(0, 0, 85)
            local pos = v:GetPos() + Vector(0, 0, v:OBBMaxs().z * 1.15)
            local ang =  Angle(0, ply:EyeAngles().y - 90, 90)

            local intPlayerNameY, intPlayerJobY, intPlayerValueY = 10, 32, 45

            cam.Start3D2D(pos, ang, 0.1)
                
                
            
                draw.RoundedBox(0, -60, 10, 54, 54, theme.secondarycolor)
                draw.RoundedBox(0, -60 + 3, 10 + 3, 54 - 6, 54 - 6, theme.primarycolor)

                if v:IsSpeaking() then
                    surface.SetDrawColor(theme.primarytextcol)
                    surface.SetMaterial(micicon)
                else
                    surface.SetDrawColor(theme.primarytextcol)
                    surface.SetMaterial(micmute)
                end

                surface.DrawTexturedRect(-57, 10 + 3, 48, 48)
            
                -- draw.RoundedBox(0, -5, 10, namew + 20, 85, theme.secondarycolor)
                -- draw.RoundedBox(0, -5 + 3, 10 + 3, namew + 30 - 6, 85 - 6, theme.primarycolor)


                draw.SimpleTextOutlined(name, "gubfont_primary_30", 0, 30, theme.primarytextcol, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, theme.secondarycolor)
                draw.SimpleText(job,"gubfont_primary_30", 0, 52, team.GetColor(v:Team()), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            cam.End3D2D()
            end
        

    end)

    hook.Add("GubHUD:Reload", "GubHUD:Unload_PlayerOverhead", function(  )
        hook.Remove("PostDrawTranslucentRenderables", "GubHUD:PostPlayerDraw")
        timer.Remove("GubHUD:UpdatePlayerOverhead")
    end)
end

-- function DrawOverhead(ply)
--     if !gubhudconfig.showoverhead then return end
--     local lp = LocalPlayer()

--     if lp = ply then return end
--     if !IsValid(lp) then return end
--     if !lp:Alive() then return end
--     if !IsValid(ply) then return end
--     if !ply:Alive() then return end

--     if ply:GetColor().a == "0" then return end

--     if lp:GetPos():DistToSqr(ply:GetPos()) > 100000 then return end

--     local pos = ply:GetPos + Vector(0, 0, ply:OBBMaxs().z * 1.15)
--     local ang = Angle(0, lp:EyeAngles().y - 90, 90) 
-- end

-- hook.Add("PostPlayerDraw", "GubHUD:PostPlayerDraw", function(ply)

-- end)