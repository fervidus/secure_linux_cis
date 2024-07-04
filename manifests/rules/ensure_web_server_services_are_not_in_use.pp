# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_web_server_services_are_not_in_use
class secure_linux_cis::rules::ensure_web_server_services_are_not_in_use {
  package { ['httpd', 'nginx']:
    ensure => absent,
  }

  # service { ['httpd', 'nginx']:
  #   ensure => stopped,
  #   enable => mask,
  # }
}
