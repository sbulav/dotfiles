{
  lib,
  config,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.obsidian;
in {
  options.custom.apps.obsidian = {
    enable = mkEnableOption "Enable Obsidian note-taking app";
  };

  config = mkIf cfg.enable {
    homebrew = {
      casks = ["obsidian"];
    };
  };
}
