{
  containers.traefik.config.services.traefik.dynamicConfigOptions.http.middlewares.secure-headers = {
    headers = {
      sslRedirect = true;
      accessControlMaxAge = "100";
      stsSeconds = "31536000"; # force browsers to only connect over https
      stsIncludeSubdomains = true; # force browsers to only connect over https
      stsPreload = true; # force browsers to only connect over https
      forceSTSHeader = true; # force browsers to only connect over https
      contentTypeNosniff = true; # sets x-content-type-options header value to "nosniff", reduces risk of drive-by downloads
      frameDeny = true; # sets x-frame-options header value to "deny", prevents attacker from spoofing website in order to fool users into clicking something that is not there
      browserXssFilter = true; # sets x-xss-protection header value to "1; mode=block", which prevents page from loading if detecting a cross-site scripting attack
      contentSecurityPolicy = [
        # sets content-security-policy header to suggested value
        "default-src"
        "self"
      ];
      referrerPolicy = "same-origin";
      addVaryHeader = true;
      customResponseHeaders = {
        X-Robots-Tag = "none,noarchive,nosnippet,notranslate,noimageindex";
        server = "";
        X-Forwarded-Proto = "https";
      };
      sslProxyHeaders = {
        X-Forwarded-Proto = "https";
      };
    };
  };
}
