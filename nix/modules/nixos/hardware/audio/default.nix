{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.hardware.audio;
in {
  options.hardware.audio = with types; {
    enable = mkBoolOpt false "Enable pipewire";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      alsa.enable = true;
      alsa.support32Bit = true;
      enable = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    programs.noisetorch.enable = true;

    environment.systemPackages = with pkgs; [
      pamixer
      pavucontrol
    ];
  };
}
