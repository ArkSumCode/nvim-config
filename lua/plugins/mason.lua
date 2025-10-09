return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ensure_installed = {
					"prettier",
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"lua_ls",
			"rust_analyzer",
			"ts_ls",
			"angularls",
			"eslint",
			"pyright",
			"jdtls",
		},
	},
}
