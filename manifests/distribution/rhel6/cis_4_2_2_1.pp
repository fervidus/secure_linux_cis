#
class secure_linux_cis::distribution::rhel6::cis_4_2_2_1 {
  include secure_linux_cis::rules::ensure_syslog_ng_service_is_enabled
}
