# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @param enforced Should this rule be enforced
# @param logging How logging is done
# @param is_logging_host Is this host a logging host
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_1_5
class secure_linux_cis::redhat7::cis_4_2_1_5 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  Boolean $is_logging_host = false,
) {


  if $enforced and $logging == 'rsyslog' {

    include ::secure_linux_cis::service
    if $is_logging_host {

      file_line { 'rsyslog.conf ModLoad':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '$ModLoad imtcp',
        match  => '\$ModLoad',
      }

      file_line { 'rsyslog.conf InputTCPServerRun':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '$InputTCPServerRun 514',
        match  => '\$InputTCPServerRun',
      }
    }

    else {

      file_line { 'rsyslog.conf ModLoad':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '#$ModLoad imtcp',
        match  => '\$ModLoad',
      }

      file_line { 'rsyslog.conf InputTCPServerRun':
        ensure => present,
        path   => '/etc/rsyslog.conf',
        line   => '#$InputTCPServerRun 514',
        match  => '\$InputTCPServerRun',
      }
    }
  }
}
