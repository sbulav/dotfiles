{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.desktop.addons.kitty;
in {
  options.custom.desktop.addons.kitty = with types; {
    enable = mkBoolOpt false "Whether to enable the Kitty terminal";
  };

  config = mkIf cfg.enable {
    home.programs.kitty = {
      enable = true;
      font = {
        name = "CaskaydiaCove Nerd Font";
        size = 14.0;
      };

      keybindings = {
        "kitty_mod+e" = "kitten hints"; # https://sw.kovidgoyal.net/kitty/kittens/hints/
        "kitty_mod+f" = "toggle_fullscreen";
        "kitty_mod+c" = "copy_to_clipboard";
      };
      extraConfig = ''
        mouse_map right press ungrabbed copy_to_clipboard
        mouse_map middle release ungrabbed paste_from_clipboard
      '';
      settings = {
        disable_ligatures = "never";
        macos_option_as_alt = "yes";
        share_connections = "no";
        kitty_mod = "ctrl+shift";
        background_opacity = "0.90";
        confirm_os_window_close = 0;

        macos_quit_when_last_window_closed = "no";
        sync_to_monitor = "no";
        term = "xterm-256color";
      };
    };
  };
}
