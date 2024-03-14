local base16_colors = {
  bg = "#1B2B34",
  bg_dark = "#343D46",
  bg_highlight = "#4F5B66",
  comment = "#65737E",
  fg_dark = "#A7ADBA",
  fg = "#C0C5CE",
  fg_gutter = "#CDD3DE",
  fg_light = "#D8DEE9", -- TODO: this doesn't make sesne

  red = "#EC5f67",
  orange = "#F99157",
  yellow = "#FAC863",
  green = "#99C794",
  green_dark = "#11ab49",
  cyan = "#5FB3B3",
  blue = "#6699CC",
  purple = "#C594C5",
  magenta = "#C594C5",
  black = "#000000",
  white = "#dedcdc",
}

-- config.color_scheme = "Oceanic-Next"
command_palette_bg_color = base16_colors.black
-- https://wezfurlong.org/wezterm/config/appearance.html#retro-tab-bar-appearance
config.colors = {
  -- The default text color
  foreground = base16_colors.white,
  -- The default background color
  background = base16_colors.black,
  tab_bar = {
    background = base16_colors.black,
    active_tab = {
      bg_color = base16_colors.green_dark,
      fg_color = base16_colors.fg,
    },
    inactive_tab = {
      -- bg_color = base16_colors.bg_dark,
      bg_color = base16_colors.bg_dark,
      fg_color = base16_colors.fg_dark,
    },
    new_tab = {
      bg_color = base16_colors.bg_dark,
      fg_color = base16_colors.fg_dark,
    },
  },
}
