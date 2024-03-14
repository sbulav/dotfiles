{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.custom) enabled;

  cfg = config.custom.cli-apps.home-manager;
in {
  options.custom.cli-apps.home-manager = {
    enable = mkEnableOption "home-manager";
  };

  config = mkIf cfg.enable {
    programs.home-manager = enabled;
  };
}
