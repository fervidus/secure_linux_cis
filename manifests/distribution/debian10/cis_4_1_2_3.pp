# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_1_2_3 {
  include secure_linux_cis::rules::ensure_system_is_disabled_when_audit_logs_are_full
}
