# 4.3 Ensure logrotate is configured (Not Scored)
#
# Description:
# The system includes the capability of rotating log files regularly to avoid filling up the
# system with logs or making the logs unmanageable large. The file
# /etc/logrotate.d/syslog is the configuration file used to rotate log files created by
# syslog or rsyslog.
#
# Rationale:
# By keeping the log files smaller and more manageable, a system administrator can easily
# archive these files to another system and spend less time looking through inordinately
# large log files.
#
# @summary 4.3 Ensure logrotate is configured (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_3
class secure_linux_cis::redhat7::cis_4_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    class { '::logrotate': }

  }
}
