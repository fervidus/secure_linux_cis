# @api private
#
# @summary Ensure CUPS is not installed 
#
class secure_linux_cis::rules::ensure_cups_is_not_installed {
  package { 'cups':
    ensure => absent,
  }
}
