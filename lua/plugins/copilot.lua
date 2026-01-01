local config = require("copilot.config")

return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			headers = {
				user = "MAIrkus",
				assistant = "MelindAI",
			},
			functions = config,
		},
	},
}
