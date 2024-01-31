{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.apps.firefox;
  browser = ["firefox.desktop"];

  # XDG MIME types
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = ["chromium-browser.desktop"];
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;

    "application/json" = browser;
  };
in {
  options.custom.apps.firefox = with types; {
    enable = mkBoolOpt false "Whether or not to enable Firefox.";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };

    xdg = {
      mime = {
        enable = true;
        defaultApplications = associations;
        addedAssociations = associations;
      };
    };
  };
}
