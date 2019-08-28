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
  Boolean $enforced = true,
  Boolean $ipv6_enabled = true,
) {

  if $enforced and !$ipv6_enabled {

    sysctl { 'net.ipv6.conf.all.disable_ipv6':
      value => 1,
    }

    sysctl { 'net.ipv6.conf.default.disable_ipv6':
      value => 1,
    }

    kernel_parameter { 'ipv6.disable=1':
      ensure => present,
    }

    services { 'ip6tables':
      ensure => stopped,
      enable => false,
    }

  }
}
