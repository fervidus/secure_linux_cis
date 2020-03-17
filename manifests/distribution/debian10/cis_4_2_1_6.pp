# @api private
#
class secure_linux_cis::distribution::debian10::cis_4_2_1_6 {
  include secure_linux_cis::rules::ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts
}
