{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.virtualisation.virt-manager;
in {
  options.custom.virtualisation.virt-manager = with types; {
    enable = mkBoolOpt false "Whether or not to enable virt-manager.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      virt-manager
    ];
  };
}
