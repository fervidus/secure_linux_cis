# 2.2.8 Ensure DNS Server is not enabled (Scored)
#
# Description:
# The Domain Name System (DNS) is a hierarchical naming system that maps names to IP addresses for computers,
# services and other resources connected to a network.
#
# Rationale:
# Unless a system is specifically designated to act as a DNS server,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 2.2.8 Ensure DNS Server is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_8
class secure_linux_cis::redhat7::cis_2_2_8 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'named':
      ensure => stopped,
      enable => false,
    }
  }
}
