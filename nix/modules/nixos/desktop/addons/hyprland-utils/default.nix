{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.hyprland-utils;
in {
  options.custom.desktop.addons.hyprland-utils = with types; {
    enable = mkBoolOpt false "Whether or not to add support for hyprland.";
  };

  config = mkIf cfg.enable {
    # Required as deps
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      # hyprland
      # hyprland-protocols
      hyprpaper
      hyprpicker

      wlroots
      cliphist
      wl-clipboard

      grim
      slurp
      networkmanagerapplet

      adwaita-qt
      adwaita-qt6
      gnome.adwaita-icon-theme
      gnome.gnome-tweaks
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
    services.xserver = {
      enable = true;
    };
    services = {
      # Enable touchpad support (enabled default in most desktopManager).
      libinput.enable = true;
      displayManager = {
        defaultSession = "hyprland";
      };
    };
  };
}
