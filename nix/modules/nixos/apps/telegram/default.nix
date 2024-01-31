{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.telegram;
in {
  options.custom.apps.telegram = with types; {
    enable = mkBoolOpt false "Whether or not to enable telegram.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [telegram-desktop];};
}
