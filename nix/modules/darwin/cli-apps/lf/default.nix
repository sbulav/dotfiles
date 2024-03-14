{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.cli-apps.lf;
in {
  options.custom.cli-apps.lf = {
    enable = mkEnableOption "lf";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lf
    ];
    custom.home.file.".config/lf/lfrc".source = ./lfrc;
    custom.home.file.".config/lf/icons".source = ./icons;
    custom.home.file.".config/lf/lf_kitty_clean" = {
      source = ./lf_kitty_clean;
      executable = true;
    };
    custom.home.file.".config/lf/lf_kitty_preview" = {
      source = ./lf_kitty_preview;
      executable = true;
    };
  };
}
