

-- local theme = gubhudconfig.theme

-- local GUBHud = {} or GUBHud

-- function GUBHud.DrawDoorInfo()
--     local ent = LocalPlayer():GetEyeTrace().Entity
        
--         local offset = Vector(4, 0, 0)
--         local ang = ent:GetAngles() + Angle(0, 90, 90)
--         local pos = ent:LocalToWorld(ent:OBBCenter() + offset)

--         -- front
--         cam.Start3D2D(pos, ang, (ent:GetPos():Distance(LocalPlayer():GetPos())/920))
--             GUBHud.DoorInfo(ent)
--         cam.End3D2D()
        
--         offset = -Vector(4, 0, 0)
--         ang = ent:GetAngles() - Angle(180, -90, 90)
--         pos = ent:LocalToWorld(ent:OBBCenter() + offset)
--         -- back
--         cam.Start3D2D(pos, ang, (ent:GetPos():Distance(LocalPlayer():GetPos())/920))
--             GUBHud.DoorInfo(ent)
--         cam.End3D2D()
    
-- end

-- function GUBHud.DoorInfo(ent)
    
--     local doordata = ent:getDoorData()

--     if table.Count(doordata) > 0 then
--         -- owner
--         if doordata.groupOwn then
--             draw.SimpleText(doorData.groupOwn, "gubfont_30", 0, 15, theme.white, TEXT_ALIGN_CENTER)
--             -- draw.RoundedBox(5,-125,60,260,1, theme.white)
--             -- draw.RoundedBox(5,-125,10,260,1, theme.white)
--         elseif doordata.nonOwnable then
--             draw.SimpleText("NOT OWNABLE", "gubfont_30", 0, 15, Color(245, 55, 55), TEXT_ALIGN_CENTER)
--         elseif doordata.owner then
--             draw.SimpleText(GUBHud.GetValidString(Player(doordata.owner):Nick()), "gubfont_30", 0, -10, theme.white, TEXT_ALIGN_CENTER)
--             -- draw.SimpleText(GUBHud.GetValidString(title), "gubfont_30", 0, 20, theme.white, TEXT_ALIGN_CENTER)
--             -- draw.RoundedBox(5,-125,60,260,1, theme.white)
--             -- draw.RoundedBox(5,-125,-10,250,1, theme.white)
--         end
--     else 
--         draw.SimpleText("test", "gubfont_30", 0, 15, theme.white, TEXT_ALIGN_CENTER)
--             -- draw.RoundedBox(5,-125,60,260,1, theme.white)
--             -- draw.RoundedBox(5,-125,10,260,1, theme.white)
        
--     end

    
-- end


-- function GUBHud.GetValidString(str)
--     if (!str) then return "" end
--     return str
-- end

-- hook.Add("PostDrawTranslucentRenderables", "GUB:DrawHUDInformation", function()
--     local entities = ents.FindInSphere(LocalPlayer():EyePos(), 100)

--     for i = 1, #entities do
--         local curent = entities[i]

--         if curent:isDoor() and curent:GetClass() != "prop_dynamic" and !curent:GetNoDraw() then
--             GUBHud.DrawDoorInfo()
--         end
--     end
-- end)
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

-- local Cache = {}

-- local function Draw2D3DDoor( door )

-- 	// Door position and angles
-- 	local DoorData = {}
-- 	local DoorAngles = door:GetAngles()

-- 	if Cache[door] then
-- 		DoorData = Cache[door]
-- 	else
-- 		local OBBMaxs = door:OBBMaxs()
-- 		local OBBMins = door:OBBMins()
-- 		local OBBCenter = door:OBBCenter()

-- 		local size = OBBMins - OBBMaxs
-- 		size = Vector(math.abs(size.x), math.abs(size.y), math.abs(size.z))

-- 		local OBBCenterToWorld = door:LocalToWorld(OBBCenter)

-- 		local TraceTbl = {
-- 			endpos = OBBCenterToWorld,
-- 			filter = function( ent )
-- 				return !(ent:IsPlayer() or ent:IsWorld())
-- 			end
-- 		}

