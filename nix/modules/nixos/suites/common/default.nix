{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.suites.common;
in {
  options.suites.common = with types; {
    enable = mkBoolOpt false "Enable the common suite";
  };

  config = mkIf cfg.enable {
    system.nix.enable = true;
    system.security.doas.enable = false;

    hardware.audio.enable = true;
    hardware.networking.enable = true;

    services.ssh.enable = true;
    programs.dconf.enable = true;

    # add sys custom build package
    environment.systemPackages = [pkgs.custom.sys];

    system = {
      fonts.enable = true;
      locale.enable = true;
      time.enable = true;
      xkb.enable = true;
    };
    custom.tools = {
      git.enable = true;
    };
  };
}
