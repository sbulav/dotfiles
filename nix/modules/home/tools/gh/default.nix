{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.tools.gh;
in {
  options.custom.tools.gh = with types; {
    enable = mkBoolOpt false "Whether or not to install and configure gh.";
  };

  config = mkIf cfg.enable {
    programs.gh = {
      enable = true;
    };
  };
}
