#
class secure_linux_cis::ubuntu16::cis_4_1_1_1 {
  include secure_linux_cis::rules::ensure_audit_log_storage_size_is_configured
}
