{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.system.fonts;
in {
  options.system.fonts = with types; {
    enable = mkBoolOpt false "Whether or not to manage fonts.";
    fonts = mkOpt (listOf package) [] "Custom font packages to install.";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      # Enable icons in tooling since we have nerdfonts.
      LOG_ICONS = "true";
    };

    # environment.systemPackages = with pkgs; [font-manager];

    fonts.packages = with pkgs;
      [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji
        (nerdfonts.override {fonts = ["JetBrainsMono" "CascadiaCode" "FiraCode"];})
      ]
      ++ cfg.fonts;

    fonts.fontconfig = {
      defaultFonts = {
        monospace = ["CaskaydiaCove Nerd Font Mono"];
        sansSerif = ["CascadiaCode Nerd Font"];
        serif = ["CascadiaCode Nerd Font"];
      };
    };
    stylix.enable = true;
    stylix.base16Scheme = {
      base00 = "16181a";
      base01 = "1e2124";
      base02 = "3c4048";
      base03 = "7b8496";
      base04 = "7b8496";
      base05 = "ffffff";
      base06 = "16181a";
      base07 = "ffffff";
      base08 = "ff6e5e";
      base09 = "ffbd5e";
      base0A = "f1ff5e";
      base0B = "5eff6c";
      base0C = "5ef1ff";
      base0D = "5ea1ff";
      base0E = "bd5eff";
      base0F = "ff5ef1";
    };
    stylix.image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/sbulav/wallpapers-nix/refs/heads/main/wallpapers/nature/house-forest.jpg";
      sha256 = "sha256-Mn21EA3g+WzUORM9JcSOcDSUBvn8oENwSvFwG8afhRw=";
    };
  };
}
