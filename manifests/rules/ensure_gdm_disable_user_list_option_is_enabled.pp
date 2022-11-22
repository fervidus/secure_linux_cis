# @api private
#
# @summary Ensure GDM disable-user-list option is enabled 
#
class secure_linux_cis::rules::ensure_gdm_disable_user_list_option_is_enabled {
  package { 'gdm':
    ensure => absent,
  }
}
