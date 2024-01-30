{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.hardware.fingerprint;
in {
  options.hardware.fingerprint = with types; {
    enable = mkBoolOpt false "Whether or not to enable fingerprint support.";
  };

  config = mkIf cfg.enable {services.fprintd.enable = true;};
}
