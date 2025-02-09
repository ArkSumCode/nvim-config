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

-- Setup Treesitter syntax highlighting
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"angular",
		"css",
		"csv",
		"dockerfile",
		"gdscript",
		"glsl",
		"go",
		"html",
		"java",
		"javascript",
		"json",
		"lua",
		"markdown",
		"php",
		"python",
		"ron",
		"rust",
		"scss",
		"sql",
		"toml",
		"tsx",
		"typescript",
		"yaml",
	},
	sync_install = false,
	auto_install = true,
	ignore_install = {},
})

-- Godot Setup
local gdscript_config = {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {},
}
if vim.fn.has("win32") == 1 then
	-- Windows specific. Requires nmap installed (`winget install nmap`)
	gdscript_config["cmd"] = { "ncat", "localhost", os.getenv("GDScript_Port") or "6005" }
end
require("lspconfig").gdscript.setup(gdscript_config)

-- Set Colorscheme
vim.cmd([[colorscheme tokyonight-night]])

-- Set Tab as intend width equals 4 Space
vim.cmd([[
	set autoindent
	set noexpandtab
	set tabstop=4
	set shiftwidth=4
]])
