{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.tools.net;
in {
  options.custom.tools.net = with types; {
    enable = mkBoolOpt false "Whether or not to enable common utilities.";
  };

  config = mkIf cfg.enable {
    home.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [
      dig
      iftop
      ipfetch
      nfs-utils
      traceroute
      mtr
    ];
  };
}
