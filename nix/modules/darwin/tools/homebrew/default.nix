{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.tools.homebrew;
in {
  options.custom.tools.homebrew = {
    enable = mkBoolOpt false "Whether or not to enable homebrew.";
    masEnable = mkBoolOpt false "Whether or not to enable Mac App Store downloads.";
  };

  config = mkIf cfg.enable {
    homebrew = {
      enable = true;

      global = {
        brewfile = true;
        autoUpdate = true;
      };

      onActivation = {
        autoUpdate = true;
        cleanup = "uninstall";
        upgrade = true;
      };

      casks = [
        "raycast"
        "vlc"
      ];

      # taps = [
      #   "homebrew/bundle"
      #   "homebrew/cask-fonts"
      #   "homebrew/cask-versions"
      #   "homebrew/services"
      # ];
    };
  };
}
