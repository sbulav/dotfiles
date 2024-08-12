{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.custom.apps.zoom-us;
in {
  options.custom.apps.zoom-us = {
    enable = mkEnableOption "zoom";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zoom-us
    ];
  };
}
