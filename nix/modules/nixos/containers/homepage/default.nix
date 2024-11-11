{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.containers.homepage;
in {
  options.${namespace}.containers.homepage = with types; {
    enable = mkBoolOpt false "Enable homepage nixos-container;";
    domain = mkOpt str "" "The domain to get certificates to";
  };

  config = mkIf cfg.enable {
    # networking.nat = {
    #   enable = true;
    #   internalInterfaces = ["ve-homepage"];
    #   externalInterface = "ens3";
    # };
    containers.homepage = {
      ephemeral = true;
      autoStart = true;

      privateNetwork = true;
      # Need to add 172.16.64.0/18 on router
      hostAddress = "172.16.64.10";
      localAddress = "172.16.64.101";

      # bindMounts = {
      #   "/var/log/httpd" = {
      #     hostPath = "/tank/video/";
      #     isReadOnly = false;
      #   };
      # };

      config = {
        config,
        pkgs,
        ...
      }: {
        services.homepage-dashboard.enable = true;

        networking = {
          firewall = {
            enable = true;
            allowedTCPPorts = [80];
          };
          # Use systemd-resolved inside the container
          # Workaround for bug https://github.com/NixOS/nixpkgs/issues/162686
          useHostResolvConf = lib.mkForce false;
        };
        services.resolved.enable = true;
        system.stateVersion = "24.11";
      };
    };
  };
}
