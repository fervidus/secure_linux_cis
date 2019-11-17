#  Ensure TCP Wrappers is installed (Scored)
#
# Description:
# TCP Wrappers provides a simple access list and standardized logging method for services capable of supporting it.
# In the past, services that were called from inetd and xinetd supported the use of tcp wrappers. As inetd and xinetd
# have been falling in disuse, any service that can support tcp wrappers will have the libwrap.so library attached to it.
#
# Rationale:
# TCP Wrappers provide a good simple access list mechanism to services that may not have that support built in. It is
# recommended that all services that can support TCP Wrappers, use it.
#
# @summary  Ensure TCP Wrappers is installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_tcp_wrappers_is_installed
class secure_linux_cis::rules::ensure_tcp_wrappers_is_installed (
  Boolean $enforced = true,
) {

  case $facts['os']['family'] {
    'RedHat': {
      $package = 'tcp_wrappers'
    }
    'Debian': {
      $package = 'tcpd'
    }
    default: {
    }
  }

  if $enforced {

    package { $package:
      ensure => installed,
    }

  }
}