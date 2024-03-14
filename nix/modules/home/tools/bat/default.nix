{
  config,
  lib,
  options,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.tools.bat;
in {
  options.custom.tools.bat = {
    enable = mkBoolOpt true "Whether or not to enable bat.";
  };

  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;

      config = {
        style = "auto,header-filesize";
      };

      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batpipe
        batwatch
        prettybat
      ];
    };

    home.shellAliases = {
      cat = "bat";
    };
  };
}
