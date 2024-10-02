{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.system.security;
in {
  options.custom.system.security = with types; {
    enable = mkEnableOption "MacOS security settings";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      security.pam.enableSudoTouchIdAuth = true;
    }
  ]);
}
