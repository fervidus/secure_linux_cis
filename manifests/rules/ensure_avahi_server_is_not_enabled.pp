# @api private
#  Ensure Avahi Server is not enabled (Scored)
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
# @summary  Ensure Avahi Server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_avahi_server_is_not_enabled
class secure_linux_cis::rules::ensure_avahi_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'avahi-daemon':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
