-- https://github.com/pjcj/base/blob/2f036f8bb616a5b3dabf8314ae9eb6d574a83e32/.wezterm.lua#L406
--
local wezterm = require "wezterm"
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- var set by smart-splits.nvim
local function is_vim(pane)
  return pane:get_user_vars().IS_NVIM == "true"
end

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

-- https://wezfurlong.org/wezterm/config/lua/window-events/update-right-status.html
wezterm.on("update-right-status", function(window)
  window:set_right_status(wezterm.format {
    { Text = wezterm.strftime "[%H:%M]" },
  })
end)

-- Set font
config.font = wezterm.font_with_fallback {
  {
    family = "CaskaydiaCove Nerd Font",
    weight = "Regular",
    italic = false,
  },
  { family = "Symbols Nerd Font Mono", scale = 0.80 },
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
config.window_background_opacity = 0.9
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.tab_max_width = 64
config.hide_mouse_cursor_when_typing = false
config.color_scheme = "Oceanic-Next"
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
}

-- https://wezfurlong.org/wezterm/config/appearance.html#retro-tab-bar-appearance
config.colors = {
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
  brightness = 0.6,
}
local process_icons = {
  ["docker"] = wezterm.nerdfonts.linux_docker,
  ["docker-compose"] = wezterm.nerdfonts.linux_docker,
  ["psql"] = "󱤢",
  ["kuberlr"] = wezterm.nerdfonts.linux_docker,
  ["kubectl"] = wezterm.nerdfonts.linux_docker,
  ["stern"] = wezterm.nerdfonts.linux_docker,
  ["make"] = wezterm.nerdfonts.seti_makefile,
  ["vim"] = wezterm.nerdfonts.dev_vim,
  ["node"] = wezterm.nerdfonts.mdi_hexagon,
  ["go"] = wezterm.nerdfonts.seti_go,
  ["zsh"] = wezterm.nerdfonts.dev_terminal,
  ["bash"] = wezterm.nerdfonts.cod_terminal_bash,
  ["btm"] = wezterm.nerdfonts.mdi_chart_donut_variant,
  ["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
  ["cargo"] = wezterm.nerdfonts.dev_rust,
  ["sudo"] = wezterm.nerdfonts.fa_hashtag,
  ["lazydocker"] = wezterm.nerdfonts.linux_docker,
  ["git"] = wezterm.nerdfonts.dev_git,
  ["lua"] = wezterm.nerdfonts.seti_lua,
  ["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
  ["curl"] = wezterm.nerdfonts.mdi_flattr,
  ["gh"] = wezterm.nerdfonts.dev_github_badge,
  ["ruby"] = wezterm.nerdfonts.cod_ruby,
}

local function basename(s)
  return s:gsub("(.*[/\\])(.*)", "%2"):match "%w+"
end

local function is_not_empty(s)
  return s ~= nil and #tostring(s) > 0
end

local function remove_trailing(s)
  if string.sub(s, -1, -1) == "/" then
    return string.sub(s, 1, -2)
  end

  return s
end

local function get_current_process(tab)
  local wezterm_prog = tab.active_pane.user_vars.WEZTERM_PROG
  if is_not_empty(wezterm_prog) then
    return basename(wezterm_prog)
  end

  if is_not_empty(tab.active_pane.foreground_process_name) then
    return basename(tab.active_pane.foreground_process_name)
  end

  return "?"
end

local function get_current_working_dir(tab)
  local current_dir_url = tab.active_pane.current_working_dir
  if not is_not_empty(current_dir_url) then
    return " ?"
  end

  local home_dir = remove_trailing(os.getenv "HOME") .. "/"
  if current_dir_url.file_path == home_dir then
    return " ~"
  end

  return " " .. current_dir_url.file_path:gsub("(.*/)(.*)/", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local idx = " " .. tab.tab_index + 1 .. " "
  local process = "[" .. get_current_process(tab) .. "]"
  local dir = get_current_working_dir(tab)
  local separator = " ▕"

  return {
    { Attribute = { Intensity = "Bold" } },
    { Text = idx },
    "ResetAttributes",
    { Foreground = { Color = "#9cdbfb" } },
    { Text = process },
    "ResetAttributes",
    { Text = wezterm.truncate_right(dir, max_width - (2 + #idx + #process)) },
    { Attribute = { Intensity = "Bold" } },
    { Foreground = { Color = "#1b2226" } },
    { Text = separator },
  }
end)

wezterm.on("format-window-title", function(tab, _, tabs)
  local index = ""
  if #tabs > 1 then
    index = "[" .. tab.tab_index + 1 .. "/" .. #tabs .. "]"
  end

  return index .. tab.window_title
end)
