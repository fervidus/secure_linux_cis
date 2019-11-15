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
class secure_linux_cis::rules::ensure_default_deny_firewall_policy (
  Boolean $enforced = true,
) {

  if $enforced {

    firewallchain { 'INPUT:filter:IPv4':
      ensure => present,
      policy => drop,
    }

    firewallchain { 'OUTPUT:filter:IPv4':
      ensure => present,
      policy => drop,
    }

    firewallchain { 'FORWARD:filter:IPv4':
      ensure => present,
      policy => drop,
    }

    firewallchain { 'INPUT:filter:IPv6':
      ensure => present,
      policy => drop,
    }

    firewallchain { 'OUTPUT:filter:IPv6':
      ensure => present,
      policy => drop,
    }

    firewallchain { 'FORWARD:filter:IPv6':
      ensure => present,
      policy => drop,
    }
  }
}
