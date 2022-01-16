### ni.unit.auras (target)

Gets the auras on the specified target.

 Parameters:
 - **target** `token|guid`

 Returns:
 - **auras** `aura table`

### ni.unit.best_location (target, distance, radius[, score[, callback[, friendly[, height_max[, max_distance]]]]])

Gets the best location that meets the criteria passed.

 Parameters:
 - **target** `token|guid`
 - **distance** `number`
 - **radius** `number`
 - **score** `number`
 - **callback** `function`
 - **friendly** `boolean`
 - **height_max** `number`
 - **max_distance** `number`

 Returns:
 - **x** `number`
 - **y** `number`
 - **z** `number`

### ni.unit.best_helpful_location (target, distance, radius[, score[, callback[, height_max[, max_distance]]]])

Wrapper for best_location for friendly target

 Parameters:
 - **target** `token|guid`
 - **distance** `number`
 - **radius** `number`
 - **score** `number`
 - **callback** `function`
 - **height_max** `number`
 - **max_distance** `number`

 Returns:
 - **x** `number`
 - **y** `number`
 - **z** `number`

### ni.unit.best_damage_location (target, distance, radius[, score[, callback[, height_max[, max_distance]]]])

Wrapper for best_location for enemy target

 Parameters:
 - **target** `token|guid`
 - **distance** `number`
 - **radius** `number`
 - **score** `number`
 - **callback** `function`
 - **height_max** `number`
 - **max_distance** `number`

 Returns:
 - **x** `number`
 - **y** `number`
 - **z** `number`

### ni.unit.combat_reach (target)

Gets the combat reach for the specified target.

 Parameters:
 - **target** `string`

 Returns:
 - **combat_reach** `number`

### ni.unit.exists (target)

Checks if the unit exists.

 Parameters:
 - **target** `string`

 Returns:
 - **exists** `boolean`

### ni.unit.info (target)

Gets the information of the specified target

 Parameters:
 - **target** `string`

 Returns:
 - **x** `number`
 - **y** `number`
 - **z** `number`
 - **facing** `number`
 - **target** `string`
 - **height** `number`

### ni.unit.location (target)

Gets the location of the specified target.

 Parameters:
 - **target** `string`

 Returns:
 - **x** `number`
 - **y** `number`
 - **z** `number`

### ni.unit.is_facing (target_a, target_b[, field_of_view])

Checks if one target is facing another.

 Parameters:
 - **target_a** `string`
 - **target_b** `string`
 - **field_of_view** `number`

 Returns:
 - **facing** `boolean`

### ni.unit.is_behind (target_a, target_b)

Checks if one target is behind another.

 Parameters:
 - **target_a** `string`
 - **target_b** `string`

 Returns:
 - **behind** `boolean`

### ni.unit.has_aura (target, id)

Checks if a target has a specific aura id.

 Parameters:
 - **target** `string`
 - **id** `number`

 Returns:
 - **has_aura** `boolean`

### ni.unit.distance (target_a, target_b)

Gets the distance between two targets.

 Parameters:
 - **target_a** `string`
 - **target_b** `string`

 Returns:
 - **distance** `number`

### ni.unit.creator (target)

Gets the GUID of the units creator.

 Parameters:
 - **target** `string`

 Returns:
 - **guid** `string`

### ni.unit.dynamic_flags (target)

Gets the units dynamic flags.

 Parameters:
 - **target** `string`

 Returns:
 - **flags** `boolean`

 Notes:
 This function will return 9 different values which are all booleans for the
 dynamic flags 1 - 9. (Dynamic flag titles may be different for expansions)
 I was being lazy, and didn't want to type out the 9 different returns.

### ni.unit.flags (target)

Gets the units flags.

 Parameters:
 - **target** `string`

 Returns:
 - **flags** `boolean`

 Notes:
 This function will return 32 different values which are all booleans for the
 dynamic flags 1 - 32. (Flag titles may be different for expansions)
 I was being lazy, and didn't want to type out the 32 different returns.

### ni.unit.type (target)

Gets the units creature type.

 Parameters:
 - **target** `string`

 Returns:
 - **creature_type** `number`

### ni.unit.los (target_a, target_b[, hit_flags])

Checks if two units are in line of sight of each other.

 Parameters:
 - **target_a** `string`
 - **target_b** `string`
 - **hit_flags** `number`

 Returns:
 - **success** `boolean`
 - **intersection_x** `number`
 - **intersection_y** `number`
 - **intersection_z** `number`

### ni.unit.pointer (target)

Gets the units pointer

 Parameters:
 - **target** `string`

 Returns:
 - **pointer** `number`
 - **hex_pointer** `string`

### ni.unit.transport (target)

Gets the units transport guid

 Parameters:
 - **target** `string`

 Returns:
 - **guid** `string`

### ni.unit.facing (target)

Gets the units facing in radians

 Parameters:
 - **target** `string`

 Returns:
 - **direction** `number`

### ni.unit.descriptor (target, index)

Gets the unit descriptor value for the given index

 Parameters:
 - **target** `string`
 - **index** `number`

 Returns:
 - **descriptor** `number`

### aura

Table keys:
 - **name** `string`
 - **ID** `number`

