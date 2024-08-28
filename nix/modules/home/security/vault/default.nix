{
  options,
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.security.vault;
in {
  options.custom.security.vault = with types; {
    enable = mkBoolOpt false "Whether or not to enable Hashicorp Vault.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      vault
    ];
  };
}
