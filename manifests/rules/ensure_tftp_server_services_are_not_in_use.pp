# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_tftp_server_services_are_not_in_use
class secure_linux_cis::rules::ensure_tftp_server_services_are_not_in_use {
  package { 'tftp-server':
    ensure => absent,
  }

  # service { 'tftp':
  #   ensure => stopped,
  #   enable => mask,
  # }
}
