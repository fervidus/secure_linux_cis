#
class secure_linux_cis::cis_suse12::cis_5_1_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_cron_monthly_are_configured
}
