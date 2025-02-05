local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "AdventureTime"
config.font = wezterm.font("FreeMono", { weight = "Bold" })
config.font_size = 14.0
config.line_height = 1.5

return config
