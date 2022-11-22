# @api private
#
# @summary Ensure HTTP server is not installed 
#
class secure_linux_cis::rules::ensure_http_server_is_not_installed {
  package { 'httpd':
    ensure => absent,
  }
}
