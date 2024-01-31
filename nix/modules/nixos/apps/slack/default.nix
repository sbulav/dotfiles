{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.slack;
in {
  options.custom.apps.slack = with types; {
    enable = mkBoolOpt false "Whether or not to enable slack.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [slack];};
}
