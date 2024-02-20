{
  lib,
  pkgs,
  ...
}:
with lib.custom; {
  custom = {
    suites = {
      common = enabled;
      develop = enabled;
    };

    desktop.yabai = enabled;
    desktop.addons.wezterm = enabled;
  };

  # suites.common.enable = true; # Enables the basics, like audio, networking, ssh, etc.
  environment.systemPath = [
    "/opt/homebrew/bin"
  ];

  system.stateVersion = 4;
}
