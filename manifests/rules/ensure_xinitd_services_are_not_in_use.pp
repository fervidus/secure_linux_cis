# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_xinitd_services_are_not_in_use
class secure_linux_cis::rules::ensure_xinitd_services_are_not_in_use {
  package { 'xinetd':
    ensure => absent,
  }

  # service { 'xinetd':
  #   ensure => stopped,
  #   enable => mask,
  # }
}
