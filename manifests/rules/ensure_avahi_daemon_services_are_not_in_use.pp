# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_avahi_daemon_services_are_not_in_use
class secure_linux_cis::rules::ensure_avahi_daemon_services_are_not_in_use {
  package { 'avahi':
    ensure => absent,
  }

  # service { 'avahi':
  #   ensure => stopped,
  #   enable => mask,
  # }
}
