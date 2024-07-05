{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.virtualisation.podman;
in {
  options.custom.virtualisation.podman = {
    enable = mkBoolOpt false "Whether or not to enable Podman.";
  };

  config = mkIf cfg.enable {
    # NixOS 22.05 moved NixOS Containers to a new state directory and the old
    # directory is taken over by OCI Containers (eg. podman). For systems with
    # system.stateVersion < 22.05, it is not possible to have both enabled.
    # This option disables NixOS Containers, leaving OCI Containers available.
    boot.enableContainers = false;

    environment.systemPackages = with pkgs; [podman-compose];

    custom = {
      user = {
        extraGroups = [
          "docker"
          "podman"
        ];
      };
    };

    virtualisation = {
      podman = {
        inherit (cfg) enable;
        dockerCompat = true;
        dockerSocket.enable = true;
      };
    };
  };
}
