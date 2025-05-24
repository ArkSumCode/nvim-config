-- Set colorscheme to tokyonight night
return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "base16-circus", --light color scheme
			-- colorscheme = "base16-equilibrium-light", -- dark color scheme
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
}
