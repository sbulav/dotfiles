{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib.custom; let
  wallpapers = inputs.wallpapers-nix.packages.${pkgs.system}.full;
in {
  custom = {
    user = {
      enable = true;
      name = config.snowfallorg.user.name;
    };

    desktop = {
      hyprland = enabled;
      addons = {
        hyprpaper = enabled;
        mako = enabled;
        rofi = enabled;
        kitty = disabled;
        swaylock = enabled;
        hypridle = enabled;
        waybar = enabled;
        wlogout = enabled;
        hyprlock = disabled;
        wezterm = enabled;
        wallpaper = "${wallpapers}/share/wallpapers/catppuccin/lake-purple.jpg";

        waypaper = {
          enable = true;
          wallpaperDirectory = "${wallpapers}/share/wallpapers";
        };
      };
    };

    apps = {
      obsidian = enabled;
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
      gh = enabled;
      git = enabled;
      direnv = disabled;
    };
    security = {
      rbw = enabled;
      vault = enabled;
      sops = {
        enable = true;
        defaultSopsFile = lib.snowfall.fs.get-file "secrets/nz/sab/default.yaml";
        sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
      };
    };
  };
  home.stateVersion = "23.11";
}
