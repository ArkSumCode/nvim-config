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

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "powershell.exe" }
	config.default_cwd = "C:\\Users\\marku\\repos"
end

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{ key = "%", mods = "LEADER|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "p", mods = "LEADER", action = act.PasteFrom("Clipboard") },
	{ key = "y", mods = "LEADER", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
	{ key = "d", mods = "LEADER", action = wezterm.action.ShowLauncher },
	{ key = "f", mods = "LEADER", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },
}

wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().active
	local ratio = 0.7
	local width, height = screen.width * ratio, screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window({
		position = {
			x = (screen.width - width) / 2,
			y = (screen.height - height) / 2,
			origin = "ActiveScreen",
		},
	})
	-- window:gui_window():maximize()
	window:gui_window():set_inner_size(width, height)
end)

return config
