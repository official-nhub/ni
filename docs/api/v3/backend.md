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

Returns:
- On fail: `nil`
- On success: `boolean`

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

Returns: 
- On fail: `nil`
- On success: `table` _keys: number, values: table; subkeys: name [string], ID [number]_

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

Returns: `mapid [number], tilex [number], tiley [number]`

Example:
```lua
local mapid, tilex, tiley = ni.backend.GetMapInfo();
```

## BestLocation

Description:

Retrieves the best location that meets the criteria passed to the function.

Arguments:
- **target** `token|guid` _required_
- **distance** `number` _required_
- **radius** `number` _required_
- **friendly** `boolean` _optional; default: false_
- **increment** `number` _optional; default: 1.0_
- **heightmax** `number` _optional; default: 20.0_
- **callback** `function` _optional_
- **score** `number` _optional; default: 300.0_

Returns:
- On fail: `nil`
- On success: `x [number], y [number], z [number]`

Notes:

The callback function is to help assess each objects score value. The lower a total score, the more likely that area will be skipped. The callback takes 1 argument which is the guid, and must return a score (number).

Example:
```lua
local x, y, z = ni.backend.BestLocation("target", 10, 8, false, 1, 10, function(guid)
	if ni.unit.debuff(guid, "Something bad") then
		return -1000 --Simulate an avoid this mob area
	end
	return 100
end);
if x then
	print(string.format("Best location at %d %d %d", x, y, z))
end
```

## CombatReach

Description:

Gets the combat reach for the token specified.

Arguments:
- **target** `token|guid` _required_

Returns:
- On fail: `nil`
- On success: `number`

Example:
```lua

```

## ObjectExists

Description:

Checks if the object specified exists within the object manager (slightly different than UnitExists).

Arguments:
- **target** `token|guid` _required_

Returns: `boolean`

Example:
```lua

```

## GetObjects

Description:

Gets all of the objects currently in the object manager.

Arguments: `none`

Returns: `table` _keys: number, values: table; subkeys: guid [string], type [number], name [string]_

Example:
```lua

```

## ObjectInfo

Description:

Gets information pertaining to the token specified.

Arguments:
- **target** `token|guid` _required_

Returns:
- If unit: `x [number], y [number], z [number], facing [number], target_guid [string], height [number]`
- All others: `x [number], y [number], z [number]`

Example:
```lua

```

## IsFacing

Description:

Checks if one token is facing another within a certain field of view.

Arguments:
- **target_a** `token|guid` _required_
- **target_b** `token|guid` _required_
- **degrees** `number` _optional; default: 180.0_

Returns: `boolean`

Example:
```lua

```

## IsBehind

Description:

Checks if one token is behind another.

Arguments:
- **target_a** `token|guid` _required_
- **target_b** `token|guid` _required_

Returns: `boolean`

Example:
```lua

```

## HasAura

Description:

Checks of the token specified has a specific aura (by ID).

Arguments:
- **target** `token|guid` _required_
- **id** `number` _required_

Returns:
- On fail: `nil`
- On success: `boolean`

Example:
```lua

```

## Encrypt

Description:

Encrypts a string with AES-256 encryption.

Arguments:
- **content** `string` _required_
- **key** `string` _required_
- **iv** `string` _optional; default: Random generated_

Returns:
- On fail: `nil, err_msg [string]`
- On success: `encrypted_content [string]`

Example:
```lua

```

## Decrypt

Description:

Decrypts an AES-256 encrypted string. On failure, the second return contains the error message.

Arguments:
- **content** `string` _required_
- **key** `string` _required_

Returns:
- On fail: `nil, string`

Example:
```lua

```

## ParseFile

Description:

Parses a file with the given callback function.

Arguments:
- **file** `string` _required_
- **key** `string` _optional; default: HWID_
- **callback** `function` _required_

Returns: `boolean, err_msg [string]`

Notes:

This function doesn't require the key, and when the key is not specified, the function argument becomes the second, not third. The callback function takes 1 argument which is the file contents (decrypted if encrypted file is specified).

Example:
```lua

```

## LoadFile

Description:

Loads a file into the stack as a function, similar to loadstring.

Arguments:
- **file** `string` _required_
- **key** `string` _optional; default: none_
- **chunk_name** `string` _optional; default: ?_

Returns:
- On fail: `nil, err_msg [string]`
- On success: `function`

Notes:

This function doesn't require the key, and when the key is not specified, the chunk name becomes the second argument.

Example:
```lua

```

## LoadString

Description:

Loads a string into the stack as a function, similar to loadstring.

Arguments:
- **content** `string` _required_
- **chunk_name** `string` _optional; default: ?_

Returns:
- On fail: `nil, err_msg [string]`
- On success: `function`

Example:
```lua

```

## GetContent

Description:

Gets the content of a file.

Arguments:
- **file** `string` _required_
- **key** `string` _optional; default: HWID_

Returns:
- On fail: `nil`
- On success: `content [string]`

Example:
```lua

```

## SaveContent

Description:

Saves the content to a file.

Arguments:
- **file** `string` _required_
- **content** `string` _required_

Returns:
- On fail: `nil`
- On success: `boolean`

Example:
```lua

```

## GetBaseFolder

Description:

Gets the base folder for ni.

Arguments: `none`

Returns: `string`

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