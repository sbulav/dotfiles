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
    services.swayidle = {
      enable = true;

      events = [
        {
          event = "lock";
          command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
        }
        {
          event = "after-resume";
          command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }
        {
          event = "before-sleep";
          command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
        }
      ];
      # 5 min lock, 10min turn the screen off, 20 min suspend
      timeouts = [
        {
          timeout = 300;
          command = "${pkgs.swaylock-effects}/bin/swaylock -fF -C ~/.config/swaylock/config";
        }
        {
          timeout = 600;
          command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
          resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }
        {
          timeout = 1200;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
