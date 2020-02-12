# @api private
#
class secure_linux_cis::distribution::suse12::cis_4_2_2_4 {
  include secure_linux_cis::rules::ensure_syslog_ng_is_configured_to_send_logs_to_a_remote_log_host
}
