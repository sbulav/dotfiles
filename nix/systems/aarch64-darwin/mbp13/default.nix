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

  environment.systemPath = [
    "/opt/homebrew/bin"
  ];

  system.stateVersion = 4;
}
