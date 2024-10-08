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

    virtualisation = {
      virt-manager = disabled;
    };

    desktop.aerospace = enabled;
  };

  # suites.common.enable = true; # Enables the basics, like audio, networking, ssh, etc.
  environment.systemPath = [
    "/opt/homebrew/bin"
  ];

  system.stateVersion = 4;
}
