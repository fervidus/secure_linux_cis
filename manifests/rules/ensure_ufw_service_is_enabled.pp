# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ufw_service_is_enabled
class secure_linux_cis::rules::ensure_ufw_service_is_enabled {
    service { 'ugw':
      ensure => running,
      enable => true,
    }
}
