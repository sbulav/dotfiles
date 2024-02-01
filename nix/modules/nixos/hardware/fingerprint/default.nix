{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.hardware.fingerprint;
in {
  options.hardware.fingerprint = with types; {
    enable = mkBoolOpt false "Whether or not to enable fingerprint support.";
  };

  config = mkIf cfg.enable {
    services.fprintd.enable = true;

    security.pam.services.swaylock.text = ''
      # Account management.
      account required pam_unix.so

      # Authentication management.

      # prompt for a password; pressing Enter on a blank field will proceed to fingerprint authentication.
      auth sufficient pam_unix.so nullok likeauth try_first_pass
      auth sufficient ${pkgs.fprintd}/lib/security/pam_fprintd.so
      auth required pam_deny.so

      # Password management.
      password sufficient pam_unix.so nullok sha512

      # Session management.
      session required pam_env.so conffile=/etc/pam/environment readenv=0
      session required pam_unix.so
    '';
  };
}
