{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.wlogout;
in {
  options.custom.desktop.addons.wlogout = with types; {
    enable = mkBoolOpt false "Whether to enable the wlogout";
  };

  config = mkIf cfg.enable {
    home.programs.wlogout = {
      enable = true;
    };
  };
}
