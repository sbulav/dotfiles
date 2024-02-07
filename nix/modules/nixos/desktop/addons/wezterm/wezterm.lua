-- https://github.com/pjcj/base/blob/2f036f8bb616a5b3dabf8314ae9eb6d574a83e32/.wezterm.lua#L406
--
local wezterm = require "wezterm"
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- https://wezfurlong.org/wezterm/config/lua/window-events/update-right-status.html
wezterm.on("update-right-status", function(window)
  window:set_right_status(wezterm.format {
    { Text = wezterm.strftime "[%H:%M]" },
  })
end)

local font_family = "CaskaydiaCove Nerd Font Mono"
config.adjust_window_size_when_changing_font_size = false

-- wezterm comes with JetBrains Mono and a default fallback font for symbols
-- so technically, this is not needed. But the fallback symbols are a bit odd
-- looking compared to JetBrains Mono (seem too big or stretched out)
config.font = wezterm.font_with_fallback {
  { family = font_family, weight = "Regular", stretch = "Normal", style = "Normal" },
  { family = font_family, weight = "Regular", stretch = "Normal", style = "Italic" },
  { family = font_family, weight = "Bold", stretch = "Normal", style = "Normal" },
  { family = font_family, weight = "Bold", stretch = "Normal", style = "Italic" },
}

-- config.font = wezterm.font("CaskaydiaCove Nerd Font", {
--   weight = "Regular",
-- })
config.font_size = 14
config.window_padding = {
  left = 0,
  right = 0,
  top = 1,
  bottom = 1,
}
config.xcursor_theme = "Adwaita"
config.window_background_opacity = 0.9
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.tab_max_width = 64
config.hide_mouse_cursor_when_typing = false
-- config.color_scheme = "Oceanic-Next"
config.cursor_blink_rate = 1000
config.command_palette_bg_color = "#1c1c1c"
config.default_cursor_style = "BlinkingBlock"

-- Never prompt confirmation for closing
-- config.window_close_confirmation = "NeverPrompt"
config.window_close_confirmation = "AlwaysPrompt"

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
}

-- https://wezfurlong.org/wezterm/config/appearance.html#retro-tab-bar-appearance
config.colors = {
  -- The default text color
  foreground = "white",
  -- The default background color
  background = "black",
  tab_bar = {
    background = base16_colors.bg,
    active_tab = {
      bg_color = base16_colors.green_dark,
      fg_color = base16_colors.fg,
    },
    inactive_tab = {
      bg_color = base16_colors.bg_dark,
      fg_color = base16_colors.fg_dark,
    },
    new_tab = {
      bg_color = base16_colors.bg_dark,
      fg_color = base16_colors.fg_dark,
    },
  },
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.2,
}

wezterm.on("format-window-title", function(tab, _, tabs)
  local index = ""
  if #tabs > 1 then
    index = "[" .. tab.tab_index + 1 .. "/" .. #tabs .. "]"
  end

  return index .. tab.window_title
end)
