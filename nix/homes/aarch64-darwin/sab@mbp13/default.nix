{
  lib,
  pkgs,
  config,
  osConfig ? {},
  format ? "unknown",
  ...
}:
with lib.custom; {
  custom = {
    user = {
      enable = true;
      name = config.snowfallorg.user.name;
    };

    cli-apps = {
      home-manager = enabled;
      atuin = enabled;
      neovim = enabled;
      yazi = enabled;
    };

    tools = {
      git = enabled;
      gh = enabled;
      bat = enabled;
    };

    desktop = {
      addons = {
        wezterm = enabled;
      };
    };
    security = {
      vault = enabled;
    };
  };

  home.sessionPath = [
    "$HOME/bin"
  ];

  home.stateVersion = "23.11";
}
