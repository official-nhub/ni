# Backend

> Functions introduced to extend the lua functionality. All functions will be prepended with `ni.backend`, however they are not all intended to be called directly and/or are used as helpers for other functions.

---

## Tokens

Tokens in World of Warcraft are the accessors for a given unit. In addition to the normal tokens ("target", "focus", "arena1", etc.) you can use a units GUID or "totemX" (X is the number; 1-4). Certain functions have additional tokens you can specify also.

## MoveTo

Description:

Moves the player to the given target or coordinates.

Arguments:
- **target** `token|guid` _required_

Arguments (overload):
- **x** `number` _required_
- **y** `number` _required_
- **z** `number` _required_

Returns: `nil`

Example:
```lua
-- Token usage
if UnitExists("target") then
	ni.backend.MoveTo("target")
end
-- Coordinate usage
if true then
	ni.backend.MoveTo(1.5, 5.4, 12.5)
end
```

## ClickAt

Description:

Sends the click action at a given target location or coordinates. (Has additional token "mouse" to click at mouse location)

Arguments:
- **target** `token|guid` _required_

Arguments (overload):
- **x** `number` _required_
- **y** `number` _required_
- **z** `number` _required_

Returns: `nil`

Example:
```lua
if SpellIsTargetting() then
	ni.backend.ClickAt("mouse")
end
-- Target usage
if UnitExists("target") and SpellIsTargetting() then
	ni.backend.ClickAt("target")
end
-- Coordinate usage
if true then
	ni.backend.ClickAt(5.1, 4.5, 5.12)
end
```

## RegisterCallback

Description:

Registers a Lua function to be performed as a callback on mouse or keyboard actions.

Arguments:
- **table** `table` _required_
- **func** `function` _required_

Returns: `true on success or nil`

Example:
```lua
local keys = {}
local function OnKeyHandler(self, keyType, key)
    if key == 70 then --f key
        if keyType == 256 then --key down
            self[key] = true
        elseif keyType == 257 then --key up
			self[key] = false
        end
        return true
    end
	return false
end
ni.backend.RegisterCallback(keys, OnKeyHandler)
```

## Auras

Description:

Gets the auras on the specified token.

Arguments:
- **target** `token|guid` _required_

Returns: `table or nil` _keys: number, values: subkeys: name [string], ID [number]_

Example:
```lua
local auras = ni.backend.Auras("player") or {}
for k, v in ipairs(auras) down
	print(v.ID)
	print(v.name)
end
```

## GetMapInfo

Description:

Gets the current map information for the player.

Arguments: `none`

Returns: `number, number, number`

Example:
```lua
local mapid, tilex, tiley = ni.backend.GetMapInfo();
```

## BestLocation

Description:

Arguments:

Returns:

Example:
```lua

```

## CombatReach

Description:

Arguments:

Returns:

Example:
```lua

```

## ObjectExists

Description:

Arguments:

Returns:

Example:
```lua

```

## ObjectInfo

Description:

Arguments:

Returns:

Example:
```lua

```

## IsFacing

Description:

Arguments:

Returns:

Example:
```lua

```

## IsBehind

Description:

Arguments:

Returns:

Example:
```lua

```

## HasAura

Description:

Arguments:

Returns:

Example:
```lua

```

## Encrypt

Description:

Arguments:

Returns:

Example:
```lua

```

## Decrypt

Description:

Arguments:

Returns:

Example:
```lua

```

## ParseFile

Description:

Arguments:

Returns:

Example:
```lua

```

## LoadFile

Description:

Arguments:

Returns:

Example:
```lua

```

## LoadString

Description:

Arguments:

Returns:

Example:
```lua

```

## GetContent

Description:

Arguments:

Returns:

Example:
```lua

```

## SaveContent

Description:

Arguments:

Returns:

Example:
```lua

```

## GetBaseFolder

Description:

Arguments:

Returns:

Example:
```lua

```

## GetDistance

Description:

Arguments:

Returns:

Example:
```lua

```

## LookAt

Description:

Arguments:

Returns:

Example:
```lua

```

## ObjectCreator

Description:

Arguments:

Returns:

Example:
```lua

```

## StopMoving

Description:

Arguments:

Returns:

Example:
```lua

```

## UnitDynamicFlags

Description:

Arguments:

Returns:

Example:
```lua

```

## UnitFlags

Description:

Arguments:

Returns:

Example:
```lua

```

## CreatureType

Description:

Arguments:

Returns:

Example:
```lua

```

## GetSpellID

Description:

Arguments:

Returns:

Example:
```lua

```

## LoS

Description:

Arguments:

Returns:

Example:
```lua

```

## ObjectPointer

Description:

Arguments:

Returns:

Example:
```lua

```

## BaseAddress

Description:

Arguments:

Returns:

Example:
```lua

```

## ObjectTransport

Description:

Arguments:

Returns:

Example:
```lua

```

## ObjectFacing

Description:

Arguments:

Returns:

Example:
```lua

```

## ResetLastHardwareAction

Description:

Arguments:

Returns:

Example:
```lua

```

## CallProtected

Description:

Arguments:

Returns:

Example:
```lua

```

## GetDirectoryContents

Description:

Arguments:

Returns:

Example:
```lua

```

## GetPath

Description:

Arguments:

Returns:

Example:
```lua

```

## FreeMaps

Description:

Arguments:

Returns:

Example:
```lua

```

## ObjectDescriptor

Description:

Arguments:

Returns:

Example:
```lua

```

## SetCreatureTracking

Description:

Arguments:

Returns:

Example:
```lua

```

## SetResourceTracking

Description:

Arguments:

Returns:

Example:
```lua

```

## WebRequest

Description:

Arguments:

Returns:

Example:
```lua

```

## Read

Description:

Arguments:

Returns:

Example:
```lua

```

## Open

Description:

Arguments:

Returns:

Example:
```lua

```

## ToggleConsole

Description:

Arguments:

Returns:

Example:
```lua

```

## ProtectFrame

Description:

Arguments:

Returns:

Example:
```lua

```

## PacketCallback

Description:

Arguments:

Returns:

Example:
```lua

```

## GetHWID

Description:

Arguments:

Returns:

Example:
```lua

```

## GetFunction

Description:

Arguments:

Returns:

Example:
```lua

```

## Error

Description:

Arguments:

Returns:

Example:
```lua

```

## MessageBox

Description:

Arguments:

Returns:

Example:
```lua

```