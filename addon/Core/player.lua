local ni = ...

local GetGlyphSocketInfo,
	GetContainerNumSlots,
	GetContainerItemID,
	GetItemSpell,
	GetInventoryItemID,
	GetItemCooldown,
	GetSpellCooldown,
	GetTime,
	IsFalling,
	GetItemInfo,
	GetInventoryItemLink =
	GetGlyphSocketInfo,
	GetContainerNumSlots,
	GetContainerItemID,
	GetItemSpell,
	GetInventoryItemID,
	GetItemCooldown,
	GetSpellCooldown,
	GetTime,
	IsFalling,
	GetItemInfo,
	GetInventoryItemLink

local CurrentMovingTime, CurrentStationaryTime, ResetMovementTime = 0, 0, 0.5;

ni.player = {};
ni.player.moveto = function(...) --target/x,y,z
	ni.backend.MoveTo(...)
end;
ni.player.clickat = function(...) --target/x,y,z/mouse
	ni.backend.ClickAt(...)
end;
ni.player.stopmoving = function()
	ni.backend.CallProtected("StrafeLeftStop");
	ni.backend.CallProtected("StrafeRightStop");
	ni.backend.CallProtected("TurnLeftStop");
	ni.backend.CallProtected("TurnRightStop");
	ni.backend.StopMoving();
end;
ni.player.lookat = function(target, inv) --inv true to look away
	ni.backend.LookAt(target, inv)
end;
ni.player.target = function(target)
    ni.backend.CallProtected("TargetUnit", target)
end;
ni.player.runtext = function(text)
	ni.debug.print(string.format("Running: %s", text))
	ni.backend.CallProtected("RunMacroText", text)
end;
ni.player.useitem = function(...) --itemid/name[, target]
	if #{...} > 1 then
		ni.debug.print(string.format("Using item %s on %s", ...))
	else
		ni.debug.print(string.format("Using item %s", ...))
	end
	local item = ...
	if tonumber(...) then
		item = GetItemInfo(item)
		if #{...} > 1 then
			local _, tar = ...
			ni.backend.CallProtected("UseItemByName", item, tar)
		else
			ni.backend.CallProtected("UseItemByName", item)
		end
	else
		ni.backend.CallProtected("UseItemByName", ...)
	end
end;
ni.player.useinventoryitem = function(slotid)
	ni.debug.print(string.format("Using Inventory Slot %s", slotid))
	ni.backend.CallProtected("UseInventoryItem", slotid)
end;
ni.player.interact = function(target)
	ni.debug.print(string.format("Interacting with %s", target))
	ni.backend.CallProtected("InteractUnit", UnitGUID(target))
end;
ni.player.hasglyph = function(glyphid)
	for i = 1, 6 do
		if GetGlyphSocketInfo(i) then
			if select(3, GetGlyphSocketInfo(i)) == glyphid then
				return true
			end
		end
	end
	return false
end;
ni.player.cancelbuff = function(id)
	local spellName = GetSpellInfo(id)
	if ni.player.buff(id) then
		CancelUnitBuff("player", spellName)
		return true;
	end
		return false;
end;
-- Function for check every ranks of pet spell 
-- For example you can use like:
-- GetSpellAutocast(ni.player.getpetspell(GetSpellInfo(47983), "pet"), "pet")
-- or
-- ni.backend.CallProtected("ToggleSpellAutocast", ni.player.getpetspell(GetSpellInfo(47983), "pet"), "pet")
ni.player.getpetspell = function(spellId, bookType)
    local searchSpellName = GetSpellInfo(spellId)
    local i = 1
    local spellName = GetSpellName(i, bookType)
    while spellName do
        if spellName == searchSpellName then
            return i 
        end
        i = i + 1
        spellName = GetSpellInfo(i, bookType)
    end
end;
ni.player.hasitem = function(itemid)
	return GetItemCount(itemid, false, false) > 0
end;
ni.player.hasitemequipped = function(id)
	for i = 1, 19 do
		if GetInventoryItemID("player", i) == id then
			return true
		end
	end
	return false
end;
ni.player.slotcastable = function(slotnum)
	return GetItemSpell(GetInventoryItemID("player", slotnum)) ~= nil
end;
ni.player.slotcd = function(slotnum)
	if not ni.player.slotcastable(slotnum) then
		return 0
	end
	local start, duration, enable = GetItemCooldown(GetInventoryItemID("player", slotnum))
	if (start > 0 and duration > 0) then
		return start + duration - GetTime()
	end
	return 0
end;
ni.player.getaverageitemlevel = function(t) -- calculate average item level
    local iLevelSum, iCount = 0, 0 
    for i = 1, 18 do 
    if i ~= 4 then 
    local ItemLink = GetInventoryItemLink(t, i) 
    if ItemLink then 
     local _,_,_,l = GetItemInfo(ItemLink) 
        iLevelSum = iLevelSum + l 
        iCount = iCount + 1 
            end 
        end 
    end 
    if iCount > 0 then 
        return (iLevelSum/iCount) 
    end
end;
-- function to get best item for use depend by ur level.
-- by list i mean table. For example FireStones = { 41174, 41173, 40773, 41172, 41171, 41169, 41170 };
ni.player.getbestitembylevel = function(list) 
	local level = UnitLevel("player");
	for i = 1, #list do
	local itemid = list[i]	
	local name, _, _, req = GetItemInfo(itemid)
	if GetItemCount(itemid, false, false) > 0 then
	if name and level >= req then
				BestItem = name
				return name, itemid
			end
		end
	end
end;
ni.player.itemcd = function(item)
	local start, duration, enable = GetItemCooldown(item)
	if (start > 0 and duration > 0) then
		return start + duration - GetTime()
	end
	return 0
end;
ni.player.petcd = function(spell)
	local start, duration, enable = GetSpellCooldown(spell)
	if (start > 0 and duration > 0) then
		return start + duration - GetTime()
	else
		return 0
	end
end;
ni.player.registermovement = function(elapsed)
	local speed = GetUnitSpeed("player");
	if speed ~= 0 then
		CurrentMovingTime = CurrentMovingTime + elapsed;
		CurrentStationaryTime = 0;
	else
		if CurrentStationaryTime < ResetMovementTime then
			CurrentStationaryTime = CurrentStationaryTime + elapsed;
		elseif CurrentStationaryTime > ResetMovementTime then
			CurrentMovingTime = 0;
		end
	end
end;
ni.player.movingfor = function(duration)
	local duration = duration or 1;
	if CurrentMovingTime >= duration and not ni.unit.buff("player", 98767) then
		return true;
	end
	return false;
end;
ni.player.getmovingtime = function()
	return CurrentMovingTime;
end;
ni.player.ismoving = function()
	if ni.unit.ismoving("player") or IsFalling() then
		return true
	end
	return false
end;

setmetatable(
	ni.player,
	{
		__index = function(t, k)
			if ni.unit[k] then
				rawset(t, k, function(...)
					return ni.unit[k]("player", ...);
				end);
				return t[k];
			end
		end
	}
);