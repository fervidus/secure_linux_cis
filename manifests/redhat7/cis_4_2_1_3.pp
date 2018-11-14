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
# @example
#   include secure_linux_cis::redhat7::cis_4_2_1_3
class secure_linux_cis::redhat7::cis_4_2_1_3 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced and $logging == 'rsyslog' {

    file { '/etc/rsyslog.d/':
      ensure  => directory,
      recurse => true,
      mode    => '0640',
    }
  }
}
