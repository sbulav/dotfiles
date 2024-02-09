{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.system.input;
in {
  options.custom.system.input = with types; {
    enable = mkEnableOption "macOS input";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      system = {
        # keyboard = {
        #   enableKeyMapping = true;
        #   remapCapsLockToEscape = true;
        # };

        # defaults = {
        #   ".GlobalPreferences" = {
        #     "com.apple.mouse.scaling" = "1";
        #   };

        # NSGlobalDomain = {
        #   AppleKeyboardUIMode = 3;
        #   ApplePressAndHoldEnabled = false;

        #   KeyRepeat = 2;
        #   InitialKeyRepeat = 15;

        #   NSAutomaticCapitalizationEnabled = false;
        #   NSAutomaticDashSubstitutionEnabled = false;
        #   NSAutomaticQuoteSubstitutionEnabled = false;
        #   NSAutomaticPeriodSubstitutionEnabled = false;
        #   NSAutomaticSpellingCorrectionEnabled = false;
        # };
        # };
      };
    }
  ]);
}
