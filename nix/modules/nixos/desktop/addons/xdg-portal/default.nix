{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.xdg-portal;
in {
  options.custom.desktop.addons.xdg-portal = with types; {
    enable = mkBoolOpt false "Whether or not to add support for xdg portal.";
  };

  config = mkIf cfg.enable {
    xdg = {
      autostart.enable = true;
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          # Only one hyprland portal must be enabled, otherwise screen sharing brokes
          # xdg-desktop-portal
          xdg-desktop-portal-hyprland
        ];
        # gtkUsePortal = true;
      };
    };
  };
}
