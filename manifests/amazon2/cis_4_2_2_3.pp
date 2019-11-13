#
class secure_linux_cis::cis_amazon2::cis_4_2_2_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_syslog_ng_default_file_permissions_configured
}
