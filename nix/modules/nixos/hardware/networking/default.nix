{
  options,
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.hardware.networking;
in {
  options.hardware.networking = with types; {
    enable = mkBoolOpt false "Enable NetworkManager";
    hosts =
      mkOpt attrs {}
      (mdDoc "An attribute set to merge with `networking.hosts`");
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
  };
}