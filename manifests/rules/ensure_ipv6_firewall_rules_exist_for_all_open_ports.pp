# @api private
#  Ensure firewall rules exist for all open ports (Scored)
#
# Description:
# Any ports that have been opened on non-loopback addresses need firewall rules to govern
# traffic.
#
# Rationale:
# Without a firewall rule configured for open ports default firewall policy will drop all
# packets to these ports.
#
# @summary  Ensure firewall rules exist for all open ports (Scored)
#
class secure_linux_cis::rules::ensure_ipv6_firewall_rules_exist_for_all_open_ports {
  firewall { '010 open IPv6 ssh port':
    chain    => 'INPUT',
    dport    => 22,
    state    => 'NEW',
    action   => 'accept',
    proto    => 'tcp',
    provider => 'ip6tables',
    tag      => 'cis_firewall_pre',
  }
}
