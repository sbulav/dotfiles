{
  namespace,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.security.openconnect;
  vpnScript = pkgs.writeScriptBin "myvpn" ''
    #! ${pkgs.bash}/bin/sh

    function openconnecthelp ()
    {
      echo "******************************************************"
      echo "VPN access via openconnect"
      echo "******************************************************"
      echo
      echo "Usage: myvpn <up|down|status>"
    }

    if [ "$#" != "1" ]
    then
      openconnecthelp
      exit 0
    fi

    # Parse command
    case "$1" in
      up)
      ;;
      down)
      ;;
      status)
      ;;
      *)
        echo "ERROR: Invalid command <$1>"
        RESULT=2
      ;;
    esac
        # Parse command
        case "$1" in
          up)
            echo $OPENCONNECT_PW | \
              sudo ${pkgs.openconnect}/bin/openconnect --no-dtls --background \
              --passwd-on-stdin -u $OPENCONNECT_USER $OPENCONNECT_SERVER
            if [[ $? -ne 0 ]]; then
            echo "******************************************************"
              echo "ERROR: Cannot start VPN connection."
            else
              sleep 1
              echo "******************************************************"
              echo "My DNSs are:"
              grep "nameserver" /etc/resolv.conf
              echo "******************************************************"
              echo "VPN is up and running!"
              echo "******************************************************"
              echo "Removing LAN routes to VPN"
              sudo route del -net 192.168.0.0/16
            fi
          ;;
          down)
            echo "******************************************************"
            echo "Stopping the VPN and removing all routes"
            sudo kill -2 `pgrep openconnect`
            echo "VPN stopped!"
          ;;
          status)
            echo "*******************STATUS*****************************"
            echo "Connected as $OPENCONNECT_USER to $OPENCONNECT_SERVER"
            echo "******************************************************"
            echo "Pid of openconnect are:"
            pgrep -l openconnect
            echo "******************************************************"
            echo "My DNSs are:"
            grep "nameserver" /etc/resolv.conf
          ;;
        esac

  '';
in {
  options.custom.security.openconnect = with types; {
    enable = mkBoolOpt false "Whether or not to install openconnect and add script.";
  };

  config = mkIf cfg.enable {
    # sops.secrets = lib.mkIf config.${namespace}.security.sops.enable {
    #   openconnect_pw = {
    #     sopsFile = lib.snowfall.fs.get-file "secrets/${config.${namespace}.user.name}/default.yaml";
    #   };
    # };
    home.packages = with pkgs; [
      openconnect
      vpnScript
    ];
  };
}
