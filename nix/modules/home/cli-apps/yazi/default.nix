{
  config,
  lib,
  options,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.cli-apps.yazi;
in {
  options.custom.cli-apps.yazi = {
    enable = mkEnableOption "Yazi Terminal File manager";
  };

  config = mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      package = pkgs.yazi;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;

      settings = {
        manager = {
          layout = [1 3 4];
          linemode = "size";
          show_hidden = false;
          show_symlink = true;
          sort_by = "alphabetical";
          sort_dir_first = true;
          sort_reverse = false;
          sort_sensitive = false;
        };
      };
    };

    xdg.configFile = {
      "yazi" = {
        source = lib.cleanSourceWith {
          src = lib.cleanSource ./configs/.;
        };

        recursive = true;
      };
    };
  };
}
