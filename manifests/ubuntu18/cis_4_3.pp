#
class secure_linux_cis::cis_ubuntu18::cis_4_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_logrotate_is_configured
}
