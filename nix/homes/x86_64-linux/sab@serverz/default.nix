{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib.custom; let
  wallpapers = inputs.wallpapers-nix.packages.${pkgs.system}.catppuccin;
in {
  custom = {
    user = {
      enable = true;
      name = config.snowfallorg.user.name;
    };

    cli-apps = {
      argocd = disabled;
      atuin = enabled;
      bottom = enabled;
      fastfetch = enabled;
      home-manager = enabled;
      yazi = enabled;
    };
    tools = {
      gh = disabled;
      git = enabled;
      direnv = disabled;
    };
    security = {
      rbw = disabled;
      vault = disabled;
    };
  };
  home.stateVersion = "24.05";
}
