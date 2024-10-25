{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.hardware.networking;
in {
  options.hardware.networking = with types; {
    enable = mkBoolOpt false "Enable NetworkManager";
    hosts =
      mkOpt attrs {} "An attribute set to merge with `networking.hosts`";
  };

  config = mkIf cfg.enable {
    networking = {
      networkmanager.enable = true;
      enableIPv6 = false;
      wireguard.enable = true;
      firewall.enable = false;
      hosts =
        {
          "127.0.0.1" = ["local.test"] ++ (cfg.hosts."127.0.0.1" or []);
        }
        // cfg.hosts;
    };
    systemd.services.NetworkManager-wait-online.enable = false;
    services.wg-netmanager.enable = true;
    environment.systemPackages = with pkgs; [networkmanager-l2tp openconnect_openssl];
    services.strongswan = {
      enable = true;
      secrets = [
        "ipsec.d/ipsec.nm-l2tp.secrets"
      ];
    };
  };
}
