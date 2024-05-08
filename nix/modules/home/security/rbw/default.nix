{
  options,
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.security.rbw;
in {
  options.custom.security.rbw = with types; {
    enable = mkBoolOpt false "Whether or not to enable rbw.";
    lockTimeout = mkOpt int 28800 "The amount of time to wait before continuing with shell init.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rbw
    ];

    programs = {
      rbw = {
        enable = true;
        settings = {
          lock_timeout = cfg.lockTimeout;
          pinentry = pkgs.pinentry-gnome3;
          email = "zppfan@gmail.com";
        };
      };
    };
  };
}
