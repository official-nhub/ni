### ni.utilities.table_contains_key (table, key)

Checks if a table contains a key.

Returns:
- **contains** `boolean`

### ni.utilities.table_contains_value (table, value)

Checks if a table contains a value.

Returns:
- **contains** `boolean`

### ni.utilities.ipairs (table)

Implementation of ipairs.

Parameters:
- **table** `table`

Returns:
- **key** `number`
- **value**

### ni.utilities.pairs (table)

Implementation of pairs.

Parameters:
- **table** `table`

Returns:
- **key**
- **value**

### ni.utilities.get_hwid ()

Gets the HWID for the current users computer base64 encoded.

Returns:
- **hwid** `string`

### ni.utilities.log (message)

Logs a message to the lua log file

Parameters:
- **message** `string`

### ni.utilities.has_bit (item, bit)

Checks if a bit is set on an integer

Parameters:
- **item** `number`
- **bit** `number`

Returns:
- **has_bit** `boolean`

### ni.utilities.set_bit (item, bit)

Sets the bit of an integer

Parameters:
- **item** `number`
- **bit** `number`

Returns:
- **value** `number`

### ni.utilities.clear_bit (item, bit)

Clears the bit from an integer

Parameters:
- **item** `number`
- **bit** `number`

Returns:
- **value** `number`

### ni.utilities.to_json (table)

Encodes a lua table to a json string

Parameters:
- **table** `table`

Returns:
- **json** `string`
- **error** `string`

Notes:
Can return nil on the json string if there is an error.

### ni.utilities.from_json (json)

Decodes a json string to a lua table

Parameters:
- **json** `string`

Returns:
- **table** `table`
- **error** `string`

Notes:
Can return nil if the string is improperly formed.

