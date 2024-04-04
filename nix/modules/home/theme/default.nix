{
  lib,
  pkgs,
  inputs,
  config,
  options,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.theme;
in {
  options.custom.theme = with types; {
    enable = mkBoolOpt false "Whether or not to enable the wallpaper .";
    wallpaper_url = mkOpt types.str "https://github.com/Vinetos/dotnix/blob/main/home/themes/catpuccin/backgrounds/deer.jpg?raw=true" "The URL of the wallpaper";
    wallpaper_sha256 = mkOpt types.str "1494bkhakk72xk8hcy1mw7b1m6rr4bda3aspblz6ml6325fx796x" "The SHA256 of the wallpaper";
  };

  config = mkIf cfg.enable {
    custom.theme = {
      enable = mkDefault true;
      # wallpaper_ = [wallpaper];
    };
  };
}
