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
class secure_linux_cis::rules::ensure_outbound_and_established_connections_are_configured {
  case $secure_linux_cis::firewall {
    'iptables': {
      firewall { '004 accept new and established ouput tcp connections':
        chain  => 'OUTPUT',
        state  => ['NEW', 'ESTABLISHED'],
        action => 'accept',
        proto  => 'tcp',
        tag    => 'cis_firewall_pre',
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
    'nftables': {
      # Create default drop policy for nftables
      # nftables::rule { 'INPUT-tcp':
      #   content => 'ip protocol tcp ct state established accept',
      # }

      # nftables::rule { 'INPUT-tcp-ssh':
      #   content => 'tcp dport 22 accept',
      # }

      # nftables::rule { 'INPUT-udp':
      #   content => 'ip protocol udp ct state established accept',
      # }

      # nftables::rule { 'INPUT-icmp':
      #   content => 'ip protocol icmp ct state established accept',
      # }

      # nftables::rule { 'OUTPUT-tcp':
      #   content => 'ip protocol tcp ct state new,related,established accept',
      # }

      # nftables::rule { 'OUTPUT-udp':
      #   content => 'ip protocol udp ct state new,related,established accept',
      # }

      # nftables::rule { 'OUTPUT-icmp':
      #   content => 'ip protocol icmp ct state new,related,established accept',
      # }
    }
    default: { file('Need iptables or nftables firewall.') }
  }
}
