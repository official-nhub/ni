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
- On success: `string`

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

Calculates the distance between tokens or points.

Arguments:
- **targeta** `token|guid` _required_
- **targetb** `token|guid` _required_

Arguments (overload #1):
- **x1** `number` _required_
- **y1** `number` _required_
- **x2** `number` _required_
- **y2** `number` _required_

Arguments (overload #2):
- **x1** `number` _required_
- **y1** `number` _required_
- **z1** `number` _required_
- **x2** `number` _required_
- **y2** `number` _required_
- **z2** `number` _required_

Returns:
- On fail: `nil`
- On success: `number`

Example:
```lua

```

## LookAt

Description:

Turns the player to a token, or away from.

Arguments:
- **target** `token|guid` _required_
- **turn_away** `boolean` _optional_

Returns: `nil`

Example:
```lua

```

## ObjectCreator

Description:

Gets the GUID of the objects creator.

Arguments:
- **target** `token|guid` _required_

Returns:
- On fail: `nil`
- On success: `guid [string]`

Example:
```lua

```

## StopMoving

Description:

Stops the players movement.

Arguments: `none`

Returns: `nil`

Example:
```lua

```

## UnitDynamicFlags

Description:

Gets the dynamic flags for a unit.

Arguments:
- **target** `token|guid` _required_

Returns:
- On fail: `nil`
- On success: `boolean` x9

Example:
```lua

```

## UnitFlags

Description:

Gets the flags for a unit.

Arguments:
- **target** `token|guid` _required_

Returns:
- On fail: `nil`
- On success: `boolean` x32

Example:
```lua

```

## CreatureType

Description:

Gets the creature type of a unit.

Arguments:
- **target** `token|guid` _required_

Returns:
- On fail: `nil`
- On success: `number`

Example:
```lua

```

## GetSpellID

Description:

Gets the spell ID from a spell name.

Arguments:
- **spell** `string` _required_

Returns:
- On fail: `nil`
- On success: `number`

Example:
```lua

```

## LoS

Description:

Performs a trace line between points to check if line of sight is present.

Arguments:
- **targeta** `token|guid` _required_
- **targetb** `token|guid` _required_
- **hit_flags** `number` _optional; default: HitTestGroundAndStructures_

Arguments (overload):
- **x1** `number` _required_
- **y1** `number` _required_
- **z1** `number` _required_
- **x2** `number` _required_
- **y2** `number` _required_
- **z2** `number` _required_
- **hit_flags** `number` _optional; default: HitTestGroundAndStructures_

Returns: `success [boolean], intersection_x [number], intersection_y [number], intersection_z [number]`

Notes:

Hit flags are a number. When combining multiple options, it is a bitwise or operation. Default flags:
```
HitTestNothing = 0x0,
HitTestBoundingModels = 0x1,
HitTestWMO = 0x10,
HitTestUnknown = 0x40,
HitTestGround = 0x100,
HitTestLiquid = 0x10000,
HitTestUnknown2 = 0x20000,
HitTestMovableObjects = 0x100000,
HitTestLOS = HitTestWMO | HitTestBoundingModels | HitTestMovableObjects,
HitTestGroundAndStructures = HitTestLOS | HitTestGround
```

Example:
```lua

```

## ObjectPointer

Description:

Gets the pointer for an object.

Arguments:
- **target** `token|guid` _required_

Returns:
- On fail: `nil`
- On success: `pointer [number], hex_pointer [string]`

Example:
```lua

```

## BaseAddress

Description:

Gets the games base address.

Arguments: `none`

Returns: `pointer [number], hex_pointer [string]`

Example:
```lua

```

## ObjectTransport

Description:

Gets the GUID of an objects transport if it exists.

Arguments:
- **target** `token|guid` _required_

Returns:
- On fail: `nil`
- On success: `guid [string]`

Example:
```lua

```

## ObjectFacing

Description:

Gets the objects facing radians.

Arguments:
- **target** `token|guid` _required_

Returns:
- On fail: `nil`
- On success: `number`

Example:
```lua

```

## ResetLastHardwareAction

Description:

Sets the last hardware action as if a key was pressed. (Can prevent AFK)

Arguments: `none`

Returns: `nil`

Example:
```lua

```

## CallProtected

Description:

Calls a function without causing the game taint to trigger (and the action blocked popup). Essentially a lua unlocker function for that call.

Arguments:
- **function** `string` _required_
- ... `functions normal arguments`

Returns:
- On fail: `nil`
- On success: The called functions regular returns

Example:
```lua
ni.backend.CallProtected("CastSpellByName", "Blizzard")
ni.backend.CallProtected("RunMacroText", "print('hello')")
ni.backend.CallProtected("InteractUnit", UnitGUID("target"))
```

## GetDirectoryContents

Description:

Gets the contents of a folder directory.

Arguments:

Returns:
- On fail: `nil, err_msg [string]`
- On success: `table` _keys: number, values: table; subkeys: path [string], is_dir [boolean]_

Example:
```lua

```

## GetPath

Description:

Gets a path from start to end point with navigation mesh.

Arguments:
- **x1** `number` _required_
- **y1** `number` _required_
- **z1** `number` _required_
- **x2** `number` _required_
- **y2** `number` _required_
- **z2** `number` _required_
- **includes** `number` _optional_
- **excludes** `number` _optional_

Returns:
- On fail: `nil`
- On success: `table` _keys: number, values: table; subkeys: x [number], y [number], z [number]_

Notes:

This function currently requires a folder included in the base folder with the navigation mesh files for it to use.

Example:
```lua

```

## FreeMaps

Description:

Frees the maps loaded in memory.

Arguments: `none`

Returns: `nil`

Example:
```lua

```

## ObjectDescriptor

Description:

Gets the objects descriptor value.

Arguments:
- **target** _required_
- **descriptor** _required_

Returns:
- On fail: `nil`
- On success: `number`

Example:
```lua

```

## SetCreatureTracking

Description:

Sets the players creature tracking value to track certain creatures on the minimap.

Arguments:
- **value** `number` _required_

Returns: `nil`

Example:
```lua

```

## SetResourceTracking

Description:

Sets the players resource tracking value to track certain resources on the minimap.

Arguments:
- **value** `number` _required_

Returns: `nil`

Example:
```lua

```

## WebRequest

Description:

Performs a web request.

Arguments:
- **url** `string` _required_
- **data** `string` _default: ""_
- **post** `boolean` _required_
- **callback** `function`

Returns:
- On callback fail: `err_msg [string]`
- On success: `nil`

Notes:

The callback function takes 2 arguments. The first is the response code (200, 404, etc.) and the second is the response content.

Example:
```lua

```

## Read

Description:

Reads client memory with the specified type.

Arguments:
- **type** `string` _required_
- **address** `number` _required_
- **...** `numbers` _optional_

Returns:
- On fail: `nil`
- On success: `value [type]`

Example:
```lua

```

## Open

Description:

Executes the OS open command.

Arguments:
- **path** `string` _required_

Returns: `nil`

Example:
```lua

```

## ToggleConsole

Description:

Toggles the console window open and closed.

Arguments: `none`

Returns: `nil`

Example:
```lua

```

## ProtectFrame

Description:

Registers a frame to be protected from enumeration with the games Lua functions.

Arguments:
- **frame** `frame` _required_

Returns: `boolean`

Example:
```lua

```

## PacketCallback

Description:

Registers a callback to be called when a packet is received.

Arguments:
- **callback** `function` _required_

Returns: `boolean`

Notes:

The callback function is called when the client receives a packet. The first argument to this function is the packet opcode, and the second is a table of the packet data bytes.

Example:
```lua

```

## GetHWID

Description:

Gets a unique identifier of the users PC that is a base64 encoded string.

Arguments: `none`

Returns: `string`

Example:
```lua

```

## GetFunction

Description:

Gets the original function for the specified string. Can be used to override hooksecurefunc and overwrite hooks on the client.

Arguments:
- **function** `string` _required_

Returns:
- On fail: `nil`
- On success: `function`

Example:
```lua

```

## Error

Description:

Raises a lua error with the specified message.

Arguments:
- **message** `string` _required_

Returns: `nil`

Example:
```lua

```

## MessageBox

Description:

Makes a message box pop up.

Arguments:
- **message** `string` _required_
- **title** `string` _optional; default: ""_
- **icon** `number` _optional; default: 0_

Returns: `nil`

Example:
```lua

```