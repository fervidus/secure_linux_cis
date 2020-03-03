# @api private
#  Ensure remote syslog-ng messages are only accepted on designated log hosts (Not Scored)
#
# Description:
# By default, syslog-ng does not listen for log messages coming in from remote systems.
#
# Rationale:
# The guidance in the section ensures that remote log hosts are configured to only accept
# syslog-ng data from hosts within the specified domain and that those systems that are not
# designed to be log hosts do not accept any remote syslog-ng messages. This provides
# protection from spoofed log data and ensures that system administrators are reviewing
# reasonably complete syslog data in a central location.
#
# @summary  Ensure remote syslog-ng messages are only accepted on designated log hosts (Not Scored)
#
# @param enforced Should this rule be enforced
# @param logging How logging is done
# @param is_logging_host Is this host a logging host
#
# @example
#   include secure_linux_cis::ensure_remote_syslog_ng_messages_are_only_accepted_on_designated_log_hosts
class secure_linux_cis::rules::ensure_remote_syslog_ng_messages_are_only_accepted_on_designated_log_hosts(
    Boolean $enforced = true,
) {

  Class['::secure_linux_cis::rules::ensure_remote_syslog_ng_messages_are_only_accepted_on_designated_log_hosts']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    if $::secure_linux_cis::logging == 'syslog-ng' {
      if $::secure_linux_cis::is_logging_host {
        file_line { 'syslog-ng.conf remote 1':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/syslog-ng/syslog-ng.conf',
          line     => 'source net{ tcp(); };',
          match    => '^source net',
        }
        file_line { 'syslog-ng.conf remote 2':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/syslog-ng/syslog-ng.conf',
          line     => 'destination remote { file("/var/log/remote/${FULLHOST}-log"); };', # lint:ignore:single_quote_string_with_variables
          match    => '^destination remote',
        }
        file_line { 'syslog-ng.conf remote 3':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/syslog-ng/syslog-ng.conf',
          line     => 'log { source(net); destination(remote); };',
        }
      }
      else {
        file_line { 'syslog-ng.conf remote 1':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/syslog-ng/syslog-ng.conf',
          line     => '',
          match    => '^source net',
        }
        file_line { 'syslog-ng.conf remote 2':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/syslog-ng/syslog-ng.conf',
          line     => '',
          match    => '^destination remote',
        }
      }
    }
  }
}
