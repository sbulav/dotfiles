{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.skhd;
in {
  options.custom.desktop.addons.skhd = {
    enable = mkEnableOption "skhd";
  };

  config = mkIf cfg.enable {
    launchd.user.agents.skhd.serviceConfig = {
      StandardOutPath = "/tmp/skhd.log";
      StandardErrorPath = "/tmp/skhd.log";
    };
    services.skhd = {
      enable = true;
      skhdConfig = ''
        # Default mode
        :: default

        # Workspace focus
        alt - 1 : yabai -m space --focus 1
        alt - 2 : yabai -m space --focus 2
        alt - 3 : yabai -m space --focus 3
        alt - 4 : yabai -m space --focus 4
        alt - 5 : yabai -m space --focus 5
        alt - 6 : yabai -m space --focus 6
        alt - 7 : yabai -m space --focus 7
        alt - 8 : yabai -m space --focus 8
        alt - 9 : yabai -m space --focus 9
        alt - 0 : yabai -m space --focus 10

        alt - up : yabai -m space --focus 2
        alt - down : yabai -m space --focus (yabai -m query --spaces --display | jq 'map(select(."is-native-fullscreen" == true))[-1].index')

        # change focus between external displays (left and right)
        ctrl + alt - left : yabai -m display --focus west
        ctrl + alt - right : yabai -m display --focus east

        # Move windows to another workspace
        ctrl + shift - 1 : yabai -m window --space 1
        ctrl + shift - 2 : yabai -m window --space 2
        ctrl + shift - 3 : yabai -m window --space 3
        ctrl + shift - 4 : yabai -m window --space 4
        ctrl + shift - 5 : yabai -m window --space 5
        ctrl + shift - 6 : yabai -m window --space 6
        ctrl + shift - 7 : yabai -m window --space 7
        ctrl + shift - 8 : yabai -m window --space 8
        ctrl + shift - 9 : yabai -m window --space 9
        ctrl + shift - 0 : yabai -m window --space 10

        # Navigation
        alt - h : yabai -m window --focus west
        alt - j : yabai -m window --focus south
        alt - k : yabai -m window --focus north
        alt - l : yabai -m window --focus east
        alt - left : yabai -m window --focus west
        alt - down : yabai -m window --focus south
        alt - up : yabai -m window --focus north
        alt - right : yabai -m window --focus east

        # Close current window
        alt - q : yabai -m window --close

        # Moving windows
        shift + alt - h : yabai -m window --warp west
        shift + alt - j : yabai -m window --warp south
        shift + alt - k : yabai -m window --warp north
        shift + alt - l : yabai -m window --warp east

        # Move floating window
        shift + alt - h : yabai -m window --move rel:-20:0
        shift + alt - j : yabai -m window --move rel:0:20
        shift + alt - k : yabai -m window --move rel:0:-20
        shift + alt - l : yabai -m window --move rel:20:0

        # Float/unfloat windows
        shift + alt - space : yabai -m window --toggle float; \
        yabai -m window --grid 4:4:1:1:2:2

        # Fullscreen
        alt - f : yabai -m window --toggle zoom-fullscreen
        ctrl + shift - f : yabai -m window --toggle native-fullscreen

        # Resize mode
        :: resize @

        ## Enter resize mode
        alt - r ; resize

        ## Leave resize mode
        resize < escape ; default

        ## Resize mode key bindings
        resize < h : \
            yabai -m window --resize left:-20:0 ; \
            yabai -m window --resize right:-20:0
        resize < j : \
            yabai -m window --resize bottom:0:20 ; \
            yabai -m window --resize top:0:20
        resize < k : \
            yabai -m window --resize top:0:-20 ; \
            yabai -m window --resize bottom:0:-20
        resize < l : \
            yabai -m window --resize right:20:0 ; \
            yabai -m window --resize left:20:0

        # Resize windows
        ctrl + alt - h : \
            yabai -m window --resize left:-20:0 ; \
            yabai -m window --resize right:-20:0

        ctrl + alt - j : \
            yabai -m window --resize bottom:0:20 ; \
            yabai -m window --resize top:0:20

        ctrl + alt - k : \
            yabai -m window --resize top:0:-20 ; \
            yabai -m window --resize bottom:0:-20

        ctrl + alt - l : \
            yabai -m window --resize right:20:0 ; \
            yabai -m window --resize left:20:0

        # Toggle window split type with semicolon
        ctrl + alt - e : yabai -m window --toggle split

        # Balance size of windows
        ctrl + alt - 0 : yabai -m space --balance

        # Workspace init
        ctrl + shift - n : yabai -m space --create
        ctrl + shift - d : yabai -m space --destroy

        # Applications
        alt - x : /Applications/Nix\ Apps/WezTerm.app/wezterm
        ctrl + alt - b: /Applications/Firefox.App/Contents/MacOS/firefox

        # -- Starting/Stopping/Restarting Yabai --

        # stop/start/restart yabai + skhd
        ctrl + alt - q : launchctl stop org.nixos.yabai; launchctl stop org.nixos.skhd
        ctrl + alt - s : launchctl start org.nixos.yabai; launchctl start org.nixos.skhd
        ctrl + alt - r : launchctl stop org.nixos.yabai; launchctl stop org.nixos.skhd; launchctl start org.nixos.yabai; launchctl start org.nixos.skhd
      '';
    };
  };
}
