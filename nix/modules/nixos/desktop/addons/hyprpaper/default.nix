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
  wallpaper = /home/sab/Pictures/wallpaper.png;
in {
  options.custom.desktop.addons.hyprpaper = with types; {
    enable = mkBoolOpt false "Whether to enable the hyprpaper config";
  };

  config = mkIf cfg.enable {
    home.file.".config/hypr/hyprpaper.conf".text = ''
      preload = ${wallpaper}
      wallpaper = eDP-1,${wallpaper}
      wallpaper = DP-1,${wallpaper}
      wallpaper = DP-2,${wallpaper}
    '';
  };
}
