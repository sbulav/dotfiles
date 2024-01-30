{
  options,
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.system.xkb;
in {
  options.system.xkb = with types; {
    enable = mkBoolOpt false "Whether or not to configure xkb.";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
    services.xserver = {
      layout = "dh,ru";
      # xkbOptions = "grp:shift_caps_toggle,grp_led:caps,terminate:ctrl_alt_bksp";
      xkbOptions = "terminate:ctrl_alt_bksp";
    };
    extraLayouts.dh = {
      description = "Colemak-DH ergo";
      languages = ["eng"];
      symbolsFile = ./symbols/colemak_dh;
    };
  };
}
