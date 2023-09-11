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

  programs.waybar = {
    enable = true;

    package = pkgs.waybar;

    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };

    style = builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css" + ''
      * {
        font-family: Hack Nerd Font Mono, FontAwesome, Roboto, Helvetica, Arial, sans-serif;
      }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "custom/weather" "hyprland/language" "backlight" "battery" "pulseaudio" "bluetooth" "tray" "clock" ];

        clock = {
          interval = 1;
          tooltip = true;
          format = "{:%Y-%m-%d\n %H:%M:%S}";
        };
        pulseaudio = {
          scroll-step = 1; # %, can be a float
          format = "🔊{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        backlight = {
          format = "{percent}%💡";
        };
        battery = {
          interval = 5;
          full-at = 85;
          format = "🔋{capacity}% {power}w";
        };
        bluetooth = {
          format = "  {status} ";
          format-disabled = "";
          format-connected = " {num_connections} connected";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        };
        tray = {
          icon-size = 24;
          spacing = 5;
        };
        "custom/weather" = {
          exec = "${pkgs.curl}/bin/curl -L \"wttr.in/Stockholm?format=%f+%p\"";
          format = "{}";
          interval = 3600;
          #signal = 1;
        };
        "hyprland/language" = {
          format = " KB: {} ";
          format-en = "EN";
          format-ru = "RU";
          format-dh = "DH";
          on-click = "${hyprctl} switchxkblayout at-translated-set-2-keyboard next";
        };
      };
    };
  };
}
