{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.imv;
in {
  options.custom.apps.imv = with types; {
    enable = mkBoolOpt false "Whether or not to enable imv.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [imv];};
}
