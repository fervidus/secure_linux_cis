#  Ensure IPv6 router advertisements are not accepted (Not Scored)
#
# Description:
# This setting disables the system's ability to accept IPv6 router advertisements.
#
# Rationale:
# It is recommended that systems not accept router advertisements as they could be tricked
# into routing traffic to compromised machines. Setting hard routes within the system
# (usually a single default route to a trusted router) protects the system from bad routes.
#
# @summary  Ensure IPv6 router advertisements are not accepted (Not Scored)
#
# @param enforced Should this rule be enforced
# @param ipv6_enabled Should ipv6 be enabled
#
# @example
#   include secure_linux_cis::ensure_ipv6_router_advertisements_are_not_accepted
class secure_linux_cis::rules::ensure_ipv6_router_advertisements_are_not_accepted (
  Boolean $enforced     = true,
  Boolean $ipv6_enabled = false,
) {

  if $enforced {

    sysctl { 'net.ipv6.conf.all.accept_ra':
      value => 0,
    }

    sysctl { 'net.ipv6.conf.default.accept_ra':
      value => 0,
    }
  }
}
