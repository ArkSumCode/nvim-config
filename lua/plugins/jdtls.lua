-- this file is for working in
-- environments where the java version
-- is different to what jdtls needs
-- to operate
local java = "C:/Program Files/Common Files/Oracle/Java/javapath"
local java21 = java .. "/java.exe"
return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		vim.env.JAVA_HOME = java21 -- set JAVA_HOME is required for JDTLS
		local cmd = { vim.fn.exepath("jdtls") }
		if LazyVim.has("mason.nvim") then
			-- lambok only works
			-- when updating the command
			local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
			table.insert(cmd, string.format("--jvm-args=-javaagent:%s", lombok_jar))
		end
		vim.lsp.config("jdtls", {
			cmd = cmd,
			settings = {
				java = {
					home = java21,
				},
				autobuild = {
					enabled = false, -- this stops the automatic build on save/change
				},
				configuration = {
					runtimes = {
						{
							name = "JavaSE-25",
							path = java21,
							default = true,
						},
					},
				},
			},
		})
	end,
}
