# @api private
#
class secure_linux_cis::distribution::oracle6::cis_4_1_1_1 {
  include secure_linux_cis::rules::ensure_audit_log_storage_size_is_configured
}
