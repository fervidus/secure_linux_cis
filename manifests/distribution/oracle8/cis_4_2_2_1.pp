# @api private
#
class secure_linux_cis::distribution::oracle8::cis_4_2_2_1 {
  include secure_linux_cis::rules::ensure_journald_is_configured_to_send_logs_to_rsyslog
}
