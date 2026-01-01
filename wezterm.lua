local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

config.default_cwd = "/home/markus/repos/"

-- color schemes
-- config.color_scheme = "tokyonight_night"
-- config.color_scheme = "Equilibrium Light (base16)" -- light color scheme
-- config.color_scheme = "Circus (base16)Circus (base16)" -- dark color scheme
config.color_scheme = "Catppuccin Mocha" -- dark color scheme

config.font_size = 14
config.font =
	wezterm.font("RecMonoLinear Nerd Font Propo", { weight = "Regular", stretch = "Normal", style = "Normal" })

config.term = "xterm-256color"
config.window_background_gradient = {
	colors = { "#191919", "#191919" },
	orientation = "Vertical",
}
config.window_background_opacity = 0.9
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{ key = "i", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "u", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "p", mods = "LEADER", action = act.PasteFrom("Clipboard") },
	{ key = "y", mods = "LEADER", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
	{ key = "g", mods = "LEADER", action = wezterm.action({ Search = { CaseInSensitiveString = "" } }) },
	{ key = "f", mods = "LEADER", action = wezterm.action.ToggleFullScreen },
	{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
	{ key = "d", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{
		key = "l",
		mods = "LEADER",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "l", mods = "CTRL" }),
		}),
	},
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
}

-- hide tab
config.disable_default_key_bindings = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false

for i = 1, 8 do
	-- F1 through F8 to activate that tab
	table.insert(config.keys, {
		key = "F" .. tostring(i),
		action = act.ActivateTab(i - 1),
	})
end

wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().active
	local ratio = 0.9
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

-- windows specific
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- set terminal from cmd to powershell
	config.default_prog = { "pwsh.exe" }
end

return config
