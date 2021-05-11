# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ipv4_default_deny_firewall_policy
class secure_linux_cis::rules::ensure_ipv4_default_deny_firewall_policy {
  # Create default drop policy for ipv6
  $filter_rules = [
    'INPUT:filter:IPv4',
    'OUTPUT:filter:IPv4',
    'FORWARD:filter:IPv4',
  ]

  firewallchain { $filter_rules:
    ensure => present,
    policy => drop,
    tag    => 'cis_firewall_post',
  }
}
