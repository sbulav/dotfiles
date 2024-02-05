{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.wezterm;
in {
  options.custom.desktop.addons.wezterm = with types; {
    enable = mkBoolOpt false "Whether to enable the wezterm terminal";
  };

  config = mkIf cfg.enable {
    home.programs.wezterm = {
      enable = true;
      extraConfig = ''
        local config = {}
        config.window_background_opacity = 0.90
        config.use_fancy_tab_bar = true
        config.font_size = 13.0
        config.hide_mouse_cursor_when_typing = true

        config.window_padding = {
          left = 1,
          right = 1,
          top = 0,
          bottom = 0,
        }

        config.window_frame = {
          font = wezterm.font { family = 'CaskaydiaCove Nerd Font' },
        }

        return config
      '';
    };
  };
}
