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

  imports = [
    (import ../shared/shared-traefik-route.nix
      {
        app = "homepage";
        host = "${cfg.host}";
        url = "http://${cfg.localAddress}:8082";
      })
    (import ../shared/shared-adguard-dns-rewrite.nix
      {host = "${cfg.host}";})
  ];
  config = mkIf cfg.enable {
    containers.homepage = {
      ephemeral = true;
      autoStart = true;

      privateNetwork = true;
      # Need to add 172.16.64.0/18 on router
      hostAddress = "${cfg.hostAddress}";
      localAddress = "${cfg.localAddress}";

      config = {...}: {
        networking.hosts = {
          #TODO: remove this once migrated
          "${cfg.hostAddress}" = [
            "traefik.sbulav.ru"
            "adguard.sbulav.ru"
            "flood.sbulav.ru"
          ];
        };

        services.homepage-dashboard = {
          enable = true;
          widgets = [
            {
              resources = {
                cpu = true;
                disk = "/";
                memory = true;
              };
            }
          ];
          services = [
            {
              "My First Group" = [
                {
                  "My First Service" = {
                    description = "Homepage is awesome";
                    href = "http://localhost/";
                  };
                }
              ];
            }
            {
              "Network" = [
                {
                  "My Second Service" = {
                    description = "Homepage is the best";
                    href = "http://localhost/";
                  };
                }
                # TODO: implement enabling widgets based on config

                {
                  "Traefik" = {
                    icon = "traefik";
                    href = "https://traefik.sbulav.ru";
                    widget = {
                      type = "traefik";
                      url = "https://traefik.sbulav.ru";
                    };
                  };
                }
                {
                  "Adguard" = {
                    icon = "Adguard";
                    href = "https://adguard.sbulav.ru";
                    widget = {
                      type = "adguard";
                      url = "http://${config.${namespace}.containers.adguard.localAddress}:3000";
                    };
                  };
                }
                {
                  "Flood" = {
                    icon = "Flood";
                    href = "https://flood.sbulav.ru";
                    widget = {
                      type = "flood";
                      url = "http://${config.${namespace}.containers.flood.localAddress}:3000";
                    };
                  };
                }
              ];
            }
          ];
        };

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
  };
}
