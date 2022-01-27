local ni = ...

local function run(name, queue, abilities, onload, onunload)
   local profile = {};
   profile.loaded = false;
   profile.name = name;
   function profile.execute()
      local temp_queue;
      if type(queue) == "function" then
         temp_queue = queue()
      else
         temp_queue = queue;
      end
      for i = 1, #temp_queue do
         local abilityinqueue = temp_queue[i]
         if abilities[abilityinqueue] ~= nil and abilities[abilityinqueue]() then
            break
         end
      end
   end
   return profile;
end

ni.bootstrap = {
   profile = function(name, queue, abilities, onload, onunload)
      ni.bootstrap[name] = run(name, queue, abilities, onload, onunload);
   end
}