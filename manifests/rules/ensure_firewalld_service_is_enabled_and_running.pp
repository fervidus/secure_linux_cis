# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running
class secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running {
  service { 'firewalld':
    ensure => started,
  }
}
