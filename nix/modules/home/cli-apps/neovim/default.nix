{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.custom.cli-apps.neovim;
in {
  options.custom.cli-apps.neovim = {
    enable = mkEnableOption "Neovim";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    # xdg.configFile = {
    #   "dashboard-nvim/.keep".text = "";
    # };
  };
}
