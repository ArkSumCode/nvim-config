return {
	{
		"mason-org/mason.nvim",
		opts = {},
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls" },
			})
		end,
	},
}
