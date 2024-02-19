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

      cli-apps = {
        tmux = enabled;
        # neovim = enabled;
        # yazi = enabled;
      };

      # tools = {
      #   git = enabled;
      #   flake = enabled;
      # };

      tools = {
        # git.enable = true;
        # gh.enable = true;
        http.enable = true;
        misc.enable = true;
        k8s.enable = true;
        net.enable = true;
      };
      system = {
        fonts = enabled;
        input = enabled;
        interface = enabled;
      };

      # cli-apps = {
      #   yazi.enable = lib.mkDefault true;
      # };

      # security = {
      #   gpg = enabled;
      # };
    };
  };
}
