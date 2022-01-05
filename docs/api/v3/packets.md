# Packets

> Packets have different functions based on whether they're crafted or from a callback.

---

## new

Description:

Creates a new packet to be received/sent. The third argument is to create either a packet to receive or to send.

Arguments:
- **opcode** `number` _required_
- **size** `number` _required_
- **receive** `number` _optional; default: false_

Returns: 
- On fail: `nil`
- On success: `packet [userdata]`

Example:
```lua
--Dance emote on WoTLK
local pkt = ni.packets.new(259, 0xC, true);
pkt:write_int32(10)
pkt:write_uint64(UnitGUID("player"))
pkt:receive()
```

# Packet functions

> When calling a function for a packet, make sure you are using ":" and not ".".

---

## Metamethods worth using

### __len

Description:

Allows you to get the length of the packet easily like a table.

Example:
```lua
--Gets the packet length
local length = #pkt
```

### __call

!> Callback packet only

Description:

Allows you to call the packet as if it was a function. The argument it takes is a number to set the read index to.

Example:
```lua
--Sets the packet index to 2 and reads
local guid = pkt(2):read_uint64()
```

## send

!> Crafted packet only

Description:

Arguments: `none`

Returns: `nil`

Example:
```lua
```

## receive

!> Crafted packet only

Description:

Arguments: 

Returns: 

Example:
```lua
```

## write_packed_guid

!> Crafted packet only

Description:

Arguments: 
- **guid** `string` _packs a guid for packet that requires a packed guid_

Returns: `nil`

Example:
```lua
```

## write_float

!> Crafted packet only

Description:

Arguments:
- **value** `number` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: `nil`

Example:
```lua
```

## write_double

!> Crafted packet only

Description:

Arguments: 
- **value** `number` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: `nil`

Example:
```lua
```

## write_int64

!> Crafted packet only

Description:

Arguments: 
- **value** `string` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: `nil`

Example:
```lua
```

## write_int32

!> Crafted packet only

Description:

Arguments: 
- **value** `number` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: `nil`

Example:
```lua
```

## write_int16

!> Crafted packet only

Description:

Arguments: 
- **value** `number` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: `nil`

Example:
```lua
```

## write_int8

!> Crafted packet only

Description:

Arguments: 
- **value** `number` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: `nil`

Example:
```lua
```

## write_uint64

!> Crafted packet only

Description:

Arguments: 
- **value** `string` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: 

Example:
```lua
```

## write_uint32

!> Crafted packet only

Description:

Arguments: 
- **value** `number` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: `nil`

Example:
```lua
```

## write_uint16

!> Crafted packet only

Description:

Arguments: 
- **value** `number` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: `nil`

Example:
```lua
```

## write_uint8

!> Crafted packet only

Description:

Arguments: 
- **value** `number` _required_
- **byte_swap** `boolean` _optional; default: false_

Returns: `nil`

Example:
```lua
```

## tellg

!> Callback packet only

Description:

Gets the current read index position.

Arguments: `none`

Returns: `number`

Example:
```lua
```

## seekg

!> Callback packet only

Description:

Sets the current read index position.

Arguments: 
- **value** `number` _required_

Returns: `nil`

Example:
```lua
```

## data

!> Callback packet only

Description:

Returns the packet bytes as a table.

Arguments: `none`

Returns: `table`

Example:
```lua
```

## read_packed_guid

!> Callback packet only

Description:

Arguments: `none`

Returns: `guid [hex string]`

Example:
```lua
```

## read_float

!> Callback packet only

Description:

Arguments: 
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [number]`

Example:
```lua
```

## read_double

!> Callback packet only

Description:

Arguments: 
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [number]`

Example:
```lua
```

## read_int64

!> Callback packet only

Description:

Arguments:
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [hex string]`

Example:
```lua
```

## read_int32

!> Callback packet only

Description:

Arguments: 
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [number]`

Example:
```lua
```

## read_int16

!> Callback packet only

Description:

Arguments: 
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [number]`

Example:
```lua
```

## read_int8

!> Callback packet only

Description:

Arguments: 
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [number]`

Example:
```lua
```

## read_uint64

!> Callback packet only

Description:

Arguments: 
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [hex string]`

Example:
```lua
```

## read_uint32

!> Callback packet only

Description:

Arguments: 
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [number]`

Example:
```lua
```

## read_uint16

!> Callback packet only

Description:

Arguments: 
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [number]`

Example:
```lua
```

## read_uint8

!> Callback packet only

Description:

Arguments: 
- **byte_swap** `boolean` _optional; default: false_

Returns: `value [number]`

Example:
```lua
```