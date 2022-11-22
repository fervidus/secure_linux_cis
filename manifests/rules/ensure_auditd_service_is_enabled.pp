# @api private
#
# @summary Ensure auditd service is enabled 
#
class secure_linux_cis::rules::ensure_auditd_service_is_enabled {
  # Also ensuring the package is installed before the service
  package { $secure_linux_cis::auditd_package:
    ensure => installed,
    before => Service['auditd'],
  }
  service { 'auditd':
    ensure => running,
    enable => true,
  }
}
