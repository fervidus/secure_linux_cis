# 4.2.2.4 Ensure syslog-ng is configured to send logs to a remote log host (Not Scored)
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
# @summary 4.2.2.4 Ensure syslog-ng is configured to send logs to a remote log host (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_2_4
class secure_linux_cis::redhat7::cis_4_2_2_4 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  String $logging_host = '',
) {

  if $enforced and $logging == 'syslog-ng' and $logging_host != '' {

    file_line { 'syslog-ng.conf logging_host':
      ensure => present,
      path   => '/etc/syslog-ng/syslog-ng.conf',
      line   => "destination logserver { tcp(\"${logging_host}\" port(514)); }; log { source(src); destination(logserver); };",
      match  => '^destination logserver',
      notify => Exec['reload syslog-ng 4_2_2_4'],
    }

    exec { 'reload syslog-ng 4_2_2_4':
      command     => '/bin/pkill -HUP syslog-ng',
      refreshonly => true,
    }
  }
}
