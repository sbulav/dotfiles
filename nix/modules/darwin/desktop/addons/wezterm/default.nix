inputs @ {
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.wezterm;
in {
  options.custom.desktop.addons.wezterm = with types; {
    enable = mkBoolOpt false "Whether or not to enable wezterm.";
  };

  config = mkIf cfg.enable {
    # System package required as program via home-manager don't appear in Apps
    environment.systemPackages = with pkgs; [
      wezterm
    ];
  };
}
