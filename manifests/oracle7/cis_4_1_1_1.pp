#
class secure_linux_cis::cis_oracle7::cis_4_1_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_audit_log_storage_size_is_configured
}
