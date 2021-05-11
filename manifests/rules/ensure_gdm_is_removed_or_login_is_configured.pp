# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_gdm_is_removed_or_login_is_configured
class secure_linux_cis::rules::ensure_gdm_is_removed_or_login_is_configured {
  package { 'gdm':
    ensure => absent,
  }
}
