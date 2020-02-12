# @api private
#
class secure_linux_cis::distribution::rhel7::cis_4_2_2_5 {
  include secure_linux_cis::rules::ensure_remote_syslog_ng_messages_are_only_accepted_on_designated_log_hosts
}
