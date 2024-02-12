{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.system.interface;
in {
  options.custom.system.interface = with types; {
    enable = mkEnableOption "macOS interface";
  };

  config = mkIf cfg.enable {
    system.defaults = {
      # dock.autohide = true;

      LaunchServices = {
        LSQuarantine = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        _FXShowPosixPathInTitle = false;
      };

      # NSGlobalDomain = {
      #   _HIHideMenuBar = true;
      #   AppleShowScrollBars = "Always";
      # };
    };
  };
}
