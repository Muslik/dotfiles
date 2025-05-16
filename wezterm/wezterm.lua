local wezterm = require('wezterm')
local config = {
  font = wezterm.font('PragmataProLiga Nerd Font'),
  color_scheme = 'rose-pine',
  font_size = 17.0,
  line_height = 1.2,
  enable_tab_bar = false,
  native_macos_fullscreen_mode = false,
  debug_key_events = false,
  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 20,
  },
  window_decorations = 'RESIZE'
}

return config
