{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.zoom-us;
in {
  options.custom.apps.zoom-us = with types; {
    enable = mkBoolOpt false "Whether or not to enable zoom-us.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [zoom-us];};
}
