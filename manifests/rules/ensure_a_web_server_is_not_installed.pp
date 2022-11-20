# @api private
#
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_a_web_server_is_not_installed {
  package { ['httpd', 'nginx']:
    ensure => absent,
  }
}
