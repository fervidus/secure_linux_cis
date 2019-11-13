#
class secure_linux_cis::cis_rhel7::cis_4_2_1_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_configured
}
