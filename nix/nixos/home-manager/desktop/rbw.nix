{pkgs, ...}: {
  programs.rbw = {
    enable = true;
    settings = {
      email = "zppfan@gmail.com";
      lock_timeout = 14400;
      pinentry = "gnome3";
    };
  };
}
