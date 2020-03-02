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
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_default_deny_firewall_policy
class secure_linux_cis::rules::ensure_default_deny_firewall_policy(
    Boolean $enforced = true,
) {
  # Create default drop policy for ipv4 and ipv6
  $filter_rules = [
    'INPUT:filter:IPv4',
    'OUTPUT:filter:IPv4',
    'FORWARD:filter:IPv4',
    'INPUT:filter:IPv6',
    'OUTPUT:filter:IPv6',
    'FORWARD:filter:IPv6',
  ]

  # functionaily for RedHat 8 or later moved to ensure_default_zone_is_set rule
  if ($enforced) {
    unless ($facts['osfamily'] == 'RedHat' and $facts['operatingsystemmajrelease'] == '8') {
      firewallchain { $filter_rules:
        ensure   => present,
        schedule => 'harden_schedule',
        policy   => drop,
        tag      => 'cis_firewall_post',
      }
    }
  }
}
