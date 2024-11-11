{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.containers.traefik;
  # wallpaper = options.system.wallpaper.value;

  staticConfigOptions = import ./staticConfigOptions.nix;
in {
  options.${namespace}.containers.traefik = with types; {
    enable = mkBoolOpt false "Enable Traefik nixos-container;";
    cf_secret_file = mkOpt str "secrets/serverz/default.yaml" "SOPS secret to get cloudflare creds from";
    domain = mkOpt str "" "The domain to get certificates to";
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

      bindMounts = {
        "${config.sops.secrets.traefik-cf-env.path}" = {
          isReadOnly = true;
        };

        "/traefik/certs" = {
          hostPath = "/tank/traefik/certs/";
          isReadOnly = false;
        };
        "/traefik/logs" = {
          hostPath = "/tank/traefik/logs/";
          isReadOnly = false;
        };
      };

      config = {
        systemd.services.traefik.serviceConfig.EnvironmentFile = "/run/secrets/traefik-cf-env";
        services.traefik = {
          enable = true;

          inherit (staticConfigOptions) staticConfigOptions;

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

              middlewares = {
                secure-headers = {
                  headers = {
                    sslRedirect = true;
                    accessControlMaxAge = "100";
                    stsSeconds = "31536000"; # force browsers to only connect over https
                    stsIncludeSubdomains = true; # force browsers to only connect over https
                    stsPreload = true; # force browsers to only connect over https
                    forceSTSHeader = true; # force browsers to only connect over https
                    contentTypeNosniff = true; # sets x-content-type-options header value to "nosniff", reduces risk of drive-by downloads
                    frameDeny = true; # sets x-frame-options header value to "deny", prevents attacker from spoofing website in order to fool users into clicking something that is not there
                    browserXssFilter = true; # sets x-xss-protection header value to "1; mode=block", which prevents page from loading if detecting a cross-site scripting attack
                    contentSecurityPolicy = [
                      # sets content-security-policy header to suggested value
                      "default-src"
                      "self"
                    ];
                    referrerPolicy = "same-origin";
                    addVaryHeader = true;
                  };
                };
                auth-chain = {
                  chain.middlewares = [
                    "secure-headers"
                  ];
                };
              };
            };
          };
        };

        networking = {
          firewall = {
            enable = false;
            allowedTCPPorts = [80];
          };
        };
        system.stateVersion = "24.11";
      };
    };
  };
}
