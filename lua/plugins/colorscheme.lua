return {
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "cyberdream",
			-- colorscheme = "base16-circus", --light color scheme
			-- colorscheme = "base16-equilibrium-light", -- dark color scheme
			colorscheme = "tokyonight-night",
			-- colorscheme = "catppuccin",
		},
	},
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"RRethy/base16-nvim",
	},
	{
		"catppuccin/nvim",
		opts = {
			flavour = "mocha", -- dark theme
			transparent_background = true,
			float = {
				transparent = true,
				solid = false,
			},
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
}
