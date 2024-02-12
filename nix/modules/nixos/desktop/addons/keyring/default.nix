{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.keyring;
in {
  options.custom.desktop.addons.keyring = with types; {
    enable = mkBoolOpt false "Whether to enable the gnome keyring. Required to save DE passwords";
  };

  config = mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [gnome.seahorse];
  };
}
