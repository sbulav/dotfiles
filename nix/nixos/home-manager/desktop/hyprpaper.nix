let
  wallpaper = ./wallpapers/cityscape2.jpg;
in {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = eDP-1,${wallpaper}
    wallpaper = DP-1,${wallpaper}
    wallpaper = DP-2,${wallpaper}
  '';
}
