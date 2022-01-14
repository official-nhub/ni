local ni = ...
--[[ Backend functions:
	MoveTo
	ClickAt
	RegisterCallback
	Auras
	GetMapInfo
	BestLocation
	CombatReach
	ObjectExists
	GetObjects
	ObjectInfo
	IsFacing
	IsBehind
	HasAura
	Encrypt
	Decrypt
	ParseFile
	LoadFile
	LoadString
	GetContent
	SaveContent
	GetBaseFolder
	GetDistance
	LookAt
	ObjectCreator
	StopMoving
	UnitDynamicFlags
	UnitFlags
	CreatureType
	GetSpellID
	LoS
	ObjectPointer
	BaseAddress
	ObjectTransport
	ObjectFacing
	ResetLastHardwareAction
	CallProtected
	GetDirectoryContents
	GetPath
	FreeMaps
	ObjectDescriptor
	SetCreatureTracking
	SetResourceTracking
	WebRequest
	Read
	Open
	ToggleConsole
	ProtectFrame
	PacketCallback
	GetHWID
	GetFunction
	Error
	MessageBox

]] 

if not ni.loaded then

    local dir = ni.backend.GetBaseFolder()
    local function LoadCoreFile(entry)
	local func, err = ni.backend.LoadFile(dir.."addon\\core\\"..entry, entry)
	if err then
    	ni.backend.Error(err)
    else
    		func(ni)
    	end
    end;
    LoadCoreFile("json.lua")
    local vars = ni.backend.GetContent(dir.."addon\\settings\\"..UnitName("player")..".json")
    if vars then
	    ni.vars = ni.json.decode(vars)
    else
	    LoadCoreFile("vars.lua")
    end;

    ni.vars.profiles.enabled = false;
    ni.vars.profiles.genericenabled = false;
    ni.vars.profiles.delay = 0;
	ni.vars.build = select(4, GetBuildInfo())
    ni.backend.SaveContent(dir.."addon\\settings\\"..UnitName("player")..".json", ni.json.encode(ni.vars))
	local corefiles = {"mwcrand.lua", "debug.lua", "memory.lua", "rotation.lua", "bootstrap.lua", "tables.lua", "drtracker.lua", "utils.lua", "frames.lua", "spell.lua", "power.lua", "rune.lua", "unit.lua", "player.lua", "healing.lua", "members.lua", "objectmanager.lua", "stopcastingtracker.lua", "timetodie.lua", "gui.lua", "mainui.lua", }
	
	for i = 1, #corefiles do
		LoadCoreFile(corefiles[i])
	end;
	
   	ni.showstatus = function(str, enabled)
		if enabled then
			ni.frames.floatingtext:message("\124cff00ff00" .. str)
		else
			ni.frames.floatingtext:message("\124cffff0000" .. str)
		end
	end;
	ni.toggleprofile = function(str)
		local unload = false;
		if ni.vars.profiles.active == str then
			ni.vars.profiles.enabled = not ni.vars.profiles.enabled;
			if ni.vars.profiles.enabled == false then
				unload = true;
			end
		else
			unload = true;
			ni.vars.profiles.enabled = true;
			ni.vars.profiles.active = str;
		end
		if unload then
			if ni.rotation.profile[ni.rotation.lastprofile] then
				if ni.rotation.profile[ni.rotation.lastprofile].unload then
					ni.rotation.profile[ni.rotation.lastprofile]:unload();
				end
				if ni.rotation.profile[ni.rotation.lastprofile].destroyGUI then
					ni.rotation.profile[ni.rotation.lastprofile]:destroyGUI();
				end
			end
		end
		if ni.vars.profiles.enabled then
			if ni.rotation.profile[str] then
				if ni.rotation.profile[str].load then
					ni.rotation.profile[str]:load();
				end
				if ni.rotation.profile[str].createGUI then
					ni.rotation.profile[str]:createGUI();
				end
			end
		end
		if ni.rotation.lastprofile ~= str then
			ni.rotation.lastprofile = str;
		end
		ni.showstatus(str, ni.vars.profiles.enabled);
	end;

	ni.togglegeneric = function(str)
		local unload = false;
		if ni.vars.profiles.generic == str then
			ni.vars.profiles.genericenabled = not ni.vars.profiles.genericenabled;
			if ni.vars.profiles.genericenabled == false then
				unload = true;
			end
		else
			unload = true;
			ni.vars.profiles.genericenabled = true;
			ni.vars.profiles.generic = str;
		end
		if unload then
			if ni.rotation.profile[ni.rotation.lastgeneric] then
				if ni.rotation.profile[ni.rotation.lastgeneric].unload then
					ni.rotation.profile[ni.rotation.lastgeneric]:unload();
				end
				if ni.rotation.profile[ni.rotation.lastgeneric].destroyGUI then
					ni.rotation.profile[ni.rotation.lastgeneric]:destroyGUI();
				end
			end
		end
		if ni.vars.profiles.genericenabled then
			if ni.rotation.profile[str] then
				if ni.rotation.profile[str].load then
					ni.rotation.profile[str]:load();
				end
				if ni.rotation.profile[str].createGUI then
					ni.rotation.profile[str]:createGUI();
				end
			end
		end
		if ni.rotation.lastgeneric ~= str then
			ni.rotation.lastgeneric = str;
		end
		ni.showstatus(str, ni.vars.profiles.genericenabled);
	end;


	ni.showintstatus = function()
		if ni.vars.profiles.interrupt then
			if (GetLocale() == "ruRU") then
				ni.frames.floatingtext:message("Прерывание: \124cff00ff00Включено")
			else
				ni.frames.floatingtext:message("Interrupts: \124cff00ff00Enabled")
			end
		else
			if (GetLocale() == "ruRU") then
				ni.frames.floatingtext:message("Прерывание: \124cffff0000Выключено")
			else			
				ni.frames.floatingtext:message("Interrupts: \124cffff0000Disabled")
			end
		end
	end;

	ni.updatefollow = function(enabled)
		if enabled then
			if (GetLocale() == "ruRU") then
				ni.frames.floatingtext:message("Авто следование: \124cff00ff00Включено")
			else
				ni.frames.floatingtext:message("Auto follow: \124cff00ff00Enabled")
			end
		else
			if (GetLocale() == "ruRU") then
				ni.frames.floatingtext:message("Авто следование: \124cffff0000Выключено")
			else		
				ni.frames.floatingtext:message("Auto follow: \124cffff0000Disabled")
			end
		end
	end;

	ni.getspellidfromactionbar = function()
		local focus = GetMouseFocus():GetName()
		if string.match(focus, "Button") then
			local button = _G[focus]
			local slot =
				ActionButton_GetPagedID(button) or ActionButton_CalculateAction(button) or button:GetAttribute("action") or 0
			if HasAction(slot) then
				local aType, aID, _, aMaxID = GetActionInfo(slot)
				if aType == "spell" then
					return aMaxID ~= nil and aMaxID or aID
				end
			end
		end
	end;
	ni.functionsregistered = function()
		return ni.backend.ToggleConsole ~= nil
	end;
	ni.frames.main:SetScript("OnUpdate", ni.frames.OnUpdate);
	ni.frames.main:SetScript("OnEvent", ni.frames.OnEvent);

	ni.loaded = true

end;