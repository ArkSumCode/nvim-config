-- formatters from mason, that are not lsps should run on save:
return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			prettier = {
				append_args = { "--tab-width", "4" },
			},
		},
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			angular = { "prettier" },
			yaml = { "prettier" },
		},
	},
}
