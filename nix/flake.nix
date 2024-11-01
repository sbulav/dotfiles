#https://github.com/Kazuto/.nix/blob/master/modules/linux/home/default.nix
{
  description = "Sbulav nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stable.url = "github:nixos/nixpkgs/nixos-24.05";

    snowfall-lib = {
      url = "github:snowfallorg/lib?ref=v3.0.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers-nix = {
      url = "github:sbulav/wallpapers-nix";
    };

    wezterm = {
      url = "github:wez/wezterm/main?dir=nix";
    };

    # Sops (Secrets)
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "stable";
    };

    sops-nix-darwin = {
      url = "github:Mic92/sops-nix/nix-darwin";
      # url = "github:khaneliman/sops-nix/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;

      snowfall = {
        meta = {
          name = "dotfiles";
          title = "dotfiles";
        };

        namespace = "custom";
      };
    };
  in
    lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config = {
        allowUnfree = true;
        # allowBroken = true;
      };

      overlays = with inputs; [];

      homes.modules = with inputs; [
        sops-nix.homeManagerModules.sops
      ];
      systems = {
        modules = {
          darwin = with inputs; [sops-nix-darwin.darwinModules.sops];
          nixos = with inputs; [sops-nix.nixosModules.sops];
        };
      };
    };
}
