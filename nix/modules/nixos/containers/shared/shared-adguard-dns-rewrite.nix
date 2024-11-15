# DNS rewrite module, by default creating CNAME to adguard
{
  host ? "test.sbulav.ru",
  url ? "adguard.sbulav.ru",
  rewrite_enabled ? false,
  ...
}: {
  containers.adguard.config.services.adguardhome.settings.filtering =
    if rewrite_enabled
    then {
      rewrites = [
        {
          domain = "${host}";
          answer = "${url}";
        }
      ];
    }
    else {};
}
