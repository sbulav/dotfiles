{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.containers.adguard;
in {
  options.${namespace}.containers.adguard = with types; {
    enable = mkBoolOpt false "Enable adguard nixos-container;";
    host = mkOpt str "adguard.sbulav.ru" "The host to serve adguard on";
    hostAddress = mkOpt str "172.16.64.10" "With private network, which address to use on Host";
    localAddress = mkOpt str "172.16.64.104" "With privateNetwork, which address to use in container";
    rewriteAddress = mkOpt str "192.168.89.206" "IP address or CNAME to create DNS rewrites(local DNS entries) to";
  };

  imports = [
    (import ../shared/shared-traefik-route.nix
      {
        app = "adguard";
        host = "${cfg.host}";
        url = "http://${cfg.localAddress}:3000";
      })
  ];

  config = mkIf cfg.enable {
    networking.nat = {
      enable = true;
      internalInterfaces = ["ve-adguard"];
      externalInterface = "ens3";
    };
    containers.adguard = {
      ephemeral = true;
      autoStart = true;

      privateNetwork = true;
      # Need to add 172.16.64.0/18 on router
      hostAddress = "${cfg.hostAddress}";
      localAddress = "${cfg.localAddress}";

      config = {...}: {
        services.adguardhome = {
          enable = true;
          host = "${cfg.localAddress}";
          port = 3000;
          settings = {
            dns = {
              bind_hosts = ["${cfg.localAddress}"];
              port = 53;
              ratelimit = 0;
              upstream_dns = ["tls://security.cloudflare-dns.com" "quic://dns.adguard-dns.com" "77.88.8.8"];
              upstream_mode = "parallel";
              use_http3_upstreams = true;
              bootstrap_dns = ["1.1.1.2" "1.0.0.2"];

              cache_size = 256 * 1024 * 1024;
              cache_optimistic = true;

              enable_dnssec = true;
            };
            filtering = {
              protection_enabled = true;
              filtering_enabled = true;
              safe_search.enabled = true;

              rewrites = [
                {
                  domain = "${cfg.host}";
                  answer = "${cfg.rewriteAddress}";
                }
              ];
            };
            statistics.enabled = true;
          };
        };

        networking = {
          firewall = {
            enable = true;
            allowedTCPPorts = [53 3000];
            allowedUDPPorts = [53];
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