-- 		local WidthOffset
-- 		local HeightOffset = Vector(0, 0, 16)
-- 		local DrawAngles

-- 		local scale = 0.1
		
-- 		local CanvasPos
-- 		local CanvasPosReverse
-- 		local canvasWidth

-- 		if size.x > size.y then
-- 			DrawAngles = Angle(0, 0, 90)
-- 			TraceTbl.start = OBBCenterToWorld + door:GetRight() * (size.y / 2)

-- 			local thickness = util.TraceLine(TraceTbl).Fraction * (size.y / 2) + 0.5
-- 			WidthOffset = Vector(size.x / 2, thickness, 0)

-- 			canvasWidth = size.x / scale
-- 		else
-- 			DrawAngles = Angle(0, 90, 90)
-- 			TraceTbl.start = OBBCenterToWorld + door:GetForward() * (size.x / 2)

-- 			local thickness = (1 - util.TraceLine(TraceTbl).Fraction) * (size.x / 2) + 0.5
-- 			WidthOffset = Vector(-thickness, size.y / 2, 0)

-- 			canvasWidth = size.y / scale
-- 		end

-- 		CanvasPos = OBBCenter - WidthOffset + HeightOffset
-- 		CanvasPosReverse = OBBCenter + WidthOffset + HeightOffset

-- 		DoorData = {
-- 			DrawAngles = DrawAngles,
-- 			CanvasPos = CanvasPos,
-- 			CanvasPosReverse = CanvasPosReverse,
-- 			scale = scale,
-- 			canvasWidth = canvasWidth,
-- 			start = TraceTbl.start
-- 		}

-- 		Cache[door] = DoorData
-- 	end

-- 	// Door info
-- 	local doorData = door:getDoorData()
-- 	local doorHeader = ""
-- 	local doorSubHeader = ""
-- 	local extraText = {}

-- 	if table.Count( doorData ) > 0 then

-- 		if doorData.groupOwn then

-- 			doorHeader = doorData.title or RayUI.GetPhrase("hud", "group_door")
-- 			doorSubHeader = string.Replace(RayUI.GetPhrase("hud", "group_door_access"), "%G", doorData.groupOwn)

-- 		elseif doorData.nonOwnable then

-- 			doorHeader = doorData.title or ""

-- 		elseif doorData.teamOwn then

-- 			doorHeader = doorData.title or RayUI.GetPhrase("hud", "team_door")
-- 			doorSubHeader = string.Replace(RayUI.GetPhrase("hud", "team_door_access"), "%J", table.Count(doorData.teamOwn))

-- 			for k,_ in ipairs(doorData.teamOwn) do
-- 				table.insert(extraText, team.GetName(k))
-- 			end
-- 		elseif doorData.owner then

-- 			doorHeader = doorData.title or "Purchased door"
-- 			local doorOwner = Player(doorData.owner)

-- 			if IsValid(doorOwner) then
-- 				doorSubHeader = string.Replace("Owner: %N", "%N", (RayBoard and RayBoard:GetNick(doorOwner) or doorOwner:Name()))
-- 			else
-- 				doorSubHeader = RayUI.GetPhrase("hud", "owner_unknown")
-- 			end

-- 			if doorData.allowedToOwn then
-- 				for k,v in ipairs(doorData.allowedToOwn) do

-- 					doorData.allowedToOwn[k] = Player(k)

-- 					if !IsValid(doorData.allowedToOwn[k]) then
-- 						doorData.allowedToOwn[k] = nil
-- 					end
-- 				end

-- 				if table.Count(doorData.allowedToOwn) > 0 then

-- 					table.insert(extraText, RayUI.GetPhrase("hud", "allowed_coowners"))

-- 					for k,v in ipairs(doorData.allowedToOwn) do
-- 						table.insert(extraText, (RayBoard and RayBoard:GetNick(v) or v:Name()))
-- 					end

