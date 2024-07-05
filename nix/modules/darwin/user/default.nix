{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) types mkIf mkDefault;
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
    name = mkOpt types.str "sab" "The name to use for the user account.";
    fullName = mkOpt types.str "Sergei Bulavintsev" "The full name of the user.";
    email = mkOpt types.str "bulavintsev.sergey@gmail.com" "The email of the user.";
    uid = mkOpt (types.nullOr types.int) 501 "The uid for the user account.";
  };

  config = {
    users.users.${cfg.name} = {
      # NOTE: Setting the uid here is required for another
      # module to evaluate successfully since it reads
      # `users.users.${custom.user.name}.uid`.
      # uid = mkIf (cfg.uid != null) cfg.uid;
      shell = pkgs.fish;
    };

    programs = {
      fish = {
        enable = true;
        shellAliases = {
          nixup = "darwin-rebuild switch --flake ~/dotfiles/nix";
          nixt = "darwin-rebuild check --flake ~/dotfiles/nix";
        };
      };
    };

    snowfallorg.users.${config.custom.user.name}.home.config = {
      home = {
        file = {
          ".profile".text = ''
            # The default file limit is far too low and throws an error when rebuilding the system.
            # See the original with: ulimit -Sa
            ulimit -n 4096
          '';
        };
      };
    };
  };
}
