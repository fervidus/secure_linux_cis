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
#   include secure_linux_cis::ensure_ipv6_outbound_and_established_connections_are_configured

class secure_linux_cis::rules::ensure_ipv6_outbound_and_established_connections_are_configured {

  firewall { '004 accept new and established ouput IPv6 tcp connections':
    chain    => 'OUTPUT',
    state    => ['NEW', 'ESTABLISHED'],
    action   => 'accept',
    proto    => 'tcp',
    provider => 'ip6tables',
  }
  -> firewall { '005 accept new and established ouput IPv6 udp connections':
    chain    => 'OUTPUT',
    state    => ['NEW', 'ESTABLISHED'],
    action   => 'accept',
    proto    => 'udp',
    provider => 'ip6tables',
  }
  -> firewall { '006 accept new and established ouput IPv6 icmp connections':
    chain    => 'OUTPUT',
    state    => ['NEW', 'ESTABLISHED'],
    action   => 'accept',
    proto    => 'icmp',
    provider => 'ip6tables',
  }
  -> firewall { '007 accept estalished input IPv6 tcp connections':
    chain    => 'INPUT',
    state    => 'ESTABLISHED',
    action   => 'accept',
    proto    => 'tcp',
    provider => 'ip6tables',
  }
  -> firewall { '008 accept estalished input IPv6 udp connections':
    chain    => 'INPUT',
    state    => 'ESTABLISHED',
    action   => 'accept',
    proto    => 'udp',
    provider => 'ip6tables',
  }
  -> firewall { '009 accept estalished input IPv6 icmp connections':
    chain    => 'INPUT',
    state    => 'ESTABLISHED',
    action   => 'accept',
    proto    => 'icmp',
    provider => 'ip6tables',
  }

}
