{
  pkgs,
  inputs,
  ...
}: let
  wallpapers = inputs.wallpapers-nix.packages.${pkgs.system}.catppuccin;
in {
  imports = [./hardware-configuration.nix];
  system.wallpaper = "${wallpapers}/share/wallpapers/catppuccin/bench.png";
  # Enable Bootloader
  system.boot.efi.enable = true;
  system.battery.enable = true; # Only for laptops, they will still work without it, just improves battery life
  hardware.fingerprint.enable = true;
  hardware.bluetoothmy.enable = true;

  # environment.systemPackages = with pkgs; [
  #   # Any particular packages only for this host
  # ];

  # Suites managed by nix, see suites by home-manager in homes
  suites.common.enable = true; # Enables the basics, like audio, networking, ssh, etc.
  suites.desktop.enable = true;
  suites.develop.enable = true;

  custom.virtualisation = {
    virt-manager.enable = true;
    kvm.enable = false;
    podman.enable = true;
  };

  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "23.11";
  # ======================== DO NOT CHANGE THIS ========================
}
