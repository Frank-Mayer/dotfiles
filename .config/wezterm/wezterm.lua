-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

config.color_scheme = "Catppuccin Mocha"
config.default_cursor_style = "SteadyBar"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.window_decorations = "RESIZE"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 19.0
config.unicode_version = 16
config.leader = { key = "b", mods = "CTRL" }
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.keys = {
	{ key = "5", mods = "ALT", action = wezterm.action({ SendString = "[" }) },
	{ key = "6", mods = "ALT", action = wezterm.action({ SendString = "]" }) },
	{ key = "7", mods = "ALT", action = wezterm.action({ SendString = "|" }) },
	{ key = "8", mods = "ALT", action = wezterm.action({ SendString = "{" }) },
	{ key = "9", mods = "ALT", action = wezterm.action({ SendString = "}" }) },
	{ key = "/", mods = "SHIFT|ALT", action = wezterm.action({ SendString = "\\" }) },
	{ key = "n", mods = "ALT", action = wezterm.action({ SendString = "~" }) },
	{ key = "l", mods = "ALT", action = wezterm.action({ SendString = "@" }) },
	{ key = "^", action = wezterm.action({ SendString = "^" }) },
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{ key = "o", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "LeftArrow", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "DownArrow", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "UpArrow", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "RightArrow", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = '"', mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "%", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
}

-- and finally, return the configuration to wezterm
return config
