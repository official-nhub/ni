### ni.client.get_function (name[, binary_name])

Gets the client C function for the specified string.

Parameters:
- **name** `string`
- **binary_name** `string`

Returns:
- **function** `function`

Notes:
Not all binary functions are registered with the function string passed.
Some may require the binary name to be specified. I.E. tinsert in the binary
is just 'insert'. This function can return nil if a funciton isn't found.

### ni.client.build_info ()

Gets the current client build information

Returns:
- **version** `string`
- **build** `string`
- **date** `string`

### ni.client.version ()

Gets the current client version

Returns:
- **version** `string`

### ni.client.build ()

Gets the current client build number

Returns:
- **build** `string`

Notes:
3.3.5 is 12340,
4.3.4 is 15595,
5.4.8 is 18414

### ni.client.error (message)

Raise a lua error with the specified message.

Parameters:
- **message** `string`

### ni.client.protect_frame (frame)

Registers a frame to be protected from enumeration with the games Lua.

Parameters:
- **frame** `frame`

Returns:
- **success** `boolean`

### ni.client.call_protected (name[, ...])

Calls a function with the game taint triggering.

Parameters:
- **name** `string`
- **...** `functions args`

Returns:
- **...** `functions returns`

### ni.client.reset_last_hardware_action ()

Sets the last hardware action as if a key was pressed.

### ni.client.get_time ()

Gets the computer uptime in seconds

Returns:
- **uptime** `number`

### ni.client.run_text (text)

Runs macro text securely

Parameters:
- **text** `string`

### ni.client.get_net_stats ()

Gets the current client network statistics

Returns:
- **down** `number`
- **up** `number`
- **latency** `number`

Or:
- **down** `number`
- **up** `number`
- **latency_home** `number`
- **latency_world** `number`

Notes:
3.3.5 network statistics didn't differentiate between latency home and world.
Latency home is the connection between computer to server in milliseconds and
latency world is the connection between computer and server including TCP
overhead.

### ni.client.latency ()

Gets the average home latence in milliseconds

Returns:
- **latency** `number`

