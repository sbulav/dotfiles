{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.hyprlock;
in {
  options.custom.desktop.addons.hyprlock = with types; {
    enable = mkBoolOpt false "Whether to enable the hyprlock";
  };

  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      # package = pkgs.hyprlock;

      settings = {
        backgrounds = [
          {
            path = config.custom.desktop.addons.wallpaper;
          }
        ];
      };
    };
  };
}
