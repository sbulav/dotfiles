# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.kernelParams = [ "ipv6.disable=1" ];
  boot.loader.efi.canTouchEfiVariables = true;
  #
  networking.hostName = "nz"; # Define your hostname.
  networking.enableIPv6 = false;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.fish.enable = true;
  programs.tmux.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.git.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  users.defaultUserShell = pkgs.fish;
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
  #            programs.dconf.enable = true;
  #	home-manager.users.sab = { lib, ... }: {
  #  home.stateVersion = "23.05"; # Did you read the comment?
  #	    dconf.settings = {
  #    "org/gnome/desktop/input-sources" = {
  #      show-all-sources = true;
  #sources = [ (mkTuple [ "xkb" "eu" ]) (mkTuple [ "xkb" "us+altgr-intl" ]) ];
  #sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "eu" ]) ];
  #sources = [ (mkTuple [ "xkb" "us" ]) ];
  #      xkb-options = [ "terminate:ctrl_alt_bksp" ];
  #    };
  #    };
  #};
  # Configure keymap in X11
  services.xserver = {
    layout = "us,ru,dh";
    #xkbVariant = "";

    xkbOptions = "grp:shift_caps_toggle,grp_led:caps,caps:escape,terminate:ctrl_alt_bksp";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.sudo.wheelNeedsPassword = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  services.xserver.extraLayouts.dh = {
    description = "Colemak-DH ergo";
    languages = [ "eng" ];
    #  symbolsFile = /home/sab/git_priv/BigBagKbdTrixXKB/xkb-data_xmod/xkb/symbols/colemak;
    symbolsFile = /home/sab/colemak_dh;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sab = {
    isNormalUser = true;
    description = "Sergei";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bat
    fzf
    gcc
    gnumake
    jq
    # cargo
    # nodejs_20
    unzip
    kitty
    lf
    curl
    gnome.gnome-tweaks
    wget
    fd
    neofetch
    ripgrep
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
