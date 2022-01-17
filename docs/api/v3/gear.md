### ni.gear.use (slot)

Uses the inventory item by slot id.

Parameters:
- **slot** `number`

### ni.gear.id (slot)

Gets the inventory slot item id.

Parameters:
- **slot** `number`

Returns:
- **id** `number`

### ni.gear.is_equipped (id)

Checks if an item ID is equipped

Parameters:
- **id** `number`

Returns:
- **is_equipped** `boolean`

### ni.gear.spell (slot)

Checks if the equipped item is has a spell

Parameters:
- **slot** `number`

Returns:
- **spell_name** `string`
- **spell_id** `number`

### ni.gear.cooldown (slot)

Gets the cooldown of an item equipped

Parameters:
- **slot** `number`

Returns:
- **start_time** `number`
- **duration** `number`
- **enabled** `number`

### ni.gear.cooldown_remaining (slot)

Gets the cooldown time remaining for an item equipped

Parameters:
- **slot** `number`

Returns:
- **remaining** `number`

