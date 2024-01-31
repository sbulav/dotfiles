{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.gimp;
in {
  options.custom.apps.gimp = with types; {
    enable = mkBoolOpt false "Whether or not to enable Gimp.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [gimp];};
}
