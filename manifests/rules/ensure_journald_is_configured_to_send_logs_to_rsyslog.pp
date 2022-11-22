# @api private
#
# @summary Ensure journald is configured to send logs to rsyslog 
#
class secure_linux_cis::rules::ensure_journald_is_configured_to_send_logs_to_rsyslog {
  file_line { 'journald_syslog':
    path     => '/etc/systemd/journald.conf',
    line     => 'ForwardToSyslog=yes',
    match    => '^ForwardToSyslog\ *=',
    multiple => true,
  }
}
