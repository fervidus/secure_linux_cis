#
class secure_linux_cis::cis_aliyun1::cis_4_2_1_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts
}
