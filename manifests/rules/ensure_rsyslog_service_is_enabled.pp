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
class secure_linux_cis::rules::ensure_rsyslog_service_is_enabled {
  if $secure_linux_cis::logging == 'rsyslog' {
    service { 'rsyslog':
      ensure => running,
      enable => true,
    }
  }
}
