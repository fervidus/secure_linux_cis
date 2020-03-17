# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_journald_is_configured_to_send_logs_to_rsyslog
class secure_linux_cis::rules::ensure_journald_is_configured_to_send_logs_to_rsyslog {
  file_line { 'journald_syslog':
    schedule => 'harden_schedule',
    path     => '/etc/systemd/journald.conf',
    line     => 'ForwardToSyslog=yes',
    match    => '^ForwardToSyslog=',
    multiple => true,
  }
}
