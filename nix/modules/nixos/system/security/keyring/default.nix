{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.security.keyring;
in {
  options.custom.security.keyring = with types; {
    enable = mkBoolOpt false "Whether to enable gnome keyring.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gnome.gnome-keyring
      gnome.libgnome-keyring
    ];
    security.pam.services.${config.user.name}.enableGnomeKeyring = true;
  };
}
