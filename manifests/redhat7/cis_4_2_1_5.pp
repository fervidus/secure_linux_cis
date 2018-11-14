# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_1_5
class secure_linux_cis::redhat7::cis_4_2_1_5 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  Boolean $is_logging_host = false,
) {

  if $enforced and $logging == 'rsyslog' {

    if $is_logging_host {

      file_line { 'rsyslog.conf ModLoad':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '$ModLoad imtcp',
        match  => '\$ModLoad',
        notify => Exec['reload rsyslog 4_2_1_5'],
      }

      file_line { 'rsyslog.conf InputTCPServerRun':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '$InputTCPServerRun 514',
        match  => '\$InputTCPServerRun',
        notify => Exec['reload rsyslog 4_2_1_5'],
      }
    }

    else {

      file_line { 'rsyslog.conf ModLoad':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '#$ModLoad imtcp',
        match  => '\$ModLoad',
        notify => Exec['reload rsyslog 4_2_1_5'],
      }

      file_line { 'rsyslog.conf InputTCPServerRun':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '#$InputTCPServerRun 514',
        match  => '\$InputTCPServerRun',
        notify => Exec['reload rsyslog 4_2_1_5'],
      }
    }

    exec { 'reload rsyslog 4_2_1_5':
      command     => '/bin/pkill -HUP rsyslogd',
      refreshonly => true,
    }
  }
}
