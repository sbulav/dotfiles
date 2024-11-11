{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.containers.traefik;
in {
  options.${namespace}.containers.traefik = with types; {
    enable = mkBoolOpt false "Enable Traefik nixos-container;";
    cf_secret_file = mkOpt str "secrets/serverz/default.yaml" "SOPS secret to get cloudflare creds from";
    domain = mkOpt str "" "The domain to get certificates to";
    dataPath = mkOpt str "/tank/traefik" "Traefik data path on host machine";
  };

  config = mkIf cfg.enable {
    sops.secrets = {
      traefik-cf-env = {
        sopsFile = lib.snowfall.fs.get-file "${cfg.cf_secret_file}";
        restartUnits = ["container@traefik.service"];
      };
    };

    # Running traefik on host network, opening necessary ports
    networking.firewall.allowedTCPPorts = [
      80
      443
    ];

    containers.traefik = {
      ephemeral = true;
      autoStart = true;

      # Mounting Cloudflare creds(email and dns api token) as file
      bindMounts = {
        "${config.sops.secrets.traefik-cf-env.path}" = {
          isReadOnly = true;
        };

        "/traefik/certs" = {
          hostPath = "${cfg.dataPath}/certs/";
          isReadOnly = false;
        };
        "/traefik/logs" = {
          hostPath = "${cfg.dataPath}/logs/";
          isReadOnly = false;
        };
      };

      config = {
        #Injecting Cloudflare creds as systemd service env variables
        systemd.services.traefik.serviceConfig.EnvironmentFile = "/run/secrets/traefik-cf-env";
        services.traefik = {
          enable = true;

          staticConfigOptions = import ./staticConfigOptions.nix;

          dynamicConfigOptions = {
            http = {
              routers.traefik-dashboard = {
                rule = "Host(`traefik.${cfg.domain}`)";
                service = "api@internal";
                middlewares = [
                  "secure-headers"
                ];
                tls = {
                  certResolver = "production";
                  domains = {
                    "0" = {
                      main = "${cfg.domain}";
                      sans = "*.${cfg.domain}";
                    };
                  };
                };
              };

              middlewares = import ./middleware_secure-headers.nix;
            };
          };
        };

        # We are using Host network
        networking.firewall.enable = false;
        system.stateVersion = "24.11";
      };
    };
  };
}
