{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.containers.jellyfin;
in {
  options.${namespace}.containers.jellyfin = with types; {
    enable = mkBoolOpt false "Enable jellyfin nixos-container;";
    host = mkOpt str "jellyfin.sbulav.ru" "The host to serve jellyfin on";
    dataPath = mkOpt str "/tank/jellyfin" "Jellyfin data path on host machine";
    hostAddress = mkOpt str "172.16.64.10" "With private network, which address to use on Host";
    localAddress = mkOpt str "172.16.64.107" "With privateNetwork, which address to use in container";
    secret_file = mkOpt str "secrets/serverz/default.yaml" "SOPS secret to get creds from";
  };
  imports = [
    (import ../shared/shared-traefik-route.nix
      {
        app = "jellyfin";
        host = "${cfg.host}";
        url = "http://${cfg.localAddress}:8096";
        route_enabled = cfg.enable;
        middleware = ["secure-headers-jellyfin" "authelia"];
      })
    (import ../shared/shared-adguard-dns-rewrite.nix
      {
        host = "${cfg.host}";
        rewrite_enabled = cfg.enable;
      })
  ];

  config = mkIf cfg.enable {
    sops.secrets = {
      "jellyfin/oidc_client_secret" = {
        sopsFile = lib.snowfall.fs.get-file "${cfg.secret_file}";
        uid = 999;
      };
    };
    networking.nat = {
      enable = true;
      internalInterfaces = ["ve-jellyfin"];
      externalInterface = "ens3";
    };
    containers.jellyfin = {
      ephemeral = true;
      autoStart = true;

      privateNetwork = true;
      # Need to add 172.16.64.0/18 on router
      hostAddress = "${cfg.hostAddress}";
      localAddress = "${cfg.localAddress}";

      bindMounts = {
        "${config.sops.secrets."jellyfin/oidc_client_secret".path}" = {
          isReadOnly = true;
        };
        "/var/lib/jellyfin/config/" = {
          hostPath = "${cfg.dataPath}/config/";
          isReadOnly = false;
        };
        "/var/lib/jellyfin/" = {
          hostPath = "${cfg.dataPath}/";
          isReadOnly = false;
        };
        "/var/lib/jellyfin/log/" = {
          "hostPath" = "${cfg.dataPath}/log/";
          isReadOnly = false;
        };
      };

      config = {pkgs, ...}: {
        systemd.tmpfiles.rules = [
          "d /var/lib/jellyfin 700 jellyfin jellyfin -"
        ];
        services.jellyfin = {
          enable = true;
        };
        systemd.services.jellyfin.preStart = let
          sso-authentication-plugin = pkgs.fetchzip {
            stripRoot = false;
            url = "https://github.com/9p4/jellyfin-plugin-sso/releases/download/v3.5.2.4/sso-authentication_3.5.2.4.zip";
            hash = "sha256-e+w5m6/7vRAynStDj34eBexfCIEgDJ09huHzi5gQEbo=";
          };
          ssoConfig = pkgs.writeTextFile {
            name = "SSO-Auth.xml";
            text = ''
              <?xml version="1.0" encoding="utf-8"?>
              <PluginConfiguration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
                <SamlConfigs />
                <OidConfigs>
                  <item>
                    <key>
                      <string>authelia</string>
                    </key>
                    <value>
                      <PluginConfiguration>
                        <OidEndpoint>https://${config.${namespace}.containers.authelia.host}</OidEndpoint>
                        <OidClientId>jellyfin</OidClientId>
                        <OidSecret>CLIENT_SECRET_REPLACE</OidSecret>
                        <Enabled>true</Enabled>
                        <EnableAuthorization>true</EnableAuthorization>
                        <EnableAllFolders>true</EnableAllFolders>
                        <EnabledFolders />
                        <AdminRoles>
                          <string>jellyfin-admins</string>
                          <string>admins</string>
                        </AdminRoles>
                        <Roles>
                          <string>jellyfin-users</string>
                          <string>dev</string>
                        </Roles>
                        <EnableFolderRoles>false</EnableFolderRoles>
                        <EnableLiveTvRoles>false</EnableLiveTvRoles>
                        <EnableLiveTv>false</EnableLiveTv>
                        <EnableLiveTvManagement>false</EnableLiveTvManagement>
                        <LiveTvRoles />
                        <LiveTvManagementRoles />
                        <FolderRoleMappings />
                        <RoleClaim>groups</RoleClaim>
                        <OidScopes>
                          <string>groups</string>
                        </OidScopes>
                        <CanonicalLinks></CanonicalLinks>
                        <DisableHttps>false</DisableHttps>
                        <DoNotValidateEndpoints>false</DoNotValidateEndpoints>
                        <DoNotValidateIssuerName>false</DoNotValidateIssuerName>
                      </PluginConfiguration>
                    </value>
                  </item>
                </OidConfigs>
              </PluginConfiguration>
            '';
            executable = false;
          };

          brandingConfig = pkgs.writeTextFile {
            name = "brandingConfig.xml";
            text = ''
              <?xml version="1.0" encoding="utf-8"?>
              <BrandingOptions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
                <LoginDisclaimer>&lt;form action="https://${cfg.host}/sso/OID/start/authelia"&gt;
                &lt;button class="raised block emby-button button-submit"&gt;
                  Sign in with SSO
                &lt;/button&gt;
              &lt;/form&gt;</LoginDisclaimer>
                <CustomCss>a.raised.emby-button {
                padding: 0.9em 1em;
                color: inherit !important;
              }

              .disclaimerContainer {
                display: block;
              }</CustomCss>
                <SplashscreenEnabled>true</SplashscreenEnabled>
              </BrandingOptions>
            '';
            executable = false;
          };
        in ''
          # Setting up SSO integration
          mkdir -p /var/lib/jellyfin/plugins
          CLIENT_SECRET="$(cat ${config.sops.secrets."jellyfin/oidc_client_secret".path})"
          sed "s/CLIENT_SECRET_REPLACE/$CLIENT_SECRET/" ${ssoConfig} > /var/lib/jellyfin/plugins/configurations/SSO-Auth.xml
          cat ${brandingConfig} > /var/lib/jellyfin/config/branding.xml

          # Setting up SSO plugin
          rm -rf /var/lib/jellyfin/plugins/sso-authentication-plugin
          mkdir -p /var/lib/jellyfin/plugins/sso-authentication-plugin
          cp ${sso-authentication-plugin}/* /var/lib/jellyfin/plugins/sso-authentication-plugin/
          chmod -R 770 /var/lib/jellyfin/plugins/sso-authentication-plugin
        '';

        networking = {
          firewall = {
            enable = true;
            # https://jellyfin.org/docs/general/networking/index.html#port-bindings
            allowedTCPPorts = [8096 8920];
            allowedUDPPorts = [1900 7359];
          };
        };
        system.stateVersion = "24.11";
      };
    };
  };
}
