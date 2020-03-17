# @api private
#  Ensure secure ICMP redirects are not accepted (Scored)
#
# Description:
# Secure ICMP redirects are the same as ICMP redirects, except they come from gateways
# listed on the default gateway list. It is assumed that these gateways are known to your
# system, and that they are likely to be secure.
#
# Rationale:
# It is still possible for even known gateways to be compromised. Setting
# net.ipv4.conf.all.secure_redirects to 0 protects the system from routing table
# updates by possibly compromised known gateways.
#
# @summary  Ensure secure ICMP redirects are not accepted (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_secure_icmp_redirects_are_not_accepted
class secure_linux_cis::rules::ensure_secure_icmp_redirects_are_not_accepted(
    Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'net.ipv4.conf.all.secure_redirects':
      value    => 0,
      schedule => 'harden_schedule',
    }
    sysctl { 'net.ipv4.conf.default.secure_redirects':
      value    => 0,
      schedule => 'harden_schedule',
    }
  }
}
