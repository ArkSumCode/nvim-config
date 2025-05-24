-- Set colorscheme to tokyonight night
return {
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "tokyonight-night",
			-- colorscheme = "dayfox",
			colorscheme = "kanagawa",
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
		"rebelot/kanagawa.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
