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
  cfg = config.custom.home;
in {
  # imports = with inputs; [
  #   home-manager.darwinModules.home-manager
  # ];

  options.custom.home = with types; {
    file =
      mkOpt attrs {}
      "A set of files to be managed by home-manager's <option>home.file</option>.";
    configFile =
      mkOpt attrs {}
      "A set of files to be managed by home-manager's <option>xdg.configFile</option>.";
    extraOptions = mkOpt attrs {} "Options to pass directly to home-manager.";
    homeConfig = mkOpt attrs {} "Final config for home-manager.";
  };

  config = {
    custom.home.extraOptions = {
      home.stateVersion = mkDefault "22.11";
      home.file = mkAliasDefinitions options.custom.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.custom.home.configFile;
    };

    snowfallorg.users.${config.custom.user.name}.home.config = mkAliasDefinitions options.custom.home.extraOptions;

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;

      # users.${config.custom.user.name} = args:
      #   mkAliasDefinitions options.custom.home.extraOptions;
    };
  };
}
