{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.waybar;
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";
  blueberry = "${pkgs.blueberry}/bin/blueberry";
in {
  options.custom.desktop.addons.waybar = with types; {
    enable =
      mkBoolOpt false "Whether to enable Waybar in the desktop environment.";
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;

      systemd = {
        enable = false;
        target = "hyprland-session.target";
      };

      style = pkgs.substituteAll {
        src = ./style.css;
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
            format = "{icon} {windows}";
            on-click = "activate";
            all-outputs = false;
            active-only = "false";
            format-icons = {
              "1" = "󰎤";
              "2" = "󰎧";
              "3" = "󰎪";
              "4" = "󰎭";
              "5" = "󰎱";
              "6" = "󰎳";
              "7" = "󰎶";
              "8" = "󰎹";
              "9" = "󰎼";
              "10" = "󰽽";
              "urgent" = "󱨇";
              "default" = "";
              "empty" = "󱓼";
            };
            window-rewrite-default = "";
            window-rewrite = {
              "class<1Password>" = "󰢁";
              "class<Caprine>" = "󰈎";
              "class<Github Desktop>" = "󰊤";
              "class<Godot>" = "";
              "class<Mysql-workbench-bin>" = "";
              "class<Slack>" = "󰒱";
              "class<zoom>" = "󱋒";
              "class<Zoom Meeting>" = "󱋒";
              "class<code>" = "󰨞";
              "code-url-handler" = "󰨞";
              "class<discord>" = "󰙯";
              "class<firefox>" = "";
              "class<firefox> title<.*github.*>" = "";
              "class<firefox> title<.*twitch|youtube|plex|tntdrama|bally sports.*>" = "";
              "class<kitty>" = "";
              "class<org.wezfurlong.wezterm>" = "";
              "class<mediainfo-gui>" = "󱂷";
              "class<org.kde.digikam>" = "󰄄";
              "class<org.telegram.desktop>" = "";
              "class<.pitivi-wrapped>" = "󱄢";
              "class<steam>" = "";
              "class<thunderbird>" = "";
              "class<virt-manager>" = "󰢹";
              "class<vlc>" = "󰕼";
              "class<thunar>" = "󰉋";
              "class<org.gnome.Nautilus>" = "󰉋";
              "class<Spotify>" = "";
              "title<Spotify Free>" = "";
              "class<libreoffice-draw>" = "󰽉";
              "class<libreoffice-writer>" = "";
              "class<libreoffice-calc>" = "󱎏";
              "class<libreoffice-impress>" = "󱎐";
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
  };
}
