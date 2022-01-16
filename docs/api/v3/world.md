### ni.world.get_2d_distance (x1, y1, x2, y2)

Calculates the distance between two 2D points Parameters:
- **x1** `number`
- **y1** `number`
- **x2** `number`
- **y2** `number`

Returns:
- **distance** `number`

### ni.world.get_3d_distance (x1, y1, z1, x2, y2, z2)

Calculates the distance between two 3D points Parameters:
- **x1** `number`
- **y1** `number`
- **z1** `number`
- **x2** `number`
- **y2** `number`
- **z2** `number`

Returns:
- **distance** `number`

### ni.world.trace_line (x1, y1, z1, x2, y2, z2[, hit_flags])

Performs a trace line between points to check if line of sight is present.

Parameters:
- **x1** `number`
- **y1** `number`
- **z1** `number`
- **x2** `number`
- **y2** `number`
- **z2** `number`
- **hit_flags** `number`

Returns:
- **success** `boolean`
- **intersection_x** `number`
- **intersection_y** `number`
- **intersection_z** `number`

