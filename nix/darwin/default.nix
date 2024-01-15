{
  config,
  pkgs,
  ...
}: let
  user = "%USER%";
in {
  imports = [
    ../shared
    ../shared/cachix
    ./home-manager.nix
    ./skhd.nix
    ./yabai.nix
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  users.users.sab = {
    shell = pkgs.fish;
  };
  # programs.tmux.enable = true;

  # Setup user, packages, programs
  nix = {
    package = pkgs.nixUnstable;
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["@admin" "${user}"];
      warn-dirty = false;
    };

    gc = {
      user = "root";
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 2;
        Minute = 0;
      };
      options = "--delete-older-than 30d";
    };
  };

  # Turn off NIX_PATH warnings now that we're using flakes
  system.checks.verifyNixPath = false;

  # Load configuration that is shared across systems
  environment.systemPackages = with pkgs;
    [
      neofetch
    ]
    ++ (import ../shared/packages.nix {inherit pkgs;});

  # Enable fonts dir
  fonts.fontDir.enable = true;

  programs.fish.enable = true;
  system = {
    stateVersion = 4;

    defaults = {
      LaunchServices = {
        LSQuarantine = false;
      };

      # NSGlobalDomain = {
      #   AppleShowAllExtensions = true;
      #   ApplePressAndHoldEnabled = false;

      #   # 120, 90, 60, 30, 12, 6, 2
      #   KeyRepeat = 2;

      #   # 120, 94, 68, 35, 25, 15
      #   InitialKeyRepeat = 15;

      #   "com.apple.mouse.tapBehavior" = 1;
      #   "com.apple.sound.beep.volume" = 0.0;
      #   "com.apple.sound.beep.feedback" = 0;
      # };

      # dock = {
      #   autohide = false;
      #   show-recents = false;
      #   launchanim = true;
      #   orientation = "bottom";
      #   tilesize = 48;
      # };

      finder = {
        _FXShowPosixPathInTitle = false;
      };

      # trackpad = {
      #   Clicking = true;
      #   TrackpadThreeFingerDrag = true;
      # };
    };

    # keyboard = {
    #   enableKeyMapping = true;
    #   remapCapsLockToControl = true;
    # };
  };
  # Enable sudo authentication with Touch ID.
  security.pam.enableSudoTouchIdAuth = true;
}
