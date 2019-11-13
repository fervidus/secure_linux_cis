#
class secure_linux_cis::cis_debian8::cis_4_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_auditd_service_is_enabled
}
