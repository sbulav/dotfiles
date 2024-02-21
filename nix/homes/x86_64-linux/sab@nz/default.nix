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
      addons = {
        rofi = enabled;
        swaylock = enabled;
        swayidle = enabled;
        waybar = enabled;
        wlogout = enabled;
        hyprlock = disabled;
        wezterm = enabled;
      };
    };

    cli-apps = {
      home-manager = enabled;
    };
  };
}
