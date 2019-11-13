#
class secure_linux_cis::cis_ubuntu18::cis_5_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_crontab_are_configured
}
