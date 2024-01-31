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
    system = {
      nix.enable = true;

      fonts.enable = true;
      locale.enable = true;
      time.enable = true;
      xkb.enable = true;

      security.doas.enable = false;
      security.sudo.enable = true;
      security.gpg.enable = true;
    };

    hardware.audio.enable = true;
    hardware.networking.enable = true;

    services.ssh.enable = true;
    programs.dconf.enable = true;

    # add sys custom build package
    environment.systemPackages = [pkgs.custom.sys];

    custom.tools = {
      git.enable = true;
      http.enable = true;
      misc.enable = true;
      net.enable = true;
    };
    custom.cli-apps = {
      atuin.enable = true;
      neovim.enable = true;
      lf.enable = true;
      tmux.enable = true;
    };
  };
}
