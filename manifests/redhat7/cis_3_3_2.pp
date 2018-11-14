# 3.3.2 Ensure IPv6 redirects are not accepted (Not Scored)
#
# Description:
# This setting prevents the system from accepting ICMP redirects. ICMP redirects tell the
# system about alternate routes for sending traffic.
#
# Rationale:
# It is recommended that systems not accept ICMP redirects as they could be tricked into
# routing traffic to compromised machines. Setting hard routes within the system (usually a
# single default route to a trusted router) protects the system from bad routes.
#
# @summary 3.3.2 Ensure IPv6 redirects are not accepted (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_3_3
class secure_linux_cis::redhat7::cis_3_3_2 (
  Boolean $enforced = true,
  Boolean $ipv6_enabled = true,
) {

  if $enforced and $ipv6_enabled {

    sysctl { 'net.ipv6.conf.all.accept_redirects':
      value => 0,
    }

    sysctl { 'net.ipv6.conf.default.accept_redirects':
      value => 0,
    }
  }
}
