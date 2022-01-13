local ni = ...;
ni.utils = {}

ni.utils.splitstringbydelimiter = function(str, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for st in string.gmatch(str, "([^" .. sep .. "]+)") do
		table.insert(t, st)
	end
	return t
end;
ni.utils.splitstring = function(str)
	return ni.utils.splitstringbydelimiter(str, "|")
end;
ni.utils.splitstringtolower = function(str)
	str = string.lower(str)
	return ni.utils.splitstring(str)
end;
ni.utils.findand = function(str)
	return str and (string.match(str, "&&") and true) or nil
end;
ni.utils.firstcharacterupper = function(str)
	str = string.lower(str)
	return str:sub(1, 1):upper() .. str:sub(2)
end;
ni.utils.resetlasthardwareaction = function()
	ni.backend.ResetLastHardwareAction();
end;
ni.utils.savesetting = function(filename, settings)
    local dir = ni.backend.GetBaseFolder()
	if type(settings) == "table" then
    settings = ni.json.encode(settings);
	end
	ni.backend.SaveContent(dir.."addon\\Settings\\"..filename, settings);
end
ni.utils.getsettings = function(filename)
    local dir = ni.backend.GetBaseFolder()
	local content = ni.backend.GetContent(dir.."addon\\Settings\\"..filename);
	return content and ni.json.decode(content) or { };
end
local function RandomVariable(length)
    local res = ""
    for i = 1, length do
    res = res .. string.char(ni.strongrand.generate(97, 122))
    end
    return res
end
	
local generated_names = {}
ni.utils.GenerateRandomName = function()
	local name = RandomVariable(20);
    while tContains(generated_names, name) do
	name = RandomVariable(20);
	end
	table.insert(generated_names, name);
	return name;
end

ni.utils.mergetables = function(firsttable, secondtable)
	local tmp = {}

	for _, v in pairs(firsttable) do
		table.insert(tmp, v)
	end

	for _, v in pairs(secondtable) do
		table.insert(tmp, v)
	end

	return tmp
end;

ni.utils.loadprofile = function(entry)
	local result, err = ni.backend.LoadFile(entry.path, entry.filename)
	if result then
		result(ni)
		return true
	end
	ni.backend.MessageBox(err, entry.filename, 0x10)
	return false
end

local function GetFilename(path, strip)
	if type(path) == "string" then
		local start, finish = path:find('[%w%s!-={-|]+[_%.].+')
		if not start or not finish then
			return nil
		end
		result = path:sub(start,#path)
		if strip and result then
			return result:match("(.+)%..+$")
		end
		return result
	end
end


local function GetFileExtension(path)
	return path:match("^.+(%..+)$")
end

ni.utils.tinsert = function()
	return ni.backend.GetFunction("tinsert", "insert")
end

ni.utils.getprofiles = function()
	local uc, ti = ni.backend.GetFunction("UnitClass"), ni.backend.GetFunction("tinsert", "insert")
	if not uc or not ti then
		ni.backend.Error("Unable to get cached functions for GetProfiles")
	end
	local class = select(2, uc("player")):lower()
	local dir = ni.backend.GetBaseFolder()
	local contents = ni.backend.GetDirectoryContents(dir.."addon\\Rotations\\") or {}
	local files = {}
	for i = 1, #contents do
		if contents[i].is_dir and string.match(contents[i].path:lower(), class) then
			local sub_contents = ni.backend.GetDirectoryContents(contents[i].path) or {}
			local processed = false
			for i = 1, #sub_contents do
				if not sub_contents[i].is_dir then
					local extension = GetFileExtension(sub_contents[i].path)
					if extension == ".enc" or extension == ".lua" then
						ti(files, { title = GetFilename(sub_contents[i].path, true), filename = GetFilename(sub_contents[i].path), path = sub_contents[i].path})
						if not processed then
							processed = true
						end
					end
				end
			end
			if processed then
				break
			end
		end
	end
	return files
end
