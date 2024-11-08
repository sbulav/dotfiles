{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.suites.server;
in {
  options.suites.server = with types; {
    enable = mkBoolOpt false "Enable the common suite";
  };

  config = mkIf cfg.enable {
    system = {
      nix.enable = true;

      fonts.enable = false;
      locale.enable = true;
      time.enable = true;
      xkb.enable = false;

      security.doas.enable = false;
      security.sudo.enable = true;
      security.gpg.enable = true;
    };

    hardware.audio.enable = false;
    hardware.networking.enable = false;

    services.ssh.enable = true;

    custom.tools = {
      http.enable = true;
      misc.enable = true;
      net.enable = true;
    };
    custom.cli-apps = {
      neovim.enable = lib.mkDefault true;
      lf.enable = lib.mkDefault false;
      tmux.enable = lib.mkDefault false;
    };
  };
}
