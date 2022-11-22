# @api private
#
# @summary Ensure rsyslog is configured to send logs to a remote log   host 
#
class secure_linux_cis::rules::ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host {
  Class['secure_linux_cis::rules::ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host']
  ~> Class['secure_linux_cis::reboot']
  if $secure_linux_cis::logging == 'rsyslog' and $secure_linux_cis::logging_host != '' {
    file_line { 'rsyslog.conf logging_host':
      ensure => present,
      path   => '/etc/rsyslog.conf',
      line   => "*.* @@${secure_linux_cis::logging_host}",
      match  => '\*\.\* @@',
    }
  }
}
