{
  api = {
    dashboard = true;
    # Access the Traefik dashboard on <Traefik IP>:8080 of your server
    insecure = false;
  };
  log = {
    level = "INFO";
    filePath = "/traefik/logs/traefik.log";
  };

  accessLog = {
    filePath = "/traefik/logs/access.log";
    # Log access to Dashboard
    addInternals = true;
    # Buffer logs in memory before writing to disk
    bufferingSize = 100;
    # filters.statusCodes = [
    #   "200-206"
    #   "400-499"
    #   "500-599"
    # ];
  };
  entryPoints = {
    web = {
      address = ":80";
      asDefault = true;
      http.redirections.entrypoint = {
        to = "websecure";
        scheme = "https";
      };
    };

    websecure = {
      address = ":443";
      asDefault = true;
      http.tls.certResolver = "cloudflare";
    };
  };

  certificatesResolvers = {
    # Resolving via cloudflare DNS, has rate limiting
    production.acme = {
      dnsChallenge = {
        provider = "cloudflare";
        resolvers = [
          "1.1.1.1:53"
          "1.0.0.1:53"
        ];
        delayBeforeCheck = 5;
      };
      certificatesDuration = 180;
      storage = "/traefik/certs/acme.json"; # where acme certificates live
      caServer = "https://acme-v02.api.letsencrypt.org/directory";
    };
    # Issuing test certs, no rate limit
    staging.acme = {
      dnsChallenge = {
        provider = "cloudflare";
        resolvers = [
          "1.1.1.1:53"
          "1.0.0.1:53"
        ];
        delayBeforeCheck = 5;
      };
      certificatesDuration = 180;
      storage = "/traefik/certs/acme.json"; # where acme certificates live
      caServer = "https://acme-staging-v02.api.letsencrypt.org/directory";
    };
  };
}
