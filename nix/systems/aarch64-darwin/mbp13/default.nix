{
  lib,
  pkgs,
  ...
}:
with lib.custom; {
  custom = {
    suites = {
      common = enabled;
      development = enabled;
    };

    desktop.yabai = enabled;
  };

  # suites.common.enable = true; # Enables the basics, like audio, networking, ssh, etc.
  environment.systemPath = [
    "/opt/homebrew/bin"
  ];

  system.stateVersion = 4;
}
