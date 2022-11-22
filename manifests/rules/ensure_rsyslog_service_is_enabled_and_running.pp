# @api private
#
# @summary Ensure rsyslog Service is enabled and running 
#
class secure_linux_cis::rules::ensure_rsyslog_service_is_enabled_and_running {
  service { 'rsyslog':
    ensure => running,
    enable => true,
  }
}
