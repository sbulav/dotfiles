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

      cli-apps = {
        tmux = enabled;
      };

      tools = {
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

    };
  };
}
