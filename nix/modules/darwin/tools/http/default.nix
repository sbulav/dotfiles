{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.tools.http;
in {
  options.custom.tools.http = with types; {
    enable = mkBoolOpt false "Whether or not to enable common http utilities.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [wget curl];};
}
