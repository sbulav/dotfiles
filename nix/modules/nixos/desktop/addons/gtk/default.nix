{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.gtk;
in {
  options.custom.desktop.addons.gtk = with types; {
    enable = mkBoolOpt false "Whether to customize GTK and apply themes.";

    home.config = mkIf cfg.enable {
      gtk = {
        enable = true;
        theme = {
          name = "Adwaita";
          package = pkgs.gnome.adwaita-icon-theme;
        };
        iconTheme = {
          name = "Adwaita";
          package = pkgs.gnome.adwaita-icon-theme;
        };
        cursorTheme = {
          name = "Adwaita";
          package = pkgs.gnome.adwaita-icon-theme;
        };

        font.name = "System-ui Regular";
        font.size = 11;
      };
    };
  };
}
