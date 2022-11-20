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
class secure_linux_cis::rules::ensure_ip_forwarding_is_disabled {
  sysctl { 'net.ipv4.ip_forward':
    value    => 0,
  }
  if $facts['os']['family'] == 'Debian' and $secure_linux_cis::ipv6_enabled {
    sysctl { 'net.ipv6.conf.all.forwarding':
      value    => 0,
    }
  }
}
