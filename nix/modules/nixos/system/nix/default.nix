{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.system.nix;
in {
  options.system.nix = with types; {
    enable = mkBoolOpt true "Whether or not to manage nix configuration.";

    package = mkOpt package pkgs.nixVersions.latest "Which nix package to use.";
    default-substituter = {
      url = mkOpt str "https://cache.nixos.org" "The url for the substituter.";
      key = mkOpt str "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "The trusted public key for the substituter.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cachix
      gcc
      nil
      nixfmt-rfc-style
      nix-index
      nix-prefetch-git
      nvd
    ];

    nix = let
      users = ["root" config.custom.user.name];
    in {
      inherit (cfg) package;

      settings = {
        allowed-users = users;
        auto-optimise-store = true;
        builders-use-substitutes = true;
        experimental-features = "nix-command flakes";
        http-connections = 50;
        keep-going = true;
        keep-outputs = true;
        log-lines = 50;
        sandbox = "relaxed";
        trusted-users = users;
        warn-dirty = false;
        substituters = [
          "https://cache.nixos.org"
          "https://khanelinix.cachix.org"
          "https://nix-community.cachix.org"
          "https://nixpkgs-unfree.cachix.org"
          "https://numtide.cachix.org"
          "https://wezterm.cachix.org"
        ];

        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "khanelinix.cachix.org-1:FTmbv7OqlMsmJEOFvAlz7PVkoGtstbwLC2OldAiJZ10="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
          "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
          "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
        ];
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };

      # flake-utils-plus
      generateRegistryFromInputs = true;
      generateNixPathFromInputs = true;
      linkInputs = true;
    };
    system.activationScripts.diff = {
      supportsDryActivation = true;
      text = ''
        ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
      '';
    };
  };
}
