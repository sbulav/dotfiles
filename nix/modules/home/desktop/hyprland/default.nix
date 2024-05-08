{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.hyprland;
in {
  options.custom.desktop.hyprland = with types; {
    enable = mkBoolOpt false "Whether or not to install Hyprland and dependencies.";
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [brightnessctl];
    };
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig =
        builtins.readFile ./hyprland.conf;

      systemd.enable = true;
      xwayland.enable = true;
    };
  };
}
