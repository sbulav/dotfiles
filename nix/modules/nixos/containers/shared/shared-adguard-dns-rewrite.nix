# DNS rewrite module, by default creating CNAME to adguard
{
  host ? "test.sbulav.ru",
  url ? "adguard.sbulav.ru",
  ...
}: {
  containers.adguard.config.services.adguardhome.settings.filtering.rewrites = [
    {
      domain = "${host}";
      answer = "${url}";
    }
  ];
}
