# @api private
#
# @summary Ensure firewalld service is enabled and running 
#
class secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running {
  service { 'firewalld':
    ensure => running,
    enable => true,
  }
}
