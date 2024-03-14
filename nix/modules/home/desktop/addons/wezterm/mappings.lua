local act = wezterm.action

config.leader = { key = "b", mods = "CTRL" }

config.keys = {
  {
    key = "-",
    mods = "ALT",
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "=",
    mods = "ALT",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = "w",
    mods = "SHIFT|ALT",
    action = act.CloseCurrentPane { confirm = true },
  },
  { key = "X", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },

  { key = "a", mods = "LEADER|CTRL", action = wezterm.action { SendString = "\x01" } },
  { key = "-", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "\\", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = "s", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "v", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
  { key = "c", mods = "LEADER", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = "h", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Left" } },
  { key = "j", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Down" } },
  { key = "k", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Up" } },
  { key = "l", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Right" } },
  { key = "H", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
  { key = "J", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
  { key = "K", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
  { key = "L", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
  { key = "1", mods = "LEADER", action = wezterm.action { ActivateTab = 0 } },
  { key = "2", mods = "LEADER", action = wezterm.action { ActivateTab = 1 } },
  { key = "3", mods = "LEADER", action = wezterm.action { ActivateTab = 2 } },
  { key = "4", mods = "LEADER", action = wezterm.action { ActivateTab = 3 } },
  { key = "5", mods = "LEADER", action = wezterm.action { ActivateTab = 4 } },
  { key = "6", mods = "LEADER", action = wezterm.action { ActivateTab = 5 } },
  { key = "7", mods = "LEADER", action = wezterm.action { ActivateTab = 6 } },
  { key = "8", mods = "LEADER", action = wezterm.action { ActivateTab = 7 } },
  { key = "9", mods = "LEADER", action = wezterm.action { ActivateTab = 8 } },
  { key = "d", mods = "LEADER", action = wezterm.action { CloseCurrentPane = { confirm = true } } },
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act.PasteFrom "PrimarySelection",
  },
}
