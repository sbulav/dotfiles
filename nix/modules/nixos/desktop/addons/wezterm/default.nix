{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.wezterm;
in {
  options.custom.desktop.addons.wezterm = with types; {
    enable = mkBoolOpt false "Whether to enable the wezterm terminal";
  };

  config = mkIf cfg.enable {
    home.programs.wezterm = {
      enable = true;
      extraConfig =
        # Generate wezterm.lua; order of files are important
        (builtins.readFile ./wezterm.lua)
        + (builtins.readFile ./mappings.lua)
        + (builtins.readFile ./colors.lua)
        + (builtins.readFile ./tabs.lua)
        + (builtins.readFile ./events.lua)
        + ''
          return config
        '';
    };
  };
}
