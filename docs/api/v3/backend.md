# Backend

> Functions introduced to extend the lua functionality. All functions will be prepended with `ni.backend`, however they are not all intended to be called directly and/or are used as helpers for other functions.

---

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

Arguments:

Returns:

Example:
```lua

```

## RegisterCallback

Description:

Arguments:

Returns:

Example:
```lua

```

## Auras

Description:

Arguments:

Returns:

Example:
```lua

```

## GetMapInfo

Description:

Arguments:

Returns:

Example:
```lua

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