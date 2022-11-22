# @api private
#
# @summary Ensure a web server is not installed 
#
class secure_linux_cis::rules::ensure_a_web_server_is_not_installed {
  package { ['httpd', 'nginx']:
    ensure => absent,
  }
}
