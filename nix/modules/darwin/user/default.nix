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
in {
  options.custom.user = {
    name = mkOpt str "sab" "The name to use for the user account.";
    fullName = mkOpt str "Sergei Bulavintsev" "The full name of the user.";
    email = mkOpt str "bulavintsev.sergey@gmail.com" "The email of the user.";
  };

  config = {
    users.users.${cfg.name} = {
      # NOTE: Setting the uid here is required for another
      # module to evaluate successfully since it reads
      # `users.users.${custom.user.name}.uid`.
      # uid = mkIf (cfg.uid != null) cfg.uid;
      shell = pkgs.fish;
    };

    snowfallorg.user.${config.custom.user.name}.home.config = {
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
