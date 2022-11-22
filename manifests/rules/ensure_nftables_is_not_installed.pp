# @api private
#
# @summary Ensure nftables is not installed 
#
class secure_linux_cis::rules::ensure_nftables_is_not_installed {
  package { 'nftables':
    ensure => absent,
  }
}
