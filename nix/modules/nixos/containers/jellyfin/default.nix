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
                          <string>admins</string>
                        </AdminRoles>
                        <Roles>
                          <string>users</string>
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
                 <LoginDisclaimer>&lt;a href="https://${cfg.host}/SSO/OID/p/authelia" class="raised cancel block emby-button authentik-sso"&gt;
                    Sign in with Authelia&amp;nbsp;
                    &lt;img alt="OpenID Connect (authelia)" title="OpenID Connect (authelia)" class="oauth-login-image" src="https://raw.githubusercontent.com/goauthentik/authentik/master/web/icons/icon.png"&gt;
                  &lt;/a&gt;
                  &lt;a href="https://${cfg.host}/SSOViews/linking" class="raised cancel block emby-button authentik-sso"&gt;
                    Link Authentik config&amp;nbsp;
                  &lt;/a&gt;
                  &lt;a href="https://${config.${namespace}.containers.authelia.host}" class="raised cancel block emby-button authentik-sso"&gt;
                    Authelia config&amp;nbsp;
                  &lt;/a&gt;
                </LoginDisclaimer>
                <CustomCss>
                  /* Hide this in lieu of authentik link */
                  .emby-button.block.btnForgotPassword {
                     display: none;
                  }

                  /* Make links look like buttons */
                  a.raised.emby-button {
                     padding: 0.9em 1em;
                     color: inherit !important;
                  }

                  /* Let disclaimer take full width */
                  .disclaimerContainer {
                     display: block;
                  }

                  /* Optionally, apply some styling to the `.authentik-sso` class, probably let users configure this */
                  .authentik-sso {
                     /* idk set a background image or something lol */
                  }

                  .oauth-login-image {
                      height: 24px;
                      position: absolute;
                      top: 12px;
                  }
                </CustomCss>
                <SplashscreenEnabled>true</SplashscreenEnabled>
              </BrandingOptions>
            '';
            executable = false;
          };
        in ''
          mkdir -p /var/lib/jellyfin/plugins
          CLIENT_SECRET="$(cat ${config.sops.secrets."jellyfin/oidc_client_secret".path})"
          sed "s/CLIENT_SECRET_REPLACE/$CLIENT_SECRET/" ${ssoConfig} > /var/lib/jellyfin/plugins/configurations/SSO-Auth.xml
          cat ${brandingConfig} > /var/lib/jellyfin/plugins/configurations/brandingConfig.xml
        '';

        networking = {
          firewall = {
            enable = false;
            # https://jellyfin.org/docs/general/networking/index.html#port-bindings
            allowedTCPPorts = [8096 8920];
            allowedUDPPorts = [1900 7359];
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
