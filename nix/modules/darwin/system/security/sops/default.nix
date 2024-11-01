{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) mkBoolOpt mkOpt;

  cfg = config.${namespace}.system.security.sops;
in {
  options.${namespace}.system.security.sops = with lib.types; {
    enable = mkBoolOpt false "Whether to enable sops.";
    defaultSopsFile = mkOpt path null "Default sops file.";
    sshKeyPaths = mkOpt (listOf path) ["/etc/ssh/ssh_host_ed25519_key"] "SSH Key paths to use.";
  };

  config = lib.mkIf cfg.enable {
    sops = {
      inherit (cfg) defaultSopsFile;

      age = {
        inherit (cfg) sshKeyPaths;

        keyFile = "${config.users.users.${config.${namespace}.user.name}.home}/.config/sops/age/keys.txt";
      };
    };

    sops.secrets = {
      "mbp16_sab_ssh_key" = {
        sopsFile = lib.snowfall.fs.get-file "secrets/mbp16/default.yaml";
      };
    };
  };
}
