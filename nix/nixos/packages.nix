{pkgs, ...}: {
  # Load configuration that is shared across systems
  environment.systemPackages = with pkgs;
    [
      adwaita-qt
      adwaita-qt6
      gnome.gnome-tweaks
      gnumake
      file
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
      xdg-desktop-portal-hyprland
      xdg-utils
      zathura # PDF viewer
    ]
    ++ (import ../shared/packages.nix {inherit pkgs;});
}
