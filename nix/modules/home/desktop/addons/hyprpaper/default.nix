{
  config,
  lib,
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
    services.hyprpaper = {
      enable = true;

      settings = {
        preload = [wallpaper];
        wallpaper = [", ${wallpaper}"];
        ipc = true;
      };
    };
  };
}
