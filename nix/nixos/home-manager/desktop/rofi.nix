{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-calc
    ];
    extraConfig = {
      combi-hide-mode-prefix = true;
      combi-modi = "drun,run,calc";
      disable-history = false;
      display-Network = " 󰤨  Network";
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 﩯  Window";
      drun-display-format = "{icon} {name}";
      hide-scrollbar = true;
      icon-theme = "Fluent";
      location = 0;
      modi = "combi,drun,calc,";
      show-icons = true;
      sidebar-mode = true;
      sorting-method = "fzf";
      sort = true;
      terminal = "kitty";
      font = "FiraCode Nerd Font Regular 12";
      kb-accept-custom = "Control+Return";
      kb-cancel = "Escape,Control+g,Control+bracketleft,Control+space";
      kb-row-select = "Control+Super+space";
      matching = "fuzzy";
    };
    theme = ./rofi/catppuccin-frappe.rasi;
  };
}
