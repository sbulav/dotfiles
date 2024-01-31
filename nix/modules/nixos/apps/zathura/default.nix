{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.zathura;
in {
  options.custom.apps.zathura = with types; {
    enable = mkBoolOpt false "Whether or not to enable zathura.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [zathura];};
}
