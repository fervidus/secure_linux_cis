# @api private
#  Ensure loopback traffic is configured (Scored)
#
# Description:
# Configure the loopback interface to accept traffic. Configure all other interfaces to deny
# traffic to the loopback network (/8).
#
# Rationale:
# Loopback traffic is generated between processes on machine and is typically critical to
# operation of the system. The loopback interface is the only place that loopback network
# (/8) traffic should be seen, all other interfaces should ignore traffic on this
# network as an anti-spoofing measure.
#
# @summary  Ensure loopback traffic is configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_loopback_traffic_is_configured
class secure_linux_cis::rules::ensure_loopback_traffic_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    firewall { '001 accept all input to lo interface':
      chain    => 'INPUT',
      schedule => 'harden_schedule',
      proto    => 'all',
      iniface  => 'lo',
      action   => 'accept',
      tag      => 'cis_firewall_pre',
    }
    -> firewall { '002 accept all output to lo interface':
      chain    => 'OUTPUT',
      proto    => 'all',
      outiface => 'lo',
      action   => 'accept',
      tag      => 'cis_firewall_pre',
    }
    -> firewall { '003 drop all to lo 127.0.0.0/8':
      chain  => 'INPUT',
      proto  => 'all',
      source => '127.0.0.0/8',
      action => 'drop',
      tag    => 'cis_firewall_pre',
    }
  }
}
