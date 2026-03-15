local java = ""
local java21 = java .. "/21.0.10-zulu"
local java11 = java .. "/11.0.26-zulu"
-- this file is for working on
-- environments where the java version is lower
-- than the 21 to get the lsp to run
return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		vim.env.JAVA_HOME = java21 -- Set JAVA_HOME is required for JDTLS
		local cmd = { vom.fn.exepath("jdtls") }
		if LazyVim.has("mason.nvim") then
			-- lombok annotations need an additional argument
			-- at the jdtls command
			local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
			table.insert(cmd, string.format("--jvm-args=-javaagent:%s", lombok_jar))
		end
		vim.lsp.config("jdtls", {
			cmd = cmd,
			settings = {
				java = {
					home = java21,
					autobuild = {
						enabled = false, -- This stops the automatic build on save/change
					},
					configuartion = {
						runtimes = {
							{
								name = "JavaSE-11",
								path = java11,
								default = true,
							},
						},
					},
				},
			},
		})
	end,
}
