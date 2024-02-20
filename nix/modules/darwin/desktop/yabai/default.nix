{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.desktop.yabai;

  inherit (lib) types mkEnableOption mkIf;
  inherit (lib.custom) mkOpt enabled;
in {
  options.custom.desktop.yabai = {
    enable = mkEnableOption "Yabai";
    enable-scripting-addition = mkOpt types.bool true "Whether to enable the scripting addition for Yabai. (Requires SIP to be disabled)";
  };

  config = mkIf cfg.enable {
    custom.desktop.addons = {
      skhd = enabled;
    };
    launchd.user.agents.yabai.serviceConfig = {
      StandardOutPath = "/tmp/yabai.log";
      StandardErrorPath = "/tmp/yabai.log";
    };

    services.yabai = {
      enable = true;
      enableScriptingAddition = true;
      config = {
        # Binary space partitioning layout
        layout = "bsp";
        # When focusing a window, put the mouse at its center
        mouse_follows_focus = "on";
        # Automatically focus the window under the mouse
        focus_follows_mouse = "autoraise";
        # New window spawns to the right if vertical split, or bottom if
        # horizontal split
        window_placement = "second_child";
        # Disable opacity for windows
        window_opacity = "off";
        # Padding added around the sides of a space
        top_padding = 6;
        bottom_padding = 6;
        left_padding = 6;
        right_padding = 6;
        # Size of the gap that separates windows
        window_gap = 6;
        # Draw shadow for windows, window_border has been removed
        window_shadow = "on";
        # Add padding for external status bar
        external_bar = "all:0:26";
      };

      extraConfig = ''
        for _ in $(yabai -m query --spaces | jq '.[].index | select(. > 6)'); do
            yabai -m space --destroy 7
        done

        function setup_space {
          local idx="$1"
          local name="$2"
          local space=
          echo "setup space $idx : $name"

          space=$(yabai -m query --spaces --space "$idx")
          if [ -z "$space" ]; then
            yabai -m space --create
          fi
          yabai -m space "$idx" --label "$name"
        }

        setup_space 1 main
        setup_space 2 web
        setup_space 3 code
        setup_space 4 social
        setup_space 5 media
        setup_space 6 other

        yabai -m rule --add app="^Safari$" space=2
        yabai -m rule --add app="^Firefox$" space=2
        yabai -m rule --add app="^Kitty$" space=3
        yabai -m rule --add app="^kitty$" space=3
        yabai -m rule --add app="^wezterm$" space=3
        yabai -m rule --add app="^wezterm-gui$" space=3
        yabai -m rule --add app="^WezTerm$" space=3
        yabai -m rule --add app="^Telegram$" space=1
        yabai -m rule --add app="^Slack$" space=1
        yabai -m rule --add app="^Teams$" space=1
        yabai -m rule --add app="^Mail$" space=4
        yabai -m rule --add app="^Calendar$" space=4
        yabai -m rule --add app="^Music$" space=5

        # Float system settings
        yabai -m rule --add app="^(Terminal|Calculator|Software Update|Dictionary|VLC|System Preferences|System Settings|zoom.us|Photo Booth|Archive Utility)$" manage=off
        yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
        yabai -m rule --add app="^System Information$" label="^About This Mac$" manage=off
        yabai -m rule --add app="^Cisco AnyConnect Secure Mobility Client$" manage=off
        yabai -m rule --add app="^Cisco$" manage=off

        # Load scripting addition
        yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
        sudo yabai --load-sa
      '';
    };
  };
}
