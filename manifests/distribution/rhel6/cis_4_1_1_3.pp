# @api private
#
class secure_linux_cis::distribution::rhel6::cis_4_1_1_3 {
  include secure_linux_cis::rules::ensure_audit_logs_are_not_automatically_deleted
}
