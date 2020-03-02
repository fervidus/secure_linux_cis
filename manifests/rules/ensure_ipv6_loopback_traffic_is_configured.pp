# @api private
# Ensure IPv6 loopback traffic is configured (Scored)
#
# Description:
# Configure the loopback interface to accept traffic. Configure all other interfaces to deny
# traffic to the loopback network (::1).
#
# Rationale:
# Loopback traffic is generated between processes on machine and is typically critical to
# operation of the system. The loopback interface is the only place that loopback network
# (::1) traffic should be seen, all other interfaces should ignore traffic on this
# network as an anti-spoofing measure.
#
# @summary Ensure IPv6 loopback traffic is configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::rules::ensure_ipv6_loopback_traffic_is_configured
class secure_linux_cis::rules::ensure_ipv6_loopback_traffic_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    firewall { '001 IPv6 accept all input to lo interface':
      chain    => 'INPUT',
      schedule => 'harden_schedule',
      proto    => 'all',
      iniface  => 'lo',
      action   => 'accept',
      provider => 'ip6tables',
      tag      => 'cis_firewall_pre',
    }
    -> firewall { '002 IPv6 accept all output to lo interface':
      chain    => 'OUTPUT',
      proto    => 'all',
      outiface => 'lo',
      action   => 'accept',
      provider => 'ip6tables',
      tag      => 'cis_firewall_pre',
    }
    -> firewall { '003 IPv6 drop all to lo ::/0':
      chain    => 'INPUT',
      proto    => 'all',
      source   => '::1',
      action   => 'drop',
      provider => 'ip6tables',
      tag      => 'cis_firewall_pre',
    }
  }
}
