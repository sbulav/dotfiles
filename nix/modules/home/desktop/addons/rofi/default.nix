{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.rofi;
in {
  options.custom.desktop.addons.rofi = with types; {
    enable =
      mkBoolOpt false "Whether to enable Rofi in the desktop environment.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rofi-rbw
      wtype
    ];
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      # plugins = with pkgs; [
      #   rofi-calc
      # ];
      extraConfig = {
        combi-hide-mode-prefix = true;
        combi-modi = "drun,run";
        disable-history = false;
        display-Network = " 󰤨  Network";
        display-drun = "   Apps ";
        display-run = "   Run ";
        display-window = " 﩯  Window";
        display-vpn = " VPN ";
        drun-display-format = "{icon} {name}";
        icon-theme = "Fluent";
        location = 0;
        modi = "run,drun,vpn:~/.config/rofi/rofi-vpn.sh,clip:~/.config/rofi/rofi-cliphist.sh,";
        show-icons = true;
        sidebar-mode = true;
        sorting-method = "fzf";
        sort = true;
        terminal = "kitty";
        font = "FiraCode Nerd Font Regular 12";
        kb-accept-custom = "Control+Return";
        kb-cancel = "Escape,Control+g,Control+bracketleft,Control+space";
        kb-row-select = "Control+Super+space";
        matching = "fuzzy";
      };
      # theme = ./rofi/catppuccin-frappe.rasi;
    };
    home.file.".config/rofi/rofi-vpn.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env sh

          multiple=false
          active_marker='[*] '

          error() {
              echo "''${@}" >&2
              exit 1
          }

          maybe_remove_active_marker() {
              length=''$(printf '%s' "''${active_marker}" | wc -c)
              if [ "''$(echo "''${1}" | cut -c "-''${length}")" = "''${active_marker}" ]; then
                  echo "''${1}" | cut -c ''$((length + 1))-
                  return 0
              fi
              echo "''${1}"
              return 1
          }

          disconnect_all() {
            active_connections=$(
                nmcli --get-values name,type connection show --active \
                | awk -F ':' '
                $2 != "vpn" && $2 != "wireguard" { next }
                { print $1 }
                '
                )
              if [ -z "''${active_connections}" ]; then
                return
                  fi
                  echo "''${active_connections}" | xargs -d '\n' nmcli connection down \
                  > /dev/null
          }

          connection_list() {
              nmcli --get-values name,type,active,state connection show \
              | awk -F ':' '
                  ''$2 != "vpn" && ''$2 != "wireguard" { next }
                  ''$3 == "yes" { ''$1 = "\a" ''$1 }
                  { print ''$1 }
              ' \
              | LC_COLLATE=C sort \
              | sed -n "s/^\a/''${active_marker}/;p"
          }

          toggle_connection() {
              if connection=''$(maybe_remove_active_marker "''${1}"); then
                  action='down'
              else
                  action='up'
              fi
              if [ ''${multiple} != true ]; then
                  disconnect_all
                  if [ ''${action} = 'down' ]; then
                      return
                  fi
              fi
              nmcli connection "''${action}" "''${connection}" > /dev/null &
          }

          run_rofi_mode() {
              if [ ''${#} -eq 0 ]; then
                  connection_list
              else
                  toggle_connection "''${1}"
              fi
          }

          "run_rofi_mode" "''${@}"
      '';
    };
    home.file.".config/rofi/rofi-cliphist.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        tmp_dir="/tmp/cliphist"
        rm -rf "$tmp_dir"

        if [[ -n "$1" ]]; then
            cliphist decode <<<"$1" | wl-copy
            exit
        fi

        mkdir -p "$tmp_dir"

        read -r -d "" prog <<EOF
        /^[0-9]+\s<meta http-equiv=/ { next }
        match(\$0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp)/, grp) {
            system("echo " grp[1] "\\\\\t | cliphist decode >$tmp_dir/"grp[1]"."grp[3])
            print \$0"\0icon\x1f$tmp_dir/"grp[1]"."grp[3]
            next
        }
        1
        EOF
        cliphist list | gawk "$prog"
      '';
    };
  };
}
