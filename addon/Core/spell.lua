-------------------
-- Spell functions for ni
local ni = ...

ni.spell = {}

-- Localizations to avoid hooks from servers
local GetSpellCooldown = ni.client.get_function("GetSpellCooldown")
local GetSpellInfo = ni.client.get_function("GetSpellInfo")
local IsSpellInRange = ni.client.get_function("IsSpellInRange")
local IsSpellKnown = ni.client.get_function("IsSpellKnown")
local IsPlayerSpell = ni.client.get_function("IsPlayerSpell")
local IsUsableSpell = ni.client.get_function("IsUsableSpell")
local IsCurrentSpell = ni.client.get_function("IsCurrentSpell")
local type = ni.client.get_function("type")
local build = ni.client.build()

--[[--
Gets the spell information
 
Parameters:
- **spell** `string or number`
 
Returns:
- **...**
 
Notes:
Wrapper for GetSpellInfo. See that for appropriate documentation.
@param spell
]]
function ni.spell.info(spell)
   return GetSpellInfo(spell)
end

--[[--
Checks if spell is in range to target
 
Parameters:
- **spell** `string or number`
- **target** `string`
 
Returns:
- **in_range** `boolean`
]]
function ni.spell.in_range(spell, target)
   if type(spell) == "number" then
      spell = ni.spell.info(spell)
   end
   local in_range = IsSpellInRange(spell, target)
   if not in_range then
      return false
   end
   return in_range == 1
end

--[[--
Casts a spell by name or id
 
Parameters:
- **spell** `string or number`
- **target** `string`
@param spell
@param[opt] target string
]]
function ni.spell.cast(...)
   local spell = ...
   if type(spell) == "number" then
      ni.client.call_protected("CastSpellById", ...)
   else
      ni.client.call_protected("CastSpellByName", ...)
   end
end

--[[--
Casts a spell by name or id on area
 
Parameters:
- **spell** `string or number`
- **target** `string`
- **offset** `number`
@param spell
@param target string
@param[opt] offset number
]]
function ni.spell.cast_at(spell, target, offset)
   if spell then
   if target == "mouse" then
      ni.spell.cast(spell)
      ni.player.click_at("mouse")
  elseif ni.unit.exists(target) then
  local offset = true and offset or random()
  local x, y, z = ni.unit.info(target)
  local r = offset * sqrt(random())
  local theta = random() * 360
  local tx = x + r * cos(theta)
  local ty = y + r * sin(theta)
      ni.spell.cast(spell)
      ni.player.click_at(tx, ty, z)
   end
   end
end

--[[--
Gets the spell name from id
 
Parameters:
- **name** `string`
@param name string
]]
function ni.spell.id(name)
   return ni.backend.GetSpellId(name)
end

--[[--
Check if the spell is known
 
Parameters:
- **spell** `string or number`
- **pet** `boolean`
 
Returns:
- **known** `boolean`
@param spell number
@param[opt] pet boolean
]]
function ni.spell.known(spell, pet)
   if type(spell) == "string" then
      spell = ni.spell.id(spell)
   end
   if build >= 18414 and not pet then
      return IsPlayerSpell(spell)
   end
   return IsSpellKnown(spell, pet)
end

--[[--
Gets a spells cooldown information
 
Parameters:
- **spell** `string or number`
 
Returns:
- **start** `number`
- **duration** `number`
- **enabled** `number`
@param spell
]]
function ni.spell.cooldown(spell)
   return GetSpellCooldown(spell)
end

--[[--
Returns if we are are currently on Global Cooldown
 
Returns:
- **start** `number`
- **duration** `number`
- **enabled** `number`
]]
function ni.spell.global_cooldown()
   return ni.spell.cooldown(61304)
end

--[[--
Gets the remaining cooldown time
 
Parameters:
- **spell** `string or number`
 
Returns:
- **remaining** `number`
@param spell
]]
function ni.spell.cooldown_remaining(spell)
   local start, duration = ni.spell.cooldown(spell)
   if not start then
      return 0
   end
   local gcd_start = ni.spell.global_cooldown()
   if (start > 0 and duration > 0 and start ~= gcd_start) then
      return start + duration - ni.client.get_time()
   else
      return 0
   end
end

--[[--
Returns if we are currently on global cooldown
 
Returns:
- **on_gcd** `boolean`
]]
function ni.spell.on_global_cooldown()
   local _, duration = ni.spell.global_cooldown()
   return duration ~= 0
end

--[[--
Short hand for on_global_cooldown.

See: [ni.spell.on_global_cooldown](#ni.spell.on_global_cooldown ())
]]
function ni.spell.on_gcd()
   return ni.spell.on_global_cooldown()
end

--[[--
Gets a spells cast time
 
Parameters:
- **spell** `string or number`
 
Returns:
- **duration** `number`
@param spell
]]
function ni.spell.cast_time(spell)
   local _, _, _, _, _, _, cast_time = ni.spell.info(spell)
   return cast_time / 1000 + ni.client.get_net_stats() / 1000
end

--[[--
Returns true if the spell is instant cast
 
Parameters:
- **spell** `string or number`
 
Returns:
- **is_instant** `boolean`
@param spell
]]
function ni.spell.is_instant(spell)
   local _, _, _, _, _, _, cast_time = ni.spell.info(spell)
   return cast_time == 0
end

--[[--
Determines whether a spell can be used by the player character
 
Parameters:
- **spell** `string or number`
 
Returns:
- **usable** `boolean`
- **no_mana** `boolean`
@param spell
]]
function ni.spell.is_usable(spell)
   return IsUsableSpell(spell)
end

--[[--
Determines if a spell is currently being cast or qued by the player
 
Parameters:
- **spell** `string or number`
 
Returns:
- **is_current** `boolean`
@param spell
]]
function ni.spell.is_current(spell)
   return IsCurrentSpell(spell)
end

--[[--
Stops the current spellcasting. Doesn't work for channeled spells.
]]
function ni.spell.stop_casting()
   return ni.client.call_protected("SpellStopCasting")
end

--[[--
Checks if a spell is valid to be cast on a unit
 
Parameters:
- **spell** `string or number`
- **target** `string`
- **is_facing** `boolean`
- **line_of_sight** `boolean`
- **is_friendly** `boolean`
 
Returns:
- **valid** `boolean`
@param spell
@param target string
@param[opt] is_facing boolean
@param[opt] line_of_sight boolean
@param[opt] is_friendly boolean
]]
function ni.spell.valid(spell, target, is_facing, line_of_sight, is_friendly)
   if not ni.unit.exists(target) then
      return false
   end
   if not is_friendly then
      if not ni.player.can_attack(target) then
         return false
      end
      if ni.unit.is_dead_or_ghost(target) then
         return false
      end
   end
   local name, _, _, cost, _, power_type = ni.spell.info(spell)
   if type(spell) == "string" then
      spell = ni.spell.id(spell)
      if spell == 0 then
         return false
      end
   end
   if not ni.spell.in_range(name, target) then
      return false
   end
   if not ni.spell.known(spell) then
      return false
   end
   if ni.player.power(power_type) < cost then
      return false
   end
   if is_facing and not ni.player.facing(target) then
      return false
   end
   if line_of_sight and not ni.player.los(target) then
      return false
   end
   return true
end
