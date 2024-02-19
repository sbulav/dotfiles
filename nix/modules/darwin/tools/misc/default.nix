{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.tools.misc;
in {
  options.custom.tools.misc = with types; {
    enable = mkBoolOpt false "Whether or not to enable common utilities.";
  };

  config = mkIf cfg.enable {
    # xdg.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [
      bat
      fd
      file
      fzf
      jq
      killall
      ripgrep
      rsync
      tree
      unzip
      yq
      zoxide
    ];
  };
}
