# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_nis_server_services_are_not_in_use
class secure_linux_cis::rules::ensure_nis_server_services_are_not_in_use {
  package { 'ypserv':
    ensure => absent,
  }

  # service { 'ypserv':
  #   ensure => stopped,
  #   enable => mask,
  # }
}
