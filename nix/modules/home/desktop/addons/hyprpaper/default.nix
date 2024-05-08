{
  inputs,
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.hyprpaper;
  wallpaper = config.custom.desktop.addons.wallpaper;
in {
  imports = [hyprpaper.homeManagerModules.default];
  options.custom.desktop.addons.hyprpaper = with types; {
    enable = mkBoolOpt false "Whether to enable the hyprpaper config";
  };

  config = mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;

      preloads = [wallpaper];
      wallpapers = [", ${wallpaper}"];
      ipc = false;
    };
  };
}
