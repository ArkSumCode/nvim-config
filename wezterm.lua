local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

config.color_scheme = "tokyonight_night"
config.disable_default_key_bindings = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.font_size = 14
config.font =
	wezterm.font("RecMonoLinear Nerd Font Propo", { weight = "Regular", stretch = "Normal", style = "Normal" })

config.default_prog = { "powershell.exe" }
config.default_cwd = "C:\\Users\\marku\\repos"

config.keys = {
	{ key = "e", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "r", mods = "CTRL|SHIFT", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
	{ key = "d", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncher },
	{ key = "f", mods = "CTRL|SHIFT", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },
}

return config
