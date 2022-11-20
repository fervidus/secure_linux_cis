# @api private
#  Ensure IPv6 redirects are not accepted (Not Scored)
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
# @summary  Ensure IPv6 redirects are not accepted (Not Scored)
#
class secure_linux_cis::rules::ensure_ipv6_redirects_are_not_accepted {
  # This is addresed by ensure_icmp_redirects_are_not_accepted
}
