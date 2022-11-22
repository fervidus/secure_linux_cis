# @api private
#
# @summary Ensure GDM is removed or login is configured 
#
class secure_linux_cis::rules::ensure_gdm_is_removed_or_login_is_configured {
  package { 'gdm':
    ensure => absent,
  }
}
