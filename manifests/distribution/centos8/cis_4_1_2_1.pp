#
class secure_linux_cis::distribution::centos8::cis_4_1_2_1 {
  include secure_linux_cis::rules::ensure_audit_log_storage_size_is_configured
}
