{
  pkgs,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  hostName = "serverz";
in {
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.device = "nodev";
  # boot.loader.grub.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub = {
  #   # no need to set devices, disko will add all devices that have a EF02 partition to the list already
  #   devices = ["/dev/sda2"];
  #   efiSupport = true;
  #   efiInstallAsRemovable = true;
  # };

  # environment.systemPackages = with pkgs; [
  #   # Any particular packages only for this host
  # ];

  # Suites managed by nix, see suites by home-manager in homes
  suites.common.enable = true; # Enables the basics, like audio, networking, ssh, etc.
  suites.desktop.enable = false;
  suites.develop.enable = false;

  services = {
    openssh = {
      enable = true;

      # authorizedKeys = [
      #   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH2vxB14+ZGFFgtQ6UQ6zw33r/4e/vkMIzNKeaTnDRHmmfnjDSU5oXWt7OSCZQw8zPSbzPV7QPKC9MwEdsl9ZXr4kVxAvN/d/oI/cBU/77tMDW/m1d+SEqhztNrBfpSIavuCT+K9l1vMr/R4qoRxSfLRVsBhr3Xfk3bxZ2vh9dsefZXbL4/ebzW74RUoh1GccPqvBQJxP/+wYsyspn3lsmEi2AbIJprR6fN2Vb3pTW/D0E7k2iIcuBOd1hsw3mn5e2OpXOG2R0XcssBjlquS23up3sIujbw46gITIe1+kCLnmCfGXRDOmcUfB4ySwUlFma8RjcZg7vTGUe47PNJmo3 sab@fedoraz.sbulav.tk"
      # ];
    };
  };

  users.users.sab.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH2vxB14+ZGFFgtQ6UQ6zw33r/4e/vkMIzNKeaTnDRHmmfnjDSU5oXWt7OSCZQw8zPSbzPV7QPKC9MwEdsl9ZXr4kVxAvN/d/oI/cBU/77tMDW/m1d+SEqhztNrBfpSIavuCT+K9l1vMr/R4qoRxSfLRVsBhr3Xfk3bxZ2vh9dsefZXbL4/ebzW74RUoh1GccPqvBQJxP/+wYsyspn3lsmEi2AbIJprR6fN2Vb3pTW/D0E7k2iIcuBOd1hsw3mn5e2OpXOG2R0XcssBjlquS23up3sIujbw46gITIe1+kCLnmCfGXRDOmcUfB4ySwUlFma8RjcZg7vTGUe47PNJmo3 sab@fedoraz.sbulav.tk"
  ];
  custom.virtualisation = {
    virt-manager.enable = false;
    kvm.enable = false;
    podman.enable = false;
  };

  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "24.05";
  # ======================== DO NOT CHANGE THIS ========================
}
