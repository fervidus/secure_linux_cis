#
class secure_linux_cis::cis_rhel8::cis_4_2_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_rsyslog_service_is_enabled
}
