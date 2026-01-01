local function read_file(filepath)
	local file = io.open(filepath, "r")
	if not file then
		return nil, "Could not open file: " .. filepath
	end
	local content = file:read("*a")
	file:close()
	return content
end

local function scan_files_by_name(name)
	return vim.fn.glob("**/" .. name, true, true)
end

local function scan_files_by_names(names)
	local files = {}
	for _, name in ipairs(names) do
		local scan = scan_files_by_name(name)
		for _, file in ipairs(scan) do
			table.insert(files, file)
		end
	end
	return files
end

local function scan_files_by_ext(ext)
	return vim.fn.glob("**/*" .. ext, true, true)
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

local function concat_tables(t1, t2)
	local result = {}
	for _, v in ipairs(t1) do
		table.insert(result, v)
	end
	for _, v in ipairs(t2) do
		table.insert(result, v)
	end
	return result
end

local function project_files(scheme, mimetype, ext, names)
	local f1 = scan_files_by_ext(ext)
	local f2 = scan_files_by_names(names)
	local files = concat_tables(f1, f2)
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
						return project_files("lua", "text/x-lua", ".lua", { "README.md" })
					end,
				},
				rust = {
					description = "Send rust project files",
					uri = "rust",
					resolve = function()
						return project_files("rust", "text/x-rust", ".rs", { "README.md", "cargo.toml" })
					end,
				},
				java = {
					description = "Send java project files",
					uri = "java",
					resolve = function()
						return project_files("java", "text/x-java", ".java", { "README.md" })
					end,
				},
				javascript = {
					description = "Send javascript project files",
					uri = "js",
					resolve = function()
						return project_files("javascript", "text/javascript", ".js", { "README.md" })
					end,
				},
				typescript = {
					description = "Send typescript project files",
					uri = "ts",
					resolve = function()
						return project_files("typescript", "text/typescript", ".ts", { "README.md" })
					end,
				},
			},
		},
	},
}
