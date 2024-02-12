{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.zathura;
  associations = {
    "application/pdf" = ["org.pwmt.zathura.desktop.desktop"];
    "application/epub" = ["org.pwmt.zathura.desktop.desktop"];
  };
in {
  options.custom.apps.zathura = with types; {
    enable = mkBoolOpt false "Whether or not to enable zathura.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [zathura];
    xdg = {
      mime = {
        enable = true;
        defaultApplications = associations;
        addedAssociations = associations;
      };
    };
  };
}
