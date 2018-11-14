# 4.2.2.3 Ensure syslog-ng default file permissions configured (Scored)
#
# Description:
# syslog-ng will create logfiles that do not already exist on the system. This setting controls
# what permissions will be applied to these newly created files.
#
# Rationale:
# It is important to ensure that log files exist and have the correct permissions to ensure that
# sensitive syslog-ng data is archived and protected.
#
# @summary 4.2.2.3 Ensure syslog-ng default file permissions configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_2_3
class secure_linux_cis::redhat7::cis_4_2_2_3 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced and $logging == 'syslog-ng' {

    file_line { 'syslog-ng.conf permissions':
      ensure => present,
      path   => '/etc/syslog-ng/syslog-ng.conf',
      line   => 'options { chain_hostnames(off); flush_lines(0); perm(0640); stats_freq(3600); threaded(yes); };',
      notify => Exec['reload syslog-ng 4_2_2_3'],
    }

    exec { 'reload syslog-ng 4_2_2_3':
      command     => '/bin/pkill -HUP syslog-ng',
      refreshonly => true,
    }
  }
}
