{
  config,
  lib,
  namespace,
  inputs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.containers.nextcloud;
in {
  options.${namespace}.containers.nextcloud = with types; {
    enable = mkBoolOpt false "Enable nextcloud nixos-container;";
    secret_file = mkOpt str "secrets/serverz/default.yaml" "SOPS secret to get creds from";
    dataPath = mkOpt str "/tank/nextcloud" "Nextcloud data path on host machine";
    host = mkOpt str "nextcloud.sbulav.ru" "The host to serve nextcloud on";
    hostAddress = mkOpt str "172.16.64.10" "With private network, which address to use on Host";
    localAddress = mkOpt str "172.16.64.106" "With privateNetwork, which address to use in container";
  };

  config = mkIf cfg.enable {
    networking.nat = {
      enable = true;
      internalInterfaces = ["ve-nextcloud"];
      externalInterface = "ens3";
    };

    sops.secrets = {
      nextcloud-admin-pass = {
        sopsFile = lib.snowfall.fs.get-file "${cfg.secret_file}";
        uid = 999;
      };
    };
    containers.nextcloud = {
      ephemeral = true;
      autoStart = true;

      privateNetwork = true;
      # Need to add 172.16.64.0/18 on router
      hostAddress = "${cfg.hostAddress}";
      localAddress = "${cfg.localAddress}";

      bindMounts = {
        "${config.sops.secrets.nextcloud-admin-pass.path}" = {
          isReadOnly = true;
        };

        "/var/lib/nextcloud/config/" = {
          hostPath = "${cfg.dataPath}/config/";
          isReadOnly = false;
        };
        "/var/lib/nextcloud/data/" = {
          hostPath = "${cfg.dataPath}/data/";
          isReadOnly = false;
        };
        "/var/lib/nextcloud/store-apps/" = {
          hostPath = "${cfg.dataPath}/store-apps/";
          isReadOnly = false;
        };
        "/var/lib/postgresql/" = {
          hostPath = "${cfg.dataPath}/postgresql/";
          isReadOnly = false;
        };
      };
      # Inherit inputs to use stable package in container
      specialArgs = {
        inherit inputs;
      };

      config = {
        config,
        inputs,
        ...
      }: {
        systemd.tmpfiles.rules = [
          # "z /run/secrets/nextcloud-admin-pass - nextcloud nextcloud -"
          "d /var/lib/nextcloud 750 nextcloud nextcloud -"
          "d /var/lib/postgresql 700 postgres postgres -"
        ];

        services = {
          nextcloud = {
            enable = true;
            package = inputs.stable.legacyPackages.x86_64-linux.nextcloud30;
            hostName = "${cfg.host}";

            https = true;
            maxUploadSize = "16G";
            configureRedis = true;
            datadir = "/var/lib/nextcloud";
            database.createLocally = true;
            # As recommended by admin panel
            phpOptions."opcache.interned_strings_buffer" = "24";

            autoUpdateApps.enable = true;
            extraAppsEnable = true;
            extraApps = {
              inherit
                (config.services.nextcloud.package.packages.apps)
                previewgenerator
                notes
                user_oidc
                ;
            };

            config = {
              adminuser = "admin";
              adminpassFile = "/run/secrets/nextcloud-admin-pass";
              dbtype = "pgsql";
            };

            settings = {
              log_type = "file";
              loglevel = 1;
              trusted_proxies = ["${cfg.hostAddress}"];
              default_phone_region = "US";
              enable_previews = true;
              maintenance_window_start = 4; # Run jobs at 4am UTC
              enabledPreviewProviders = [
                "OC\\Preview\\BMP"
                "OC\\Preview\\GIF"
                "OC\\Preview\\JPEG"
                "OC\\Preview\\Krita"
                "OC\\Preview\\MarkDown"
                "OC\\Preview\\MP3"
                "OC\\Preview\\OpenDocument"
                "OC\\Preview\\PNG"
                "OC\\Preview\\TXT"
                "OC\\Preview\\XBitmap"
                # Not included by default
                "OC\\Preview\\HEIC"
                "OC\\Preview\\Movie"
                "OC\\Preview\\MP4"
              ];
            };
          };
        };

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

    containers.traefik.config.services.traefik.dynamicConfigOptions.http = lib.mkIf config.${namespace}.containers.traefik.enable {
      routers.nextcloud = {
        entrypoints = ["websecure"];
        rule = "Host(`${cfg.host}`)";
        service = "nextcloud";
        middlewares = ["auth-chain"];
        tls = {
          certResolver = "production";
        };
      };
      services.nextcloud = {
        loadBalancer = {
          passHostHeader = true;
          servers = [
            {
              url = "http://${cfg.localAddress}:80";
            }
          ];
        };
      };
    };

    containers.adguard.config.services.adguardhome.settings.filtering.rewrites =
      lib.mkIf config.${namespace}.containers.adguard.enable
      [
        {
          domain = "${cfg.host}";
          answer = "${config.${namespace}.containers.adguard.rewriteAddress}";
        }
      ];
  };
}
