{
  containers.traefik.config.services.traefik.dynamicConfigOptions.http.middlewares.allow-lan = {
    ipAllowList.sourceRange = [
      "127.0.0.1/32"
      "172.16.64.0/24"
      "192.168.88.0/24"
      "192.168.89.0/24"
    ];
  };
}
