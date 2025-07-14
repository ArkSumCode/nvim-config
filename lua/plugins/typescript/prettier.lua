return {
	{
		"mason-org/mason.nvim",
		opts = { ensure_installed = { "prettier", "prettierd" } },
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = function()
			local opts = {
				default_format_opts = {
					timeout_ms = 3000,
					async = false,
					quiet = false,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					typescript = { "prettierd", "prettier" },
					javascript = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
				},
				formatters = {
					injected = { options = { ignore_errors = true } },
				},
			}
			return opts
		end,
	},
}
