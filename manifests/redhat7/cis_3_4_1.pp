# 3.4.1 Ensure TCP Wrappers is installed (Scored)
#
# Description:
# TCP Wrappers provides a simple access list and standardized logging method for services capable of supporting it.
# In the past, services that were called from inetd and xinetd supported the use of tcp wrappers. As inetd and xinetd
# have been falling in disuse, any service that can support tcp wrappers will have the libwrap.so library attached to it.
#
# Rationale:
# TCP Wrappers provide a good simple access list mechanism to services that may not have that support built in. It is
# recommended that all services that can support TCP Wrappers, use it.
#
# @summary 3.4.1 Ensure TCP Wrappers is installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_4_1
class secure_linux_cis::redhat7::cis_3_4_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'tcp_wrappers':
      ensure => installed,
    }
  }
}
