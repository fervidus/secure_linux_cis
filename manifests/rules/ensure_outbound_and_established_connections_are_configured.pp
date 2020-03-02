# @api private
#  Ensure outbound and established connections are configured (Not Scored)
#
# Description:
# Configure the firewall rules for new outbound, and established connections.
#
# Rationale:
# If rules are not in place for new outbound, and established connections all packets will be
# dropped by the default policy preventing network usage.
#
# @summary  Ensure outbound and established connections are configured (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_outbound_and_established_connections_are_configured
class secure_linux_cis::rules::ensure_outbound_and_established_connections_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    firewall { '004 accept new and established ouput tcp connections':
      chain    => 'OUTPUT',
      schedule => 'harden_schedule',
      state    => ['NEW', 'ESTABLISHED'],
      action   => 'accept',
      proto    => 'tcp',
      tag      => 'cis_firewall_pre',
    }
    -> firewall { '005 accept new and established ouput udp connections':
      chain  => 'OUTPUT',
      state  => ['NEW', 'ESTABLISHED'],
      action => 'accept',
      proto  => 'udp',
      tag    => 'cis_firewall_pre',
    }
    -> firewall { '006 accept new and established ouput icmp connections':
      chain  => 'OUTPUT',
      state  => ['NEW', 'ESTABLISHED'],
      action => 'accept',
      proto  => 'icmp',
      tag    => 'cis_firewall_pre',
    }
    -> firewall { '007 accept estalished input tcp connections':
      chain  => 'INPUT',
      state  => 'ESTABLISHED',
      action => 'accept',
      proto  => 'tcp',
      tag    => 'cis_firewall_pre',
    }
    -> firewall { '008 accept estalished input udp connections':
      chain  => 'INPUT',
      state  => 'ESTABLISHED',
      action => 'accept',
      proto  => 'udp',
      tag    => 'cis_firewall_pre',
    }
    -> firewall { '009 accept estalished input icmp connections':
      chain  => 'INPUT',
      state  => 'ESTABLISHED',
      action => 'accept',
      proto  => 'icmp',
      tag    => 'cis_firewall_pre',
    }
  }
}
