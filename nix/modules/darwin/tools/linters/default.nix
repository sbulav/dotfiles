{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.tools.linters;
in {
  options.custom.tools.linters = with types; {
    enable = mkBoolOpt false "Whether or not to enable linters utilities.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      alejandra
      ctags
      stylua
    ];
  };
}
