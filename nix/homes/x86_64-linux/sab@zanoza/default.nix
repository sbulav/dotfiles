{
  lib,
  config,
  inputs,
  pkgs,
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
      fastfetch = enabled;
      home-manager = enabled;
      yazi = enabled;
    };
    tools = {
      gh = disabled;
      git = enabled;
      direnv = disabled;
    };
    security = {
      rbw = disabled;
      vault = disabled;
      sops = {
        enable = true;
        defaultSopsFile = lib.snowfall.fs.get-file "secrets/sab/default.yaml";
        sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
      };
    };
  };
  home.stateVersion = "24.11";
}
