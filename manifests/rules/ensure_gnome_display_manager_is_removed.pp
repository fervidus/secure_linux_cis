# @api private
#
# @summary Ensure GNOME Display Manager is removed 
#
class secure_linux_cis::rules::ensure_gnome_display_manager_is_removed {
  package { 'gdm3':
    ensure => absent,
  }
}
