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
      };
    };

    cli-apps = {
      atuin = enabled;
      yazi = enabled;
      home-manager = enabled;
    };
    tools = {
      gh = enabled;
      git = enabled;
      direnv = disabled;
    };
    security.rbw.enable = true;
  };
}
