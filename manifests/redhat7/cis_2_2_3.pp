# 2.2.3 Ensure Avahi Server is not enabled (Scored)
#
# Description:
# Avahi is a free zeroconf implementation, including a system for multicast DNS/DNS-SD service discovery.
# Avahi allows programs to publish and discover services and hosts running on a local network with no specific configuration.
# For example, a user can plug a computer into a network and Avahi automatically finds printers to print to,
# files to look at and people to talk to, as well as network services running on the machine.
#
# Rationale:
# Automatic discovery of network services is not normally required for system functionality.
# It is recommended to disable the service to reduce the potential attack surface.
#
# @summary 2.2.3 Ensure Avahi Server is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_3
class secure_linux_cis::redhat7::cis_2_2_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'avahi-daemon':
      ensure => stopped,
      enable => false,
    }
  }
}
