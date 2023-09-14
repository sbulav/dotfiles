{ pkgs , ...
}:{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      #image = "$HOME/.config/wall";
      color = "000000ff";
      font-size = "24";
      indicator-idle-visible = true;
      clock = true;
      timestr = "%H:%M";
      datestr = "%A, %d %B";

      indicator = true;
      indicator-radius = "100";
      indicator-thickness = "10";

      effect-blur = "30x2";
      effect-vignette = "0.5:0.5";

      text-color = "cdd6f4";
      text-clear-color = "11111b";
      text-ver-color = "11111b";
      text-wrong-color = "11111b";

      ring-color = "1e1e2e";
      key-hl-color = "f5c2e7";
      line-color = "f5c2e7";
      inside-color = "00000088";
      separator-color = "00000000";

      inside-clear-color = "f2cdcd88";
      line-clear-color = "f2cdcd";
      ring-clear-color = "f2cdcd";

      inside-ver-color = "89dceb88";
      line-ver-color = "89dceb";
      ring-ver-color = "89dceb";

      inside-wrong-color = "f38ba888";
      line-wrong-color = "f38ba8";
      ring-wrong-color = "f38ba8";
    };
  };
}
