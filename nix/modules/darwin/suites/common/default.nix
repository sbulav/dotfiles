{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.suites.common;
in {
  options.custom.suites.common = with types; {
    enable = mkBoolOpt false "Whether or not to enable common configuration.";
  };

  config = mkIf cfg.enable {
    programs.fish = enabled;

    custom = {
      nix = enabled;

      # apps = {
      #   iterm2 = enabled;
      # };

      # cli-apps = {
      #   neovim = enabled;
      # };

      # tools = {
      #   git = enabled;
      #   flake = enabled;
      # };

      system = {
        fonts = enabled;
        input = enabled;
        interface = enabled;
      };

      # security = {
      #   gpg = enabled;
      # };
    };
  };
}
