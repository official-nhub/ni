# UI

> Functions for creating UI elements on the overlay. All element text/title when set with ## before the string hides the text.

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

Keys:
- **Open** `boolean` _gets and sets window open_
- **Title** `string` _only returns title, cannot change_

Example:
```lua
local window = ni.ui.new("Window", "Fancy title", false)
window.Open = true
```

### Button

Arguments:
- **type** `string` _required; "Button"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `button [userdata]`

Keys:
- **Text** `string` _gets and sets button text_
- **Callback** `function` _sets the button callback_

Example:
```lua
local button = ni.ui.new("Button", window)
button.Text = "Greetings"
button.Callback = function()
	print("Ohai")
end
```

### Label

Arguments:
- **type** `string` _required; "Label"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `label [userdata]`

Keys:
- **Text** `string` _gets and sets label text_

Example:
```lua
local label = ni.ui.new("Label", window)
label.Text = "Some cool label"
```

### Checkbox

Arguments:
- **type** `string` _required; "Checkbox"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `checkbox [userdata]`

Keys:
- **Checked** `boolean` _gets and sets the checkbox checked status_
- **Text** `string` _gets and sets the checkbox text_
- **Callback** `function` _sets the checkbox callback_

Example:
```lua
local checkbox = ni.ui.new("Checkbox", window)
checkbox.Text = "Not checked"
checkbox.Checked = false
checkbox.Callback = function(checked)
	if checked then
		checkbox.Text = "Checked"
	else
		checkbox.Text = "Not checked"
	end
end
```

### Slider

Arguments:
- **type** `string` _required; "Slider"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `slider [userdata]`

Keys:
- **Value** `number` _gets and sets the slider value_
- **Min** `number` _gets and sets the slider minimum value_
- **Max** `number` _gets and sets the slider maximum value_
- **Text** `string` _gets and sets the slider text_
- **Width** `number` _gets and sets the slider width_

Example:
```lua
local slider = ni.ui.new("Slider", window)
slider.Text = "##latency" --Will hid the text
slider.Value = 200
slider.Min = 20
slider.Max = 1000
```

### ComboBox

Arguments:
- **type** `string` _required; "ComboBox"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `combobox [userdata]`

Keys:
- **Text** `string` _gets and sets the combo box text_
- **Selected** `string` _gets and sets the combo box selected text_
- **Width** `number` _gets and sets the combo box width_
- **Add** `function` _adds an element into the combo box_
- **Remove** `function` _removes an element from the combo box_
- **Callback** `function` _sets the callback function to execute when an item is selected_

Example:
```lua
local combobox = ni.ui.new("ComboBox", window)
combobox.Text = "##profiles"
combobox.Selected = "Select a profile"
combobox:Add("Select a profile")
combobox:Add("Some cool profile")
combobox.Callback = function(selected)
	print(string.format("%s was selected", selected))
end
```

### Input

Arguments:
- **type** `string` _required; "Input"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `input [userdata]`

Keys:
- **Text** `string` _gets and sets the input text_
- **Value** `string` _gets and sets the input text value_
- **Width** `number` _gets and sets the input text width_

Example:
```lua
local input = ni.ui.new("Input", window)
input.Text = "##something"
input.Value = "Some string value"
```

### TabSelector

Arguments:
- **type** `string` _required; "TabSelector"_
- **parent** `userdata` _required_
- **same_line** `boolean` _optional; default: false_

Returns: `tabselector [userdata]`

Keys:
- **AddTab** `function` _creates a new tab element_

Example:
```lua
local selector = ni.ui.new("TabSelector", window)
local tab1 = selector:AddTab("Tab 1")
local tab2 = selector:AddTab("Another tab")
```

### Tab

Arguments: `none`

Returns: `none`

Keys:
- **Text** `string` _gets and sets the tab text_

Example:
```lua
local selector = ni.ui.new("TabSelector", window)
local tab = selector:AddTab("A title I don't want")
tab.Text = "Desired title"
```