{pkgs, ...}: {
  imports = [./hardware-configuration.nix];

  # Enable Bootloader
  system.boot.efi.enable = true;
  system.battery.enable = true; # Only for laptops, they will still work without it, just improves battery life
  hardware.fingerprint.enable = true;
  hardware.bluetoothmy.enable = true;

  # environment.systemPackages = with pkgs; [
  #   # Any particular packages only for this host
  # ];

  suites.common.enable = true; # Enables the basics, like audio, networking, ssh, etc.
  suites.desktop.enable = true;

  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "23.11";
  # ======================== DO NOT CHANGE THIS ========================
}
