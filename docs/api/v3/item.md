### ni.item.spell (item)

Checks if an item has a cast ability

Parameters:
- **item** `number or string`

Returns:
- **spell_name** `string`
- **spell_id** `number`

### ni.item.charges (item)

Gets the items charges

Parameters:
- **item** `number`

Returns:
- **charges** `number`

### ni.item.count (item)

Gets the item count for an item

Parameters:
- **item** `number or string`

Returns:
- **count** `number`

### ni.item.is_present (item)

Checks if the item is in the players bags.

Parameters:
- **item** `number or string`

Returns:
- **has_item** `boolean`

### ni.item.use (item[, target])

Uses the item in the players bags

Parameters:
- **item** `number or string`
- **target** `string`

### ni.item.cooldown (item)

Gets the cooldown information of an item

Parameters:
- **item** `number`

Returns:
- **start_time** `number`
- **duration** `number`
- **enabled** `number`

### ni.item.cooldown_remaining (item)

Gets the cooldown time remaining of an item

Parameters:
- **item** `number`

Returns:
- **cooldown** `number`

