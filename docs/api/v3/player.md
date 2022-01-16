### ni.player.move_to (...)

Moves the player to the token or coordinates.

Parameters:
- **target** `token|guid`

Or
- **x** `number`
- **y** `number`
- **z** `number`

### ni.player.click_at (...)

Clicks at the location of the target, or coordinates.

Parameters:
- **target** `token|guid`

Or
- **x** `number`
- **y** `number`
- **z** `number`

### ni.player.get_map_info ()

Gets the current map information for the player.

Returns:
- **map_id** `number`
- **tile_x** `number`
- **tile_y** `number`

### ni.player.look_at (target[, away])

Turns the player to a target, or away from it.

Parameters:
- **target** `token|guid`
- **away** `boolean`

### ni.player.stop_moving ()

Stops the players movement.

### ni.player.set_creature_tracking (value)

Sets the player creature tracking value.

Parameters:
- **value** `number`

### ni.player.set_resource_tracking (value)

Sets the player resource tracking value.

Parameters:
- **value** `number`

### ni.player.target (target)

Sets the players target to the token passed

Parameters:
- **target** `string`

