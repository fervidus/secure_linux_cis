# @api private
#  Ensure rsyslog Service is enabled (Scored)
#
# Description:
# Once the rsyslog package is installed it needs to be activated.
#
# Rationale:
# If the rsyslog service is not activated the system may default to the syslogd service or lack
# logging instead.
#
# @summary  Ensure rsyslog Service is enabled (Scored)
#
# @param enforced Should this rule be enforced
# @param logging How logging is done
#
# @example
#   include secure_linux_cis::ensure_rsyslog_service_is_enabled
class secure_linux_cis::rules::ensure_rsyslog_service_is_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    if $::secure_linux_cis::logging == 'rsyslog' {
      service { 'rsyslog':
        ensure   => running,
        schedule => 'harden_schedule',
        enable   => true,
      }
    }
  }
}
