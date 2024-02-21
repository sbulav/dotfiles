{
  options,
  config,
  lib,
  inputs,
  ...
}:
with lib;
with lib.custom; {
  imports = with inputs; [
    home-manager.nixosModules.home-manager
  ];

  options.home = with types; {
    file =
      mkOpt attrs {}
      "A set of files to be managed by home-manager's <option>home.file</option>.";
    configFile =
      mkOpt attrs {}
      "A set of files to be managed by home-manager's <option>xdg.configFile</option>.";
    programs = mkOpt attrs {} "Programs to be managed by home-manager.";
    services = mkOpt attrs {} "Services to be managed by home-manager.";
    wayland = mkOpt attrs {} "Wayland to be managed by home-manager.";
    extraOptions = mkOpt attrs {} "Options to pass directly to home-manager.";
  };

  config = {
    home.extraOptions = {
      home.file = mkAliasDefinitions options.home.file;
      home.stateVersion = config.system.stateVersion;
      programs = mkAliasDefinitions options.home.programs;
      services = mkAliasDefinitions options.home.services;
      wayland = mkAliasDefinitions options.home.wayland;
      xdg.configFile = mkAliasDefinitions options.home.configFile;
      xdg.enable = true;
    };

    home-manager = {
      useUserPackages = true;

      users.${config.custom.user.name} =
        mkAliasDefinitions options.home.extraOptions;
    };
  };
}
