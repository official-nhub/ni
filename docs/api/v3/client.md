### ni.client.error (message)

Raise a lua error with the specified message.

 Parameters:
 - **message** `string`

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

