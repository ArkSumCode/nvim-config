-- formatters from mason, that are not lsps should run on save:
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			angular = { "prettier" },
		},
	},
}
