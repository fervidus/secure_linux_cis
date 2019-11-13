#
class secure_linux_cis::cis_rhel8::cis_5_1_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_cron_d_are_configured
}
