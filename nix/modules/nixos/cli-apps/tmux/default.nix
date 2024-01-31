{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.cli-apps.tmux;
in {
  options.custom.cli-apps.tmux = {
    enable = mkEnableOption "Tmux";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      tmux
    ];
    home.file.".tmux.conf".source = ./tmux.conf;
  };
}
