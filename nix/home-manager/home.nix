# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    ./desktop/hyprpaper.nix
    ./desktop/mako.nix
    ./mime.nix
    ./desktop/rofi.nix
    ./desktop/swaylock.nix
    ./desktop/waybar.nix
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
      allowUnfreePredicate = _: true;
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
    imv
    bluez-tools
    fd
    glib # required for mime
    fzf
    gh
    k9s
    kubectl
    neofetch
    networkmanagerapplet
    papirus-icon-theme
    ripgrep
    slack
    pcmanfm
    brightnessctl
    swayidle
    xdg-utils
    wl-clipboard
  ];

  programs.firefox.enable = true;
  programs.wlogout.enable = true;

  services.copyq = {
    enable = true;
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
