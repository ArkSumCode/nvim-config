return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		image = {
			enabled = true,
			icons = {
				math = "󰪚 ",
				chart = "󰄧 ",
				image = " ",
			},
		},
		-- Only show explorer searchbar when typing /
		picker = { sources = { explorer = { layout = { auto_hide = { "input" } } } } }
	},
}
