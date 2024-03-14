{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.suites.develop;
in {
  options.custom.suites.develop = with types; {
    enable =
      mkBoolOpt false
      "Whether or not to enable common development configuration.";
  };

  config = mkIf cfg.enable {

    custom.tools = {
      lsp.enable = true;
      linters.enable = true;
      k8s.enable = true;
    };
  };
}
