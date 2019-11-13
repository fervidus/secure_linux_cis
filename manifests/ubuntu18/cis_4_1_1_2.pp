#
class secure_linux_cis::cis_ubuntu18::cis_4_1_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_system_is_disabled_when_audit_logs_are_full
}
