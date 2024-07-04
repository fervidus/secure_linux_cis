# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_dhcp_server_services_are_not_in_use
class secure_linux_cis::rules::ensure_dhcp_server_services_are_not_in_use {
  package { 'dhcp-server':
    ensure => absent,
  }

  # service { 'dhcpd':
  #   ensure => stopped,
  #   enable => mask,
  # }
}
