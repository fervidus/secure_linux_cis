# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ipv4_loopback_traffic_is_configured
class secure_linux_cis::rules::ensure_ipv4_loopback_traffic_is_configured {
  firewall { '001 accept all input to lo interface':
    chain   => 'INPUT',
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
    tag     => 'cis_firewall_pre',
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
