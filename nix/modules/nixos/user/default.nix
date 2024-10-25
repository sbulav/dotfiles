{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.user;
  defaultIconFileName = "profile.png";
  defaultIcon = pkgs.stdenvNoCC.mkDerivation {
    name = "default-icon";
    src = ./. + "/${defaultIconFileName}";

    dontUnpack = true;

    installPhase = ''
      cp $src $out
    '';

    passthru = {fileName = defaultIconFileName;};
  };
  propagatedIcon =
    pkgs.runCommandNoCC "propagated-icon"
    {passthru = {inherit (cfg.icon) fileName;};}
    ''
      local target="$out/share/icons/user/${cfg.name}"
      mkdir -p "$target"

      cp ${cfg.icon} "$target/${cfg.icon.fileName}"
    '';
in {
  options.custom.user = with types; {
    name = mkOpt str "sab" "The name to use for the user account.";
    fullName = mkOpt str "Sergei Bulavintsev" "The full name of the user.";
    email = mkOpt str "bulavintsev.sergey@gmail.com" "The email of the user.";
    initialPassword =
      mkOpt str "password"
      "The initial password to use when the user is first created.";
    icon =
      mkOpt (nullOr package) defaultIcon
      "The profile picture to use for the user.";
    prompt-init = mkBoolOpt true "Whether or not to show an initial message when opening a new shell.";
    extraGroups = mkOpt (listOf str) [] "Groups for the user to be assigned.";
    extraOptions =
      mkOpt attrs {}
      "Extra options passed to `users.users.<name>`.";
  };

  config = {
    environment.systemPackages = with pkgs; [
      propagatedIcon
    ];

    home = {
      file = {
        "Documents/.keep".text = "";
        "Downloads/.keep".text = "";
        "Music/.keep".text = "";
        "Pictures/.keep".text = "";
        "Pictures/${
          cfg.icon.fileName or (builtins.baseNameOf cfg.icon)
        }".source =
          cfg.icon;
      };
    };

    programs = {
      fish = {
        enable = true;
        shellAliases = {
          nixup = "sudo nixos-rebuild switch --flake ~/dotfiles/nix#nz";
          nixt = "sudo nixos-rebuild test --flake ~/dotfiles/nix#nz";
          nixclean = "sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nix-store --repair --verify --check-contents && sudo nix-store --optimise -vvv";
        };
        # interactiveShellInit = "source ~/dotfiles/fish/functions/l.fish";
      };
    };
    users.users.${cfg.name} =
      {
        isNormalUser = true;
        inherit (cfg) name initialPassword;
        home = "/home/${cfg.name}";
        group = "users";

        shell = pkgs.fish;
        extraGroups =
          ["wheel" "audio" "sound" "video" "networkmanager" "input" "tty" "docker"]
          ++ cfg.extraGroups;
      }
      // cfg.extraOptions;
  };
}
