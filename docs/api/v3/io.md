### ni.io.get_base_path ()

Gets the base path for ni, which is the location the loader resides.

Returns:
- **path** `string`

### ni.io.split_path (path)

Split the path into an entry table.

Parameters:
- **path** `string`

Returns:
- [`entry table`](#entry)

### ni.io.load_string (string[, chunk])

Loads a string into buffer to be executed.

Parameters:
- **string** `string`
- **chunk** `string`

Returns:
- **func** `function`
- **err** `string`

### ni.io.load_buffer (file[, chunk])

Loads a file into the lua buffer to be executed.

Parameters:
- **file** `string`
- **chunk** `string`

Returns:
- **func** `function`
- **error** `string`

### ni.io.load_file (path[, chunk[, parser]])

This function will load the selected file into the lua state.

Parameters:
- **path** `string`
- **chunk** `string`
- **parser** `function`

Returns:
- **success** `boolean`
- **error** `string`

### ni.io.load_entry (entry[, parser])

Loads the entry into the lua state

Parameters:
- **entry** `entry table`
- **parser** `function`

Returns:
- **success** `boolean`
- **error** `string`

### ni.io.get_contents (directory)

Gets contents from directory

Parameters:
- **directory** `string`

Returns:
- **content** `content table`
- **error** `string`

### ni.io.get_folders (directory)

Gets the folders within a directory

Parameters:
- **directory** `string`

Returns:
- **folders** `string table`
- **error** `string`

### ni.io.get_entries (directory)

Gets entries from directory

Parameters:
- **directory** `string`

Returns:
- **entries** `entry table`

### entry

Table keys:
- **extension** `string`
- **filename** `string`
- **stem** `string`
- **path** `string`

### content

Table keys:
- **path** `string`
- **is_directory** `boolean`

