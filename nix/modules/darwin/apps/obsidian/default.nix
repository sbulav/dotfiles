{
  lib,
  config,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.obsidian;
in {
  options.custom.desktop.obsidian = {
    enable = mkEnableOption "Enable Obsidian note-taking app";
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = ["obsidian"];
    };
  };
}
