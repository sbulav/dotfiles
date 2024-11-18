{
  config,
  lib,
  namespace,
  inputs,
  pkgs,
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

  imports = [
    (import ../shared/shared-traefik-route.nix
      {
        app = "nextcloud";
        host = "${cfg.host}";
        url = "http://${cfg.localAddress}:80";
        route_enabled = cfg.enable;
      })
    (import ../shared/shared-adguard-dns-rewrite.nix
      {
        host = "${cfg.host}";
        rewrite_enabled = cfg.enable;
      })
  ];
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
      nextcloud-oidc-login-client-secret = {
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
        "${config.sops.secrets.nextcloud-oidc-login-client-secret.path}" = {
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
        pkgs,
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
            secretFile = "/run/secrets/run/secrets/nextcloud-oidc-login-client-secret";

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
                ;
              oidc_login = pkgs.fetchNextcloudApp {
                license = "agpl3Plus";
                url = "https://github.com/pulsejet/nextcloud-oidc-login/releases/download/v3.2.0/oidc_login.tar.gz";
                sha256 = "sha256-DrbaKENMz2QJfbDKCMrNGEZYpUEvtcsiqw9WnveaPZA=";
              };
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
              user_oidc = {
                single_logout = false;
                auto_provision = true;
                soft_auto_provision = true;
              };
              allow_user_to_change_display_name = false;
              lost_password_link = "disabled";
              oidc_login_provider_url = "https://authelia.sbulav.ru";
              oidc_login_client_id = "nextcloud";
              oidc_login_auto_redirect = false;
              oidc_login_end_session_redirect = false;
              oidc_login_button_text = "Log in with Authelia";
              oidc_login_hide_password_form = false;
              oidc_login_use_id_token = true;
              oidc_login_attributes = {
                id = "preferred_username";
                name = "name";
                mail = "email";
                groups = "groups";
              };
              oidc_login_default_group = "oidc";
              oidc_login_use_external_storage = false;
              oidc_login_scope = "openid profile email groups";
              oidc_login_proxy_ldap = false;
              oidc_login_disable_registration = false; # different from doc, to enable auto creation of new users
              oidc_login_redir_fallback = false;
              oidc_login_tls_verify = true;
              oidc_create_groups = false;
              oidc_login_webdav_enabled = false;
              oidc_login_password_authentication = false;
              oidc_login_public_key_caching_time = 86400;
              oidc_login_min_time_between_jwks_requests = 20;
              oidc_login_well_known_caching_time = 86400;
              oidc_login_update_avatar = false;
              oidc_login_code_challenge_method = "S256";
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
          # useHostResolvConf = lib.mkForce false;
        };
        # services.resolved.enable = true;
        system.stateVersion = "24.11";
      };
    };
  };
}
