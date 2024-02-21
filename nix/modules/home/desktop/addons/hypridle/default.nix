{
  inputs,
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.hypridle;
  inherit (inputs) hypridle;
in {
  imports = [hypridle.homeManagerModules.default];

  options.custom.desktop.addons.hypridle = with types; {
    enable = mkBoolOpt false "Whether to enable the hypridle";
  };

  config = mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      package = pkgs.hypridle;

      lockCmd = "${getExe config.programs.hypridle.package}";
      afterSleepCmd = "${getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on";

      listeners = [
        {
          timeout = 900;
          onTimeout = "${getExe config.programs.hypridle.package}";
        }
        {
          timeout = 1200;
          onTimeout = "${getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms off";
          onResume = "${getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on";
        }
      ];
    };
  };
}
