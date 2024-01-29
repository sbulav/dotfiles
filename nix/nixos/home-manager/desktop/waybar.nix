{pkgs, ...}: let
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";
  blueberry = "${pkgs.blueberry}/bin/blueberry";
in {
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
          "bluetooth"
          "network"
          "tray"
          "battery"
          "custom/power"
        ];

        bluetooth = {
          "format" = "󰂯";
          "format-disabled" = "󰂲";
          "format-connected" = "󰂱";
          "tooltip-format" = "{controller_alias}\t{controller_address}";
          "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t\t{device_address}";
          "on-click" = "blueberry";
        };

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
          format-icons = ["" "" "" "" ""];
        };
        "custom/kernel" = {
          interval = "once";
          format = " {}";
          exec = "uname -r";
        };
        network = {
          format-wifi = "󰖩 {signalStrength}%";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} 󰈀";
          format-linked = "{ifname} (No IP) 󰈀";
          format-disconnected = "󰖪";
          format-alt = "  󰜮 {bandwidthDownBytes} 󰜷 {bandwidthUpBytes}";
        };
        pulseaudio = {
          scroll-step = 5;
          tooltip = true;
          tooltip-format = "{volume}% {format_source}";
          on-click-right = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click = "${pkgs.pamixer}/bin/pamixer -t";
          format = "{icon} {volume}%";
          format-bluetooth = "󰂯 {icon} {volume}%";
          format-muted = "󰝟 0%";
          format-icons = {
            default = ["" "" " "];
          };
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
          format-icons = [" " " " " " " " " "];
        };
        "tray" = {spacing = 10;};
        "custom/power" = {
          format = "";
          on-click = "wlogout -p layer-shell";
        };
      };
    };
  };
}
