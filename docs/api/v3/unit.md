### ni.unit.auras (target)

Gets the auras on the specified target.

Parameters:
- **target** `string`

Returns:
- **auras** `aura table`

### ni.unit.best_location (target, distance, radius[, score[, callback[, friendly[, height_max[, max_distance]]]]])

Gets the best location that meets the criteria passed.

Parameters:
- **target** `string`
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
- **target** `string`
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
- **target** `string`
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

### ni.unit.guid (target)

Gets the targets guid

Parameters:
- **target** `string`

Returns:
- **guid** `string`

### ni.unit.short_guid (target)

Gets the short guid

Parameters:
- **target** `string`

Returns:
- **short_guid** `string`

### ni.unit.health (target)

Gets the targets current health

Parameters:
- **target** `string`

Returns:
- **health** `number`

### ni.unit.health_max (target)

Gets the targets max health

Parameters:
- **target** `string`

Returns:
- **max_health** `number`

### ni.unit.health_deficit (target)

Gets the targets health deficit

Parameters:
- **target** `string`

Returns:
- **deficit** `number`

### ni.unit.health_percent (target)

Gets the targets health percent

Parameters:
- **target** `string`

Returns:
- **health_percent** `number`

### ni.unit.hp (target)

Shorthand function for health_percent.

