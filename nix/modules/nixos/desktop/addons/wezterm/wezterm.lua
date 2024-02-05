-- https://github.com/pjcj/base/blob/2f036f8bb616a5b3dabf8314ae9eb6d574a83e32/.wezterm.lua#L406
--
local wezterm = require "wezterm"
local act = wezterm.action
local window = wezterm.window
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Dark"
end

local function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

-- var set by smart-splits.nvim
local function is_vim(pane)
  return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
  Left = "h",
  Down = "j",
  Up = "k",
  Right = "l",
  -- reverse lookup
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == "resize" and "META" or "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
        }, pane)
      else
        if resize_or_move == "resize" then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

local process_icons = {
  ["docker"] = wezterm.nerdfonts.linux_docker,
  ["docker-compose"] = wezterm.nerdfonts.linux_docker,
  ["kubectl"] = wezterm.nerdfonts.md_kubernetes,
  ["k9s"] = wezterm.nerdfonts.md_kubernetes,
  ["psql"] = wezterm.nerdfonts.dev_database,
  ["usql"] = wezterm.nerdfonts.dev_database,
  ["nvim"] = wezterm.nerdfonts.dev_vim,
  ["make"] = wezterm.nerdfonts.seti_makefile,
  ["vim"] = wezterm.nerdfonts.dev_vim,
  ["node"] = wezterm.nerdfonts.dev_nodejs_small,
  ["npm"] = wezterm.nerdfonts.dev_npm,
  ["go"] = wezterm.nerdfonts.seti_go,
  ["zsh"] = wezterm.nerdfonts.dev_terminal,
  ["bash"] = wezterm.nerdfonts.cod_terminal_bash,
  ["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
  ["cargo"] = wezterm.nerdfonts.dev_rust,
  ["sudo"] = wezterm.nerdfonts.fa_hashtag,
  ["git"] = wezterm.nerdfonts.dev_git,
  ["lazygit"] = wezterm.nerdfonts.dev_git,
  ["lua"] = wezterm.nerdfonts.seti_lua,
  ["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
  ["curl"] = wezterm.nerdfonts.mdi_flattr,
  ["gh"] = wezterm.nerdfonts.dev_github_badge,
  ["ruby"] = wezterm.nerdfonts.cod_ruby,
  ["adb"] = wezterm.nerdfonts.dev_android,
  ["python"] = wezterm.nerdfonts.cod_python,
}

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir or ""
  local HOME_DIR = string.format("file://%s", os.getenv "HOME")

  return current_dir == HOME_DIR and "." or string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

local function get_process(tab)
  if not tab.active_pane or tab.active_pane.foreground_process_name == "" then
    return "[?]"
  end

  local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
  if string.find(process_name, "kubectl") then
    process_name = "kubectl"
  end

  return process_icons[process_name] or string.format("[%s]", process_name)
end

---@diagnostic disable-next-line: unused-local
wezterm.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
  local has_unseen_output = false
  if not tab.is_active then
    for _, pane in ipairs(tab.panes) do
      if pane.has_unseen_output then
        has_unseen_output = true
        break
      end
    end
  end

  local cwd = wezterm.format {
    { Attribute = { Intensity = "Bold" } },
    { Text = get_current_working_dir(tab) },
  }

  local title = string.format(" %s %s ", get_process(tab), cwd)

  if has_unseen_output then
    return {
      { Foreground = { Color = "#28719c" } },
      { Text = title },
    }
  end

  return {
    { Text = title },
  }
end)

-- https://wezfurlong.org/wezterm/config/lua/window-events/update-right-status.html
wezterm.on("update-right-status", function(window)
  if not window:get_dimensions().is_full_screen then
    window:set_right_status ""
    return
  end

  window:set_right_status(wezterm.format {
    { Text = wezterm.strftime "[%H:%M]" },
  })
end)

config.color_scheme = "Catppuccin Mocha"
-- scheme_for_appearance(get_appearance())
config.font = wezterm.font("CaskaydiaCove Nerd Font", {
  weight = "Regular",
})
-- config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- disable ligatures
config.font_size = 14
config.window_padding = {
  left = 0,
  right = 0,
  top = 1,
  bottom = 1,
}
config.window_background_opacity = 0.9
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.hide_mouse_cursor_when_typing = false

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
  { key = "Z", mods = "LEADER", action = act.TogglePaneZoomState },
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
  { key = "&", mods = "LEADER|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
  { key = "d", mods = "LEADER", action = wezterm.action { CloseCurrentPane = { confirm = true } } },
  { key = "x", mods = "LEADER", action = wezterm.action { CloseCurrentPane = { confirm = true } } },

  -- move between split panes
  split_nav("move", "h"),
  split_nav("move", "j"),
  split_nav("move", "k"),
  split_nav("move", "l"),

  -- resize panes
  split_nav("resize", "h"),
  split_nav("resize", "j"),
  split_nav("resize", "k"),
  split_nav("resize", "l"),
}

return config
