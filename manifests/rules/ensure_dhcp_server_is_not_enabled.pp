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
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_dhcp_server_is_not_enabled
class secure_linux_cis::rules::ensure_dhcp_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { ['dhcpd', 'isc-dhcp-server', 'isc-dhcp-server6']:
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
