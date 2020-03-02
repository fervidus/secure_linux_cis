# @api private
#  Ensure syslog-ng service is enabled (Scored)
#
# Description:
# Once the syslog-ng package is installed it needs to be activated.
#
# Rationale:
# If the syslog-ng service is not activated the system may default to the syslogd service or
# lack logging instead.
#
# @summary  Ensure syslog-ng service is enabled (Scored)
#
# @param enforced Should this rule be enforced
# @param logging How logging is done
#
# @example
#   include secure_linux_cis::ensure_syslog_ng_service_is_enabled
class secure_linux_cis::rules::ensure_syslog_ng_service_is_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    if $::secure_linux_cis::logging == 'syslog-ng' {
      service { 'syslog-ng':
        ensure   => running,
        schedule => 'harden_schedule',
        enable   => true,
      }
    }
  }
}
