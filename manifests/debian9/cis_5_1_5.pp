#
class secure_linux_cis::cis_debian9::cis_5_1_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_cron_weekly_are_configured
}
