{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.mako;
in {
  options.custom.desktop.addons.mako = with types; {
    enable = mkBoolOpt false "Whether to enable Mako in Sway.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [libnotify];
    home.services.mako = {
      enable = true;
      defaultTimeout = 5000;
      font = "FiraCode Nerd Font 10";
      layer = "overlay";
      anchor = "top-right";
      maxIconSize = 32;
      icons = true;
      iconPath = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";
      borderRadius = 5;
      margin = "5";
      extraConfig = ''
        group-by=app-name
        background-color=#FFFFFFee
        text-color=#000000cc
        border-color=#00000033
        border-size=1
        progress-color=source #07b5efee

        [urgency=low]
        border-color=#394b70

        [urgency=normal]
        border-color=#00000033

        [urgency=high]
        border-color=#ff757f
        default-timeout=0
      '';
    };
  };
}
