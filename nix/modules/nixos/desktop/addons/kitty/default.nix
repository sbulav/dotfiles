{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.kitty;
in {
  options.custom.desktop.addons.kitty = with types; {
    enable = mkBoolOpt false "Whether to enable the Kitty terminal";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [kitty];
  };
}
