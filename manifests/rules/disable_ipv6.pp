# @api private
#  Disable IPv6 (Not Scored)
#
# Description:
# Although IPv6 has many advantages over IPv4, not all organizations have IPv6 or dual
# stack configurations implemented.
#
# Rationale:
# If IPv6 or dual stack is not to be used, it is recommended that IPv6 be disabled to reduce
# the attack surface of the system.
#
# @summary Disable IPv6 (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::disable_ipv6
class secure_linux_cis::rules::disable_ipv6(
  Boolean $enforced = true,
) {
  if $enforced and !$::secure_linux_cis::ipv6_enabled {
    kernel_parameter { 'ipv6.disable=1':
      ensure   => present,
      bootmode => 'default',
    }
  }
}
