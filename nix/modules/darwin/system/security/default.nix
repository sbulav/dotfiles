{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.system.security;
in {
  options.custom.system.security = with types; {
    enable = mkEnableOption "MacOS security settings";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      security.pam.enableSudoTouchIdAuth = true;
      # skip sudo authn for frequently used commands
      environment.etc."sudoers.d/10-nix-commands".text = with pkgs; ''
        ${config.${namespace}.user.name} ALL=(ALL:ALL) NOPASSWD: \
          /run/current-system/sw/bin/darwin-rebuild, \
          /run/current-system/sw/bin/nix-build, \
          /run/current-system/sw/bin/nix-channel, \
          /run/current-system/sw/bin/nix-collect-garbage, \
          ${pkgs.coreutils}/bin/env nix-env -p /nix/var/nix/profiles/system --set /nix/store/*, \
          ${pkgs.coreutils}/bin/env /nix/store/*/activate, \
          /etc/profiles/per-user/${config.${namespace}.user.name}/bin/openconnect, \
          /sbin/route, \
          /usr/bin/dscacheutil, \
          /usr/bin/killall, \
          /usr/bin/pkill, \
          /usr/bin/renice
      '';
    }
  ]);
}
