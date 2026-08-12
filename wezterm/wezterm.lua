local wezterm = require('wezterm')
local config = {
  -- 'PragmataPro Nerd Font' is the 2022 Nerd Fonts 2.1.0 patch: it carries the
  -- icons, but ships Regular only. Left alone wezterm smears that into a fake
  -- bold, so the rules below hand each weight to the genuine 2021 cuts.
  font = wezterm.font_with_fallback({
    'PragmataPro Nerd Font',
    'PragmataPro',
    'Symbols Nerd Font Mono',
  }),
  font_rules = {
    {
      intensity = 'Bold',
      italic = false,
      font = wezterm.font_with_fallback({
        { family = 'PragmataPro', weight = 'Bold' },
        'PragmataPro Nerd Font',
        'Symbols Nerd Font Mono',
      }),
    },
    {
      intensity = 'Normal',
      italic = true,
      font = wezterm.font_with_fallback({
        { family = 'PragmataPro', style = 'Italic' },
        'PragmataPro Nerd Font',
        'Symbols Nerd Font Mono',
      }),
    },
    {
      intensity = 'Bold',
      italic = true,
      font = wezterm.font_with_fallback({
        { family = 'PragmataPro', weight = 'Bold', style = 'Italic' },
        'PragmataPro Nerd Font',
        'Symbols Nerd Font Mono',
      }),
    },
  },
  color_scheme = 'rose-pine',
  font_size = 17.0,
  line_height = 1.2,
  enable_tab_bar = false,
  native_macos_fullscreen_mode = false,
  debug_key_events = false,
  window_background_opacity = 1,
  macos_window_background_blur = 20,
  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 20,
  },
  window_decorations = 'RESIZE',
  keys = {
    -- Ctrl+Shift+O — переключить прозрачность
    {
      key = 'O',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(function(window, pane)
        local overrides = window:get_config_overrides() or {}
        if overrides.window_background_opacity == 1.0 then
          overrides.window_background_opacity = 0.9
          overrides.macos_window_background_blur = 20
        else
          overrides.window_background_opacity = 1.0
          overrides.macos_window_background_blur = 0
        end
        window:set_config_overrides(overrides)
      end),
    },
    -- Ctrl+Shift+] — увеличить прозрачность
    {
      key = ']',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(function(window, pane)
        local overrides = window:get_config_overrides() or {}
        local opacity = overrides.window_background_opacity or 0.85
        overrides.window_background_opacity = math.min(opacity + 0.05, 1.0)
        window:set_config_overrides(overrides)
      end),
    },
    -- Ctrl+Shift+[ — уменьшить прозрачность
    {
      key = '[',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(function(window, pane)
        local overrides = window:get_config_overrides() or {}
        local opacity = overrides.window_background_opacity or 0.85
        overrides.window_background_opacity = math.max(opacity - 0.05, 0.1)
        window:set_config_overrides(overrides)
      end),
    },
  },
}

return config
