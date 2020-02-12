# @api private
#
class secure_linux_cis::distribution::oracle7::cis_4_2_1_4 {
  include secure_linux_cis::rules::ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host
}
