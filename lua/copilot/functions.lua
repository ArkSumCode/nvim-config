local M = {}

local function read_file(filepath)
	local file = io.open(filepath, "r")
	if not file then
		return nil, "Could not open file: " .. filepath
	end
	local content = file:read("*a")
	file:close()
	return content
end

local function scan_files(ext, names, root)
	local files = vim.fn.glob(root .. "**/*" .. ext, true, true)
	for _, name in ipairs(names or {}) do
		vim.list_extend(files, vim.fn.glob("**/" .. name, true, true))
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

function M.project_files(scheme, mimetype, ext, names, root)
	root = root or ""
	local files = scan_files(ext, names, root)
	return make_objects(scheme, mimetype, files)
end

return M
