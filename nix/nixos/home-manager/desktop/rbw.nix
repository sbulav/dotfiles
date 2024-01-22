{pkgs, ...}: {
  programs.rbw = {
    enable = true;
    settings = {
      email = "zppfan@gmail.com";
      lock_timeout = 300;
      pinentry = "gnome3";
    };
  };
}
