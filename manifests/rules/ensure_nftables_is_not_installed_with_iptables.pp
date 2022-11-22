# @api private
#
# @summary Ensure nftables is not installed with iptables 
#
class secure_linux_cis::rules::ensure_nftables_is_not_installed_with_iptables {
  package { 'nftables':
    ensure => absent,
  }
}
