{
  inputs,
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.hyprpaper;
  inherit (inputs) hyprpaper;
  wallpaper = builtins.fetchurl {
    url = config.custom.theme.wallpaper_url;
    sha256 = config.custom.theme.wallpaper_sha256;
  };
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
