{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.hypridle;
in {
  options.custom.desktop.addons.hypridle = {
    enable = mkBoolOpt false "Whether to enable hypridle in the desktop environment.";
  };

  config = mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      # package = pkgs.hypridle;

      settings = {
        general = {
          lock_cmd = "${pkgs.swaylock-effects}/bin/swaylock -fF";
          ignore_dbus_inhibit = false;
          after_sleep_cmd = "${getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on";
        };

        # 5 min lock, 10min turn the screen off, 20 min suspend
        listener = [
          {
            timeout = 300;
            on-timeout = "${pkgs.swaylock-effects}/bin/swaylock -fF";
          }
          {
            timeout = 600;
            on-timeout = "${getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms off";
            on-resume = "${getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on";
          }
          {
            timeout = 1200;
            on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
            on-resume = "${getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on";
          }
        ];
      };
    };
  };
}
