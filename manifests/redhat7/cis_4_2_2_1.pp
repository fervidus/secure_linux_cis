# 4.2.2.1 Ensure syslog-ng service is enabled (Scored)
#
# Description:
# Once the syslog-ng package is installed it needs to be activated.
#
# Rationale:
# If the syslog-ng service is not activated the system may default to the syslogd service or
# lack logging instead.
#
# @summary 4.2.2.1 Ensure syslog-ng service is enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_2_1
class secure_linux_cis::redhat7::cis_4_2_2_1 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced and $logging == 'syslog-ng' {

    service { 'syslog-ng':
      ensure => running,
      enable => true,
    }
  }
}
