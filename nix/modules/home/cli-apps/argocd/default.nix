{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.custom.cli-apps.argocd;
in {
  options.custom.cli-apps.argocd = {
    enable = mkEnableOption "argocd";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      argocd
    ];
  };
}
