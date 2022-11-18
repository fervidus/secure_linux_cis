# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_gnome_display_manager_is_removed
class secure_linux_cis::rules::ensure_gnome_display_manager_is_removed {
  package { 'gdm3':
    ensure => absent,
  }
}
