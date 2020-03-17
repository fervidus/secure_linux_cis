# @api private
#  Ensure source routed packets are not accepted (Scored)
#
# Description:
# In networking, source routing allows a sender to partially or fully specify the route packets take through a network.
# In contrast, non-source routed packets travel a path determined by routers in the network.
# In some cases, systems may not be routable or reachable from some locations (e.g. private addresses vs. Internet routable),
# and so source routed packets would need to be used.
#
# Rationale:
# Setting net.ipv4.conf.all.accept_source_route and net.ipv4.conf.default.accept_source_route to 0 disables the system from
# accepting source routed packets. Assume this system was capable of routing packets to Internet routable addresses on one
# interface and private addresses on another interface. Assume that the private addresses were not routable to the Internet
# routable addresses and vice versa. Under normal routing circumstances, an attacker from the Internet routable addresses
# could not use the system as a way to reach the private address systems. If, however, source routed packets were allowed,
# they could be used to gain access to the private address systems as the route could be specified,
# rather than rely on routing protocols that did not allow this routing.
#
# @summary  Ensure source routed packets are not accepted (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_source_routed_packets_are_not_accepted
class secure_linux_cis::rules::ensure_source_routed_packets_are_not_accepted(
    Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'net.ipv4.conf.all.accept_source_route':
      value    => 0,
      schedule => 'harden_schedule',
    }
    sysctl { 'net.ipv4.conf.default.accept_source_route':
      value    => 0,
      schedule => 'harden_schedule',
    }
    if $facts['osfamily'] == 'Debian' and $::secure_linux_cis::ipv6_enabled {
      sysctl { 'net.ipv6.conf.all.accept_source_route':
        value    => 0,
        schedule => 'harden_schedule',
      }
      sysctl { 'net.ipv6.conf.default.accept_source_route':
        value    => 0,
        schedule => 'harden_schedule',
      }
    }
  }
}
