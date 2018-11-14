# 4.2.2.5 Ensure remote syslog-ng messages are only accepted on designated log hosts (Not Scored)
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
# @summary 4.2.2.5 Ensure remote syslog-ng messages are only accepted on designated log hosts (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_2_5
class secure_linux_cis::redhat7::cis_4_2_2_5 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  Boolean $is_logging_host = false,
) {

  if $enforced and $logging == 'syslog-ng' {

    if $is_logging_host {

      file_line { 'syslog-ng.conf remote 1':
        ensure => present,
        path   => '/etc/syslog-ng/syslog-ng.conf',
        line   => 'source net{ tcp(); };',
        match  => '^source net',
        notify => Exec['reload syslog-ng 4_2_2_5'],
      }

      file_line { 'syslog-ng.conf remote 2':
        ensure => present,
        path   => '/etc/syslog-ng/syslog-ng.conf',
        line   => 'destination remote { file("/var/log/remote/${FULLHOST}-log"); };', # lint:ignore:single_quote_string_with_variables
        match  => '^destination remote',
        notify => Exec['reload syslog-ng 4_2_2_5'],
      }

      file_line { 'syslog-ng.conf remote 3':
        ensure => present,
        path   => '/etc/syslog-ng/syslog-ng.conf',
        line   => 'log { source(net); destination(remote); };',
        notify => Exec['reload syslog-ng 4_2_2_5'],
      }
    }

    else {

      file_line { 'syslog-ng.conf remote 1':
        ensure => present,
        path   => '/etc/syslog-ng/syslog-ng.conf',
        line   => '',
        match  => '^source net',
        notify => Exec['reload syslog-ng 4_2_2_5'],
      }

      file_line { 'syslog-ng.conf remote 2':
        ensure => present,
        path   => '/etc/syslog-ng/syslog-ng.conf',
        line   => '',
        match  => '^destination remote',
        notify => Exec['reload syslog-ng 4_2_2_5'],
      }
    }

    exec { 'reload syslog-ng 4_2_2_5':
      command     => '/bin/pkill -HUP syslog-ng',
      refreshonly => true,
    }
  }
}
