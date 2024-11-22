{
  config,
  lib,
  namespace,
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
  };
  imports = [
    (import ../shared/shared-traefik-route.nix
      {
        app = "jellyfin";
        host = "${cfg.host}";
        url = "http://${cfg.localAddress}:8096";
        route_enabled = cfg.enable;
        # middleware = "secure-headers";
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

      config = {...}: {
        systemd.tmpfiles.rules = [
          "d /var/lib/jellyfin 700 jellyfin jellyfin -"
        ];
        services.jellyfin = {
          enable = true;
        };

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
