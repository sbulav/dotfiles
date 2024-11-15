{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.containers.authelia;
in {
  options.${namespace}.containers.authelia = with types; {
    enable = mkBoolOpt false "Enable authelia nixos-container;";
    secret_file = mkOpt str "secrets/serverz/default.yaml" "SOPS secret to get creds from";
    dataPath = mkOpt str "/tank/authelia" "Authelia data path on host machine";
    host = mkOpt str "authelia.sbulav.ru" "The host to serve authentik on";
    domain = mkOpt str "sbulav.ru" "The domain session cookie to protect";
    hostAddress = mkOpt str "172.16.64.10" "With private network, which address to use on Host";
    localAddress = mkOpt str "172.16.64.103" "With privateNetwork, which address to use in container";
  };

  imports = [
    (import ../shared/shared-traefik-route.nix
      {
        app = "authelia";
        host = "${cfg.host}";
        url = "http://${cfg.localAddress}:9091";
        middleware = "secure-headers";
      })
    (import ../shared/shared-adguard-dns-rewrite.nix
      {host = "${cfg.host}";})
  ];

  config = mkIf cfg.enable {
    sops.secrets = {
      authelia-env = {
        sopsFile = lib.snowfall.fs.get-file "${cfg.secret_file}";
        uid = 999;
        restartUnits = ["container@authelia.service"];
      };
      authelia-storage-encryption-key = {
        sopsFile = lib.snowfall.fs.get-file "${cfg.secret_file}";
        uid = 999;
        restartUnits = ["container@authelia.service"];
      };
    };
    containers.authelia = {
      ephemeral = true;
      autoStart = true;

      privateNetwork = true;
      # Need to add 172.16.64.0/18 on router
      hostAddress = "${cfg.hostAddress}";
      localAddress = "${cfg.localAddress}";

      # Mounting Cloudflare creds(email and dns api token) as file
      bindMounts = {
        "${config.sops.secrets.authelia-env.path}" = {
          isReadOnly = true;
        };
        "${config.sops.secrets.authelia-storage-encryption-key.path}" = {
          isReadOnly = true;
        };

        "/var/lib/authelia-main/users/" = {
          hostPath = "${cfg.dataPath}/users/";
          isReadOnly = false;
        };
        "/var/lib/authelia-main/logs/" = {
          hostPath = "${cfg.dataPath}/logs/";
          isReadOnly = false;
        };
        "/var/lib/authelia-main/storage/" = {
          hostPath = "${cfg.dataPath}/storage/";
          isReadOnly = false;
        };
      };
      config = {...}: {
        systemd.services.authelia-main.serviceConfig.EnvironmentFile = "/run/secrets/authelia-env";
        services.authelia.instances = {
          main = {
            enable = true;
            secrets = {
              storageEncryptionKeyFile = config.sops.secrets.authelia-storage-encryption-key.path;
              #   jwtSecretFile = config.sops.secrets.authelia_jwt_secret_file.path;
              #   sessionSecretFile = config.sops.secrets.authelia_session_secret_file.path;
              manual = true;
            };

            settings = {
              log = {
                level = "info";
                file_path = "/var/lib/authelia-main/logs/authelia.log";
              };
              authentication_backend = {
                file.path = "/var/lib/authelia-main/users/users_database.yml";
                password_reset.disable = true;
              };

              storage.local.path = "/var/lib/authelia-main/storage/db.sqlite3";
              server.disable_healthcheck = true;
              regulation = {
                ban_time = 300;
                find_time = 120;
                max_retries = 3;
              };
              session = {
                name = "authelia_session";
                cookies = [
                  {
                    domain = "${cfg.domain}";
                    authelia_url = "https://${cfg.host}";
                    default_redirection_url = "https://homepage.${cfg.domain}";
                  }
                ];
              };
              default_2fa_method = "totp";
              # TODO: change notifier to smtp/2fa
              #used to send 2FA registration emails etc
              notifier = {
                disable_startup_check = false;
                filesystem = {
                  filename = "/var/lib/authelia-main/logs/notification.txt";
                };
              };
              access_control = {
                # default_policy = "deny";
                # default_policy = "one_factor";
                default_policy = "two_factor";
                rules = [
                  {
                    domain = "*.${cfg.domain}";
                    # policy = "one_factor";
                    policy = "two_factor";
                  }
                ];
              };
            };
          };
        };
        networking = {
          firewall = {
            enable = true;
            allowedTCPPorts = [9091];
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
