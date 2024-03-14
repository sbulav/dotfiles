{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.custom) enabled;

  cfg = config.custom.cli-apps.atuin;
in {
  options.custom.cli-apps.atuin = {
    enable = mkEnableOption "atuin";
  };

  config = mkIf cfg.enable {
    programs.atuin = {
      enable = true;
      # Does not work right now, injecting via fish
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
