{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.pcmanfm;
in {
  options.custom.apps.pcmanfm = with types; {
    enable = mkBoolOpt false "Whether or not to enable pcmanfm.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [pcmanfm];};
}
