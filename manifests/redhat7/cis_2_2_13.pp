# 2.2.13 Ensure HTTP Proxy Server is not enabled (Scored)
#
# Description:
# Squid is a standard proxy server used in many distributions and environments.
#
# Rationale:
# If there is no need for a proxy server, it is recommended that the squid proxy be disabled to reduce the potential attack surface.
#
# @summary 2.2.13 Ensure HTTP Proxy Server is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_13
class secure_linux_cis::redhat7::cis_2_2_13 (
  Boolean $enforced = true,
) {

  if $enforced {

    $http_proxy_services = [
      'squid',
    ]

    service { $http_proxy_services:
      ensure => stopped,
      enable => false,
    }
  }
}
