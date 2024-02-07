-- https://github.com/pjcj/base/blob/2f036f8bb616a5b3dabf8314ae9eb6d574a83e32/.wezterm.lua#L406
--
local wezterm = require "wezterm"
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Fonts
-- {{{
config.adjust_window_size_when_changing_font_size = false

config.font = wezterm.font_with_fallback {
  "CaskaydiaCove Nerd Font Mono",
  { family = "Symbols Nerd Font Mono", scale = 0.9 },
  { family = "DejaVu Sans", weight = "Regular", scale = 0.75 },
}
config.font_size = 14
-- }}}
-- Windows
-- {{{
config.window_close_confirmation = "AlwaysPrompt"
config.window_padding = {
  left = 0,
  right = 0,
  top = 1,
  bottom = 0,
}
config.window_background_opacity = 0.9
-- }}}
-- Cursor
-- {{{
config.cursor_blink_rate = 1000
config.default_cursor_style = "BlinkingBlock"
config.hide_mouse_cursor_when_typing = false
config.xcursor_theme = "Adwaita"
-- }}}
-- Tabs
-- {{{
config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.2,
}
-- }}}
-- Update window title
-- {{{
wezterm.on("format-window-title", function(tab, _, tabs)
  local index = ""
  if #tabs > 1 then
    index = "[" .. tab.tab_index + 1 .. "/" .. #tabs .. "]"
  end

  return index .. tab.window_title
end)
-- }}}
-- Update status on the right side
-- {{{
-- Icons: https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
-- https://wezfurlong.org/wezterm/config/lua/window-events/update-right-status.html
wezterm.on("update-right-status", function(window)
  local _, kube_context, _ = wezterm.run_child_process { "bash", "-lc", "kubectx -c" }
  local _, kube_ns, _ = wezterm.run_child_process { "bash", "-lc", "kubens -c" }
  kube_context = kube_context:gsub("[\n\r]", "")
  kube_ns = kube_ns:gsub("[\n\r]", "")

  local date = wezterm.strftime "[%H:%M]"

  window:set_right_status(wezterm.format {
    { Foreground = { Color = base16_colors.blue } },
    { Text = wezterm.nerdfonts.md_kubernetes },
    { Foreground = { Color = base16_colors.magenta } },
    { Text = " " .. kube_context },
    { Foreground = { Color = base16_colors.cyan } },
    { Text = ":" .. kube_ns },
    { Foreground = { Color = base16_colors.red } },
    { Text = " " .. date },
  })
end)
-- }}}
