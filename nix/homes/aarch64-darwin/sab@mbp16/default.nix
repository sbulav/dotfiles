{
  lib,
  config,
  ...
}:
with lib.custom; {
  custom = {
    user = {
      enable = true;
      name = config.snowfallorg.user.name;
    };
    apps = {
      obsidian = enabled;
      zoom-us = enabled;
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
      sops = {
        enable = true;
        defaultSopsFile = lib.snowfall.fs.get-file "secrets/sab/default.yaml";
        sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
      };
    };
  };

  sops.secrets = {
    env_credentials = {
      sopsFile = lib.snowfall.fs.get-file "secrets/sab/default.yaml";
      path = "${config.home.homeDirectory}/.ssh/sops-env-credentials";
    };
  };
  home.sessionPath = [
    "$HOME/bin"
  ];

  home.stateVersion = "24.05";
}
