{
  lib,
  config,
  pkgs,
  osConfig ? {},
  ...
}: let
  inherit (lib) types mkIf mkDefault mkMerge;
  inherit (lib.custom) mkOpt;

  cfg = config.custom.user;

  is-linux = pkgs.stdenv.isLinux;
  is-darwin = pkgs.stdenv.isDarwin;

  home-directory =
    if cfg.name == null
    then null
    else if is-darwin
    then "/Users/${cfg.name}"
    else "/home/${cfg.name}";
in {
  options.custom.user = {
    enable = mkOpt types.bool false "Whether to configure the user account.";
    name = mkOpt types.str "sab" "The name to use for the user account.";
    fullName = mkOpt types.str "Sergei Bulavintsev" "The full name of the user.";
    email = mkOpt types.str "bulavintsev.sergey@gmail.com" "The email of the user.";

    home = mkOpt (types.nullOr types.str) home-directory "The user's home directory.";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      assertions = [
        {
          assertion = cfg.name != null;
          message = "custom.user.name must be set";
        }
        {
          assertion = cfg.home != null;
          message = "custom.user.home must be set";
        }
      ];

      home = {
        username = mkDefault cfg.name;
        homeDirectory = mkDefault cfg.home;
      };
    }
  ]);
}
