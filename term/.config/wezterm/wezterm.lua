local wezterm = require("wezterm")
local config = {}

config.enable_wayland = false -- GUI fix on Debian 13
config.initial_rows = 40
config.initial_cols = 120
config.audible_bell = "Disabled"
config.color_scheme = "nord"

return config
