-------------------
-- OnUpdate section for ni
local ni = ...

ni.update = {}

local tinsert = ni.client.get_function("tinsert", "insert")
local tremove = ni.client.get_function("tremove", "remove")

-- Table to store the registered callbacks
local update_callbacks = {}
-- Creating for count to prevent lookup time of the table length
local items_in_table = 0

--[[--
@local
Default OnUpdate callback for client.
 
Parameters:
- **self** `frame`
- **elapsed** `number`
- **...**
@param self
@param elapsed
@param[opt]...
]]
local function update_callback(self, elapsed, ...)
   for i = 1, items_in_table do
      update_callbacks[i].callback(elapsed)
   end
end

--[[--
Function for registering a callback to be executed.
 
Parameters:
- **title** `string`
- **func** `function`
@param title string
@param func function
]]
function ni.update.register_callback(title, func)
   local contains = false
   for i = 1, #update_callbacks do
      if update_callbacks[i].name == title then
         contains = true
         break
      end
   end
   if not contains then
      tinsert(update_callbacks, {
         name = title,
         callback = func
      })
      items_in_table = #update_callbacks
   end
end

--[[--
Function for unregistering callback.
 
Parameters:
- **title** `string`
@param title string
]]
function ni.update.unregister_callback(title)
   for key, handler in ni.table.pairs(update_callbacks) do
      if handler.name == title then
         tremove(update_callbacks, key)
         items_in_table = #update_callbacks
         return
      end
   end
end

--[[--
Initializes the OnUpdate handler to be used.
]]
function ni.update.initialize()
   ni.frame:SetScript("OnUpdate", update_callback)
end