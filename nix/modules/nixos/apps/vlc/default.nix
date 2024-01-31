{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.vlc;

  associations = {
    "audio/*" = ["vlc.desktop"];
    "video/*" = ["vlc.desktop"];
  };
in {
  options.custom.apps.vlc = with types; {
    enable = mkBoolOpt false "Whether or not to enable vlc.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [vlc];

    xdg = {
      mime = {
        enable = true;
        defaultApplications = associations;
        addedAssociations = associations;
      };
    };
  };
}
