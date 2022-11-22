# @api private
#
# @summary Ensure HTTP Proxy Server is not installed 
#
class secure_linux_cis::rules::ensure_http_proxy_server_is_not_installed {
  package { 'squid':
    ensure => absent,
  }
}
