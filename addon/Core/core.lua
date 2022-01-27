local ni = ...

-- Prevent double loading (Shouldn't happen, but just to be safe)
if not ni.loaded then
   local base_path = ni.backend.GetBaseFolder()
   local core_path = base_path.."addon\\core\\"
   local initial_files = {
      "io.lua",
      "client.lua",
      "utilities.lua",
      "table.lua"
   }

   -- Load the utilities table for use
   for i = 1, #initial_files do
      local file = initial_files[i]
      local func, err = ni.backend.LoadFile(core_path..file, file)
      if func then
         func(ni)
      else
         ni.backend.Error(err)
      end
   end

   -- Seed the random number generator
   ni.utilities.randomseed(ni.client.get_time())

   -- Setup the main frame for functions used later
   ni.frame = ni.client.get_function("CreateFrame")("frame", nil, UIParent)
   ni.frame:RegisterAllEvents()
   ni.backend.ProtectFrame(ni.frame, UIParent)

   -- As long as the files table isn't inserted to or removed from it'll stay in this order
   local core_files = {
      "input.lua",
      "events.lua",
      "world.lua",
      "navigation.lua",
      "item.lua",
      "gear.lua",
      "object.lua",
      "power.lua",
      "rune.lua",
      "runes.lua",
      "unit.lua",
      "player.lua",
      "spell.lua",
      "update.lua",
      "objects.lua",
      "ui.lua",
      "bootstrap.lua"
   }

   -- Load each of the above files here
   for _, file in ni.table.pairs(core_files) do
      local _, error = ni.io.load_file(core_path..file, file)
      if error then
         ni.backend.Error(error)
      end
   end

   ni.events.initialize()
   ni.update.initialize()

   do
      local window_init = core_path.."components\\main_window\\init.lua"
      local func, err = ni.io.load_buffer(window_init, string.format("@%s", window_init))
      if err then
         ni.backend.Error(err)
      else
         func(ni, core_path)
      end
   end
   -- TODO: continue after loading files

   ni.loaded = true
end