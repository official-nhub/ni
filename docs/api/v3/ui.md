# ui

> Functions for creating UI elements on the overlay.

---

## new

Description:

Creates a new UI element.

Element types:
- Window
- Button
- Label
- Checkbox
- Slider
- ComboBox
- TabSelector
- Input

### Window

Arguments:
- **type** `string` _required; "Window"_
- **title** `string` _required_
- **shown** `boolean` _optional; default: true_

Returns: `window [userdata]`

Example:
```lua
local window = ni.ui.new("Window", "Fancy title")
```

### Button

Arguments:
- **type** `string` _required; "Button"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `button [userdata]`

Example:
```lua
local button = ni.ui.new("Button", window)
```

### Label

Arguments:
- **type** `string` _required; "Label"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `label [userdata]`

Example:
```lua
local label = ni.ui.new("Button", window)
```

### Checkbox

Arguments:
- **type** `string` _required; "Checkbox"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `checkbox [userdata]`

Example:
```lua
local checkbox = ni.ui.new("Checkbox", window)
```

### Slider

Arguments:
- **type** `string` _required; "Slider"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `slider [userdata]`

Example:
```lua
local slider = ni.ui.new("Slider", window)
```

### ComboBox

Arguments:
- **type** `string` _required; "ComboBox"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `combobox [userdata]`

Example:
```lua
local combobox = ni.ui.new("ComboBox", window)
```

### TabSelector

Arguments:
- **type** `string` _required; "TabSelector"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `tabselector [userdata]`

Example:
```lua
local selector = ni.ui.new("TabSelector", window)
```

### Input

Arguments:
- **type** `string` _required; "Input"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `input [userdata]`

Example:
```lua
local input = ni.ui.new("Input", window)
```