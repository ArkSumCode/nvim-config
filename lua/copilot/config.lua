local functions = require("copilot.functions")

return {
	lua = {
		description = "Send lua project files",
		uri = "lua",
		resolve = function()
			return functions.project_files("lua", "text/x-lua", ".lua", { "README.md" })
		end,
	},
	rust = {
		description = "Send rust project files",
		uri = "rust",
		resolve = function()
			return functions.project_files("rust", "text/x-rust", ".rs", { "README.md", "Cargo.toml" }, "src/")
		end,
	},
	java = {
		description = "Send java project files",
		uri = "java",
		resolve = function()
			return functions.project_files("java", "text/x-java", ".java", { "README.md" })
		end,
	},
	javascript = {
		description = "Send javascript project files",
		uri = "js",
		resolve = function()
			return functions.project_files("javascript", "text/javascript", ".js", { "README.md" })
		end,
	},
	typescript = {
		description = "Send typescript project files",
		uri = "ts",
		resolve = function()
			return functions.project_files("typescript", "text/typescript", ".ts", { "README.md" })
		end,
	},
}
