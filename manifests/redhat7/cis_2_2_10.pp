# 2.2.10 Ensure HTTP server is not enabled (Scored)
#
# Description:
# HTTP or web servers provide the ability to host web site content.
#
# Rationale:
# Unless there is a need to run the system as a web server,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 2.2.10 Ensure HTTP server is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_10
class secure_linux_cis::redhat7::cis_2_2_10 (
  Boolean $enforced = true,
) {

  if $enforced {

    $http_services = [
      'httpd',
      'apache',
      'apache2',
      'lighttpd',
      'nginx',
    ]

    service { $http_services:
      ensure => stopped,
      enable => false,
    }
  }
}
