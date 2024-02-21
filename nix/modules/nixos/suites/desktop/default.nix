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
    custom = {
      desktop.addons = {
        keyring = enabled;
        gtk = enabled;
        regreet = enabled;
        xdg-portal = enabled;
        hyprland-utils = enabled;
      };
      apps = {
        firefox = enabled;
        imv = enabled;
        slack = enabled;
        zoom-us = enabled;
        telegram = enabled;
        vlc = enabled;
        zathura = enabled;
        pcmanfm = enabled;
      };
    };
  };
}
