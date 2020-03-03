# @api private
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @param enforced Should this rule be enforced
# @param logging How logging is done
# @param is_logging_host Is this host a logging host
#
# @example
#   include secure_linux_cis::ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts
class secure_linux_cis::rules::ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    if $::secure_linux_cis::logging == 'rsyslog' {
      if $::secure_linux_cis::is_logging_host {
        file_line { 'rsyslog.conf ModLoad':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/rsyslog.conf',
          line     => '$ModLoad imtcp',
          match    => '\$ModLoad',
        }
        file_line { 'rsyslog.conf InputTCPServerRun':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/rsyslog.conf',
          line     => '$InputTCPServerRun 514',
          match    => '\$InputTCPServerRun',
        }
      }
      else {
        file_line { 'rsyslog.conf ModLoad':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/rsyslog.conf',
          line     => '#$ModLoad imtcp',
          match    => '\$ModLoad',
        }
        file_line { 'rsyslog.conf InputTCPServerRun':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/rsyslog.conf',
          line     => '#$InputTCPServerRun 514',
          match    => '\$InputTCPServerRun',
        }
      }
    }
  }
}
