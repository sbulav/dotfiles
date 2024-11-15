{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.containers.flood;
in {
  options.${namespace}.containers.flood = with types; {
    enable = mkBoolOpt false "Enable flood nixos-container with rtorrent;";
    host = mkOpt str "flood.sbulav.ru" "The host to serve flood on";
    hostAddress = mkOpt str "172.16.64.10" "With private network, which address to use on Host";
    localAddress = mkOpt str "172.16.64.105" "With privateNetwork, which address to use in container";
  };
  imports = [
    (import ../shared/shared-traefik-route.nix
      {
        app = "flood";
        host = "${cfg.host}";
        url = "http://${cfg.localAddress}:3000";
      })
    (import ../shared/shared-adguard-dns-rewrite.nix
      {host = "${cfg.host}";})
  ];

  config = mkIf cfg.enable {
    networking.nat = {
      enable = true;
      internalInterfaces = ["ve-flood"];
      externalInterface = "ens3";
    };
    containers.flood = {
      ephemeral = true;
      autoStart = true;

      privateNetwork = true;
      # Need to add 172.16.64.0/18 on router
      hostAddress = "${cfg.hostAddress}";
      localAddress = "${cfg.localAddress}";

      config = {...}: {
        services.rtorrent = {
          enable = true;
          dataDir = "/var/lib/torrents";
        };
        services.flood = {
          enable = true;
          host = "${cfg.localAddress}";
          port = 3000;
          extraArgs = [
            "--noauth"
            "--rtsocket=${config.services.rtorrent.rpcSocket}"
          ];
        };
        systemd.services.flood = {
          wantedBy = ["multi-user.target"];
          wants = ["rtorrent.service"];
          after = ["rtorrent.service"];
          serviceConfig = {
            User = "rtorrent";
          };
        };

        networking = {
          firewall = {
            enable = true;
            allowedTCPPorts = [3000 139 445];
            allowedUDPPorts = [137 138];
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
