#
class secure_linux_cis::cis_oracle7::cis_4_1_1_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_audit_logs_are_not_automatically_deleted
}
