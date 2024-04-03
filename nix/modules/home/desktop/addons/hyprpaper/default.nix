{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.hyprpaper;
  wallpaper = config.custom.desktop.addons.wallpaper;
in {
  options.custom.desktop.addons.hyprpaper = with types; {
    enable = mkBoolOpt false "Whether to enable the hyprpaper config";
  };

  config = mkIf cfg.enable {
    xdg.configFile = {
      "hypr/hyprpaper.conf".text = ''
        preload = ${wallpaper}
        wallpaper = eDP-1,${wallpaper}
        wallpaper = DP-1,${wallpaper}
        wallpaper = DP-2,${wallpaper}
      '';
    };
    systemd.user.services.hyprpaper = {
      Install.WantedBy = ["hyprland-session.target"];

      Unit = {
        Description = "Hyprpaper Service";
        PartOf = ["graphical-session.target"];
      };

      Service = {
        ExecStart = "${getExe pkgs.hyprpaper}";
        Restart = "always";
      };
    };
  };
}
