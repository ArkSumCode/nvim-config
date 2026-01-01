local function working_dir()
	return vim.fn.getcwd()
end

local function os_separator()
	return package.config:sub(1, 1)
end

local function read_file(filepath)
	local file = io.open(filepath, "r")
	if not file then
		return nil, "Could not open file: " .. filepath
	end
	local content = file:read("*a")
	file:close()
	return content
end

local function lua_files(dir, files)
	files = files or {}
	local scan = vim.loop.fs_scandir(dir)
	if not scan then
		return files
	end
	while true do
		local name, type = vim.loop.fs_scandir_next(scan)
		if not name then
			break
		end
		local full_path = dir .. os_separator() .. name
		if type == "directory" then
			lua_files(full_path, files)
		elseif type == "file" and name:sub(-4) == ".lua" then
			table.insert(files, full_path)
		end
	end
	return files
end

local function lua_objects(files)
	local objects = {}
	for _, file in ipairs(files) do
		local content = read_file(file)
		table.insert(objects, {
			uri = "lua://" .. file,
			mimetype = "text/x-lua",
			data = content,
		})
	end
	return objects
end

return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			window = {
				layout = "replace",
				title = "MelindAI",
			},
			headers = {
				user = "MAIrkus",
				assistant = "MelindAI",
			},
			functions = {
				lua = {
					description = "Send lua project files",
					uri = "lua",
					resolve = function()
						local path = working_dir()
						local files = lua_files(path)
						local objects = lua_objects(files)
						return objects
					end,
				},
			},
		},
	},
}
