### ni.rune.cooldown (index)

Returns the rune cooldown information for selected rune index.

Parameters:
- **index** `number`

Returns:
- **start** `number`
- **duration** `number`
- **enabled** `number`

### ni.rune.type (index)

Gets the rune type by index

Parameters:
- **index** `number`

Returns:
- **rune_type** `number`

### ni.rune.on_cooldown (index)

Checks if a rune index is currently on cooldown

Parameters:
- **index** `number`

Returns:
- **on_cooldown** `boolean`

### ni.runes.status (rune_type)

Returns the numbers of runes on cooldown and off cooldown for a specific type

Parameters:
- **rune_type** `number`

Returns:
- **on_cooldown** `number`
- **off_cooldown** `number`

### ni.runes.available ()

Returns the number of available runes

Returns:
- **runes_available** `number`

### ni.runes.death.count ()

Returns the number of death runes

Returns:
- **death_runes** `number`

### ni.runes.death.status ()

Returns the numbers of death runes on cooldown and off cooldown

Returns:
- **death_on_cooldown** `number`
- **death_off_cooldown** `number`

### ni.runes.frost.status ()

Returns the numbers of frost runes on cd and off cd

Returns:
- **frost_on_cooldown** `number`
- **frost_off_cooldown** `number`

### ni.runes.unholy.status ()

Returns the numbers of unholy runes on cooldown and off cooldown

Returns:
- **unholy_on_cooldown** `number`
- **unholy_off_cooldown** `number`

### ni.runes.blood.status ()

Returns the numbers of blood runes on ccooldown and off cooldown

Returns:
- **blood_on_cooldown** `number`
- **blood_off_cooldown** `number`

