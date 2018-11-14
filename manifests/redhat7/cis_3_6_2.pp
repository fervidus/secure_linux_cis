# 3.6.2 Ensure default deny firewall policy (Scored)
#
# Description:
# A default deny all policy on connections ensures that any unconfigured network usage will
# be rejected.
#
# Rationale:
# With a default accept policy the firewall will accept any packet that is not configured to be
# denied. It is easier to white list acceptable usage than to black list unacceptable usage.
#
# @summary 3.6.2 Ensure default deny firewall policy (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_6_2
class secure_linux_cis::redhat7::cis_3_6_2 (
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
  }
}
