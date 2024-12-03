{
  pkgs,
  lib,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  hostName = "serverz";
in {
  imports = [
    ./hardware-configuration.nix
  ];

  # Enable Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.enableContainers = true;

  # Suites managed by nix, see suites by home-manager in homes
  suites.server.enable = true; # Enables the basics, like neovim, ssh, etc.
  suites.desktop.enable = false;
  suites.develop.enable = false;

  custom.security.sops = {
    enable = true;
    sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    defaultSopsFile = lib.snowfall.fs.get-file "secrets/serverz/default.yaml";
  };

  users.users.sab.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH2vxB14+ZGFFgtQ6UQ6zw33r/4e/vkMIzNKeaTnDRHmmfnjDSU5oXWt7OSCZQw8zPSbzPV7QPKC9MwEdsl9ZXr4kVxAvN/d/oI/cBU/77tMDW/m1d+SEqhztNrBfpSIavuCT+K9l1vMr/R4qoRxSfLRVsBhr3Xfk3bxZ2vh9dsefZXbL4/ebzW74RUoh1GccPqvBQJxP/+wYsyspn3lsmEi2AbIJprR6fN2Vb3pTW/D0E7k2iIcuBOd1hsw3mn5e2OpXOG2R0XcssBjlquS23up3sIujbw46gITIe1+kCLnmCfGXRDOmcUfB4ySwUlFma8RjcZg7vTGUe47PNJmo3 sab@fedoraz.sbulav.tk"
  ];

  custom.virtualisation = {
    virt-manager.enable = false;
    kvm.enable = false;
    podman.enable = false;
  };

  custom.containers = {
    traefik = {
      enable = true;
      cf_secret_file = "secrets/serverz/default.yaml";
      domain = "sbulav.ru";
    };
    homepage = {
      enable = true;
      host = "homepage.sbulav.ru";
      hostAddress = "172.16.64.10";
      localAddress = "172.16.64.101";
    };
    authelia = {
      enable = true;
      host = "authelia.sbulav.ru";
      hostAddress = "172.16.64.10";
      localAddress = "172.16.64.102";
    };
    adguard = {
      enable = true;
      host = "adguard.sbulav.ru";
      rewriteAddress = "192.168.89.206";
      hostAddress = "172.16.64.10";
      localAddress = "172.16.64.104";
    };
    flood = {
      enable = false;
      host = "flood.sbulav.ru";
      hostAddress = "172.16.64.10";
      localAddress = "172.16.64.105";
    };
    nextcloud = {
      enable = true;
      host = "nextcloud2.sbulav.ru";
      hostAddress = "172.16.64.10";
      localAddress = "172.16.64.106";
    };
    jellyfin = {
      enable = true;
      host = "jellyfin2.sbulav.ru";
      hostAddress = "172.16.64.10";
      localAddress = "172.16.64.107";
    };
  };

  environment.systemPackages = with pkgs; [
    alejandra
    nixd # LSP for nix
  ];
  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "24.05";
  # ======================== DO NOT CHANGE THIS ========================
}
