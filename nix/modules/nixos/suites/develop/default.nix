{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.suites.develop;
in {
  options.suites.develop = with types; {
    enable = mkBoolOpt false "Enable the develop suite";
  };

  config = mkIf cfg.enable {
    custom.tools = {
      lsp.enable = true;
      linters.enable = true;
      k8s.enable = true;
    };
  };
}
