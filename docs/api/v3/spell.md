### ni.spell.info (spell)

Gets the spell information

Parameters:
- **spell** `string or number`

Returns:
- **...**

Notes:
Wrapper for GetSpellInfo.  See that for appropriate documentation.

### ni.spell.in_range (spell, target)

Checks if spell is in range to target

Parameters:
- **spell** `string or number`
- **target** `string`

Returns:
- **in_range** `boolean`

### ni.spell.cast (spell[, target])

Casts a spell by name or id

Parameters:
- **spell** `string or number`
- **target** `string`

### ni.spell.id (name)

Gets the spell name from id

Parameters:
- **name** `string`

### ni.spell.known (spell[, pet])

Check if the spell is known

Parameters:
- **spell** `string or number`
- **pet** `boolean`

Returns:
- **known** `boolean`

### ni.spell.cooldown (spell)

Gets a spells cooldown information

Parameters:
- **spell** `string or number`

Returns:
- **start** `number`
- **duration** `number`
- **enabled** `number`

### ni.spell.global_cooldown ()

Returns if we are are currently on Global Cooldown

Returns:
- **start** `number`
- **duration** `number`
- **enabled** `number`

### ni.spell.cooldown_remaining (spell)

Gets the remaining cooldown time

Parameters:
- **spell** `string or number`

Returns:
- **remaining** `number`

### ni.spell.on_global_cooldown ()

Returns if we are currently on global cooldown

Returns:
- **on_gcd** `boolean`

### ni.spell.on_gcd ()

Short hand for on_global_cooldown.

See: [ni.spell.on_global_cooldown](#ni.spell.on_global_cooldown ())

### ni.spell.cast_time (spell)

Gets a spells cast time

Parameters:
- **spell** `string or number`

Returns:
- **duration** `number`

### ni.spell.is_instant (spell)

Returns true if the spell is instant cast

Parameters:
- **spell** `string or number`

Returns:
- **is_instant** `boolean`

### ni.spell.is_usable (spell)

Determines whether a spell can be used by the player character

Parameters:
- **spell** `string or number`

Returns:
- **usable** `boolean`
- **no_mana** `boolean`

### ni.spell.is_current (spell)

Determines if a spell is currently being cast or qued by the player

Parameters:
- **spell** `string or number`

Returns:
- **is_current** `boolean`

### ni.spell.stop_casting ()

Stops the current spellcasting.  Doesn't work for channeled spells.

### ni.spell.valid (spell, target[, is_facing[, line_of_sight[, is_friendly]]])

Checks if a spell is valid to be cast on a unit

Parameters:
- **spell** `string or number`
- **target** `string`
- **is_facing** `boolean`
- **line_of_sight** `boolean`
- **is_friendly** `boolean`

Returns:
- **valid** `boolean`

