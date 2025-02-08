-- Download Lazy Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("Installing 'folke/lazy.nvim'...")
	vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Startup Lazy
require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	install = { colorscheme = { "tokyonight" } },
	checker = {
		enabled = true,
		notify = true,
	},
	packagerformance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- Startup LSP
require("lspconfig")["gdscript"].setup({
	name = "godot",
	cmd = { "ncat", "127.0.0.1", "6005" },
})

-- Set Colorscheme
vim.cmd([[colorscheme tokyonight-night]])
