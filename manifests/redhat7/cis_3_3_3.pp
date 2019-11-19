# 3.3.3 Ensure IPv6 is disabled (Not Scored)
#
# Description:
# Although IPv6 has many advantages over IPv4, few organizations have implemented IPv6.
#
# Rationale:
# If IPv6 is not to be used, it is recommended that it be disabled to reduce the attack surface
# of the system.
#
# @summary 3.3.3 Ensure IPv6 is disabled (Not Scored)
#
# @param enforced Should this rule be enforced
# @param ipv6_enabled Should ipv6 be enabled
#
# @example
#   include secure_linux_cis::redhat7::cis_3_3_3
class secure_linux_cis::redhat7::cis_3_3_3 (
  Boolean $enforced     = true,
  Boolean $ipv6_enabled = false,
) {

  if $enforced and !$ipv6_enabled {

    sysctl { 'net.ipv6.conf.all.disable_ipv6':
      value => 1,
    }

    sysctl { 'net.ipv6.conf.default.disable_ipv6':
      value => 1,
    }

    if $facts['os']['family'] == 'RedHat' {
      file_line { 'disable_ipv6_network':
        path  => '/etc/sysconfig/network',
        line  => 'NETWORKING_IPV6=no',
        match => 'NETWORKING_IPV6=',
      }

      file_line { 'disable_ipv6_network_init':
        path  => '/etc/sysconfig/network',
        line  => 'IPV6INIT=no',
        match => 'IPV6INIT=',
      }
    }
  }
}
