### ni.utilities.get_base_path ()

Gets the base path for ni, which is the location the loader resides.

 Returns:
 - **path** `string`

### ni.utilities.split_path (path)

Split the path into an entry table.

 Returns:
 - [`entry table`](#entry)

### ni.utilities.load_file (path[, chunk[, parser]])

This function will load the selected file into the lua state.

 Returns:
 - **success** `boolean`
 - **error** `string`

### ni.utilities.load_entry (entry[, parser])

Loads the entry into the lua state

 Returns:
 - **success** `boolean`
 - **error** `string`

### ni.utilities.get_contents (directory)

Gets contents from directory  Returns:
 - **content** `content table`
 - **error** `string`

### ni.utilities.get_folders (directory)

Gets the folders within a directory  Returns:
 - **folders** `string table`
 - **error** `string`

### ni.utilities.get_entries (directory)

Gets entries from directory  Returns:
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

