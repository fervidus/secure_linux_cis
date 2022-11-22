# @api private
#
# @summary Ensure ufw is installed 
#
class secure_linux_cis::rules::ensure_ufw_is_installed {
  class { 'ufw':
    manage_package => true,
    package_name   => 'ufw',
    packege_ensure => 'present',
    manage_service => true,
    service_name   => 'ufw',
    service_ensure => 'running',
  }
}
