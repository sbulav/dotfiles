# DISABLED, builds too long
{
  config,
  lib,
  namespace,
  inputs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.${namespace}.containers.authentik;
in {
  options.${namespace}.containers.authentik = with types; {
    enable = mkBoolOpt false "Enable authentik nixos-container;";
    host = mkOpt str "authentik.sbulav.ru" "The host to serve authentik on";
    hostAddress = mkOpt str "172.16.64.10" "With private network, which address to use on Host";
    localAddress = mkOpt str "172.16.64.102" "With privateNetwork, which address to use in container";
  };
}
#   config = mkIf cfg.enable {
#     containers.authentik = {
#       ephemeral = true;
#       autoStart = true;
#       privateNetwork = true;
#       # Need to add 172.16.64.0/18 on router
#       hostAddress = "${cfg.hostAddress}";
#       localAddress = "${cfg.localAddress}";
#       config = {...}: {
#         imports = [
#           inputs.authentik-nix.nixosModules.default
# ];
#         services.authentik = {
#           enable = true;
#           # The environmentFile needs to be on the target host!
#           # Best use something like sops-nix or agenix to manage it
#           environmentFile = "/run/secrets/authentik/authentik-env";
#           settings = {
#             # email = {
#             #   host = "smtp.example.com";
#             #   port = 587;
#             #   username = "authentik@example.com";
#             #   use_tls = true;
#             #   use_ssl = false;
#             #   from = "authentik@example.com";
#             # };
#             disable_startup_analytics = true;
#             avatars = "initials";
#           };
#         };
#         networking = {
#           firewall = {
#             enable = false;
#             allowedTCPPorts = [80];
#           };
#           # Use systemd-resolved inside the container
#           # Workaround for bug https://github.com/NixOS/nixpkgs/issues/162686
#           useHostResolvConf = lib.mkForce false;
#         };
#         services.resolved.enable = true;
#         system.stateVersion = "24.11";
#       };
#     };
#     containers.traefik.config.services.traefik.dynamicConfigOptions.http = lib.mkIf config.${namespace}.containers.traefik.enable {
#       routers.authentik = {
#         entrypoints = ["websecure"];
#         rule = "Host(`${cfg.host}`)";
#         service = "authentik";
#         middlewares = [
#           "secure-headers"
#         ];
#         tls = {
#           certResolver = "production";
#         };
#       };
#       services.authentik = {
#         loadBalancer = {
#           passHostHeader = true;
#           servers = [
#             {
#               url = "http://${cfg.localAddress}:80";
#             }
#           ];
#         };
#       };
#     };
#   };
# }

