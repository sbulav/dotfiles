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
    url = "https://github.com/Vinetos/dotnix/blob/main/home/themes/catpuccin/backgrounds/deer.jpg?raw=true";
    sha256 = "1494bkhakk72xk8hcy1mw7b1m6rr4bda3aspblz6ml6325fx796x";
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
