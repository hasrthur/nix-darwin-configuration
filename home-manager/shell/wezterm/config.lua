local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.color_scheme = 'Catppuccin Mocha' -- Macchiato'

config.font = wezterm.font 'CaskaydiaCove Nerd Font Mono'
config.font_size = 18

config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0.5cell',
}

return config