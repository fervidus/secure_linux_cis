# 4.2.1.3 Ensure rsyslog default file permissions configured (Scored)
#
# Description:
# rsyslog will create logfiles that do not already exist on the system. This setting controls
# what permissions will be applied to these newly created files.
#
# Rationale:
# It is important to ensure that log files have the correct permissions to ensure that sensitive
# data is archived and protected.
#
# @summary 4.2.1.3 Ensure rsyslog default file permissions configured (Scored)
#
# @param enforced Should this rule be enforced
# @param logging How logging is done
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_1_3
class secure_linux_cis::redhat7::cis_4_2_1_3 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced and $logging == 'rsyslog' {

    file_line { 'rsyslog.conf log_permissions':
      ensure => present,
      path   => '/etc/rsyslog.conf',
      line   => '$FileCreateMode 0640',
      match  => '^\$FileCreateMode.*',
    }

    file { '/etc/rsyslog.d/':
      ensure  => directory,
      recurse => true,
      mode    => '0640',
    }
  }
}
