# @api private
#
class secure_linux_cis::distribution::centos8::cis_4_1_2_2 {
  include secure_linux_cis::rules::ensure_audit_logs_are_not_automatically_deleted
}
