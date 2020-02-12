# @api private
#
class secure_linux_cis::distribution::rhel7::cis_4_1_1_2 {
  include secure_linux_cis::rules::ensure_system_is_disabled_when_audit_logs_are_full
}
