-- begin appearance.lua
--
local wezterm = require("wezterm")
local module = {}
--
-- sync with os dark mode
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end
--
-- this is where we config
function module.apply_to_config(config)
	-- Color Scheme
	config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

	-- Fonts
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

	-- INACTIVE PANE appearance
	config.inactive_pane_hsb = {
		saturation = 0.8,
		brightness = 0.8,
	}
end

return module
