{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.swayidle;
in {
  options.custom.desktop.addons.swayidle = with types; {
    enable = mkBoolOpt false "Whether to enable the swayidle";
  };

  config = mkIf cfg.enable {
    home.services.swayidle = {
      enable = true;

      events = [
        {
          event = "before-sleep";
          command = "${pkgs.swaylock}/bin/swaylock -defF";
        }
        {
          # TODO: Make dynamic for window manager
          event = "after-resume";
          command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }
        {
          event = "lock";
          command = "${pkgs.swaylock}/bin/swaylock -defF";
        }
        {
          event = "before-sleep";
          command = "${pkgs.libnotify}/bin/notify-send 'Going to sleep in 30 sec' -t 30000";
        }
      ];
      timeouts = [
        {
          timeout = 900;
          command = "${pkgs.swaylock}/bin/swaylock -defF";
        }
        {
          # TODO: Make dynamic for window manager
          timeout = 1200;
          command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
        }
      ];
    };
  };
}
