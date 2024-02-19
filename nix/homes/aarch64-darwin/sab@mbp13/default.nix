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
      # zsh = enabled;
      # tmux = enabled;
      home-manager = enabled;
      atuin = enabled;
      neovim = enabled;
      yazi = enabled;
    };

    tools = {
      git = enabled;
      bat = enabled;
      # direnv = enabled;
    };
    desktop = {
      addons = {
        wezterm = enabled;
      };
    };
  };

  home.sessionPath = [
    "$HOME/bin"
  ];

  home.stateVersion = "23.11";
}
