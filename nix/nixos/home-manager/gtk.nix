{pkgs, ...}: {
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
    font.name = "System-ui Regular";
    font.size = 11;
  };
}
