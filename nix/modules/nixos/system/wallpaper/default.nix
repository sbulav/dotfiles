{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  # cfg = config.system.wallpaper;
in {
  options.system.wallpaper = mkOption {
    type = types.oneOf [types.package types.path types.str];
    default = inputs.wallpapers-nix.packages.${pkgs.system}.catppuccin;
    description = "The wallpaper to use.";
  };
}
