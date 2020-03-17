# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_2_1_2 {
  include secure_linux_cis::rules::ensure_rsyslog_service_is_enabled
}
