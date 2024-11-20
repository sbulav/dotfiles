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