-- 					table.insert(extraText, "")
-- 				end

-- 			end

-- 			if doorData.extraOwners then

-- 				for k,v in ipairs(doorData.extraOwners) do
-- 					doorData.extraOwners[k] = Player(k)

-- 					if !IsValid(doorData.extraOwners[k]) then
-- 						doorData.extraOwners[k] = nil
-- 					end
-- 				end

-- 				if table.Count(doorData.extraOwners) > 0 then
-- 					table.insert(extraText, RayUI.GetPhrase("hud", "door_coowners"))

-- 					for k,v in ipairs(doorData.extraOwners) do
-- 						table.insert(extraText, (RayBoard and RayBoard:GetNick(v) or v:Name()))
-- 					end
-- 				end
-- 			end
-- 		end
-- 	else
-- 		doorHeader = RayUI.GetPhrase("hud", "for_sale")
-- 		doorSubHeader = RayUI.GetPhrase("hud", "purchase_door")
-- 	end

-- 	doorHeader = string.Left(doorHeader, 26)
-- 	doorSubHeader = string.Left(doorSubHeader, 35)

-- 	local function drawDoor( )
-- 		// Header
-- 		draw.SimpleText(doorHeader, "RayUI:Largest5", DoorData.canvasWidth / 2, 0, RayUI.Colors.White, TEXT_ALIGN_CENTER)

-- 		// Sub-Header
-- 		draw.SimpleText(doorSubHeader, "RayUI:Largest4", DoorData.canvasWidth / 2, 50 * RayUI.Scale, RayUI.Colors.White, TEXT_ALIGN_CENTER)

-- 		for i = 1,#extraText do
-- 			local text = extraText[i]

-- 			// Additional info
-- 			draw.SimpleText(text,"RayUI:Largest4", DoorData.canvasWidth / 2, 90 * RayUI.Scale + i * 20 * RayUI.Scale, RayUI.Colors.White, TEXT_ALIGN_CENTER)
-- 		end
-- 	end

-- 	cam.Start3D()
-- 		cam.Start3D2D(door:LocalToWorld(DoorData.CanvasPos), DoorData.DrawAngles + DoorAngles, DoorData.scale)
-- 			drawDoor()
-- 		cam.End3D2D()

-- 		cam.Start3D2D(door:LocalToWorld(DoorData.CanvasPosReverse), DoorData.DrawAngles + DoorAngles + Angle(0, 180, 0), DoorData.scale)
-- 			drawDoor()
-- 		cam.End3D2D()
-- 	cam.End3D()
-- end

-- hook.Add("RenderScreenspaceEffects", "RayHUD:Draw2D3DDoor",function(  )
-- 	local entities = ents.FindInSphere(ply:EyePos(), 280)

-- 	for i = 1,#entities do
-- 		local curEnt = entities[i]

-- 		if curEnt:isDoor() and curEnt:GetClass() != "prop_dynamic" and !curEnt:GetNoDraw() and RayUI.Configuration.GetConfig( "DoorHUD" ) then
-- 			Draw2D3DDoor( curEnt )
-- 		end
-- 	end
-- end)

-- hook.Add("RayHUD:Reload", "RayHUD:Unload2D3DDoor", function()
-- 	hook.Remove("RenderScreenspaceEffects", "RayHUD:Draw2D3DDoor")
-- end)

	--Create a table for cached doorData.
local doorCache = {}

