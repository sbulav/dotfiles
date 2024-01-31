{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.suites.desktop;
in {
  options.suites.desktop = with types; {
    enable = mkBoolOpt false "Enable the desktop suite";
  };

  config = mkIf cfg.enable {
    system.security.rbw.enable = true;
    custom = {
      desktop = {
        hyprland = enabled;
      };
      apps = {
        firefox = enabled;
        imv = enabled;
        slack = enabled;
        telegram = enabled;
        vlc = enabled;
        zathura = enabled;
        pcmanfm = enabled;
      };
    };
  };
}
