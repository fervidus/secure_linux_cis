# 4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host (Scored)
#
#
# Description:
# The rsyslog utility supports the ability to send logs it gathers to a remote log host running syslogd(8)
# or to receive messages from remote hosts, reducing administrative overhead.
#
# @summary 4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_1_4
class secure_linux_cis::redhat7::cis_4_2_1_4 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  String $logging_host = '',
) {

  if $enforced and $logging == 'rsyslog' and $logging_host != '' {

    file_line { 'rsyslog.conf logging_host':
      ensure => present,
      path   => '/etc/rsyslog.conf',
      line   => "*.* @@${logging_host}",
      match  => '\*\.\* @@',
      notify => Exec['reload rsyslog 4_2_1_4'],
    }

    exec { 'reload rsyslog 4_2_1_4':
      command     => '/bin/pkill -HUP rsyslogd',
      refreshonly => true,
    }
  }
}
