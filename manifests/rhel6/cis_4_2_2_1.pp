#
class secure_linux_cis::cis_rhel6::cis_4_2_2_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_syslog_ng_service_is_enabled
}
