# @api private
#  Ensure ICMP redirects are not accepted (Scored)
#
# Description:
# ICMP redirect messages are packets that convey routing information and tell your host (acting as a router)
# to send packets via an alternate path. It is a way of allowing an outside routing device to update your
# system routing tables. By setting net.ipv4.conf.all.accept_redirects to 0, the system will not accept any
# ICMP redirect messages, and therefore, won't allow outsiders to update the system's routing tables.
#
# Rationale:
# Attackers could use bogus ICMP redirect messages to maliciously alter the system routing tables and get
# them to send packets to incorrect networks and allow your system packets to be captured.
#
# @summary  Ensure ICMP redirects are not accepted (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_icmp_redirects_are_not_accepted
class secure_linux_cis::rules::ensure_icmp_redirects_are_not_accepted(
    Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'net.ipv4.conf.all.accept_redirects':
      value    => 0,
      schedule => 'harden_schedule',
    }
    sysctl { 'net.ipv4.conf.default.accept_redirects':
      value    => 0,
      schedule => 'harden_schedule',
    }

    if $::secure_linux_cis::ipv6_enabled {
      sysctl { 'net.ipv6.conf.all.accept_redirects':
        value    => 0,
        schedule => 'harden_schedule',
      }
      sysctl { 'net.ipv6.conf.default.accept_redirects':
        value    => 0,
        schedule => 'harden_schedule',
      }
    }
  }
}
