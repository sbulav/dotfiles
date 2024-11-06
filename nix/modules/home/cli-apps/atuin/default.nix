{
  lib,
  config,
  namespace,
  osConfig,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.custom.cli-apps.atuin;
in {
  options.custom.cli-apps.atuin = {
    enable = mkEnableOption "atuin";
  };

  config = mkIf cfg.enable {
    programs.atuin = {
      enable = true;
      # Does not work right now, injecting via fish
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      settings = {
        auto_sync = true;
        #FIXME:(atuin) move to private server
        sync_address = "https://api.atuin.sh";
        sync_frequency = "30m";
        update_check = false;
        filter_mode = "global";
        invert = false;
        #TODO:(atuin) disable when comfortable
        show_help = true;
        sops.secrets = lib.mkIf config.${namespace}.security.sops.enable {
          key_path = config.sops.secrets.atuin_key.path;
        };

        # This came from https://github.com/nifoc/dotfiles/blob/ce5f9e935db1524d008f97e04c50cfdb41317766/home/programs/atuin.nix#L2
        history_filter = [
          "^base64decode"
          "^instagram-dl"
          "^mp4concat"
        ];
      };
    };

    # sops.secrets = lib.mkIf osConfig.${namespace}.security.sops.enable {
    sops.secrets = lib.mkIf config.${namespace}.security.sops.enable {
      atuin_key = {
        sopsFile = lib.snowfall.fs.get-file "secrets/sab/default.yaml";
      };
    };
  };
}
