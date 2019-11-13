#
class secure_linux_cis::cis_debian9::cis_5_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_cron_daemon_is_enabled
}
