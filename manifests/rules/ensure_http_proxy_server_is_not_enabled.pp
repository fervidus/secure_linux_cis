# @api private
# 3 Ensure HTTP Proxy Server is not enabled (Scored)
#
# Description:
# Squid is a standard proxy server used in many distributions and environments.
#
# Rationale:
# If there is no need for a proxy server, it is recommended that the squid proxy be disabled to reduce the potential attack surface.
#
# @summary 3 Ensure HTTP Proxy Server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_http_proxy_server_is_not_enabled
class secure_linux_cis::rules::ensure_http_proxy_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    $http_proxy_services = [
      'squid',
    ]
    service { $http_proxy_services:
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
