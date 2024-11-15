{
  namespace,
  config,
  ...
}: {
  containers.traefik.config.services.traefik.dynamicConfigOptions.http.middlewares.authelia = {
    forwardAuth = {
      address = "http://${config.${namespace}.containers.authelia.localAddress}:9091/api/authz/forward-auth";
      trustForwardHeader = true;
      authResponseHeaders = [
        "Remote-User"
        "Remote-Groups"
        "Remote-Name"
        "Remote-Email"
      ];
    };
  };
}
