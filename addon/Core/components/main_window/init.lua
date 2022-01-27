local ni, core = ...

-- Localize string creation for main folder as it'll be used a few times
local window_folder = core.."components\\main_window\\"
ni.io.load_file(window_folder .. "\\" .. "profiles.lua", "profiles.lua")

ni.window = ni.ui.window("ni", false)
if ni.window then
   local label = ni.ui.label(ni.window)
   label.Text = "Version: "..ni.__version
   ni.ui.separator(ni.window)
   local tab_manager = ni.ui.tab_manager(ni.window)
   local main_tab = tab_manager:AddTab("Main")
   local toggle_key = "F10"
   local primary_key = "F1"
   local secondary_key = "F2"
   local generic_key = "F3"
   local latency = 200
   local main_tab_manager = ni.ui.tab_manager(main_tab)
   do
      -- Setup the main window portion
      local selector_tab = main_tab_manager:AddTab("Selector")
      do
         local label = ni.ui.label(selector_tab)
         label.Text = "Primary Profile"
         label.Centered = true
         local combo = ni.ui.combobox(selector_tab)
         combo.Text = "##primary"
         combo.Selected = "None"
         combo:Add("None")
         for k in pairs(ni.profiles) do
            combo:Add(k)
         end
         combo.Callback = function(selected)
            ni.profiles.primary = selected
         end
      end
      do
         local label = ni.ui.label(selector_tab)
         label.Text = "Secondary Profile"
         label.Centered = true
         local combo = ni.ui.combobox(selector_tab)
         combo.Text = "##secondary"
         combo.Selected = "None"
         combo:Add("None")
         for k in pairs(ni.profiles) do
            combo:Add(k)
         end
         -- combo.Callback = function(selected)
         --    ni.profiles.secondary = selected
         -- end
      end
      do
         local label = ni.ui.label(selector_tab)
         label.Text = "Generic Profile"
         label.Centered = true
         local combo = ni.ui.combobox(selector_tab)
         combo.Text = "##generic"
         combo.Selected = "None"
         combo:Add("None")
         -- for i=1, #ni.profiles do
         --    combo:Add(ni.profiles[i].filename)
         -- end
         -- combo.Callback = function(selected)
         --    ni.profiles.generic = selected
         -- end
      end
   end
   do
      local settings_tab = main_tab_manager:AddTab("Settings")
      do 
         local function_keys = {}
         for i = 1, 12 do
            function_keys[i] = string.format("F%d", i)
         end

         local latency_label = ni.ui.label(settings_tab)
         latency_label.Text = "Latency"
         latency_label.Centered = true
         local latency_slider = ni.ui.slider(settings_tab)
         latency_slider.Min = 20
         latency_slider.Max = 1000
         latency_slider.Value = latency
         latency_slider.Width = -1
         latency_slider.Text = "##latency"
         ni.ui.separator(settings_tab)
         local key_label = ni.ui.label(settings_tab)
         key_label.Text = "Toggle Keys"
         key_label.Centered = true
         -- Helper function to avoid typing all this 3 times
         local function setup_toggles(label_text, combo_text, x_offset, combo_selected, combo_items, combo_callback)
            local label = ni.ui.label(settings_tab)
            label.Text = label_text
            label.OffsetY = 3
            local combo = ni.ui.combobox(settings_tab, true)
            combo.Text = combo_text
            combo.OffsetY = -3
            if x_offset then
               combo.OffsetX = x_offset
            end
            combo.Selected = combo_selected
            for i = 1, #combo_items do
               combo:Add(combo_items[i])
            end
            combo.Callback = combo_callback
         end
         setup_toggles("UI Toggle:", "##uitoggle", 49, toggle_key, function_keys, function(selected)
            toggle_key = selected
         end)
         setup_toggles("Primary Toggle:", "##primarytoggle", 14, primary_key, function_keys, function(selected)
            primary_key = selected
         end)
         setup_toggles("Secondary Toggle:", "##secondarytoggle", nil, secondary_key, function_keys, function(selected)
            secondary_key = selected
         end)
         setup_toggles("Generic Toggle:", "##generictoggle", 14, generic_key, function_keys, function(selected)
            generic_key = selected
         end)
      end
   end
   local tracker_tab = tab_manager:AddTab("Tracker")
   do
      -- Set up the tracking tabs
      local tracker_tab_manager = ni.ui.tab_manager(tracker_tab)
      do 
         local resource_tab = tracker_tab_manager:AddTab("Resources")
         local resource_file = window_folder.."resource.lua"
         local func, err = ni.io.load_buffer(resource_file, string.format("@%s", resource_file))
         func(ni, resource_tab)
      end
      do
         local creature_tab = tracker_tab_manager:AddTab("Creatures")
         local creature_file = window_folder.."creature.lua"
         local func, err = ni.io.load_buffer(creature_file, string.format("@%s", creature_file))
         func(ni, creature_tab)
      end
   end
   -- Create the callback for toggling the window open and close
   ni.input.register_callback("ni-main", function()
      if ni.input.key_down(toggle_key) then
         ni.window.Open = not ni.window.Open
         return true
      end
      return false
   end)
   -- This should be moved outside of if ni.window
   ni.input.register_callback("primary", function()
      if ni.input.key_down(primary_key) then
         ni.profiles[ni.profiles.primary].started = not ni.profiles[ni.profiles.primary].started
         if ni.profiles[ni.profiles.primary].started then
            ni.io.load_file(ni.profiles[ni.profiles.primary].path)
            ni.update.register_callback(ni.profiles.primary, ni.bootstrap[ni.profiles.primary].execute)
         else
            ni.update.unregister_callback(ni.profiles.primary)
         end
         return true
      end
      return false
   end)
end