See [ni.unit.health_percent](#ni.unit.health_percent (target))

### ni.unit.info (target)

Gets the information of the specified target

Parameters:
- **target** `string`

Returns:
- **x** `number`
- **y** `number`
- **z** `number`
- **type** `number`
- **target** `string`
- **height** `number`

### ni.unit.target (target)

Gets the units target

Parameters:
- **target** `string`

Returns:
- **guid** `string`

### ni.unit.height (target)

Gets the units height

Parameters:
- **target** `string`

Returns:
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

### ni.unit.has_aura (target, aura)

Checks if a target has a specific aura id or name.

Parameters:
- **target** `string`
- **aura** `number or string`

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

### ni.unit.can_perform_action (target)

Checks if the unit can perform action

Parameters:
- **target** `string`

Returns:
- **can_perform_action** `boolean`

### ni.unit.is_not_attackable (target)

Checks if the unit is not attackable

Parameters:
- **target** `string`

Returns:
- **is_not_attackable** `boolean`

### ni.unit.is_player_controlled (target)

Checks if the unit is player controlled

Parameters:
- **target** `string`

Returns:
- **is_player_controlled** `boolean`

### ni.unit.is_preparation (target)

Checks if the unit is preparation

Parameters:
- **target** `string`

Returns:
- **is_preparation** `boolean`

### ni.unit.is_looting (target)

Checks if the unit is looting

Parameters:
- **target** `string`

Returns:
- **is_looting** `boolean`

### ni.unit.is_pet_in_combat (target)

Checks if the unit is pet in combat

Parameters:
- **target** `string`

Returns:
- **is_pet_in_combat** `boolean`

### ni.unit.is_pvp_flagged (target)

Checks if the unit is pvp flagged

Parameters:
- **target** `string`

Returns:
- **is_pvp_flagged** `boolean`

### ni.unit.is_silenced (target)

Checks if the unit is silenced

Parameters:
- **target** `string`

Returns:
- **is_silenced** `boolean`

### ni.unit.is_pacified (target)

Checks if the unit is pacified

Parameters:
- **target** `string`

Returns:
- **is_pacified** `boolean`

### ni.unit.is_stunned (target)

Checks if the unit is stunned

Parameters:
- **target** `string`

Returns:
- **is_stunned** `boolean`

### ni.unit.is_disarmed (target)

Checks if the unit is disarmed

Parameters:
- **target** `string`

Returns:
- **is_disarmed** `boolean`

### ni.unit.is_confused (target)

Checks if the unit is confused

Parameters:
- **target** `string`

Returns:
- **is_confused** `boolean`

### ni.unit.is_fleeing (target)

Checks if the unit is fleeing

Parameters:
- **target** `string`

Returns:
- **is_fleeing** `boolean`

### ni.unit.is_possessed (target)

Checks if the unit is possessed

Parameters:
- **target** `string`

Returns:
- **is_possessed** `boolean`

### ni.unit.is_not_selectable (target)

Checks if the unit is not selectable

Parameters:
- **target** `string`

Returns:
- **is_not_selectable** `boolean`

### ni.unit.is_skinnable (target)

Checks if the unit is skinnable

Parameters:
- **target** `string`

Returns:
- **is_skinnable** `boolean`

### ni.unit.is_mounted (target)

Checks if the unit is mounted

Parameters:
- **target** `string`

Returns:
- **is_mounted** `boolean`

### ni.unit.is_immune (target)

Checks if the unit is immune

Parameters:
- **target** `string`

Returns:
- **is_immune** `boolean`

### ni.unit.type (target)

Gets the units creature type.

Parameters:
- **target** `string`

Returns:
- **creature_type** `number`

### ni.unit.is_totem (target)

Checks if the unit is a totem

Parameters:
- **target** `string`

Returns:
- **is_totem** `boolean`

### ni.unit.is_undead (target)

Checks if the unit is a undead

Parameters:
- **target** `string`

Returns:
- **is_undead** `boolean`

### ni.unit.is_demon (target)

Checks if the unit is a demon

Parameters:
- **target** `string`

Returns:
- **is_demon** `boolean`

### ni.unit.threat (target_a, target_b)

Checks the units threat to a target

Parameters:
- **target_a** `string`
- **target_b** `string`

Returns:
- **threat** `number`

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

### ni.unit.melee_range (target_a, target_b)

Gets the melee range between two units

Parameters:
- **target_a** `string`
- **target_b** `string`

Returns:
- **range** `number`

### ni.unit.in_melee (target_a, target_b)

Checks if unit is in melee range of another target

Parameters:
- **target_a** `string`
- **target_b** `string`

Returns:
- **in_melee** `boolean`

### ni.unit.casting (target)

Gets the casting information for the specified target

Parameters:
- **target** `string`

Returns:
- **...**

Notes:
See the returns for UnitCastingInfo

### ni.unit.is_casting (target)

Gets if the target is casting currently

Parameters:
- **target**

Returns:
- **casting** `boolean`

### ni.unit.casting_percent (target)

Gets the targets casting percentage completed

Parameters:
- **target** `string`

Returns:
- **percent_complete** `number`

### ni.unit.channel (target)

Gets the channel information for the specified target

Parameters:
- **target** `string`

Returns:
- **...**

Notes:
See the returns for UnitChannelInfo

### ni.unit.is_channeling (target)

Gets if the target is channeling currently

Parameters:
- **target**

Returns:
- **channeling** `boolean`

### ni.unit.channel_percent (target)

Gets the targets channel percentage completed

Parameters:
- **target** `string`

Returns:
- **percent_complete** `number`

### ni.unit.is_dead_or_ghost (target)

Gets if the target is dead or a ghost

Parameters:
- **target** `string`

Returns:
- **is_dead_or_ghost** `boolean`

### ni.unit.can_attack (target_a, target_b)

Checks to see if target_a can attack target_b

Parameters:
- **target_a** `string`
- **target_b** `string`

Returns:
- **unit_can_attack** `boolean`

### ni.unit.can_assist (target_a, target_b)

Checks to see if target_a can assist target_b

Parameters:
- **target_a** `string`
- **target_b** `string`

Returns:
- **unit_can_attack** `boolean`

### ni.unit.power (target[, power_type])

Gets the current power value for a unit

Parmeters:
- **target** `string`
- **power_type** `string or number`

Returns:
- **current**

### ni.unit.power_max (target[, power_type])

Gets the max power value for a unit

Parameters:
- **target** `string`
- **power_type** `string or number`

Returns:
- **max**

### ni.unit.power_percent (target[, power_type])

Gets the power percentage for a unit

Parameters:
- **target** `string`
- **power_type** `string or number`

Returns:
- **percent**

### ni.unit.power_deficit (target[, power_type])

Gets the power deficit for a unit

Parameters:
- **target** `string`
- **power_type** `string or number`

Returns:
- **deficit** `number`

### ni.unit.buff (target, buff[, filter])

Gets information about the buff on a unit

Parameters:
- **target** `string`
- **buff** `number or string`
- **filter** `string`

Returns:
- **...**

Notes:
See the returns for UnitBuff as this is a wrapper for that.

### ni.unit.buff_remaining (target, buff[, filter])

Get unit buff remaining

Parameters:
- **target** `string`
- **buff** `number or string`
- **filter** `string`

Returns:
- **buff_remaining** `number`

### ni.unit.buff_stacks (target, buff[, filter])

Get unit buff stacks

Parameters:
- **target** `string`
- **buff** `number or string`
- **filter** `string`

Returns:
- **buff_stacks** `number`

### ni.unit.debuff (target, debuff[, filter])

Gets information about the debuff on a unit

Parameters:
- **target** `string`
- **debuff** `number or string`
- **filter** `string`

Returns:
- **...**

Notes:
See the returns for UnitDebuff as this is a wrapper for that.

### ni.unit.debuff_remaining (target, debuff[, filter])

Get unit debuff remaining

Parameters:
- **target** `string`
- **debuff** `number or string`
- **filter** `string`

Returns:
- **debuff_remaining** `number`

### ni.unit.debuff_stacks (target, debuff[, filter])

Get unit debuff stacks

Parameters:
- **target** `string`
- **debuff** `number or string`
- **filter** `string`

Returns:
- **buff_stacks** `number`

### ni.unit.index_buff (target, index)

Gets information about the buff on a unit by specific buff index.

Parameters:
- **target** `string`
- **index** `number`

Returns:
- **...**

Notes:
See the returns for UnitBuff as this is a wrapper for that.

### ni.unit.index_debuff (target, index)

Gets information about the debuff on a unit by specific debuff index

Parameters:
- **target** `string`
- **index** `number`

Returns:
- **...**

Notes:
See the returns for UnitDebuff as this is a wrapper for that.

### ni.unit.enemies_in_range (target, distance)

Gets a table of enemy units of a target within the given range

Parameters:
- **target** `string`
- **distance** `number`

Returns:
- **in_range** `table`

### ni.unit.friends_in_range (target, distance)

Gets a table of friendly units of a target within the given range

Parameters:
- **target** `string`
- **distance** `number`

Returns:
- **in_range** `table`

### aura

Table keys:
- **name** `string`
- **ID** `number`

