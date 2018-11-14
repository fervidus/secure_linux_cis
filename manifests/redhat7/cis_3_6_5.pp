# 3.6.5 Ensure firewall rules exist for all open ports (Scored)
#
# Description:
# Any ports that have been opened on non-loopback addresses need firewall rules to govern
# traffic.
#
# Rationale:
# Without a firewall rule configured for open ports default firewall policy will drop all
# packets to these ports.
#
# @summary 3.6.5 Ensure firewall rules exist for all open ports (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_6_5
class secure_linux_cis::redhat7::cis_3_6_5 (
  Boolean $enforced = true,
) {

  if $enforced {

    firewall { '010 open ssh port':
        chain  => 'INPUT',
        dport  => 22,
        state  => 'NEW',
        action => 'accept',
        proto  => 'tcp',
    }
  }
}
