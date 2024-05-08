{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.custom.cli-apps.bottom;
in {
  options.custom.cli-apps.bottom = {
    enable = mkEnableOption "bottom";
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [bottom];
    };
  };
}
