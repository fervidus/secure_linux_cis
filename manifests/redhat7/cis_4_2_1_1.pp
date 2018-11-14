# 4.2.1.1 Ensure rsyslog Service is enabled (Scored)
#
# Description:
# Once the rsyslog package is installed it needs to be activated.
#
# Rationale:
# If the rsyslog service is not activated the system may default to the syslogd service or lack
# logging instead.
#
# @summary 4.2.1.1 Ensure rsyslog Service is enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_1_1
class secure_linux_cis::redhat7::cis_4_2_1_1 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced and $logging == 'rsyslog' {

    service { 'rsyslog':
      ensure => running,
      enable => true,
    }
  }
}
