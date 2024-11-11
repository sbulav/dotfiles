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
    host = mkOpt str "homepage.sbulav.ru" "The host to serve homepage on";
    hostAddress = mkOpt str "172.16.64.10" "With private network, which address to use on Host";
    localAddress = mkOpt str "172.16.64.101" "With privateNetwork, which address to use in container";
  };

  config = mkIf cfg.enable {
    containers.homepage = {
      ephemeral = true;
      autoStart = true;

      privateNetwork = true;
      # Need to add 172.16.64.0/18 on router
      hostAddress = "${cfg.hostAddress}";
      localAddress = "${cfg.localAddress}";

      config = {
        config,
        pkgs,
        ...
      }: {
        services.homepage-dashboard.enable = true;

        networking = {
          firewall = {
            enable = true;
            allowedTCPPorts = [8082];
          };
          # Use systemd-resolved inside the container
          # Workaround for bug https://github.com/NixOS/nixpkgs/issues/162686
          useHostResolvConf = lib.mkForce false;
        };
        services.resolved.enable = true;
        system.stateVersion = "24.11";
      };
    };

    containers.traefik.config.services.traefik.dynamicConfigOptions.http = lib.mkIf osConfig.${namespace}.containers.traefik.enable {
      routers.homepage = {
        entrypoints = ["websecure"];
        rule = "Host(`${cfg.host}`)";
        service = "homepage";
        middlewares = [
          "secure-headers"
        ];
        tls = {
          certResolver = "production";
        };
      };
      services.homepage = {
        loadBalancer = {
          passHostHeader = true;
          servers = [
            {
              url = "http://${cfg.localAddress}:8082";
            }
          ];
        };
      };
    };
  };
}
