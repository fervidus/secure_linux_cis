# @api private
#  Ensure packet redirect sending is disabled (Scored)
#
# Description:
# ICMP Redirects are used to send routing information to other hosts.
# As a host itself does not act as a router (in a host only configuration), there is no need to send redirects.
#
# Rationale:
# An attacker could use a compromised host to send invalid ICMP redirects to other router devices in an attempt
# to corrupt routing and have users access a system set up by the attacker as opposed to a valid system.
#
# @summary  Ensure packet redirect sending is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_packet_redirect_sending_is_disabled
class secure_linux_cis::rules::ensure_packet_redirect_sending_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'net.ipv4.conf.all.send_redirects':
      value    => 0,
      schedule => 'harden_schedule',
    }
    sysctl { 'net.ipv4.conf.default.send_redirects':
      value    => 0,
      schedule => 'harden_schedule',
    }
  }
}
