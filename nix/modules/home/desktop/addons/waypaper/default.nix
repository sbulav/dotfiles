{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkIf
    mkOption
    types
    ;

  cfg = config.custom.desktop.addons.waypaper;
in {
  options.custom.desktop.addons.waypaper = {
    enable = mkEnableOption "Waypaper app to change wallpapers";
    wallpaperDirectory = mkOption {
      type = with types; either path str;
      default = config.xdg.userDirs.pictures;
      apply = toString; # Prevent copies to Nix store.
      description = ''
        The directory where waypaper reads wallpapers from.

        If [](#opt-xdg.userDirs.enable) is
        `true` then the defined XDG pictures directory is used.
        Otherwise, you must explicitly specify a value.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      custom.waypaper
    ];
    xdg.configFile."waypaper/config.ini".text = ''
      [Settings]
      language = en
      folder = ${cfg.wallpaperDirectory}
      backend = hyprpaper
      monitors = All
      fill = Fill
      sort = name
      color = #ffffff
      subfolders = True
      number_of_columns = 3
      post_command =
      wallpaper = ${cfg.wallpaperDirectory}/catpuccin/lantern.png
      swww_transition_type = any
      swww_transition_step = 90
      swww_transition_angle = 0
      swww_transition_duration = 1
    '';
  };
}
