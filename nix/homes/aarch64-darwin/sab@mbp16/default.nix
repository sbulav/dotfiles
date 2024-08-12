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
      argocd = enabled;
      atuin = enabled;
      bottom = enabled;
      home-manager = enabled;
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

  home.stateVersion = "24.05";
}
