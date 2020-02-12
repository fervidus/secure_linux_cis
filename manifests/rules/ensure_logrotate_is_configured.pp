# @api private
#  Ensure logrotate is configured (Not Scored)
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
# @summary  Ensure logrotate is configured (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_logrotate_is_configured
class secure_linux_cis::rules::ensure_logrotate_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    class { '::logrotate': }
  }
}
