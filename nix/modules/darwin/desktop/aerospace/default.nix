{
  lib,
  config,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.aerospace;
in {
  options.custom.desktop.aerospace = {
    enable = mkEnableOption "Enable tiling window manager aerospace.";
  };

  config = mkIf cfg.enable {
    homebrew = {
      taps = ["nikitabobko/tap"];
      casks = ["nikitabobko/tap/aerospace"];
    };

    home-manager.users.${config.user} = {
      xdg.configFile."aerospace/aerospace.toml".source = ./aerospace.toml;
    };
  };
}
