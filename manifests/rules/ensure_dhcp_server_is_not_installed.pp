# @api private
#  Ensure DHCP Server is not enabled (Scored)
#
# Description:
# The Dynamic Host Configuration Protocol (DHCP) is a service that allows machines to be dynamically assigned IP addresses.
#
# Rationale:
# Unless a system is specifically set up to act as a DHCP server,
# it is recommended that this service be disabled to reduce the potential attack surface.
#
# @summary  Ensure DHCP Server is not enabled (Scored)
#
class secure_linux_cis::rules::ensure_dhcp_server_is_not_installed {
  package { 'dhcp':
    ensure => absent,
  }
}
