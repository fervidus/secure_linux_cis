#
class secure_linux_cis::distribution::rhel6::cis_4_1_2 {
  include secure_linux_cis::rules::ensure_auditd_service_is_enabled
}
