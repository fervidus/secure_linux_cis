# @api private
#
# @summary Ensure auditd service is enabled and running 
#
class secure_linux_cis::rules::ensure_auditd_service_is_enabled_and_running {
  service { 'auditd':
    ensure => running,
    enable => true,
  }
}
