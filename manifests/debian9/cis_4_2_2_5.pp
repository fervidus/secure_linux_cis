#
class secure_linux_cis::cis_debian9::cis_4_2_2_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_remote_syslog_ng_messages_are_only_accepted_on_designated_log_hosts
}
