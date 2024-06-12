-- Wezterm configuration file

local wezterm = require("wezterm")
-- local keybinds = require 'keybinds'
-- local appearance = require 'appearance'
-- local workspaces = require 'workspaces'
-- local actions = require 'actions'
local config = {}

-- keybinds.apply_to_config(config)
-- appearance.apply_to_config(config)
-- workspaces.apply_to_config(config)
-- actions.apply_to_config(config)

--
--
--
--
--
-- APPEARANCE
-- sync COLOR SCHEME with os dark mode
function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

-- FONT + fallback fonts
-- (else, falls back to Nerd Font Symbols; which means you don't need to use specially patched fonts!)
config.font = wezterm.font_with_fallback({
	"GeistMono Nerd Font",
	"GeistMono",
	"Liberation Mono",
})

-- CURSOR_STYLE
-- config.default_cursor_style = "BlinkingBlock"
-- config.cursor_blink_rate = 800

-- VISUAL_BELL
-- config.visual_bell = {
-- 	fade_in_duration_ms = 150,
-- 	fade_out_duration_ms = 150,
-- }
--
-- WINDOW appearance
config.window_padding = {
	bottom = 0,
}

-- TAB BAR appearance
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
-- config.show_tab_index_in_tab_bar = false

--TAB appearance
--lol
-- new try
-- make keybind action to set name of tab to "${PWD##*/}"
--
-- prev attempts
-- os.execute([wezterm cli set-tab-title "test"])
-- wezterm cli set-tab-title "${PWD##*/}"
-- wezterm.action_callback(function(window, pane, line) wezterm.window:active_tab():set_title("test")
-- wezterm.on("update-status", window:active_tab().set_title("my title"))
-- config.window:active_tab():active_pane.current_working_dir
-- config.window:active_tab:set_title("my title")
-- config

-- INACTIVE PANE appearance
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.8,
}

-- require("keybinds")

return config
