#
class secure_linux_cis::distribution::rhel7::cis_4_1_1_3 {
  include secure_linux_cis::rules::ensure_audit_logs_are_not_automatically_deleted
}
