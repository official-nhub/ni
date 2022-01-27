### ni.utilities.get_hwid ()

Gets the HWID for the current users computer base64 encoded.

Returns:
- **hwid** `string`

### ni.utilities.randomseed (seed)

Sets the seed for the random generator.

Parameters:
- **seed** `number`

### ni.utilities.random ([l[, u]])

Generates a random number.

Parameters:
- **l** `number`
- **u** `number`

Returns:
- **value** `number`

Notes:
When called without arguments, the number returned is between 0 and 1.
When called with 1 argument (n), the range is between 1 and n.
When called with 2 arguments (l, u), the range is between l and u.

### ni.utilities.randomize_point (x, y[, offset])

Gets a random point within range of specified location based off the offset (or random if none specified)

Parameters:
- **x** `number`
- **y** `number`
- **offset** `number`

Returns:
- **new_x** `number`
- **new_y** `number`

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

