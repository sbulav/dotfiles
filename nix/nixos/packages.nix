{pkgs}:
with pkgs; let
  shared-packages = import ../shared/packages.nix {inherit pkgs;};
in
  shared-packages
  ++ [
    adwaita-qt
    adwaita-qt6
    gnome.gnome-tweaks
    gnumake
    home-manager
    hyprland-protocols
    hyprpaper
    hyprpicker
    pamixer
    polkit_gnome
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    vlc
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
    zathura # PDF viewer
  ]
