{
  options,
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.system.security.sudo;
in {
  options.system.security.sudo = {
    enable = mkBoolOpt false "Whether or not to configure sudo";
  };

  config = mkIf cfg.enable {
    security.sudo.wheelNeedsPassword = false;
  };
}
