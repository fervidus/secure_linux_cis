# 3.6.4 Ensure outbound and established connections are configured (Not Scored)
#
# Description:
# Configure the firewall rules for new outbound, and established connections.
#
# Rationale:
# If rules are not in place for new outbound, and established connections all packets will be
# dropped by the default policy preventing network usage.
#
# @summary 3.6.4 Ensure outbound and established connections are configured (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_6_4
class secure_linux_cis::redhat7::cis_3_6_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    firewall { '004 accept new and established ouput tcp connections':
        chain  => 'OUTPUT',
        state  => ['NEW', 'ESTABLISHED'],
        action => 'accept',
        proto  => 'tcp',
    }
    -> firewall { '005 accept new and established ouput udp connections':
      chain  => 'OUTPUT',
      state  => ['NEW', 'ESTABLISHED'],
      action => 'accept',
      proto  => 'udp',
    }
    -> firewall { '006 accept new and established ouput icmp connections':
      chain  => 'OUTPUT',
      state  => ['NEW', 'ESTABLISHED'],
      action => 'accept',
      proto  => 'icmp',
    }
    -> firewall { '007 accept estalished input tcp connections':
      chain  => 'INPUT',
      state  => 'ESTABLISHED',
      action => 'accept',
      proto  => 'tcp',
    }
    -> firewall { '008 accept estalished input udp connections':
      chain  => 'INPUT',
      state  => 'ESTABLISHED',
      action => 'accept',
      proto  => 'udp',
    }
    -> firewall { '009 accept estalished input icmp connections':
      chain  => 'INPUT',
      state  => 'ESTABLISHED',
      action => 'accept',
      proto  => 'icmp',
    }
  }
}
