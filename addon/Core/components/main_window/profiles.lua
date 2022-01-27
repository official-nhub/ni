local ni = ...

local function get_profiles()
	local uc, ti = ni.client.get_function("UnitClass", "UnitClass"), ni.client.get_function("tinsert", "insert")
	if not uc or not ti then
		ni.backend.Error("Unable to get cached functions for GetProfiles")
	end
	local class = select(2, uc("player")):lower()
	local contents = ni.io.get_folders("addon\\Rotations\\") or {}
	local files = {}
	for i = 1, #contents do
		if string.match(contents[i]:lower(), class) then
			local folders = ni.io.get_folders(contents[i]) or {}
         if #folders == 0 then
            local entries = ni.io.get_entries(contents[i])
            local processed = false
            for i=1, #entries do
               if entries[i].extension == ".lua" or entries[i].extension == ".enc" then
                  files[entries[i].filename:sub(1, -5)] = {extension = entries[i].extension, path = entries[i].path}
               end
               if not processed then
                  processed = true
               end
            end
            if processed then
               break
            end
		   end
      end
	end
	return files
end

ni.profiles = get_profiles()