# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];
  boot.enableContainers = false;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/088a07eb-fad5-42b6-804f-a795a8e83440";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4523-0C7F";
    fsType = "vfat";
  };

  fileSystems."/mnt/tank/torrents" = {
    device = "192.168.89.200:/mnt/tank/torrents";
    options = [
      "noauto"
      "x-systemd.automount"
      "x-systemd.requires=network.target"
      "x-systemd.mount-timeout=10"
      "x-systemd.idle-timeout=1min"
    ];
    fsType = "nfs";
  };

  fileSystems."/mnt/obsidian" = {
    device = "192.168.89.200:/mnt/tank/Apps/obsidian";
    options = [
      "noauto"
      "x-systemd.automount"
      "x-systemd.requires=network.target"
      "x-systemd.mount-timeout=10"
      "x-systemd.idle-timeout=1min"
    ];
    fsType = "nfs";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/73002676-c9b2-46e8-a987-5bf002c91cbc";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  networking.hosts = {
    # "192.168.89.200" = ["truenas.sbulav.ru"];
    "100.87.128.100" = ["vault-c7.pyn.ru"];
    "100.91.128.100" = ["vault-c11.pyn.ru"];
    "100.92.128.100" = ["vault-c12.pyn.ru"];
  };
  networking.interfaces.wlp3s0.ipv4.routes = [
    {
      address = "192.168.89.0";
      prefixLength = 24;
      via = "192.168.88.1";
    }
  ];
  # networking.interfaces.enp2s0f0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.bluetooth.enable = true;
}
