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
