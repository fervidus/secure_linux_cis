# @api private
#  Ensure IPv6 is disabled (Not Scored)
#
# Description:
# Although IPv6 has many advantages over IPv4, few organizations have implemented IPv6.
#
# Rationale:
# If IPv6 is not to be used, it is recommended that it be disabled to reduce the attack surface
# of the system.
#
# @summary  Ensure IPv6 is disabled (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ipv6_is_disabled
class secure_linux_cis::rules::ensure_ipv6_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $::secure_linux_cis::ipv6_enabled {

      sysctl { 'net.ipv6.conf.all.disable_ipv6':
        value    => 1,
        schedule => 'harden_schedule',
      }

      sysctl { 'net.ipv6.conf.default.disable_ipv6':
        value    => 1,
        schedule => 'harden_schedule',
      }

      file_line { 'disable_ipv6_network':

        schedule => 'harden_schedule',
        path     => '/etc/sysconfig/network',
        line     => 'NETWORKING_IPV6=no',
        match    => 'NETWORKING_IPV6=',
      }

      file_line { 'disable_ipv6_network_init':

        schedule => 'harden_schedule',
        path     => '/etc/sysconfig/network',
        line     => 'IPV6INIT=no',
        match    => 'IPV6INIT=',
      }
    }
  }
}
