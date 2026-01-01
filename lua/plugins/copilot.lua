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

local function scan_files_by_ext(dir, ext, files)
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
			scan_files_by_ext(full_path, ext, files)
		elseif type == "file" then
			if name:sub(-#ext) == ext then
				table.insert(files, full_path)
				break
			end
		end
	end
	return files
end

local function make_objects(scheme, mimetype, files)
	local objects = {}
	for _, file in ipairs(files) do
		local content = read_file(file)
		table.insert(objects, {
			uri = scheme .. "://" .. file,
			mimetype = mimetype,
			data = content,
		})
	end
	return objects
end

local function project_files(scheme, mimetype, ext)
	local path = working_dir()
	local files = scan_files_by_ext(path, ext)
	return make_objects(scheme, mimetype, files)
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
						return project_files("lua", "text/x-lua", ".lua")
					end,
				},
				rust = {
					description = "Send rust project files",
					uri = "rust",
					resolve = function()
						return project_files("rust", "text/x-rust", ".rs")
					end,
				},
				java = {
					description = "Send java project files",
					uri = "java",
					resolve = function()
						return project_files("java", "text/x-java", ".java")
					end,
				},
				javascript = {
					description = "Send javascript project files",
					uri = "js",
					resolve = function()
						return project_files("javascript", "text/javascript", ".js")
					end,
				},
				typescript = {
					description = "Send typescript project files",
					uri = "ts",
					resolve = function()
						return project_files("typescript", "text/typescript", ".ts")
					end,
				},
			},
		},
	},
}
