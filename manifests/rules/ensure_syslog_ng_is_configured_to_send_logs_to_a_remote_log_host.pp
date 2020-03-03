# @api private
#  Ensure syslog-ng is configured to send logs to a remote log host (Not Scored)
#
# Description:
# The syslog-ng utility supports the ability to send logs it gathers to a remote log host or to
# receive messages from remote hosts, reducing administrative overhead.
#
# Rationale:
# Storing log data on a remote host protects log integrity from local attacks. If an attacker
# gains root access on the local system, they could tamper with or remove log data that is
# stored on the local system
#
# @summary  Ensure syslog-ng is configured to send logs to a remote log host (Not Scored)
#
# @param enforced Should this rule be enforced
# @param logging How logging is done
# @param logging_host Which host should logging be sent to
#
# @example
#   include secure_linux_cis::ensure_syslog_ng_is_configured_to_send_logs_to_a_remote_log_host
class secure_linux_cis::rules::ensure_syslog_ng_is_configured_to_send_logs_to_a_remote_log_host(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_syslog_ng_is_configured_to_send_logs_to_a_remote_log_host']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    if $::secure_linux_cis::logging == 'syslog-ng' and $::secure_linux_cis::logging_host != '' {
      $log_host = $::secure_linux_cis::logging_host
      file_line { 'syslog-ng.conf logging_host':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/syslog-ng/syslog-ng.conf',
        line     => "destination logserver { tcp(\"${log_host}\" port(514)); }; log { source(src); destination(logserver); };",
        match    => '^destination logserver',
      }
    }
  }
}
