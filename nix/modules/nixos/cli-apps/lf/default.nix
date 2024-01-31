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
    home.configFile."lf/lfrc".source = ./lfrc;
    home.configFile."lf/icons".source = ./icons;
    home.configFile."lf/lf_kitty_clean" = {
      source = ./lf_kitty_clean;
      executable = true;
    };
    home.configFile."lf/lf_kitty_preview" = {
      source = ./lf_kitty_preview;
      executable = true;
    };
  };
}
