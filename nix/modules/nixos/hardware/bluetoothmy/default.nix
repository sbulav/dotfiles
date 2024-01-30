{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.hardware.bluetoothmy;
in {
  options.hardware.bluetoothmy = with types; {
    enable = mkBoolOpt false "Whether or not to enable bluetooth support.";
  };

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    environment.systemPackages = with pkgs; [blueberry];
  };
}