--Create a function to draw the door.
local function draw3D2DDoor( door )

	local ply = LocalPlayer()


	--[[-------------------------------------------------------------------------
	Door Display - DisplayData
	---------------------------------------------------------------------------]]

	--Create a table for the displayData.
	local displayData = {}

	--Get the doorangles.
	local doorAngles = door:GetAngles()

	--Check if the door data is cached.
	if doorCache[door] then

		displayData = doorCache[door]

	else

		-- Make sure the door has offsets.
		door.EdgeHUD_DoorOffset = {Angles = Angle(0,0,0), Position = Vector(0,0,0)}

		--Get some vars.
		local OBBMaxs = door:OBBMaxs()
		local OBBMins = door:OBBMins()
		local OBBCenter = door:OBBCenter()

		--Get the size of the door.
		local size = OBBMins - OBBMaxs
		size = Vector(math.abs(size.x),math.abs(size.y),math.abs(size.z))

		--Get OBBCenter local to world.
		local obbCenterToWorld = door:LocalToWorld(OBBCenter)

		--Set the settings for the trace.
		local traceTbl = {
			endpos = obbCenterToWorld,
			filter = function( ent )
				return !(ent:IsPlayer() or ent:IsWorld())
			end
		}

		--Create a variable that holds the door angles. (Bigger scope)
		local offset
		local DrawAngles
		local CanvasPos1
		local CanvasPos2

		--Check what rotation the door has.
		if size.x > size.y then

			--Set the drawangles of the door.
			DrawAngles = Angle(0,0,90)

			--Set the start position of the trace.
			traceTbl.start = obbCenterToWorld + door:GetRight() * (size.y / 2)

			--Calculate the thickness of the door.
			local thickness = util.TraceLine(traceTbl).Fraction * (size.y / 2) + 0.85

			--Set the offset.
			offset = Vector(size.x / 2,thickness,0)

		else

			--Set the drawangles of the door.
			DrawAngles = Angle(0,90,90)

			--Set the start position of the trace.
			traceTbl.start = obbCenterToWorld + door:GetForward() * (size.x / 2)

			--Calculate the thickness of the door.
			local thickness = (1 - util.TraceLine(traceTbl).Fraction) * (size.x / 2) + 0.85

			--Set the offset.
			offset = Vector(-thickness,size.y / 2,0)

		end

		--Decide the heightOffset.
		local heightOffset = Vector(0,0,15)

		--Calculate the positions for the 3D2D.
		CanvasPos1 = OBBCenter - offset + heightOffset
		CanvasPos2 = OBBCenter + offset + heightOffset

		--Create a var for the 3D2D-Scale.
		local scale = 0.1

		local canvasWidth

		if size.x > size.y then
			canvasWidth = size.x / scale
		else
			canvasWidth = size.y / scale
		end

		--Create the displaydata.
		displayData = {
			DrawAngles = DrawAngles,
			CanvasPos1 = CanvasPos1,
			CanvasPos2 = CanvasPos2,
			scale = scale,
			canvasWidth = canvasWidth,
			start = traceTbl.start
		}

		--Cache the data.
		doorCache[door] = displayData

	end

	--[[-------------------------------------------------------------------------
	Door Display - Drawing
	---------------------------------------------------------------------------]]

	--Get the doorData.
	local doorData = door:getDoorData()

	--Create variables for the text.
	local doorHeader = ""
	local doorSubHeader = ""
	local extraText = {}

	--Check if the door is owned.
	if table.Count( doorData ) > 0 then

		--Who the owner is.
		if doorData.groupOwn then

			--Set the header.
			doorHeader = doorData.title or "Owned by: "

			--Set the subHeader.
			doorSubHeader =  doorData.groupOwn

		elseif doorData.nonOwnable then

			doorHeader = doorData.title or ""

		elseif doorData.teamOwn then

			--Set the header.
			doorHeader = doorData.title or "Team Owned"

			--Set the subHeader.
			doorSubHeader = "Door Teams: " .. table.Count(doorData.teamOwn)

			--Add the job titles.
			for k,_ in pairs(doorData.teamOwn) do
				table.insert(extraText, team.GetName(k))
			end

		elseif doorData.owner then

			--Set the header.
			doorHeader = doorData.title or "Owned by: "

			--Get the doorOwner.
			local doorOwner = Player(doorData.owner)

			--Make sure the owner is valid.
			if IsValid(doorOwner) then

				--Set the subHeader.
				doorSubHeader = doorOwner:Name()

			else

				doorSubHeader = "Owner Unknown"

			end

			--Check if there are any allowed co-owners.
			if doorData.allowedToOwn then

				--Check players.
				for k,v in pairs(doorData.allowedToOwn) do

					--Get the player.
					doorData.allowedToOwn[k] = Player(k)

					--Make sure that the player is valid.
					if !IsValid(doorData.allowedToOwn[k]) then

						--Remove the player.
						doorData.allowedToOwn[k] = nil

					end

				end

				--Check so we have any players left.
				if table.Count(doorData.allowedToOwn) > 0 then

					--Insert a title
					table.insert(extraText, "Allowed Co-Owners")

					--Add the owners.
					for k,v in pairs(doorData.allowedToOwn) do

						--Insert the player into the extraText table.
						table.insert(extraText,v:Name())

					end

					--Insert an empty line.
					table.insert(extraText,"")

				end

			end

			--Check if there are any co-owners.
			if doorData.extraOwners then

				--Filter out any invalid players.
				for k,v in pairs(doorData.extraOwners) do

					doorData.extraOwners[k] = Player(k)

					if !IsValid(doorData.extraOwners[k]) then
						doorData.extraOwners[k] = nil
					end

				end

				--Check if we have any extraowners left.
				if table.Count(doorData.extraOwners) > 0 then

					--Insert a title
					table.insert(extraText,"Co-Owners:")

					--Add the owners.
					for k,v in pairs(doorData.extraOwners) do
						table.insert(extraText,v:Name())
					end

				end

			end

		end

	else

		--Set the texts.
		doorHeader = "For Sale"
		doorSubHeader = "Press F2 to Purchase"

	end

	--Enforce string length limits.
	doorHeader = string.Left(doorHeader,25)
	doorSubHeader = string.Left(doorSubHeader,35)

	--Create the draw function.
	local function drawDoor( )


		--Draw the header text.
		draw.SimpleText(doorHeader,"gubfont_primary_60",displayData.canvasWidth / 2,0,Color(255,255,255,255), TEXT_ALIGN_CENTER)

		--Draw the sub-header.
		draw.SimpleText(doorSubHeader,"gubfont_primary_50",displayData.canvasWidth / 2,50,Color(255,255,255,255), TEXT_ALIGN_CENTER)

		--Loop through the other text.
		for i = 1,#extraText do

			--Get the text.
			local text = extraText[i]

			--Draw the sub-header.
			draw.SimpleText(text,"gubfont_primary_30",displayData.canvasWidth / 2,90 + i * 20,Color(255,255,255,255), TEXT_ALIGN_CENTER)

		end

	end

	--Start 3D env.
	cam.Start3D()

		--Draw the first side of the door.
		cam.Start3D2D(door:LocalToWorld(displayData.CanvasPos1 + door.EdgeHUD_DoorOffset.Position),displayData.DrawAngles + doorAngles + door.EdgeHUD_DoorOffset.Angles,displayData.scale)
			drawDoor()
		cam.End3D2D()

		--Draw the other side of the door.
		cam.Start3D2D(door:LocalToWorld(displayData.CanvasPos2 + door.EdgeHUD_DoorOffset.Position * Vector(-1,-1,1)),displayData.DrawAngles + Angle(doorAngles.pitch,doorAngles.yaw,-doorAngles.roll) + Angle(0,180,0) + door.EdgeHUD_DoorOffset.Angles,displayData.scale)
			drawDoor()
		cam.End3D2D()

	cam.End3D()

end

hook.Add("RenderScreenspaceEffects","EdgeHUD:DoorsHUD",function(  )

	--Find entities within sphere.
	local entities = ents.FindInSphere(LocalPlayer():EyePos(),250)

	--Loop through all entities.
	for i = 1,#entities do

		--Make a var for the current entity.
		local curEnt = entities[i]

		--Check so it's a door.
		if curEnt:isDoor() and curEnt:GetClass() != "prop_dynamic" and !curEnt:GetNoDraw() then
			draw3D2DDoor( curEnt )
		end


	end

end)



