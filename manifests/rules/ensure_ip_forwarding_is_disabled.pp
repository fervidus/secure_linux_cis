# @api private
#  Ensure IP forwarding is disabled (Scored)
#
# Description:
# The net.ipv4.ip_forward flag is used to tell the system whether it can forward packets or not.
#
# Rationale:
# Setting the flag to 0 ensures that a system with multiple interfaces (for example, a hard proxy),
# will never be able to forward packets, and therefore, never serve as a router.
#
# @summary  Ensure IP forwarding is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ip_forwarding_is_disabled
class secure_linux_cis::rules::ensure_ip_forwarding_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'net.ipv4.ip_forward':
      value    => 0,
      schedule => 'harden_schedule',
    }
    if $facts['osfamily'] == 'Debian' and $::secure_linux_cis::ipv6_enabled {
      sysctl { 'net.ipv6.conf.all.forwarding':
        value    => 0,
        schedule => 'harden_schedule',
      }
    }
  }
}
