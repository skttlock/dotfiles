-- Wezterm configuration file

local wezterm = require("wezterm")
local config = {}

-- sync color scheme with os dark mode
function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

-- set font + fallback fonts (else, falls back to Nerd Font Symbols; which means you don't need to use specially patched fonts!)
config.font = wezterm.font_with_fallback({
	"GeistMono Nerd Font",
	"GeistMono",
	"Liberation Mono",
})

-- set appearance of inactive panes
config.inactive_pane_hsb = {
	saturation = 0.7,
	brightness = 0.7,
}

-- set window border appearance
--TODO:
--this

-- tab bar appearance
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- set keybinds

return config
