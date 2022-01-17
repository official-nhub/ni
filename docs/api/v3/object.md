### ni.object.exists (object)

Checks if the given object is within game memory

Parameters:
- **object** `string`

Returns:
- **exists** `boolean`

### ni.object.type (object)

Gets the objects type.

Parameters:
- **object** `string`

Returns:
- **type** `number`

### ni.object.is_player (object)

Gets if the object is a player

Parameters:
- **object** `string`

Returns:
- **is_player** `boolean`

### ni.object.is_unit (object)

Gets if the object is a unit

Parameters:
- **object** `string`

Returns:
- **is_unit** `boolean`

### ni.object.location (token)

Gets the object location information

Parameters:
- **token** `string`

Returns:
- **x** `number`
- **y** `number`
- **z** `number`

### ni.object.creator (object)

Gets the GUID of the objects creator.

Parameters:
- **object** `string`

Returns:
- **guid** `string`

### ni.object.pointer (object)

Gets the objects pointer

Parameters:
- **object** `string`

Returns:
- **pointer** `number`
- **hex_pointer** `string`

### ni.object.transport (object)

Gets the objects transport guid

Parameters:
- **object** `string`

Returns:
- **guid** `string`

### ni.object.descriptor (object, index)

Gets the object descriptor value for the given index

Parameters:
- **object** `string`
- **index** `number`

Returns:
- **descriptor** `number`
