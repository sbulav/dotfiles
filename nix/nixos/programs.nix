{pkgs, ...}: {
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.fish = {
    enable = true;
    shellAliases = {
      nixup = "sudo nixos-rebuild switch --flake ~/dotfiles/nix#nz";
      nixt = "sudo nixos-rebuild test --flake ~/dotfiles/nix#nz";
      nixclean = "sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nix-store --repair --verify --check-contents && sudo nix-store --optimise -vvv";
      homeup = "home-manager switch --flake ~/dotfiles/nix";
    };
  };
  programs.tmux.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.git.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.sessionVariables = {
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };

  environment.systemPackages = with pkgs; [
    # cargo
    # nodejs_20
    alejandra
    bat
    curl
    gcc
    gnome.gnome-tweaks
    home-manager
    gnumake
    jq
    kitty
    lf
    unzip
    wget
    hyprland-protocols
    hyprpicker
    polkit_gnome
    xdg-desktop-portal-hyprland
    hyprpaper
    # firefox-wayland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
    pamixer
    vlc
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["CascadiaCode" "FiraCode"];})
  ];

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
    ])
    ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gedit # text editor
      epiphany # web browser
      geary # email reader
      gnome-characters
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      yelp # Help view
      gnome-contacts
      gnome-initial-setup
    ]);
}
