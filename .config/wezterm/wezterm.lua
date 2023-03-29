local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

return {
  ----------    GENERAL    ----------
  audible_bell = "Disabled",

  ---------- WINDOW LAYOUT ----------  
  window_background_opacity = 0.85,
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
    top = 40,
    bottom = 0,
  },

  ----------     FONTS    -----------
  font_size = 12.5,

  ----------  COLORSCHEME  ----------  
  force_reverse_video_cursor = true,
  colors = {
    foreground = '#ebdbb2',
    background = '#252525',

    ansi = {
      '#282828',
      '#cc241d',
      '#98971a',
      '#d79921',
      '#458588',
      '#b16286',
      '#689d6a',
      '#a89984',
    },
    brights = {
      '#928373',
      '#fb4934',
      '#b8bb26',
      '#fabd2f',
      '#83a598',
      '#d3869b',
      '#8ec07c',
      '#ebdbb2',
    },
  }
}