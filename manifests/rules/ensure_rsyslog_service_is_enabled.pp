# @api private
#
# @summary Ensure rsyslog service is enabled 
#
class secure_linux_cis::rules::ensure_rsyslog_service_is_enabled {
  if $secure_linux_cis::logging == 'rsyslog' {
    service { 'rsyslog':
      ensure => running,
      enable => true,
    }
  }
}
