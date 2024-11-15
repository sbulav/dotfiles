# Typical route with authentication via authelia and cert via cloudflare
{
  app ? "test",
  host ? "test.sbulav.ru",
  url ? "http://localhost:80",
  middleware ? "auth-chain",
  route_enabled ? false,
  ...
}: {
  containers.traefik.config.services.traefik.dynamicConfigOptions.http =
    if route_enabled
    then {
      routers.${app} = {
        entrypoints = ["websecure"];
        rule = "Host(`${host}`)";
        service = "${app}";
        middlewares = ["${middleware}"];
        tls = {
          certResolver = "production";
        };
      };
      services.${app} = {
        loadBalancer = {
          passHostHeader = true;
          servers = [
            {
              url = "${url}";
            }
          ];
        };
      };
    }
    else {};
}
