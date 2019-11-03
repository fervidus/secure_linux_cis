# 2.2.8 Ensure DNS Server is not enabled (Scored)
#
# Description:
# The Domain Name System (DNS) is a hierarchical naming system that maps names to IP addresses for computers,
# services and other resources connected to a network.
#
# Rationale:
# Unless a system is specifically designated to act as a DNS server,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 2.2.8 Ensure DNS Server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_2_2_8
class secure_linux_cis::distribution::redhat7::cis_2_2_8 (
  Boolean $enforced = true,
) {

  case $facts['os']['family'] {
    'RedHat': {
      $service = 'named'
    }
    'Debian': {
      $service = 'bind9'
    }
    default: {
    }
  }

  if $enforced {

    service { $service:
      ensure => stopped,
      enable => false,
    }

  }
}
