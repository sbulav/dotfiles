{pkgs, ...}: {
  programs = {
    hyprland.enable = true;
    hyprland.xwayland.enable = true;
    fish = {
      enable = true;
      shellAliases = {
        nixup = "sudo nixos-rebuild switch --flake ~/dotfiles/nix#nz";
        nixt = "sudo nixos-rebuild test --flake ~/dotfiles/nix#nz";
        nixclean = "sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nix-store --repair --verify --check-contents && sudo nix-store --optimise -vvv";
      };
      interactiveShellInit = "source ~/dotfiles/fish/functions/l.fish";
    };
    tmux.enable = true;
    neovim.enable = true;
    neovim.defaultEditor = true;
    neovim.vimAlias = true;
    git.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
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
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono" "CascadiaCode" "FiraCode"];})
  ];

  fonts.fontconfig = {
    defaultFonts = {
      monospace = ["JetBrainsMono Nerd Font Mono"];
      sansSerif = ["JetBrainsMono Nerd Font"];
      serif = ["JetBrainsMono Nerd Font"];
    };
  };

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
