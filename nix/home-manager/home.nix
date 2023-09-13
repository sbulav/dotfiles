# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    ./waybar.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "sab";
    homeDirectory = "/home/sab";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    awscli2
    azure-cli
    cargo
    fd
    fzf
    gh
    k9s
    kubectl
    neofetch
    ripgrep
    wl-clipboard
  ];

  # Enable home-manager and git
  #programs.git.enable = true;

  # programs.firefox = {
  #   enable = true;
  #   package = pkgs.firefox-bin;
  # };
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      #image = "$HOME/.config/wall";
      color = "000000ff";
      font-size = "24";
      indicator-idle-visible = true;
      clock = true;
      timestr = "%H:%M";
      datestr = "%A, %d %B";

      indicator = true;
      indicator-radius = "100";
      indicator-thickness = "10";

      effect-blur = "30x2";
      effect-vignette = "0.5:0.5";

      text-color = "cdd6f4";
      text-clear-color = "11111b";
      text-ver-color = "11111b";
      text-wrong-color = "11111b";

      ring-color = "1e1e2e";
      key-hl-color = "f5c2e7";
      line-color = "f5c2e7";
      inside-color = "00000088";
      separator-color = "00000000";

      inside-clear-color = "f2cdcd88";
      line-clear-color = "f2cdcd";
      ring-clear-color = "f2cdcd";

      inside-ver-color = "89dceb88";
      line-ver-color = "89dceb";
      ring-ver-color = "89dceb";

      inside-wrong-color = "f38ba888";
      line-wrong-color = "f38ba8";
      ring-wrong-color = "f38ba8";
    };
  };

  programs.rofi = {
    enable = true;
    extraConfig = {
      combi-hide-mode-prefix = true;
      combi-modi = "window,drun,calc";
      disable-history = false;
      display-Network = " 󰤨  Network";
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 﩯  Window";
      drun-display-format = "{icon} {name}";
      hide-scrollbar = true;
      icon-theme = "Fluent";
      location = 0;
      modi = "run,drun,window";
      show-icons = true;
      sidebar-mode = true;
      sorting-method = "fzf";
      sort = true;
      terminal = "kitty";
      font = "FiraCode Nerd Font Regular 12";
      kb-accept-custom = "Control+Return";
      kb-cancel = "Escape,Control+g,Control+bracketleft,Control+space";
      kb-row-select = "Control+Super+space";
      matching = "fuzzy";
    };
    theme = ./rofi/blurry.rasi;
  };

  services.mako = {
    enable = true;
  };

  
  services.copyq = {
    enable = true;
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
