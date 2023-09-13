{ inputs
, pkgs
, ...
}:
let
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";
in
{
  home.packages = [
    pkgs.networkmanagerapplet # For nm-applet icons
  ];

  programs.wlogout.enable = true;

  programs.waybar = {
    enable = true;

    package = pkgs.waybar;

    systemd = {
      enable = false;
      target = "hyprland-session.target";
    };

    style = pkgs.substituteAll {
      src = ./waybar/waybar.css;
    };

    settings = {
        mainBar = {
          layer = "top";
          position = "top";
          margin = "10 10 0 10";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

          modules-center = [
          "clock"
          ];
          modules-right = [
            "hyprland/language"
            "cpu"
            "memory"
            "temperature"
            "pulseaudio"
            "network"
            "tray"
            "battery"
            "custom/power"
          ];

      "hyprland/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            all-outputs = true;
            format-icons = {
              "urgent" = " ";
              "active" = " ";
              "default" = " ";
            };
      };

      "hyprland/window" = {
        max-length = 25;
        separate-outputs = true;
      };
          "cpu" = {
            format = "󰌢 {load}";
            tooltip = false;
            on-click = "gnome-system-monitor"; 
          };
          "memory" = {
            format = " {}%";
          };
          "disk" = {
            interval = 600;
            format = " {percentage_used}%";
            path = "/";
          };
          "clock" = {
            format = "  {:%b %d %H:%M}";
            tooltip-format = "<b><big>{:%Y %B}</big></b>\n\n<tt>{calendar}</tt>";
            format-alt = "{:%Y-%m-%d}";
          };
          "temperature" = {
            thermal-zone = 0;
            critical-threshold = 80;
            format = "{icon} {temperatureC}°C";
            format-icons = [ ""  ""  ""  ""  "" ];
          };
          "custom/kernel" = {
            interval = "once";
            format = " {}";
            exec = "uname -r";
          };
          network = {
              format-wifi = "󰖩";
              format-ethernet = "{ifname}: {ipaddr}/{cidr} 󰈀";
              format-linked = "{ifname} (No IP) 󰈀";
              format-disconnected = "󰖪";
              format-alt = "{ifname}: {ipaddr}/{cidr}";
          };
          "pulseaudio" = {
            format = "{icon} {volume}% {format_source}";
            format-muted = " {format_source}";
            format-source = "";
            format-source-muted = "";
            format-icons = { "default" = [ "" "" "" ]; };
            scroll-step = 1;
            tooltip-format = "{desc}; {volume}%";
            # on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
            on-click = "${pkgs.pamixer}/bin/pamixer -t";
            on-click-right = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
            on-click-middle = "pavucontrol";
          };
          "hyprland/language" = {
            # "format-dh" = " dh";
            "format-en" = "  dh";
            "format-ru" = "  ru";
            "keyboard-name" = "at-translated-set-2-keyboard";
            on-click = "${hyprctl} switchxkblayout at-translated-set-2-keyboard next";

          };
            "battery" = {
              # on-click = "cpupower-gui";
              bat = "BAT0";
              states = {
                "good" = 95;
                "warning" = 30;
                "critical" = 15;
              };
              format = "{icon} {capacity}%";
              format-charging = " {capacity}%";
              format-plugged = " {capacity}%";
              format-alt = "{time} {icon}";
              format-icons = [ " " " " " " " " " " ];
            };
          "tray" = { spacing = 10; };
          "custom/power" = {
            format = "";
            on-click = "wlogout -p layer-shell";
          };
        };
      };
        # @import "${configHome}/colors.css";
  };
}
