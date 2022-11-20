# @api private
#  Ensure default deny firewall policy (Scored)
#
# Description:
# A default deny all policy on connections ensures that any unconfigured network usage will
# be rejected.
#
# Rationale:
# With a default accept policy the firewall will accept any packet that is not configured to be
# denied. It is easier to white list acceptable usage than to black list unacceptable usage.
#
# @summary  Ensure default deny firewall policy (Scored)
#
class secure_linux_cis::rules::ensure_default_deny_firewall_policy {
  case $secure_linux_cis::firewall {
    'iptables': {
      # Create default drop policy for ipv4
      $ip_tables_filter_rules = [
        'INPUT:filter:IPv4',
        'OUTPUT:filter:IPv4',
        'FORWARD:filter:IPv4',
      ]

      firewallchain { $ip_tables_filter_rules:
        ensure => present,
        policy => drop,
        tag    => 'cis_firewall_post',
      }
    }
    'nftables': {
      # Addressed in nftables module
      # nftables::rule { 'INPUT-default':
      #   order   => '01',
      #   content => 'type filter hook input priority 0; policy drop;',
      # }

      # nftables::rule { 'OUTPUT-default':
      #   order   => '01',
      #   content => 'type filter hook output priority 0; policy drop;',
      # }

      # nftables::rule { 'FORWARD-default':
      #   order   => '01',
      #   content => 'type filter hook forward priority 0; policy drop;',
      # }
    }
    default: { file('Need iptables or nftables firewall.') }
  }
}
