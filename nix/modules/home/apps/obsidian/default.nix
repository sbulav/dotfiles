{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.custom.apps.obsidian;
in {
  options.custom.apps.obsidian = {
    enable = mkEnableOption "Enable Obsidian note-taking app";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
