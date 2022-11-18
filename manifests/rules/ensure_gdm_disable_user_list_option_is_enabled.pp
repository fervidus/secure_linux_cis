# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_gdm_disable_user_list_option_is_enabled
class secure_linux_cis::rules::ensure_gdm_disable_user_list_option_is_enabled {
  package { 'gdm':
    ensure => absent,
  }
}
