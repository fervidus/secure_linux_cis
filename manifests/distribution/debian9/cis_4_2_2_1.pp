#
class secure_linux_cis::distribution::debian9::cis_4_2_2_1 {
  include secure_linux_cis::rules::ensure_syslog_ng_service_is_enabled
}
