{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.custom.tools.k8s;
in {
  options.custom.tools.k8s = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common Kubernetes utilities.";
  };

  config = mkIf cfg.enable {
    programs.fish.shellAliases = {
      k = "kubecolor";
      kk = "kubecolor";
      kubectl = "kubecolor";
      kc = "kubectx";
      kn = "kubens";
    };

    environment.systemPackages = with pkgs; [
      kubectl
      kubectx
      kubecolor
      kubernetes-helm
      helmfile
      helm-docs
      k9s
      krew
    ];
  };
}
