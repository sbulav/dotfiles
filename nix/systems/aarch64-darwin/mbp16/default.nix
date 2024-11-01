{lib, ...}:
with lib.custom; {
  custom = {
    suites = {
      common = enabled;
      develop = enabled;
    };

    virtualisation = {
      virt-manager = disabled;
    };

    system.security = {
      sops = {
        enable = false; #TODO: enable when fix is available https://github.com/Mic92/sops-nix/pull/614
        sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
        defaultSopsFile = lib.snowfall.fs.get-file "secrets/mbp16/default.yaml";
      };
    };

    desktop.aerospace = enabled;
  };

  # suites.common.enable = true; # Enables the basics, like audio, networking, ssh, etc.
  environment.systemPath = [
    "/opt/homebrew/bin"
  ];

  system.stateVersion = 4;
}
