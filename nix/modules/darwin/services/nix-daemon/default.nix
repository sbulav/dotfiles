{
  lib,
  config,
  ...
}: let
  inherit (lib) types mkIf;
  inherit (lib.custom) mkOpt enabled;

  cfg = config.custom.services.nix-daemon;
in {
  options.custom.services.nix-daemon = {
    enable = mkOpt types.bool true "Whether to enable the Nix daemon.";
  };

  config = mkIf cfg.enable {
    services.nix-daemon = enabled;
  };
}
