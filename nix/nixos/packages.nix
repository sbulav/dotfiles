{pkgs, ...}: {
  # Load configuration that is shared across systems
  environment.systemPackages = with pkgs;
    [
      adwaita-qt
      adwaita-qt6
      blueberry
      file
      gnome.gnome-tweaks
      grim # Screenshot tool for hyprland
      slurp # Works with grim to screenshot on wayland
      gnumake
      home-manager
      hyprland-protocols
      hyprpaper
      hyprpicker
      nfs-utils
      traceroute
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
