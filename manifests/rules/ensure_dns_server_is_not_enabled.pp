# @api private
#  Ensure DNS Server is not enabled (Scored)
#
# Description:
# The Domain Name System (DNS) is a hierarchical naming system that maps names to IP addresses for computers,
# services and other resources connected to a network.
#
# Rationale:
# Unless a system is specifically designated to act as a DNS server,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary  Ensure DNS Server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_dns_server_is_not_enabled
class secure_linux_cis::rules::ensure_dns_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'RedHat': {
        $service = 'named'
      }
      'Debian': {
        $service = 'bind9'
      }
      default: {
        notify { "This DNS server check is not yet implemented for ${facts['osfamily']}": }
        $service = 'TODO DNS'
      }
    }
    service { $service:
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
