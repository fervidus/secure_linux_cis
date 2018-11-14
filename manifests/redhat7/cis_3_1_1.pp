# 3.1.1 Ensure IP forwarding is disabled (Scored)
#
# Description:
# The net.ipv4.ip_forward flag is used to tell the system whether it can forward packets or not.
#
# Rationale:
# Setting the flag to 0 ensures that a system with multiple interfaces (for example, a hard proxy),
# will never be able to forward packets, and therefore, never serve as a router.
#
# @summary 3.1.1 Ensure IP forwarding is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_1_1
class secure_linux_cis::redhat7::cis_3_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    sysctl { 'net.ipv4.ip_forward':
      value => 0,
    }
  }
}
