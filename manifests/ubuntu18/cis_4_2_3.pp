#
class secure_linux_cis::cis_ubuntu18::cis_4_2_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_rsyslog_or_syslog_ng_is_installed
}
