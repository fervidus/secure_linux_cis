# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ipv6_default_deny_firewall_policy
class secure_linux_cis::rules::ensure_ipv6_default_deny_firewall_policy(
    Boolean $enforced = false,
) {
  # Taken care of by ensure_default_deny_firewall_policy
  # firewallchain { 'INPUT:filter:IPv6':
  #   ensure => present,
  #   policy => drop,
  # }
  # firewallchain { 'OUTPUT:filter:IPv6':
  #   ensure => present,
  #   policy => drop,
  # }
  # firewallchain { 'FORWARD:filter:IPv6':
  #   ensure => present,
  #   policy => drop,
  # }
  # include secure_linux_cis::rules::ensure_default_deny_firewall_policy
}
