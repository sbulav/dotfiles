{ pkgs, ... }: {

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  programs.fish = {
    enable = true;
    shellAliases = {
      nixup = "sudo nixos-rebuild switch --flake ~/dotfiles/nix#nz";
      nixt = "sudo nixos-rebuild test --flake ~/dotfiles/nix#nz";
      nixclean = "sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nix-store --repair --verify --check-contents && sudo nix-store --optimise -vvv";
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

  environment.systemPackages = with pkgs;
    [
      # cargo
      # nodejs_20
      bat
      curl
      fd
      fzf
      gcc
      gnome.gnome-tweaks
      gnumake
      jq
      kitty
      lf
      neofetch
      ripgrep
      unzip
      wget
    ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
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
