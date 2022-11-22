# @api private
#
# @summary Ensure Samba is not installed 
#
class secure_linux_cis::rules::ensure_samba_is_not_installed {
  package { 'samba':
    ensure => absent,
  }
}
