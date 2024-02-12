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
  cfg = config.system.security.rbw;
in {
  options.system.security.rbw = with types; {
    enable = mkBoolOpt false "Whether or not to enable rbw.";
    lockTimeout = mkOpt int 28800 "The amount of time to wait before continuing with shell init.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      rbw
      pinentry-gnome
    ];

    home.programs = {
      rbw = {
        enable = true;
        settings = {
          lock_timeout = cfg.lockTimeout;
          pinentry = "gnome3";
          email = "zppfan@gmail.com";
        };
      };
    };
  };
}
