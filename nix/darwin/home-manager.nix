{
  config,
  pkgs,
  lib,
  home-manager,
  ...
}: let
  user = "sab";
in {
  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.fish;
  };

  # This is a module from nix-darwin
  # Homebrew is *installed* via the flake input nix-homebrew
  homebrew.enable = true;
  homebrew.casks = pkgs.callPackage ./casks.nix {};

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = {
      pkgs,
      config,
      lib,
      ...
    }: {
      home.enableNixpkgsReleaseCheck = false;
      home.packages = pkgs.callPackage ./packages.nix {};

      home.stateVersion = "23.05";
      programs = import ../shared/home-manager.nix {inherit config pkgs lib;};
    };
  };
}
