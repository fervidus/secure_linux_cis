# @api private
#
# @summary Ensure DHCP Server is not installed 
#
class secure_linux_cis::rules::ensure_dhcp_server_is_not_installed {
  package { 'dhcp':
    ensure => absent,
  }
}
