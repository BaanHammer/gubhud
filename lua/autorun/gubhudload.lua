gubhud = gubhud or {}
gubhud.loader = {}

-- resource.AddWorkshop("3012985548")

gubhud.materials = {

    ["heart"] = Material("materials/gubhud/hearty.png"),
    ["shield"] = Material("materials/gubhud/shieldy.png"),
    ["gunlicense"] = Material("materials/gubhud/gunlicense.png"),
    ["wanted"] = Material("materials/gubhud/wanted.png"),
    ["mic"] = Material("materials/gubhud/mic.png"),
    ["mic_mute"] = Material("materials/gubhud/mic_mute.png"),

    
}

if gubhud then
    hook.Run("GUBHud:Reload")
end

local gubpath = "gubhud/"

if SERVER then
    print([[
         _____ _    _ ____  _    _ _    _ _____  
        / ____| |  | |  _ \| |  | | |  | |  __ \ 
       | |  __| |  | | |_) | |__| | |  | | |  | |
       | | |_ | |  | |  _ <|  __  | |  | | |  | |
       | |__| | |__| | |_) | |  | | |__| | |__| |
        \_____|\____/|____/|_|  |_|\____/|_____/ ]])
    print("_____________________________________\n")
end

function gubhud.loader:IncludeClient(path)
    if CLIENT then
        include(gubpath .. path)
    end

    if SERVER then
        AddCSLuaFile(gubpath .. path)
        print("[GUBHUD] • " .. gubpath .. path)
    end
end

function gubhud.loader:IncludeServer(path)
    if SERVER then
        resource.AddFile(path)
        print("[GUBHUD] • " .. gubpath .. path)
    end
end

function gubhud.loader:IncludeShared(path)
    self:IncludeServer(path)
    self:IncludeClient(path)
    if SERVER then
        print("[GUBHUD] • " .. gubpath .. path)
    end
end

function gubhud.loader:ResourceAddFile(path)
    if SERVER then
        resource.AddFile(path)
        print("[GUBHUD] • Resource added: " .. path)
    end
end

function gubhud.loader:ResourceAddFolder(name, recurse)
    local files, folders = file.Find(name .. "/*", "GAME")

    for _, fname in ipairs(files) do
        self:ResourceAddFile(name .. "/" .. fname)
    end

    if recurse then
        for _, fname in ipairs(folders) do
            gubhud.loader:ResourceAddFolder(bane .."/" .. fname, recurse)
        end
    end
end

function gubhud.loader:MaterialAddFolder(name, recurse)
    local files, folders = file.Find(name .."/*", "GAME")

    for _, fname in ipairs(files) do
        self:ResourceAddFile(name .."/".. fname)
        gubhud.materials[fname] = name .."/".. fname
    end

    if recurse then
        for _, fname in ipairs(folders) do
            gubhud.loader:MaterialAddFolder(name .."/".. fname, recurse)
        end
    end
end

function gubhud.loader:ClAddFolder(name,recurse)
	local files, folders = file.Find(gubpath .. name .. "/*", "LUA")
	for k, fname in ipairs(files) do
		local path = name.."/"..fname
		self:IncludeClient(path)
	end
	if recurse then
		for _, fname in ipairs(folders) do
            self:ClAddFolder(name .."/".. fname, recurse)
        end
    end
end

function gubhud.loader:SvAddFolder(name,recurse)
	local files, folders = file.Find(gubpath .. name .. "/*", "LUA")
	for k, fname in ipairs(files) do
		local path = name.."/"..fname
		self:IncludeServer(path)
	end
	if recurse then
		for _, fname in ipairs(folders) do
            self:SvAddFolder(name .."/".. fname, recurse)
        end
    end
end

function gubhud.loader:ShAddFolder(name,recurse)
	local files, folders = file.Find(gubpath .. name .. "/*", "LUA")
	for k, fname in ipairs(files) do
		local path = name.."/"..fname
		self:IncludeShared(path)
	end
	if recurse then
		for _, fname in ipairs(folders) do
            self:ShAddFolder(name .."/".. fname, recurse)
        end
    end
end

gubhud.loader:ResourceAddFile("resource/fonts/yuruka.ttf")
gubhud.loader:ResourceAddFile("resource/fonts/BebasNeue-Regular.ttf")
gubhud.loader:ResourceAddFile("resource/fonts/YsabeauSC-Regular.ttf")



if CLIENT then
    if not file.Exists("gubhud", "DATA") then
        file.CreateDir("gubhud")
    end
end

function gubhud.loader:Load()
    gubhud.loader.finished = false 

    //self:IncludeClient("")
    self:IncludeClient("config/gubhudconfig.lua")

    self:IncludeServer("core/gubhudserver.lua")

    self:ClAddFolder("vgui", true)

    //self:IncludeClient("vgui/gub_circleavatar.lua")


    self:ClAddFolder("core", true)

    if SERVER then
        print("\nLOADING FINISHED")
        print("_____________________________________")
    end

    gubhud.loader.finished = true 
end

hook.Add( "OnScreenSizeChanged", "GubHUD:Reload", function()
	Load()
end)

gubhud.loader:Load()
