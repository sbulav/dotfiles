{
  lib,
  config,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.aerospace;
in {
  options.custom.desktop.addons.aerospace = {
    enable = mkEnableOption "Enable tiling window manager aerospace.";
  };

  config = mkIf cfg.enable {
    homebrew = {
      taps = ["nikitabobko/tap"];
      casks = ["nikitabobko/tap/aerospace"];
    };
  };
}
