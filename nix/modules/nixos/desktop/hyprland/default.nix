{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.hyprland;
in {
  options.custom.desktop.hyprland = with types; {
    enable = mkBoolOpt false "Whether or not to install Hyprland and dependencies.";
  };

  config = mkIf cfg.enable {
    custom.desktop.addons = {
      # electron-support = enabled;
      # hyprpicker = enabled;
      # keyring = enabled;
      # nautilus = enabled;
      # thunar = enabled;
      gtk = enabled;
      hyprpaper = enabled;
      kitty = enabled;
      mako = enabled;
      regreet = enabled;
      rofi = enabled;
      swaylock = enabled;
      waybar = enabled;
      wlogout = enabled;
      xdg-portal = enabled;
    };

    home.configFile."hypr/hyprland.conf".source = ./hyprland.conf;

    environment.systemPackages = with pkgs; [
      hyprland
      hyprland-protocols
      hyprpaper
      hyprpicker

      wlroots
      cliphist
      wl-clipboard

      grim
      slurp
      networkmanagerapplet
    ];

    environment.sessionVariables = {
      POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
      XDG_SESSION_TYPE = "wayland";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SCREENSHOTS_DIR = "~/Pictures/Screenshots";
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    services.xserver = {
      enable = true;

      displayManager = {
        defaultSession = "hyprland";

        # gdm = {
        #   enable = true;
        #   wayland = true;
        # };
      };

      # Enable touchpad support (enabled default in most desktopManager).
      libinput.enable = true;
    };
  };
}
